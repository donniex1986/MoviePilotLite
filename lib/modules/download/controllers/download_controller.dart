import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/search_result/models/search_result_models.dart';
import 'package:moviepilot_mobile/modules/setting/controllers/setting_controller.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class DownloadController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
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
      // 构建 payload，只包含非空值
      final payload = <String, dynamic>{
        'downloader': selectedDownloader.value!.name,
        if (selectedDirectory.value.isNotEmpty)
          'save_path': selectedDirectory.value,
        if (item.media_info != null) 'media_in': item.media_info!.toJson(),
        if (item.torrent_info != null)
          'torrent_in': item.torrent_info!.toJson(),
        if (customTmdbId != null && customTmdbId.isNotEmpty)
          'tmdbid': customTmdbId,
      };

      _log.info('下载请求 payload: $payload');

      final response = await _apiClient.post('/api/v1/download', data: payload);

      _log.info(
        '下载响应状态码: ${response.statusCode}, 响应头: ${response.headers}, 数据: ${response.data}',
      );

      // 处理重定向（如果 Dio 没有自动跟随）
      if (response.statusCode == 307 ||
          response.statusCode == 301 ||
          response.statusCode == 302) {
        final location =
            response.headers.value('location') ??
            response.headers.value('Location');
        if (location != null) {
          _log.info('检测到重定向到: $location');
          // 解析重定向 URL（可能是相对路径）
          String redirectPath = location;
          if (location.startsWith('http://') ||
              location.startsWith('https://')) {
            // 绝对 URL，提取路径部分
            final uri = Uri.parse(location);
            redirectPath = uri.path;
            if (uri.queryParameters.isNotEmpty) {
              redirectPath += '?${uri.query}';
            }
          } else if (!location.startsWith('/')) {
            // 相对路径，需要基于当前路径解析
            redirectPath = '/api/v1/download/$location';
          }

          _log.info('重定向路径: $redirectPath');
          // 对于 307，需要保持原始请求方法和请求体
          final redirectResponse = await _apiClient.post(
            redirectPath,
            data: payload,
            timeout: 120,
          );
          _log.info(
            '重定向后响应状态码: ${redirectResponse.statusCode}, 数据: ${redirectResponse.data}',
          );

          if (redirectResponse.statusCode == 200 ||
              redirectResponse.statusCode == 201) {
            Get.back();
            Future.delayed(const Duration(seconds: 1), () {
              ToastUtil.success('下载任务已创建');
            });
          } else {
            final errorMsg = redirectResponse.data is Map
                ? (redirectResponse.data as Map)['message'] ??
                      (redirectResponse.data as Map)['detail'] ??
                      '下载失败 (HTTP ${redirectResponse.statusCode})'
                : '下载失败 (HTTP ${redirectResponse.statusCode})';
            ToastUtil.error(errorMsg);
            _log.error('重定向后下载失败: $errorMsg, 响应数据: ${redirectResponse.data}');
          }
        } else {
          _log.warning('收到 ${response.statusCode} 重定向响应，但未找到 Location 头');
        }
        return;
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        Future.delayed(const Duration(seconds: 1), () {
          ToastUtil.success('下载任务已创建');
        });
      } else {
        final errorMsg = response.data is Map
            ? (response.data as Map)['message'] ??
                  (response.data as Map)['detail'] ??
                  '下载失败 (HTTP ${response.statusCode})'
            : '下载失败 (HTTP ${response.statusCode})';
        ToastUtil.error(errorMsg);
        _log.error('下载失败: $errorMsg, 响应数据: ${response.data}');
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '下载失败');
      ToastUtil.error('下载失败，请稍后重试 $e');
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
