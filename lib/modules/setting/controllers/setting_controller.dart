import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class SettingController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  // 目录设置列表
  final directories = <DirectorySetting>[].obs;
  
  // 下载客户端列表
  final downloadClients = <DownloadClient>[].obs;
  
  // 加载状态
  final isLoadingDirectories = false.obs;
  final isLoadingDownloadClients = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDirectories();
    loadDownloadClients();
  }

  /// 加载目录设置列表
  Future<void> loadDirectories() async {
    isLoadingDirectories.value = true;
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
        '/api/v1/system/setting/Directories',
        token: token,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          final directoryResponse = DirectorySettingResponse.fromJson(data);
          if (directoryResponse.success && directoryResponse.data != null) {
            directories.value = directoryResponse.data!.value;
          } else {
            ToastUtil.error(directoryResponse.message ?? '加载目录设置失败');
          }
        }
      } else {
        ToastUtil.error('加载目录设置失败');
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载目录设置失败');
      ToastUtil.error('加载目录设置失败');
    } finally {
      isLoadingDirectories.value = false;
    }
  }

  /// 加载下载客户端列表
  Future<void> loadDownloadClients() async {
    isLoadingDownloadClients.value = true;
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
        '/api/v1/download/clients',
        token: token,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          downloadClients.value = data
              .whereType<Map<String, dynamic>>()
              .map((e) => DownloadClient.fromJson(e))
              .toList();
        }
      } else {
        ToastUtil.error('加载下载客户端列表失败');
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载下载客户端列表失败');
      ToastUtil.error('加载下载客户端列表失败');
    } finally {
      isLoadingDownloadClients.value = false;
    }
  }

  /// 获取目录建议列表（从目录设置中提取 download_path）
  List<String> get directorySuggestions {
    return directories
        .map((dir) => dir.downloadPath)
        .where((path) => path.isNotEmpty)
        .toList();
  }
}
