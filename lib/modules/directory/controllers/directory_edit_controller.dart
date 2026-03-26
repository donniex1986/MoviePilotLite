import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/directory/controllers/directory_display_utils.dart';
import 'package:moviepilot_mobile/modules/directory/controllers/directory_list_controller.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_field_state.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_manager.dart';

class DirectoryEditController extends GetxController {
  final listController = Get.find<DirectoryListController>();

  late final int index;
  late DirectorySetting original;

  final isSaving = false.obs;

  late final SettingsFormManager form = SettingsFormManager(fields: fields);

  static final List<SettingsFieldConfig> fields = [
    const SettingsFieldConfig(
      label: '目录别名',
      envKey: 'name',
      type: SettingsFieldType.text,
      // hint: '显示名称',
    ),
    const SettingsFieldConfig(
      label: '优先级',
      envKey: 'priority',
      type: SettingsFieldType.number,
      step: 1,
    ),
    const SettingsFieldConfig(
      label: '发送通知',
      envKey: 'notify',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '媒体类型',
      envKey: 'media_type',
      type: SettingsFieldType.select,
      enumKey: 'DIR_MEDIA_TYPE',
    ),
    const SettingsFieldConfig(
      label: '媒体类别',
      envKey: 'media_category',
      type: SettingsFieldType.select,
      enumKey: 'DIR_MEDIA_CATEGORY',
    ),
    const SettingsFieldConfig(
      label: '资源存储',
      envKey: 'storage',
      type: SettingsFieldType.select,
      enumKey: 'DIR_STORAGE',
      hint: '选择资源存储类型',
    ),
    const SettingsFieldConfig(
      label: '资源目录',
      envKey: 'download_path',
      type: SettingsFieldType.text,
      hint: '/downloads',
    ),
    const SettingsFieldConfig(
      label: '按类型分类',
      envKey: 'download_type_folder',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '按类别分类',
      envKey: 'download_category_folder',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '目录监控',
      envKey: 'monitor_type',
      type: SettingsFieldType.select,
      enumKey: 'DIR_MONITOR_TYPE',
    ),
    const SettingsFieldConfig(
      label: '监控模式',
      envKey: 'monitor_mode',
      type: SettingsFieldType.select,
      enumKey: 'DIR_MONITOR_MODE',
    ),

    const SettingsFieldConfig(
      label: '媒体库存储',
      envKey: 'library_storage',
      type: SettingsFieldType.select,
      enumKey: 'DIR_STORAGE',
    ),
    const SettingsFieldConfig(
      label: '媒体库目录',
      envKey: 'library_path',
      type: SettingsFieldType.text,
      hint: '/media',
    ),
    const SettingsFieldConfig(
      label: '整理方式',
      envKey: 'transfer_type',
      type: SettingsFieldType.select,
      enumKey: 'DIR_TRANSFER_TYPE',
    ),
    const SettingsFieldConfig(
      label: '覆盖模式',
      envKey: 'overwrite_mode',
      type: SettingsFieldType.select,
      enumKey: 'DIR_OVERWRITE_MODE',
    ),

    const SettingsFieldConfig(
      label: '媒体库按类型分类',
      envKey: 'library_type_folder',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '媒体库按类别分类',
      envKey: 'library_category_folder',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '智能重命名',
      envKey: 'renaming',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '刮削元数据',
      envKey: 'scraping',
      type: SettingsFieldType.toggle,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    index = (Get.arguments?['index'] as int?) ?? -1;
    if (index >= 0 && index < listController.directories.length) {
      original = listController.directories[index];
    } else {
      original = const DirectorySetting();
    }
    _hydrateFromOriginal();
    _bindMediaTypeLinkage();
  }

  void _hydrateFromOriginal() {
    form.hydrateValue('name', original.name);
    form.hydrateValue('storage', original.storage);
    form.hydrateValue('download_path', original.downloadPath);
    form.hydrateValue('media_type', original.mediaType);
    form.hydrateValue('media_category', original.mediaCategory);
    form.hydrateValue('priority', original.priority);
    form.hydrateValue('monitor_type', original.monitorType);
    form.hydrateValue('monitor_mode', original.monitorMode);
    form.hydrateValue('transfer_type', original.transferType);
    form.hydrateValue('library_storage', original.libraryStorage);
    form.hydrateValue('library_path', original.libraryPath);
    form.hydrateValue('overwrite_mode', original.overwriteMode);
    form.hydrateValue('library_type_folder', original.libraryTypeFolder);
    form.hydrateValue(
      'library_category_folder',
      original.libraryCategoryFolder,
    );
    form.hydrateValue('download_type_folder', original.downloadTypeFolder);
    form.hydrateValue(
      'download_category_folder',
      original.downloadCategoryFolder,
    );
    form.hydrateValue('renaming', original.renaming);
    form.hydrateValue('scraping', original.scraping);
    form.hydrateValue('notify', original.notify);
    form.clearDirty();
  }

  void _bindMediaTypeLinkage() {
    final mediaTypeField = fields.firstWhere((f) => f.envKey == 'media_type');
    final mediaCategoryField = fields.firstWhere(
      (f) => f.envKey == 'media_category',
    );
    final mediaTypeState = form.stateFor(mediaTypeField);
    form.stateFor(mediaCategoryField);
    if (mediaTypeState is! SettingsSelectFieldState) return;
    ever<String>(mediaTypeState.value, (_) => _syncCategoryForMediaType());
    _syncCategoryForMediaType();
  }

  void _syncCategoryForMediaType() {
    final mt = form.state<SettingsSelectFieldState>('media_type').value.value;
    final catState = form.state<SettingsSelectFieldState>('media_category');
    final opts = _mediaCategoryOptions(mt);
    final allowed = opts.map((e) => e.value).toSet();
    if (!allowed.contains(catState.value.value)) {
      catState.value.value = '';
    }
  }

  List<SettingsEnumOption> _mediaCategoryOptions(String mediaType) {
    final t = mediaType.trim();
    if (t.isEmpty) {
      return const [SettingsEnumOption(value: '', label: '全部')];
    }
    if (t == '电影') {
      return const [
        SettingsEnumOption(value: '', label: '全部'),
        SettingsEnumOption(value: '动画电影', label: '动画电影'),
        SettingsEnumOption(value: '华语电影', label: '华语电影'),
        SettingsEnumOption(value: '外语电影', label: '外语电影'),
      ];
    }
    if (t == '电视剧') {
      return const [
        SettingsEnumOption(value: '', label: '全部'),
        SettingsEnumOption(value: '国漫', label: '国漫'),
        SettingsEnumOption(value: '日漫', label: '日漫'),
        SettingsEnumOption(value: '纪录片', label: '纪录片'),
        SettingsEnumOption(value: '儿童', label: '儿童'),
        SettingsEnumOption(value: '综艺', label: '综艺'),
        SettingsEnumOption(value: '国产剧', label: '国产剧'),
        SettingsEnumOption(value: '日韩剧', label: '日韩剧'),
        SettingsEnumOption(value: '欧美剧', label: '欧美剧'),
        SettingsEnumOption(value: '未分类', label: '未分类'),
      ];
    }
    return const [SettingsEnumOption(value: '', label: '全部')];
  }

  List<SettingsEnumOption> optionsFor(String enumKey) {
    switch (enumKey) {
      case 'DIR_STORAGE':
        return const [
          SettingsEnumOption(value: '', label: '全部'),
          SettingsEnumOption(value: 'local', label: '本地'),
          SettingsEnumOption(value: 'u115', label: '115网盘'),
          SettingsEnumOption(value: 'alipan', label: '阿里云盘'),
          SettingsEnumOption(value: 'rclone', label: 'RClone'),
          SettingsEnumOption(value: 'alist', label: 'Openlist'),
          SettingsEnumOption(value: 'smb', label: 'SMB'),
          SettingsEnumOption(value: 'custom7', label: '自定义'),
        ];
      case 'DIR_MONITOR_TYPE':
        return MonitorType.values
            .map((e) => SettingsEnumOption(value: e.name, label: e.displayName))
            .toList();
      case 'DIR_MONITOR_MODE':
        return const [
          SettingsEnumOption(value: 'compatibility', label: '兼容模式'),
          SettingsEnumOption(value: 'fast', label: '性能模式'),
        ];
      case 'DIR_TRANSFER_TYPE':
        return TransferType.values
            .map((e) => SettingsEnumOption(value: e.name, label: e.displayName))
            .toList();
      case 'DIR_OVERWRITE_MODE':
        return OverwriteMode.values
            .map((e) => SettingsEnumOption(value: e.name, label: e.displayName))
            .toList();
      case 'DIR_MEDIA_TYPE':
        return const [
          SettingsEnumOption(value: '', label: '全部'),
          SettingsEnumOption(value: '电影', label: '电影'),
          SettingsEnumOption(value: '电视剧', label: '电视剧'),
        ];
      case 'DIR_MEDIA_CATEGORY':
        return _mediaCategoryOptions(
          form.state<SettingsSelectFieldState>('media_type').value.value,
        );
      default:
        return const [];
    }
  }

  DirectorySetting _buildUpdated() {
    String readText(String k) {
      final s = form.state<SettingsTextFieldState>(k);
      return s.controller.text.trim();
    }

    String readSelect(String k) {
      final s = form.state<SettingsSelectFieldState>(k);
      return s.value.value.trim();
    }

    int readInt(String k) {
      final s = form.state<SettingsNumberFieldState>(k);
      final n = num.tryParse(s.controller.text.trim());
      return n == null ? 0 : n.toInt();
    }

    bool readBool(String k) {
      final s = form.state<SettingsToggleFieldState>(k);
      return s.value.value;
    }

    return original.copyWith(
      name: readText('name'),
      storage: readSelect('storage'),
      downloadPath: readText('download_path'),
      mediaType: readSelect('media_type'),
      mediaCategory: readSelect('media_category'),
      monitorType: readSelect('monitor_type'),
      monitorMode: readSelect('monitor_mode'),
      libraryStorage: readSelect('library_storage'),
      libraryPath: readText('library_path'),
      transferType: readSelect('transfer_type'),
      overwriteMode: readSelect('overwrite_mode'),
      priority: readInt('priority'),
      downloadTypeFolder: readBool('download_type_folder'),
      downloadCategoryFolder: readBool('download_category_folder'),
      libraryTypeFolder: readBool('library_type_folder'),
      libraryCategoryFolder: readBool('library_category_folder'),
      renaming: readBool('renaming'),
      scraping: readBool('scraping'),
      notify: readBool('notify'),
    );
  }

  Future<bool> save() async {
    if (index < 0) return false;
    if (isSaving.value) return false;
    isSaving.value = true;
    try {
      final updated = _buildUpdated();
      final ok = await listController.updateDirectoryAt(index, updated);
      if (ok) form.clearDirty();
      return ok;
    } finally {
      isSaving.value = false;
    }
  }

  @override
  void onClose() {
    form.dispose();
    super.onClose();
  }
}
