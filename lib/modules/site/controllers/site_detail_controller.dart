import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/site/models/site_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class SiteDetailController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  int? siteId;
  String siteName = '';
  SiteModel? site;

  final iconBase64 = RxnString();
  final historyItems = <SiteUserDataHistoryItem>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      final id = args['siteId'];
      siteId = id is int ? id : (id is String ? int.tryParse(id) : null);
      siteName = args['siteName']?.toString() ?? '';
      if (args['site'] is Map<String, dynamic>) {
        try {
          site = SiteModel.fromJson(args['site'] as Map<String, dynamic>);
        } catch (e, st) {
          _log.handle(e, stackTrace: st, message: '解析站点信息失败');
        }
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    if (siteId != null) {
      loadIcon();
      loadUserdataHistory();
    }
  }

  Future<void> loadIcon() async {
    final id = siteId;
    if (id == null) return;
    try {
      final response = await _apiClient.get<dynamic>('/api/v1/site/icon/$id');
      if ((response.statusCode ?? 0) >= 400) return;
      final data = response.data;
      if (data is! Map<String, dynamic>) return;
      final res = SiteIconResponse.fromJson(data);
      if (res.success && res.data?.icon != null) {
        iconBase64.value = res.data!.icon;
      }
    } catch (_) {}
  }

  Future<void> loadUserdataHistory() async {
    final id = siteId;
    if (id == null) return;
    isLoading.value = true;
    errorText.value = null;
    try {
      final response = await _apiClient.get<dynamic>('/api/v1/site/userdata/$id');
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '获取用户数据失败 (HTTP $status)';
        historyItems.clear();
        return;
      }
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        historyItems.clear();
        return;
      }
      final res = SiteUserDataHistoryResponse.fromJson(raw);
      if (!res.success) {
        errorText.value = res.message ?? '请求失败';
        historyItems.clear();
        return;
      }
      final list = res.data.toList();
      list.sort((a, b) {
        final da = a.updatedDay;
        final db = b.updatedDay;
        if (da != db) return da.compareTo(db);
        return (a.updatedTime).compareTo(b.updatedTime);
      });
      historyItems.assignAll(list);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载用户数据历史失败');
      errorText.value = '加载失败，请稍后重试';
      historyItems.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
