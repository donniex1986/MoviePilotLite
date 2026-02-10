import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/site/models/site_statistic_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class SiteStatisticController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  final items = <SiteStatisticItem>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();

  int get totalSites => items.length;
  int get normalCount =>
      items.where((e) => e.state == SiteStatisticState.ok).length;
  int get failCount => items.where((e) => e.state == SiteStatisticState.fail).length;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    errorText.value = null;
    try {
      final response =
          await _apiClient.get<dynamic>('/api/v1/site/statistic');
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '获取统计失败 (HTTP $status)';
        items.clear();
        return;
      }
      final raw = response.data;
      final list = raw is List ? raw : <dynamic>[];
      final parsed = <SiteStatisticItem>[];
      for (final item in list) {
        if (item is Map<String, dynamic>) {
          try {
            parsed.add(SiteStatisticItem.fromJson(item));
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析站点统计失败');
          }
        }
      }
      items.assignAll(parsed);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载站点统计失败');
      errorText.value = '加载失败，请稍后重试';
      items.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
