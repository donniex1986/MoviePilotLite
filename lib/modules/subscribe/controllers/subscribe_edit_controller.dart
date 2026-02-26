import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/directory/controllers/directory_list_controller.dart';
import 'package:moviepilot_mobile/modules/downloader/controllers/downloader_controller.dart';
import 'package:moviepilot_mobile/modules/rule/controllers/rule_controller.dart';
import 'package:moviepilot_mobile/modules/rule/models/rule_models.dart';
import 'package:moviepilot_mobile/modules/settings/models/system_env_model.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_controller.dart';
import 'package:moviepilot_mobile/modules/site/models/site_models.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/subscribe_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 订阅编辑 Controller
class SubscribeEditController extends GetxController {
  final _api = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  /// 原始订阅项
  SubscribeItem get item => _item;
  late SubscribeItem _item;

  final isSaving = false.obs;
  final envData = Rxn<SystemEnvData>();

  // --- 基础 ---
  final keyword = ''.obs;
  final totalEpisode = 0.obs;
  final startEpisode = 0.obs;
  final quality = '全部'.obs;
  final resolution = '1080p'.obs;
  final effect = '全部'.obs;
  final selectedSiteIds = <int>[].obs;
  final selectedDownloader = ''.obs;
  final selectedSavePath = ''.obs;
  final bestVersion = false.obs;
  final searchImdbid = false.obs;

  // --- 进阶 ---
  final include = ''.obs;
  final exclude = ''.obs;
  final selectedPriorityRuleNames = <String>[].obs; // 顺序多选，可拖拽排序
  final episodeGroup = ''.obs;
  final season = 0.obs;
  final mediaCategory = ''.obs;
  final customWords = ''.obs;

  // 质量选项（单选枚举）
  static const qualityOptions = [
    '全部',
    '蓝光原盘',
    'Remux',
    'BluRay',
    'UHD',
    'WEB-DL',
  ];

  // 分辨率选项（单选枚举）
  static const resolutionOptions = ['全部', '4k', '1080p', '720p'];

  // 特效选项（单选枚举）
  static const effectOptions = [
    '全部',
    '杜比视界',
    '杜比全景声',
    'HDR',
    'SDR',
  ];

  // 季选项 0-199
  static List<int> get seasonOptions => List.generate(200, (i) => i);

  DownloaderController get _downloaderController => Get.find<DownloaderController>();
  DirectoryListController get _directoryController => Get.find<DirectoryListController>();
  RuleController get _ruleController =>
      Get.find<RuleController>(tag: 'subscribe_edit_priority');
  SiteController get _siteController => Get.find<SiteController>();
  SubscribeController get _subscribeController => Get.find<SubscribeController>();

  /// 下载器列表（从 downloader controller）
  List<String> get downloaders =>
      _downloaderController.downloaders.map((c) => c.name).toList();

  /// 保存路径列表（从 directory controller）
  List<String> get savePaths => _directoryController.directorySuggestions;

  /// 优先级规则列表（从 rule controller）
  List<UserFilterRuleGroup> get priorityRules => _ruleController.priorityRules;

  /// 可用站点列表（从 env 的 SEARCH_SOURCE 或 site API 获取）
  /// 优先从 env 读取，若无则用 site controller
  List<SiteModel> get availableSites {
    final env = envData.value;
    if (env != null) {
      final searchSource = env.searchSource;
      if (searchSource != null && searchSource.isNotEmpty) {
        final ids = searchSource
            .split(RegExp(r'[,，\s]+'))
            .map((s) => int.tryParse(s.trim()))
            .whereType<int>()
            .toList();
        if (ids.isNotEmpty) {
          return _siteController.items
              .map((e) => e.site)
              .where((s) => ids.contains(s.id))
              .toList();
        }
      }
    }
    return _siteController.items.map((e) => e.site).toList();
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is SubscribeItem) {
      _item = args;
      _initFromItem();
    } else {
      _item = const SubscribeItem();
    }
  }

  @override
  void onReady() {
    super.onReady();
    _loadEnv();
    _ensureControllersLoaded();
  }

  void _initFromItem() {
    keyword.value = _item.keyword ?? '';
    totalEpisode.value = _item.totalEpisode ?? 0;
    startEpisode.value = _item.startEpisode ?? 0;
    quality.value = _item.quality ?? '全部';
    resolution.value = _item.resolution ?? '1080p';
    effect.value = _item.effect ?? '全部';
    selectedSiteIds.value = _item.sites ?? [];
    selectedDownloader.value = _item.downloader ?? '';
    selectedSavePath.value = _item.savePath ?? '';
    bestVersion.value = (_item.bestVersion ?? 0) != 0;
    searchImdbid.value = (_item.searchImdbid ?? 0) != 0;

    include.value = _item.include ?? '';
    exclude.value = _item.exclude ?? '';
    mediaCategory.value = _item.mediaCategory ?? '';
    customWords.value = _item.customWords ?? '';
    season.value = _item.season ?? 0;
    episodeGroup.value = _item.episodeGroup?.toString() ?? '';

    final fg = _item.filterGroups;
    if (fg is List) {
      selectedPriorityRuleNames.value = fg
          .map((e) => e is Map ? (e['name'] ?? e['rule_string'] ?? '').toString() : e.toString())
          .where((s) => s.isNotEmpty)
          .toList();
    } else if (fg != null) {
      selectedPriorityRuleNames.value = [fg.toString()];
    } else {
      selectedPriorityRuleNames.value = [];
    }
  }

  Future<void> _loadEnv() async {
    try {
      final resp = await _api.get<Map<String, dynamic>>('/api/v1/system/env');
      if (resp.statusCode != null && resp.statusCode! >= 200 && resp.statusCode! < 300) {
        final body = resp.data;
        if (body != null) {
          final parsed = SystemEnvResponse.fromJson(body);
          if (parsed.success && parsed.data != null) {
            envData.value = parsed.data;
          }
        }
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载 env 失败');
    }
  }

  void _ensureControllersLoaded() {
    if (!_downloaderController.downloaders.isNotEmpty) {
      _downloaderController.loadDownloaders();
    }
    if (_directoryController.directories.isEmpty) {
      _directoryController.loadDirectories();
    }
    if (!Get.isRegistered<RuleController>(tag: 'subscribe_edit_priority')) {
      Get.put(
        RuleController(ruleType: RuleType.priority),
        tag: 'subscribe_edit_priority',
      );
    } else {
      final rc = Get.find<RuleController>(tag: 'subscribe_edit_priority');
      if (rc.ruleType == RuleType.priority && rc.priorityRules.isEmpty) {
        rc.load();
      }
    }
    if (_siteController.items.isEmpty) {
      _siteController.load();
    }
  }

  void setKeyword(String v) => keyword.value = v;
  void setTotalEpisode(int v) => totalEpisode.value = v;
  void setStartEpisode(int v) => startEpisode.value = v;
  void setQuality(String v) => quality.value = v;
  void setResolution(String v) => resolution.value = v;
  void setEffect(String v) => effect.value = v;
  void setSelectedSites(List<int> ids) => selectedSiteIds.value = List.from(ids);
  void setDownloader(String v) => selectedDownloader.value = v;
  void setSavePath(String v) => selectedSavePath.value = v;
  void setBestVersion(bool v) => bestVersion.value = v;
  void setSearchImdbid(bool v) => searchImdbid.value = v;

  void setInclude(String v) => include.value = v;
  void setExclude(String v) => exclude.value = v;
  void setMediaCategory(String v) => mediaCategory.value = v;
  void setCustomWords(String v) => customWords.value = v;
  void setSeason(int v) => season.value = v;
  void setEpisodeGroup(String v) => episodeGroup.value = v;
  void setPriorityRuleNames(List<String> names) =>
      selectedPriorityRuleNames.value = List.from(names);

  void reorderPriorityRule(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = selectedPriorityRuleNames.removeAt(oldIndex);
    selectedPriorityRuleNames.insert(newIndex, item);
  }

  Future<bool> save() async {
    if (_item.id == null) return false;
    isSaving.value = true;
    try {
      final payload = _buildPayload();
      await _subscribeController.updateSubscribeData(
        _item.id.toString(),
        extraPayload: payload,
      );
      ToastUtil.success('保存成功');
      _subscribeController.loadUserSubscribes();
      return true;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '保存订阅失败');
      ToastUtil.error('保存失败');
      return false;
    } finally {
      isSaving.value = false;
    }
  }

  Map<String, dynamic> _buildPayload() {
    return {
      'keyword': keyword.value.isEmpty ? null : keyword.value,
      'total_episode': totalEpisode.value,
      'start_episode': startEpisode.value,
      'quality': quality.value,
      'resolution': resolution.value,
      'effect': effect.value,
      'sites': selectedSiteIds.isEmpty ? null : selectedSiteIds.toList(),
      'downloader': selectedDownloader.value.isEmpty ? null : selectedDownloader.value,
      'save_path': selectedSavePath.value.isEmpty ? null : selectedSavePath.value,
      'best_version': bestVersion.value ? 1 : 0,
      'search_imdbid': searchImdbid.value ? 1 : 0,
      'include': include.value.isEmpty ? null : include.value,
      'exclude': exclude.value.isEmpty ? null : exclude.value,
      'media_category': mediaCategory.value.isEmpty ? null : mediaCategory.value,
      'custom_words': customWords.value.isEmpty ? null : customWords.value,
      'season': season.value,
      'episode_group': episodeGroup.value.isEmpty ? null : episodeGroup.value,
      'filter_groups': selectedPriorityRuleNames.isEmpty
          ? null
          : selectedPriorityRuleNames
              .map((n) => {'name': n})
              .toList(),
    };
  }

  Future<bool> deleteSubscribe() async {
    if (_item.id == null) return false;
    isSaving.value = true;
    try {
      final ok = await _subscribeController.deleteSubscribes(_item.id.toString());
      if (ok) {
        ToastUtil.success('已取消订阅');
        _subscribeController.loadUserSubscribes();
        return true;
      }
      return false;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '取消订阅失败');
      ToastUtil.error('取消失败');
      return false;
    } finally {
      isSaving.value = false;
    }
  }
}
