import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/downloader/models/downloader_stats.dart';
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

  /// 各下载器状态（GET /api/v1/dashboard/downloader?name=xxx）
  final downloaderStats = <String, DownloaderStats>{}.obs;
  Timer? _statsTimer;
  static const Duration _statsInterval = Duration(seconds: 8);

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
    ever(downloaders, (_) => loadDownloaderStats());
    // 在下一帧启动定时器，避免 init 阶段被 dispose 或调度未就绪
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isClosed) {
        _statsTimer?.cancel();
        _statsTimer = Timer.periodic(
          _statsInterval,
          (_) => loadDownloaderStats(),
        );
      }
    });
  }

  @override
  void onClose() {
    _statsTimer?.cancel();
    _statsTimer = null;
    super.onClose();
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

  /// 刷新下载器列表（供配置列表页下拉刷新等使用）
  Future<void> refreshDownloaders() async {
    await _settingController.loadDownloadClients();
    await loadDownloaderStats();
  }

  /// 获取各下载器状态
  Future<void> loadDownloaderStats() async {
    if (downloaders.isEmpty || isClosed) return;
    final Map<String, DownloaderStats> newStats = {};
    for (final d in downloaders) {
      if (d.name.isEmpty) continue;
      try {
        final resp = await _apiClient.get<Map<String, dynamic>>(
          '/api/v1/dashboard/downloader',
          queryParameters: {'name': d.name},
        );
        if (resp.statusCode == 200 && resp.data != null) {
          newStats[d.name] = DownloaderStats.fromJson(resp.data!);
        }
      } catch (e, st) {
        _log.handle(e, stackTrace: st, message: '获取下载器 ${d.name} 状态失败');
      }
    }
    if (!isClosed) {
      downloaderStats.assignAll(newStats);
      downloaderStats.refresh();
    }
  }

  DownloaderStats? statsFor(String downloaderName) =>
      downloaderStats[downloaderName];

  /// 获取目录加载状态
  bool get isLoadingDirectories => _settingController.isLoadingDirectories;

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

      final response = await _apiClient.post(
        item.media_info != null ? '/api/v1/download' : '/api/v1/download/add',
        data: payload,
        timeout: 120,
      );

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
        if (response.data['success'] == true) {
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
