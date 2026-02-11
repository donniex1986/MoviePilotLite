import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/media_organize/models/media_organize_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class MediaOrganizeController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  static const int _pageSize = 50;

  final scrollController = ScrollController();
  int _page = 1;
  final hasMore = true.obs;

  final items = <MediaOrganizeTransferItem>[].obs;
  final storages = <StorageSetting>[].obs;
  final storageNameMap = <String, String>{}.obs;
  final isLoading = false.obs;
  final errorText = RxnString();
  final allKeys = <String>[].obs;

  /// 内部用 Set 做去重
  final _keySet = <String>{};
  List<MediaOrganizeTransferItem> get filteredItems => items
      .where(
        (e) =>
            e.title?.toLowerCase().contains(
              searchController.text.toLowerCase(),
            ) ??
            false,
      )
      .toList();
  @override
  void onReady() {
    super.onReady();
    loadStorages().then((_) => load());
    ever<List<MediaOrganizeTransferItem>>(items, (list) {
      final newKeys = list.map((e) => e.title).whereType<String>();

      bool changed = false;

      for (final key in newKeys) {
        if (_keySet.add(key)) {
          changed = true;
        }
      }

      if (changed) {
        allKeys.assignAll(_keySet.toList());
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  /// 获取存储列表并构建 type -> name 映射
  Future<void> loadStorages() async {
    try {
      final response = await _apiClient.get<dynamic>(
        '/api/v1/system/setting/Storages',
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) return;

      final data = response.data;
      if (data is! Map<String, dynamic>) return;
      final value = data['data']['value'];
      final list = <StorageSetting>[];
      final map = <String, String>{};
      for (final raw in value) {
        if (raw is Map<String, dynamic>) {
          try {
            final item = StorageSetting.fromJson(raw);
            list.add(item);
            map[item.type] = item.name;
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析存储设置失败');
          }
        }
      }
      storages.assignAll(list);
      storageNameMap.assignAll(map);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取存储列表失败');
    }
  }

  /// 根据 storage type 获取显示名称
  String getStorageName(String? type) {
    if (type == null || type.isEmpty) return type ?? '';
    return storageNameMap[type] ?? type;
  }

  final searchController = TextEditingController();

  void search(String value) {
    searchController.text = value;
    load(search: value);
  }

  Future<void> load({String? search}) async {
    isLoading.value = true;
    errorText.value = null;
    _page = 1;
    hasMore.value = true;
    try {
      final response = await _apiClient.get<dynamic>(
        '/api/v1/history/transfer',
        queryParameters: {
          'page': _page,
          'count': _pageSize,
          if (search != null && search.isNotEmpty) 'title': search,
        },
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '请求失败 (HTTP $status)';
        items.clear();
        return;
      }
      final list = _extractList(response.data);
      final parsed = <MediaOrganizeTransferItem>[];
      for (final raw in list) {
        if (raw is Map<String, dynamic>) {
          try {
            final item = MediaOrganizeTransferItem.fromJson(raw);
            parsed.add(item);
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析整理历史失败');
            continue;
          }
        }
      }
      items.assignAll(parsed);
      hasMore.value = parsed.length >= _pageSize;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取整理历史失败');
      errorText.value = '请求失败，请稍后重试';
      items.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMore() async {
    if (isLoading.value || !hasMore.value || items.isEmpty) return;
    isLoading.value = true;
    _page += 1;
    try {
      final response = await _apiClient.get<dynamic>(
        '/api/v1/history/transfer',
        queryParameters: {'page': _page, 'count': _pageSize},
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        _page -= 1;
        hasMore.value = false;
        return;
      }
      final list = _extractList(response.data);
      final parsed = <MediaOrganizeTransferItem>[];
      for (final raw in list) {
        if (raw is Map<String, dynamic>) {
          try {
            final item = MediaOrganizeTransferItem.fromJson(raw);
            parsed.add(item);
          } catch (e, st) {
            _log.handle(e, stackTrace: st, message: '解析整理历史失败');
            continue;
          }
        }
      }
      items.addAll(parsed);
      hasMore.value = parsed.length >= _pageSize;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载更多整理历史失败');
      _page -= 1;
    } finally {
      isLoading.value = false;
    }
  }

  Iterable<dynamic> _extractList(dynamic raw) {
    if (raw is List) return raw;
    if (raw is Map<String, dynamic>) {
      final data = raw['data'];
      if (data is Map<String, dynamic>) {
        final list = data['list'];
        if (list is List) return list;
      }
    }
    return const [];
  }
}
