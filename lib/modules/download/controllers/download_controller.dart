import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/search_result/models/search_result_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class DownloadController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  // 下载器列表
  final downloaders = <DownloaderItem>[].obs;
  final selectedDownloader = Rxn<DownloaderItem>();
  
  // 下载目录列表和建议
  final directories = <String>[].obs;
  final selectedDirectory = ''.obs;
  final directorySuggestions = <String>[].obs;
  
  // TMDB ID
  final tmdbId = ''.obs;
  
  // 加载状态
  final isLoadingDownloaders = false.obs;
  final isLoadingDirectories = false.obs;
  final isDownloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDownloaders();
    loadDirectories();
  }

  /// 加载下载器列表
  Future<void> loadDownloaders() async {
    isLoadingDownloaders.value = true;
    try {
      final token =
          _appService.loginResponse?.accessToken ??
          _appService.latestLoginProfileAccessToken ??
          _apiClient.token;
      if (token == null || token.isEmpty) {
        ToastUtil.error('请先登录');
        return;
      }

      final response = await _apiClient.get<dynamic>(
        '/api/v1/downloader/list',
        token: token,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          downloaders.value = data
              .whereType<Map<String, dynamic>>()
              .map((e) => DownloaderItem.fromJson(e))
              .toList();
          
          // 设置默认下载器
          if (downloaders.isNotEmpty && selectedDownloader.value == null) {
            final defaultDownloader = downloaders.firstWhere(
              (d) => d.isDefault == true,
              orElse: () => downloaders.first,
            );
            selectedDownloader.value = defaultDownloader;
          }
        }
      } else {
        ToastUtil.error('加载下载器列表失败');
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载下载器列表失败');
      ToastUtil.error('加载下载器列表失败');
    } finally {
      isLoadingDownloaders.value = false;
    }
  }

  /// 加载下载目录列表和建议
  Future<void> loadDirectories() async {
    isLoadingDirectories.value = true;
    try {
      final token =
          _appService.loginResponse?.accessToken ??
          _appService.latestLoginProfileAccessToken ??
          _apiClient.token;
      if (token == null || token.isEmpty) {
        return;
      }

      final response = await _apiClient.get<dynamic>(
        '/api/v1/downloader/directories',
        token: token,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          final dirs = data['directories'];
          final suggestions = data['suggestions'];
          
          if (dirs is List) {
            directories.value = dirs.whereType<String>().toList();
          }
          
          if (suggestions is List) {
            directorySuggestions.value = suggestions.whereType<String>().toList();
          }
          
          // 设置默认目录（留空自动匹配）
          if (selectedDirectory.value.isEmpty && directorySuggestions.isNotEmpty) {
            selectedDirectory.value = '';
          }
        }
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载下载目录失败');
    } finally {
      isLoadingDirectories.value = false;
    }
  }

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
      final token =
          _appService.loginResponse?.accessToken ??
          _appService.latestLoginProfileAccessToken ??
          _apiClient.token;
      if (token == null || token.isEmpty) {
        ToastUtil.error('请先登录');
        return;
      }

      final payload = <String, dynamic>{
        'downloader_id': selectedDownloader.value!.id,
        'enclosure': item.torrent_info?.enclosure ?? '',
        'title': item.torrent_info?.title ?? item.meta_info?.title ?? '',
        if (selectedDirectory.value.isNotEmpty) 'save_path': selectedDirectory.value,
        if (customTmdbId != null && customTmdbId.isNotEmpty) 'tmdb_id': customTmdbId,
      };

      final response = await _apiClient.post(
        '/api/v1/downloader/download',
        data: payload,
        token: token,
      );

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

  void setDownloader(DownloaderItem? downloader) {
    selectedDownloader.value = downloader;
  }

  void setDirectory(String directory) {
    selectedDirectory.value = directory;
  }

  void setTmdbId(String id) {
    tmdbId.value = id;
  }
}

/// 下载器项
class DownloaderItem {
  DownloaderItem({
    required this.id,
    required this.name,
    this.isDefault = false,
  });

  final String id;
  final String name;
  final bool isDefault;

  factory DownloaderItem.fromJson(Map<String, dynamic> json) {
    return DownloaderItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '未知下载器',
      isDefault: json['is_default'] == true || json['default'] == true,
    );
  }
}
