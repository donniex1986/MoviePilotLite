import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/rule/models/rule_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 规则类型
enum RuleType { custom, priority, download }

/// 下载规则编辑条目（含顺序与开关状态）
class DownloadRuleEditEntry {
  DownloadRuleEditEntry({required this.key, required this.enabled});
  final String key;
  bool enabled;
}

/// 规则 Controller
/// 通过 ruleType 区分自定义规则、优先级规则、下载规则
class RuleController extends GetxController {
  RuleController({required this.ruleType});

  final RuleType ruleType;
  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  final customRules = <CustomFilterRule>[].obs;
  final priorityRules = <UserFilterRuleGroup>[].obs;
  final downloadRules = <String>[].obs;

  final isLoading = false.obs;
  final errorText = RxnString();

  /// 下载规则：编辑模式
  final isEditing = false.obs;
  /// 下载规则：编辑中列表（顺序 + 开关）
  final editingDownloadItems = <DownloadRuleEditEntry>[].obs;
  final isSaving = false.obs;

  static const _torrentsPriorityLabels = {
    'upload': '站点上传量',
    'seeder': '资源做种数',
    'torrent': '资源优先级',
    'site': '站点优先级',
  };

  static const _torrentsPriorityIcons = <String, IconData>{
    'upload': CupertinoIcons.arrow_up_circle,
    'seeder': CupertinoIcons.person_2,
    'torrent': CupertinoIcons.arrow_down_circle,
    'site': CupertinoIcons.globe,
  };

  String torrentsPriorityLabel(String key) =>
      _torrentsPriorityLabels[key] ?? key;

  IconData torrentsPriorityIcon(String key) =>
      _torrentsPriorityIcons[key] ?? CupertinoIcons.circle;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    errorText.value = null;
    try {
      switch (ruleType) {
        case RuleType.custom:
          await _loadCustomRules();
          break;
        case RuleType.priority:
          await _loadPriorityRules();
          break;
        case RuleType.download:
          await _loadDownloadRules();
          break;
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载规则失败');
      errorText.value = '请求失败，请稍后重试';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadCustomRules() async {
    final resp = await _apiClient.get<Map<String, dynamic>>(
      '/api/v1/system/setting/CustomFilterRules',
    );
    final status = resp.statusCode ?? 0;
    if (status >= 400) {
      errorText.value = '请求失败 (HTTP $status)';
      return;
    }
    final data = resp.data;
    if (data is! Map<String, dynamic>) {
      errorText.value = '数据格式异常';
      return;
    }
    final parsed = CustomFilterRulesResponse.fromJson(data);
    if (parsed.success && parsed.data != null) {
      customRules.assignAll(parsed.data!.value);
    } else {
      errorText.value = parsed.message ?? '加载失败';
    }
  }

  Future<void> _loadPriorityRules() async {
    final resp = await _apiClient.get<Map<String, dynamic>>(
      '/api/v1/system/setting/UserFilterRuleGroups',
    );
    final status = resp.statusCode ?? 0;
    if (status >= 400) {
      errorText.value = '请求失败 (HTTP $status)';
      return;
    }
    final data = resp.data;
    if (data is! Map<String, dynamic>) {
      errorText.value = '数据格式异常';
      return;
    }
    final parsed = UserFilterRuleGroupsResponse.fromJson(data);
    if (parsed.success && parsed.data != null) {
      priorityRules.assignAll(parsed.data!.value);
    } else {
      errorText.value = parsed.message ?? '加载失败';
    }
  }

  Future<void> _loadDownloadRules() async {
    final resp = await _apiClient.get<Map<String, dynamic>>(
      '/api/v1/system/setting/TorrentsPriority',
    );
    final status = resp.statusCode ?? 0;
    if (status >= 400) {
      errorText.value = '请求失败 (HTTP $status)';
      return;
    }
    final data = resp.data;
    if (data is! Map<String, dynamic>) {
      errorText.value = '数据格式异常';
      return;
    }
    final parsed = TorrentsPriorityResponse.fromJson(data);
    if (parsed.success && parsed.data != null) {
      downloadRules.assignAll(parsed.data!.value);
    } else {
      errorText.value = parsed.message ?? '加载失败';
    }
  }

  static const _torrentsPriorityDefaultOrder = ['site', 'torrent', 'seeder', 'upload'];

  /// 进入下载规则编辑模式
  void enterDownloadEditMode() {
    if (ruleType != RuleType.download) return;
    final enabled = downloadRules.toList();
    editingDownloadItems.assignAll(
      _torrentsPriorityDefaultOrder.map(
        (k) => DownloadRuleEditEntry(key: k, enabled: enabled.contains(k)),
      ),
    );
    editingDownloadItems.sort((a, b) {
      final ai = enabled.indexOf(a.key);
      final bi = enabled.indexOf(b.key);
      if (ai >= 0 && bi >= 0) return ai.compareTo(bi);
      if (ai >= 0) return -1;
      if (bi >= 0) return 1;
      return _torrentsPriorityDefaultOrder.indexOf(a.key)
          .compareTo(_torrentsPriorityDefaultOrder.indexOf(b.key));
    });
    isEditing.value = true;
  }

  /// 取消下载规则编辑
  void cancelDownloadEdit() {
    isEditing.value = false;
    editingDownloadItems.clear();
  }

  /// 保存下载规则（调用 API）
  Future<bool> saveDownloadRules() async {
    if (ruleType != RuleType.download) return false;
    isSaving.value = true;
    try {
      final orderedKeys = editingDownloadItems
          .where((e) => e.enabled)
          .map((e) => e.key)
          .toList();
      final resp = await _apiClient.postJson<Map<String, dynamic>>(
        '/api/v1/system/setting/TorrentsPriority',
        orderedKeys,
      );
      final status = resp.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        ToastUtil.success('保存成功');
        downloadRules.assignAll(orderedKeys);
        isEditing.value = false;
        editingDownloadItems.clear();
        return true;
      }
      ToastUtil.error('保存失败');
      return false;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '保存下载规则失败');
      ToastUtil.error('保存失败');
      return false;
    } finally {
      isSaving.value = false;
    }
  }

  /// 拖拽重排
  void reorderDownloadItem(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = editingDownloadItems.removeAt(oldIndex);
    editingDownloadItems.insert(newIndex, item);
  }

  /// 切换开关
  void toggleDownloadItem(int index) {
    if (index >= 0 && index < editingDownloadItems.length) {
      editingDownloadItems[index].enabled = !editingDownloadItems[index].enabled;
      editingDownloadItems.refresh();
    }
  }

  void exportToClipboard() {
    String jsonStr;
    switch (ruleType) {
      case RuleType.custom:
        final list = customRules
            .map(
              (e) => {
                'id': e.id,
                'name': e.name,
                'include': e.include,
                'exclude': e.exclude,
              },
            )
            .toList();
        jsonStr = jsonEncode(list);
        break;
      case RuleType.priority:
        final list = priorityRules
            .map(
              (e) => {
                'name': e.name,
                'rule_string': e.ruleString,
                'media_type': e.mediaType,
                'category': e.category,
              },
            )
            .toList();
        jsonStr = jsonEncode(list);
        break;
      case RuleType.download:
        jsonStr = jsonEncode(downloadRules);
        break;
    }
    Clipboard.setData(ClipboardData(text: jsonStr));
    ToastUtil.success('已复制到剪贴板');
  }
}
