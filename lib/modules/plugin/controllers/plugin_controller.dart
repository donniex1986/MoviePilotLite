import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/plugin/models/plugin_models.dart';
import 'package:moviepilot_mobile/modules/plugin/services/plugin_palette_cache.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';

class PluginController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  final items = <PluginItem>[].obs;
  final keyword = ''.obs;
  final isLoading = false.obs;
  final errorText = RxnString();

  void updateKeyword(String value) => keyword.value = value.trim();

  List<PluginItem> get visibleItems {
    final key = keyword.value.trim().toLowerCase();
    if (key.isEmpty) return items.toList();
    return items
        .where((item) => _matchKeyword(item, key))
        .toList();
  }

  bool _matchKeyword(PluginItem item, String keywordLower) {
    final buffer = StringBuffer()
      ..write(item.pluginName)
      ..write(' ')
      ..write(item.pluginDesc ?? '')
      ..write(' ')
      ..write(item.pluginLabel ?? '')
      ..write(' ')
      ..write(item.pluginAuthor ?? '');
    return buffer.toString().toLowerCase().contains(keywordLower);
  }

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    errorText.value = null;
    try {
      final response = await _apiClient.get<dynamic>(
        '/api/v1/plugin/',
        queryParameters: {'state': 'installed'},
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '请求失败 (HTTP $status)';
        items.clear();
        return;
      }
      final raw = response.data;
      final list = raw is List ? raw : <dynamic>[];
      final parsed = <PluginItem>[];
      for (final item in list) {
        if (item is Map<String, dynamic>) {
          try {
            parsed.add(PluginItem.fromJson(item));
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析插件失败');
          }
        }
      }
      items.assignAll(parsed);
      _preloadPalettes();
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取插件列表失败');
      errorText.value = '请求失败，请稍后重试';
      items.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void _preloadPalettes() {
    try {
      final cache = Get.find<PluginPaletteCache>();
      final urls = visibleItems
          .map((e) =>
              e.pluginIcon != null && e.pluginIcon!.isNotEmpty
                  ? ImageUtil.convertPluginIconUrl(e.pluginIcon!)
                  : '')
          .where((s) => s.isNotEmpty);
      cache.preload(urls);
    } catch (_) {}
  }
}
