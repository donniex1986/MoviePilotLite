import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 目录列表页 Controller
/// 使用 /api/v1/system/setting/Directories 获取 DirectorySetting 列表
class DirectoryListController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  final directories = <DirectorySetting>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();

  @override
  void onReady() {
    super.onReady();
    loadDirectories();
  }

  /// 加载目录设置列表
  Future<void> loadDirectories() async {
    isLoading.value = true;
    errorText.value = null;
    try {
      final token =
          _appService.loginResponse?.accessToken ??
          _appService.latestLoginProfileAccessToken ??
          _apiClient.token;
      if (token == null || token.isEmpty) {
        ToastUtil.error('请先登录');
        errorText.value = '请先登录';
        directories.clear();
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
            directories.assignAll(directoryResponse.data!.value);
          } else {
            errorText.value = directoryResponse.message ?? '加载目录设置失败';
            directories.clear();
          }
        } else {
          errorText.value = '数据格式异常';
          directories.clear();
        }
      } else {
        errorText.value = '请求失败 (HTTP ${response.statusCode ?? 0})';
        directories.clear();
      }
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载目录设置失败');
      errorText.value = '请求失败，请稍后重试';
      directories.clear();
    } finally {
      isLoading.value = false;
    }
  }

  /// 获取目录建议列表（从目录设置中提取 download_path）
  List<String> get directorySuggestions =>
      directories
          .map((dir) => dir.downloadPath)
          .where((path) => path.isNotEmpty)
          .toList();
}
