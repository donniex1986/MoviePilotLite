import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

import '../models/cache_model.dart';

class CacheController extends GetxController {
  final keywordController = TextEditingController();

  final keyword = ''.obs;
  final selectedSites = <String>{}.obs;

  final isLoading = false.obs;
  final errorText = RxnString();
  final statusCode = RxnInt();
  final cacheResponse = Rxn<CacheResponse>();
  final showActions = false.obs;

  final ApiClient _apiClient = Get.find<ApiClient>();

  @override
  void onInit() {
    super.onInit();
    fetchCache();
  }

  @override
  void onClose() {
    keywordController.dispose();
    super.onClose();
  }

  Future<void> fetchCache() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    errorText.value = null;
    statusCode.value = null;

    try {
      final response = await _apiClient.get<dynamic>('/api/v1/torrent/cache');

      statusCode.value = response.statusCode ?? 0;
      final parsed = _parseResponse(response.data);
      cacheResponse.value = parsed;

      if (parsed == null) {
        errorText.value = _buildErrorMessage(
          response.statusCode,
          response.data,
        );
      } else if (!parsed.success) {
        errorText.value = parsed.message?.trim().isNotEmpty == true
            ? parsed.message
            : _buildErrorMessage(response.statusCode, response.data);
      }

      _syncSelectedSite();
    } catch (e) {
      errorText.value = '请求异常: $e';
      ToastUtil.error('获取缓存失败');
    } finally {
      isLoading.value = false;
    }
  }

  void updateKeyword(String value) {
    keyword.value = value;
  }

  void updateSelectedSites(Set<String> values) {
    selectedSites.addAll(values);
  }

  void toggleActions() {
    showActions.value = !showActions.value;
  }

  void closeActions() {
    showActions.value = false;
  }

  void clearFilters() {
    keywordController.text = '';
    keyword.value = '';
    selectedSites.clear();
  }

  bool get hasFilter {
    return keyword.value.trim().isNotEmpty || hasSiteFilter;
  }

  bool get hasSiteFilter => selectedSites.isNotEmpty;

  String get selectedSiteLabel {
    if (selectedSites.isEmpty) return '全部';
    final list = selectedSites.toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    if (list.length == 1) return list.first;
    return '已选 ${list.length}';
  }

  int get totalCount {
    final payload = cacheResponse.value?.data;
    if (payload?.count != null) return payload!.count!;
    return payload?.items?.length ?? 0;
  }

  int get siteCount {
    final payload = cacheResponse.value?.data;
    if (payload?.sites != null) return payload!.sites!;
    final items = payload?.items ?? const [];
    return items.map(_siteLabel).whereType<String>().toSet().length;
  }

  List<String> get siteOptions {
    final items = cacheResponse.value?.data?.items ?? const [];
    final sites = <String>{};
    for (final item in items) {
      final label = _siteLabel(item);
      if (label != null && label.trim().isNotEmpty) {
        sites.add(label.trim());
      }
    }
    final list = sites.toList();
    list.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return list;
  }

  List<CacheItem> get filteredItems {
    final items = cacheResponse.value?.data?.items ?? const [];
    if (items.isEmpty) return const [];

    final keywordText = keyword.value.trim().toLowerCase();
    final siteFilter = Set<String>.from(selectedSites);

    return items.where((item) {
      final siteLabel = _siteLabel(item) ?? '';
      if (siteFilter.isNotEmpty && !siteFilter.contains(siteLabel)) {
        return false;
      }
      if (keywordText.isEmpty) return true;
      return _matchesKeyword(item, keywordText);
    }).toList();
  }

  bool _matchesKeyword(CacheItem item, String keyword) {
    final fields = [
      item.title,
      item.description,
      item.mediaName,
      item.siteName,
      item.domain,
      item.mediaType,
      item.seasonEpisode,
      item.resourceTerm,
    ];
    for (final field in fields) {
      if (field == null) continue;
      if (field.toLowerCase().contains(keyword)) return true;
    }
    return false;
  }

  String? _siteLabel(CacheItem item) {
    final site = item.siteName?.trim();
    if (site != null && site.isNotEmpty) return site;
    final domain = item.domain?.trim();
    if (domain != null && domain.isNotEmpty) return domain;
    return null;
  }

  void _syncSelectedSite() {
    if (selectedSites.isEmpty) return;
    final options = siteOptions.toSet();
    if (options.isEmpty) {
      selectedSites.clear();
      return;
    }
    final next = selectedSites.where(options.contains).toSet();
    if (next.length != selectedSites.length) {
      selectedSites.addAll(next);
    }
  }

  String _buildErrorMessage(int? status, dynamic data) {
    final code = status ?? 0;
    final detail = _extractMessage(data);
    if (detail != null && detail.trim().isNotEmpty) {
      return '请求失败 ($code): $detail';
    }
    return '请求失败 ($code)';
  }

  String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      for (final key in ['message', 'detail', 'error', 'msg']) {
        final value = data[key];
        if (value is String && value.trim().isNotEmpty) {
          return value;
        }
      }
    }
    return null;
  }

  CacheResponse? _parseResponse(dynamic data) {
    if (data == null) return null;
    try {
      if (data is Map) {
        return CacheResponse.fromJson(Map<String, dynamic>.from(data));
      }
      if (data is String) {
        final trimmed = data.trim();
        if (!_looksLikeJson(trimmed)) return null;
        final decoded = jsonDecode(trimmed);
        if (decoded is Map) {
          return CacheResponse.fromJson(Map<String, dynamic>.from(decoded));
        }
      }
    } catch (_) {
      return null;
    }
    return null;
  }

  bool _looksLikeJson(String input) {
    if (input.isEmpty) return false;
    final first = input[0];
    final last = input[input.length - 1];
    return (first == '{' && last == '}') || (first == '[' && last == ']');
  }
}
