import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/site/models/site_resource_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class SiteResourceController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  int? siteId;
  String siteName = '';

  final categories = <SiteResourceCategory>[].obs;
  final items = <SiteResourceItem>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();

  final keyword = ''.obs;
  /// 选中的分类 id，null 表示“全部”
  final selectedCategoryId = Rxn<int>();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      final id = args['siteId'];
      siteId = id is int ? id : (id is String ? int.tryParse(id) : null);
      siteName = args['siteName']?.toString() ?? '';
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadCategories();
    loadResources();
  }

  bool get hasActiveFilters => selectedCategoryId.value != null;

  String get categoryFilterLabel {
    final id = selectedCategoryId.value;
    if (id == null) return '全部分类';
    SiteResourceCategory? c;
    for (final e in categories) {
      if (e.id == id) {
        c = e;
        break;
      }
    }
    return c?.desc.isNotEmpty == true ? c!.desc : (c?.cat ?? '全部分类');
  }

  Future<void> loadCategories() async {
    final id = siteId;
    if (id == null) return;
    try {
      final response = await _apiClient.get<dynamic>('/api/v1/site/category/$id');
      final status = response.statusCode ?? 0;
      if (status >= 400) return;
      final raw = response.data;
      final list = raw is List ? raw : <dynamic>[];
      final parsed = <SiteResourceCategory>[];
      for (final item in list) {
        if (item is Map<String, dynamic>) {
          try {
            parsed.add(SiteResourceCategory.fromJson(item));
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析站点分类失败');
          }
        }
      }
      categories.assignAll(parsed);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载站点分类失败');
    }
  }

  Future<void> loadResources() async {
    final id = siteId;
    if (id == null) {
      errorText.value = '缺少站点 ID';
      items.clear();
      return;
    }
    isLoading.value = true;
    errorText.value = null;
    try {
      final query = <String, String>{};
      final cid = selectedCategoryId.value;
      if (cid != null) {
        SiteResourceCategory? c;
        for (final e in categories) {
          if (e.id == cid) {
            c = e;
            break;
          }
        }
        query['cat'] = (c != null && c.cat.isNotEmpty) ? c.cat : cid.toString();
      }
      final kw = keyword.value.trim();
      if (kw.isNotEmpty) query['keyword'] = kw;

      final response = await _apiClient.get<dynamic>(
        '/api/v1/site/resource/$id',
        queryParameters: query.isEmpty ? null : query,
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '获取资源失败 (HTTP $status)';
        items.clear();
        return;
      }
      final raw = response.data;
      final list = raw is List ? raw : <dynamic>[];
      final parsed = <SiteResourceItem>[];
      for (final item in list) {
        if (item is Map<String, dynamic>) {
          try {
            parsed.add(SiteResourceItem.fromJson(item));
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析资源项失败');
          }
        }
      }
      items.assignAll(parsed);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载站点资源失败');
      errorText.value = '加载失败，请稍后重试';
      items.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void updateKeyword(String value) {
    keyword.value = value.trim();
  }

  void setCategoryFilter(int? categoryId) {
    selectedCategoryId.value = categoryId;
  }

  void clearCategoryFilter() {
    selectedCategoryId.value = null;
  }

  void onSearchSubmitted(String value) {
    keyword.value = value.trim();
    loadResources();
  }

  void applyFilterAndLoad() {
    loadResources();
  }
}
