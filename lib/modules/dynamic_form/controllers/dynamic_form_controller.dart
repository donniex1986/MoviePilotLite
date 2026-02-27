import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/dynamic_form_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/services/form_block_converter.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/services/trash_clean_converter.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';

/// 动态表单控制器：拉取接口、解析、转换为 FormBlock 列表；配置表单支持保存
class DynamicFormController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  /// 接口路径（GET 拉取），如 /api/v1/plugin/page/xxx
  late final String apiPath;

  /// 接口路径（PUT 保存），仅配置表单需要，如 /api/v1/plugin/xxx
  String? apiSavePath;

  /// 页面标题，可选，用于 AppBar
  String? pageTitle;

  final blocks = <FormBlock>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();
  final saveSuccess = false.obs;
  final formMode = false.obs;
  String? pluginId;

  /// 配置表单当前数据（key 为 props.model），保存时 PUT 此 Map
  final formModel = Rx<Map<String, dynamic>>({});

  String? _getToken() =>
      _appService.loginResponse?.accessToken ??
      _appService.latestLoginProfileAccessToken ??
      _apiClient.token;

  /// 初始化：接口路径必填，标题可选
  void init(
    String path, {
    String? title,
    bool formMode = false,
    String? pluginId,
  }) {
    apiPath = path;
    pageTitle = title;
    this.formMode.value = formMode;
    this.pluginId = pluginId;
  }

  @override
  void onReady() {
    super.onReady();
    load();
  }

  /// 根据字段名取当前值（配置表单用）
  dynamic getValue(String? name) {
    if (name == null || name.isEmpty) return null;
    return formModel.value[name];
  }

  static bool _boolFromDynamic(dynamic v) {
    if (v == null) return false;
    if (v is bool) return v;
    if (v is String) return v.toLowerCase() == 'true' || v == '1';
    if (v is num) return v != 0;
    return false;
  }

  /// 根据字段名取 bool（用于 Switch）
  bool getBoolValue(String? name) => _boolFromDynamic(getValue(name));

  /// 更新字段值（配置表单用）
  void updateField(String? name, dynamic value) {
    if (name == null || name.isEmpty) return;
    formModel.value = Map<String, dynamic>.from(formModel.value)
      ..[name] = value;
  }

  /// 是否显示保存按钮（有 formModel 且有 key 时）
  bool get hasFormModel => formModel.value.isNotEmpty;

  bool get _isTrashClean => pluginId == 'TrashClean';

  Future<void> load() async {
    isLoading.value = true;
    errorText.value = null;
    saveSuccess.value = false;
    try {
      final token = _getToken();
      if (token == null || token.isEmpty) {
        errorText.value = '请先登录';
        blocks.clear();
        formModel.value = {};
        return;
      }

      if (_isTrashClean) {
        await _loadTrashClean(token);
        return;
      }

      final response = await _apiClient.get<dynamic>(apiPath, token: token);
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '请求失败 (HTTP $status)';
        blocks.clear();
        formModel.value = {};
        return;
      }
      final data = response.data;
      final map = _extractMap(data);
      if (map == null) {
        errorText.value = '数据格式错误';
        blocks.clear();
        formModel.value = {};
        return;
      }
      final parsed = DynamicFormResponse.fromJson(
        Map<String, dynamic>.from(map),
      );
      if (parsed.model != null && parsed.model!.isNotEmpty) {
        formModel.value = Map<String, dynamic>.from(parsed.model!);
      } else {
        formModel.value = {};
      }
      final blocksList = FormBlockConverter.convert(parsed);
      blocks.assignAll(blocksList);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取动态表单失败');
      errorText.value = '请求失败，请稍后重试';
      blocks.clear();
      formModel.value = {};
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadTrashClean(String token) async {
    try {
      const basePath = '/api/v1/plugin/TrashClean';

      if (formMode.value) {
        // 配置页：只需 status 接口
        final resp = await _apiClient.get<dynamic>(
          '$basePath/status',
          token: token,
        );
        final statusMap = _extractMap(resp.data);
        if (statusMap == null) {
          errorText.value = '数据格式错误';
          blocks.clear();
          formModel.value = {};
          return;
        }
        final (blocksList, model) = TrashCleanConverter.convertForm(
          status: statusMap,
        );
        formModel.value = model;
        blocks.assignAll(blocksList);
      } else {
        // 展示页：并行请求 5 个接口
        final results = await Future.wait([
          _apiClient.get<dynamic>('$basePath/status', token: token),
          _apiClient.get<dynamic>(
            '$basePath/latest_clean_result',
            token: token,
          ),
          _apiClient.get<dynamic>('$basePath/clean_progress', token: token),
          _apiClient.get<dynamic>('$basePath/stats', token: token),
          _apiClient.get<dynamic>('$basePath/downloaders', token: token),
        ]);

        final statusMap = _extractMap(results[0].data) ?? {};
        final cleanResultMap = _extractMap(results[1].data) ?? {};
        final progressMap = _extractMap(results[2].data) ?? {};
        final statsData = results[3].data;
        final statsList = statsData is List
            ? statsData.cast<Map<String, dynamic>>()
            : <Map<String, dynamic>>[];
        final downloadersData = results[4].data;
        final downloadersList = downloadersData is List
            ? downloadersData.cast<Map<String, dynamic>>()
            : <Map<String, dynamic>>[];

        final blocksList = TrashCleanConverter.convertPage(
          status: statusMap,
          latestCleanResult: cleanResultMap,
          cleanProgress: progressMap,
          stats: statsList,
          downloaders: downloadersList,
        );
        formModel.value = {};
        blocks.assignAll(blocksList);
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取 TrashClean 数据失败');
      errorText.value = '请求失败，请稍后重试';
      blocks.clear();
      formModel.value = {};
    }
  }

  /// 保存配置（标准插件 PUT，TrashClean 走 POST /config）
  Future<bool> save() async {
    if (formModel.value.isEmpty) return false;
    final token = _getToken();
    if (token == null || token.isEmpty) {
      errorText.value = '请先登录';
      return false;
    }

    if (_isTrashClean) return _saveTrashClean(token);

    final savePath = apiSavePath;
    if (savePath == null || savePath.isEmpty) return false;
    isLoading.value = true;
    errorText.value = null;
    saveSuccess.value = false;
    try {
      _log.info('保存配置: $savePath ${formModel.value}');
      final response = await _apiClient.put(
        savePath,
        formModel.value,
        token: token,
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '保存失败 (HTTP $status)';
        return false;
      }

      saveSuccess.value = true;
      return true;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '保存配置失败');
      errorText.value = '保存失败，请稍后重试';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> _saveTrashClean(String token) async {
    isLoading.value = true;
    errorText.value = null;
    saveSuccess.value = false;
    try {
      final body = TrashCleanConverter.toConfigBody(formModel.value);
      _log.info('保存 TrashClean 配置: $body');
      final response = await _apiClient.post<dynamic>(
        '/api/v1/plugin/TrashClean/config',
        data: body,
        token: token,
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '保存失败 (HTTP $status)';
        return false;
      }
      saveSuccess.value = true;
      return true;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '保存 TrashClean 配置失败');
      errorText.value = '保存失败，请稍后重试';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// TrashClean 立即清理，返回清理结果 Map 或 null（失败时）
  Future<Map<String, dynamic>?> triggerClean() async {
    final token = _getToken();
    if (token == null || token.isEmpty) return null;
    try {
      final response = await _apiClient.post<dynamic>(
        '/api/v1/plugin/TrashClean/clean',
        token: token,
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) return null;
      return _extractMap(response.data);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: 'TrashClean 清理失败');
      return null;
    }
  }

  /// 获取 TrashClean 清理进度
  Future<Map<String, dynamic>?> fetchCleanProgress() async {
    final token = _getToken();
    if (token == null || token.isEmpty) return null;
    try {
      final response = await _apiClient.get<dynamic>(
        '/api/v1/plugin/TrashClean/clean_progress',
        token: token,
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) return null;
      return _extractMap(response.data);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取 TrashClean 清理进度失败');
      return null;
    }
  }

  Map<String, dynamic>? _extractMap(dynamic raw) {
    if (raw is Map<String, dynamic>) return raw;
    if (raw is Map) return Map<String, dynamic>.from(raw);
    if (raw is String) {
      try {
        final decoded = jsonDecode(raw);
        return decoded is Map ? Map<String, dynamic>.from(decoded) : null;
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}
