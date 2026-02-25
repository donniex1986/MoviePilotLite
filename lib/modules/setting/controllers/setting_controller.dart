import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/directory/controllers/directory_list_controller.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class SettingController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  // 下载客户端列表
  final downloadClients = <DownloadClient>[].obs;

  // 加载状态
  final isLoadingDownloadClients = false.obs;

  DirectoryListController get _directoryController {
    if (!Get.isRegistered<DirectoryListController>()) {
      Get.put(DirectoryListController(), permanent: true);
    }
    return Get.find<DirectoryListController>();
  }

  /// 目录设置列表（委托 DirectoryListController）
  List<DirectorySetting> get directories => _directoryController.directories;

  /// 目录加载状态
  bool get isLoadingDirectories => _directoryController.isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _directoryController; // 确保 DirectoryListController 已注册
    loadDownloadClients();
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

  /// 获取目录建议列表（委托 DirectoryListController）
  List<String> get directorySuggestions =>
      _directoryController.directorySuggestions;
}
