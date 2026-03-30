import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/media_organize/models/media_organize_models.dart';
import 'package:moviepilot_mobile/modules/storage/controllers/storage_list_controller.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

enum MediaOrganizeStatusFilter { all, success, failed }

enum MediaOrganizeSortKey { date, title, size }

class MediaOrganizeController extends GetxController {
  MediaOrganizeController({String? initialKeyword})
    : _initialKeyword = initialKeyword?.trim() ?? '';

  final _apiClient = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();
  final String _initialKeyword;

  static const int _pageSize = 50;

  final scrollController = ScrollController();
  int _page = 1;
  final hasMore = true.obs;

  final items = <MediaOrganizeTransferItem>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();
  final keyword = ''.obs;
  final statusFilter = MediaOrganizeStatusFilter.all.obs;
  final sortKey = MediaOrganizeSortKey.date.obs;
  final isSortAscending = false.obs;

  List<String> get titleOptions {
    final titles = <String>{};
    for (final item in items) {
      final title = item.title?.trim() ?? '';
      if (title.isNotEmpty) {
        titles.add(title);
      }
    }
    final result = titles.toList();
    result.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return result;
  }

  List<MediaOrganizeTransferItem> get filteredItems {
    final q = keyword.value.trim().toLowerCase();
    final filtered = items.where((item) {
      final matchesKeyword =
          q.isEmpty ? true : _matchKeyword(item, q);
      if (!matchesKeyword) return false;
      switch (statusFilter.value) {
        case MediaOrganizeStatusFilter.all:
          return true;
        case MediaOrganizeStatusFilter.success:
          return item.status == true;
        case MediaOrganizeStatusFilter.failed:
          return item.status != true;
      }
    }).toList();

    filtered.sort(_compareItems);
    return filtered;
  }

  bool get hasActiveFilters => statusFilter.value != MediaOrganizeStatusFilter.all;
  StorageListController get _storageController =>
      Get.find<StorageListController>();

  List<StorageSetting> get storages => _storageController.storages;
  Map<String, String> get storageNameMap =>
      Map.from(_storageController.storageNameMap);

  @override
  void onReady() {
    super.onReady();
    if (_initialKeyword.isNotEmpty) {
      keyword.value = _initialKeyword;
    }
    loadStorages().then((_) => load());
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  /// 委托 StorageListController 加载存储列表
  Future<void> loadStorages() async {
    await _storageController.loadStorages();
  }

  /// 根据 storage type 获取显示名称
  String getStorageName(String? type) {
    return _storageController.getStorageName(type);
  }

  void updateKeyword(String value) {
    final next = value.trim();
    if (keyword.value == next) return;
    keyword.value = next;
    load();
  }

  void updateStatusFilter(MediaOrganizeStatusFilter value) {
    statusFilter.value = value;
  }

  void updateSortKey(MediaOrganizeSortKey value) {
    sortKey.value = value;
  }

  void updateSortDirection(bool ascending) {
    isSortAscending.value = ascending;
  }

  Future<void> load() async {
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
          if (keyword.value.isNotEmpty) 'title': keyword.value,
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
        queryParameters: {
          'page': _page,
          'count': _pageSize,
          if (keyword.value.isNotEmpty) 'title': keyword.value,
        },
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

  Future<bool> deleteTransferRecord(
    MediaOrganizeTransferItem item, {
    required bool deletesrc,
    required bool deletedest,
  }) async {
    try {
      final response = await _apiClient.request<dynamic>(
        '/api/v1/history/transfer',
        RequestMethod.delete,
        item.toJson(),
        queryParameters: {'deletesrc': deletesrc, 'deletedest': deletedest},
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        return false;
      }
      final data = response.data;
      if (data is Map<String, dynamic> && data['success'] == false) {
        return false;
      }
      items.remove(item);
      return true;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '删除整理历史失败');
      return false;
    }
  }

  bool _matchKeyword(MediaOrganizeTransferItem item, String keyword) {
    final fields = <String?>[
      item.title,
      item.type,
      item.category,
      item.mode,
      item.year,
      item.src,
      item.dest,
      item.errmsg,
      item.date,
      item.src_storage,
      item.dest_storage,
    ];
    return fields.any(
      (field) => (field ?? '').toLowerCase().contains(keyword),
    );
  }

  int _compareItems(
    MediaOrganizeTransferItem a,
    MediaOrganizeTransferItem b,
  ) {
    final factor = isSortAscending.value ? 1 : -1;
    switch (sortKey.value) {
      case MediaOrganizeSortKey.date:
        return _compareNullableStrings(a.date, b.date) * factor;
      case MediaOrganizeSortKey.title:
        return _compareNullableStrings(a.title, b.title) * factor;
      case MediaOrganizeSortKey.size:
        return _compareNullableInts(
              a.src_fileitem?.size ?? 0,
              b.src_fileitem?.size ?? 0,
            ) *
            factor;
    }
  }

  int _compareNullableStrings(String? a, String? b) {
    return (a ?? '').toLowerCase().compareTo((b ?? '').toLowerCase());
  }

  int _compareNullableInts(int a, int b) {
    if (a == b) return 0;
    return a < b ? -1 : 1;
  }
}
