import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/downloader/models/downloader_config_model.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 下载器配置控制器：支持列表、新增、编辑
class DownloaderConfigController extends GetxController {
  final _api = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  /// 下载器配置列表
  final configs = <DownloaderConfig>[].obs;

  /// 当前编辑的配置（新增时为空模板）
  final currentConfig = Rxn<DownloaderConfig>();

  /// 编辑中的表单数据（用于双向绑定）
  final editEnabled = true.obs;
  final editIsDefault = false.obs;
  final editName = ''.obs;
  final editHost = ''.obs;
  final editUsername = ''.obs;
  final editPassword = ''.obs;
  final editAutoCategory = false.obs;
  final editSequential = false.obs;
  final editForceResume = false.obs;
  final editFirstLastPriority = false.obs;
  final editPathMappings = <PathMapping>[].obs;

  /// 加载状态
  final isLoading = false.obs;
  final isSaving = false.obs;

  /// 是否为新增模式（false = 编辑已有）
  bool get isCreateMode {
    final name = Get.parameters['name'];
    return name == null || name.isEmpty;
  }

  /// 存储类型选项
  static const storageTypes = ['本地', '阿里云盘', '115网盘', 'RClone', 'OpenList', 'SMB网络共享'];

  /// 进入表单页时调用，确保根据当前路由参数应用正确的数据（仅表单需要时加载配置）
  Future<void> ensureFormData() async {
    if (isCreateMode) {
      _applyToForm(DownloaderConfig());
      return;
    }
    final name = Get.parameters['name']!;
    if (configs.isEmpty) {
      await loadConfigs();
    }
    DownloaderConfig? existing;
    try {
      existing = configs.firstWhere((c) => c.name == name);
    } catch (_) {}
    _applyToForm(existing ?? DownloaderConfig(name: name));
  }

  /// 加载配置列表（表单编辑/保存时使用，列表页不依赖此接口）
  Future<void> loadConfigs() async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      final resp = await _api.get<Map<String, dynamic>>(
        '/api/v1/system/setting/Downloads',
      );
      if (resp.statusCode == 200 && resp.data != null) {
        final parsed = DownloaderConfigResponse.fromJson(resp.data!);
        if (parsed.success && parsed.data != null) {
          configs.value = parsed.data!.value;
        } else {
          configs.value = [];
        }
      } else {
        configs.value = [];
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载下载器配置失败');
      ToastUtil.error('加载失败');
      configs.value = [];
    } finally {
      isLoading.value = false;
    }
  }

  void _applyToForm(DownloaderConfig c) {
    currentConfig.value = c;
    editEnabled.value = c.enabled;
    editIsDefault.value = c.isDefault;
    editName.value = c.name;
    editHost.value = c.host;
    editUsername.value = c.username;
    editPassword.value = c.password;
    editAutoCategory.value = c.autoCategory;
    editSequential.value = c.sequential;
    editForceResume.value = c.forceResume;
    editFirstLastPriority.value = c.firstLastPriority;
    editPathMappings.value = c.pathMappings.isEmpty
        ? [PathMapping(storage: 'local', fromPath: '', toPath: '')]
        : List.from(c.pathMappings);
  }

  void addPathMapping() {
    editPathMappings.add(PathMapping(storage: 'local', fromPath: '', toPath: ''));
  }

  void removePathMapping(int index) {
    if (index >= 0 && index < editPathMappings.length) {
      editPathMappings.removeAt(index);
    }
  }

  void updatePathMapping(int index, {String? storage, String? fromPath, String? toPath}) {
    if (index < 0 || index >= editPathMappings.length) return;
    final old = editPathMappings[index];
    editPathMappings[index] = PathMapping(
      storage: storage ?? old.storage,
      fromPath: fromPath ?? old.fromPath,
      toPath: toPath ?? old.toPath,
    );
  }

  Future<bool> save() async {
    if (editName.value.trim().isEmpty) {
      ToastUtil.error('名称不能为空');
      return false;
    }
    final mappings = editPathMappings.where((m) => m.fromPath.trim().isNotEmpty || m.toPath.trim().isNotEmpty).toList();
    for (final m in mappings) {
      if (m.fromPath.trim().isEmpty) {
        ToastUtil.error('存储路径不能为空');
        return false;
      }
      if (m.toPath.trim().isEmpty) {
        ToastUtil.error('下载路径不能为空');
        return false;
      }
    }

    isSaving.value = true;
    try {
      if (configs.isEmpty) {
        await loadConfigs();
      }
      final config = DownloaderConfig(
        name: editName.value.trim(),
        type: currentConfig.value?.type ?? 'qbittorrent',
        enabled: editEnabled.value,
        isDefault: editIsDefault.value,
        host: editHost.value.trim(),
        username: editUsername.value.trim(),
        password: editPassword.value,
        autoCategory: editAutoCategory.value,
        sequential: editSequential.value,
        forceResume: editForceResume.value,
        firstLastPriority: editFirstLastPriority.value,
        pathMappings: mappings.isEmpty ? [PathMapping()] : mappings,
      );

      final list = List<Map<String, dynamic>>.from(
        configs.map((c) => c.toJson()),
      );
      final idx = list.indexWhere((m) => (m['name'] ?? '') == config.name);
      if (idx >= 0) {
        list[idx] = config.toJson();
      } else {
        list.add(config.toJson());
      }
      final payload = {'value': list};
      final resp = await _api.post<Map<String, dynamic>>(
        '/api/v1/system/setting/Downloads',
        data: payload,
      );

      if (resp.statusCode != null && resp.statusCode! >= 200 && resp.statusCode! < 300) {
        ToastUtil.success('保存成功');
        return true;
      }
      ToastUtil.error('保存失败');
      return false;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '保存下载器配置失败');
      ToastUtil.error('保存失败');
      return false;
    } finally {
      isSaving.value = false;
    }
  }
}
