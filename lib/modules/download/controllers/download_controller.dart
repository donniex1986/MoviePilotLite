import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/search_result/models/search_result_models.dart';
import 'package:moviepilot_mobile/modules/setting/controllers/setting_controller.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class DownloadController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  // 下载器列表（使用 DownloadClient）
  final downloaders = <DownloadClient>[].obs;
  final selectedDownloader = Rxn<DownloadClient>();

  // 下载目录列表和建议
  final selectedDirectory = ''.obs;

  // TMDB ID
  final tmdbId = ''.obs;

  // 高级选项展开状态
  final showAdvanced = false.obs;

  // 加载状态
  final isDownloading = false.obs;

  SettingController get _settingController {
    if (!Get.isRegistered<SettingController>()) {
      Get.put(SettingController());
    }
    return Get.find<SettingController>();
  }

  @override
  void onInit() {
    super.onInit();
    _loadDownloaders();
    _loadDirectories();
  }

  /// 加载下载器列表（从 SettingController）
  void _loadDownloaders() {
    // 监听 SettingController 的下载客户端列表
    ever(_settingController.downloadClients, (clients) {
      downloaders.value = clients;

      // 设置默认下载器（选择第一个）
      if (downloaders.isNotEmpty && selectedDownloader.value == null) {
        selectedDownloader.value = downloaders.first;
      }
    });

    // 立即同步一次
    if (_settingController.downloadClients.isNotEmpty) {
      downloaders.value = _settingController.downloadClients.toList();
      if (selectedDownloader.value == null && downloaders.isNotEmpty) {
        selectedDownloader.value = downloaders.first;
      }
    }
  }

  /// 加载下载目录列表（从 SettingController）
  void _loadDirectories() {
    // 目录建议从 SettingController 获取
    // 通过 directorySuggestions getter 访问
  }

  /// 获取目录建议列表
  List<String> get directorySuggestions {
    return _settingController.directorySuggestions;
  }

  /// 获取目录列表（从目录设置中提取）
  List<String> get directories {
    return _settingController.directories
        .map((dir) => dir.downloadPath)
        .where((path) => path.isNotEmpty)
        .toList();
  }

  /// 获取下载器加载状态
  bool get isLoadingDownloaders =>
      _settingController.isLoadingDownloadClients.value;

  /// 获取目录加载状态
  bool get isLoadingDirectories =>
      _settingController.isLoadingDirectories.value;

  /// 开始下载
  Future<void> startDownload({
    required SearchResultItem item,
    String? customTmdbId,
  }) async {
    if (selectedDownloader.value == null) {
      ToastUtil.error('请选择下载器');
      return;
    }

    isDownloading.value = true;
    try {
      final payload = <String, dynamic>{
        'downloader': selectedDownloader.value!.name,
        'save_path': selectedDirectory.value.isNotEmpty
            ? selectedDirectory.value
            : null,
        'media_in': item.media_info?.toJson(),
        'torrent_in': item.torrent_info?.toJson(),
        'tmdbid': customTmdbId,
      };
      final response = await _apiClient.post('/api/v1/download', data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        ToastUtil.success('下载任务已创建');
        Get.back();
      } else {
        final errorMsg = response.data is Map
            ? (response.data as Map)['message'] ?? '下载失败'
            : '下载失败';
        ToastUtil.error(errorMsg);
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '下载失败');
      ToastUtil.error('下载失败，请稍后重试');
    } finally {
      isDownloading.value = false;
    }
  }

  void setDownloader(DownloadClient? downloader) {
    selectedDownloader.value = downloader;
  }

  void setDirectory(String directory) {
    selectedDirectory.value = directory;
  }

  void setTmdbId(String id) {
    tmdbId.value = id;
  }
}
