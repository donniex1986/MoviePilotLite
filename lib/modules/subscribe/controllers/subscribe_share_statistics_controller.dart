import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/share_statistics_model.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';

class SubscribeShareStatisticsController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  final items = <ShareStatisticsItem>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();

  String? _getToken() =>
      _appService.loginResponse?.accessToken ??
      _appService.latestLoginProfileAccessToken ??
      _apiClient.token;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    errorText.value = null;
    try {
      final token = _getToken();
      if (token == null || token.isEmpty) {
        errorText.value = '请先登录';
        items.clear();
        return;
      }
      final response = await _apiClient.get<dynamic>(
        '/api/v1/subscribe/share/statistics',
        token: token,
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '请求失败 (HTTP $status)';
        items.clear();
        return;
      }
      final data = response.data;
      final list = _extractList(data);
      final parsed = <ShareStatisticsItem>[];
      for (final raw in list) {
        if (raw is Map<String, dynamic>) {
          try {
            parsed.add(ShareStatisticsItem.fromJson(raw));
          } catch (_) {}
        }
      }
      items.assignAll(parsed);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取分享统计失败');
      errorText.value = '请求失败，请稍后重试';
      items.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Iterable<dynamic> _extractList(dynamic raw) {
    if (raw is List) return raw;
    if (raw is Map<String, dynamic>) {
      final data = raw['data'];
      if (data is List) return data;
    }
    return const [];
  }
}
