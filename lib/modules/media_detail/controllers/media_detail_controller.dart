import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/media_detail/models/media_detail_model.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class MediaDetailController extends GetxController {
  final ApiClient _apiClient = Get.find<ApiClient>();

  final isLoading = false.obs;
  final mediaDetail = Rxn<MediaDetail>();
  final errorText = RxnString();
  final statusCode = RxnInt();

  final similarItems = <RecommendApiItem>[].obs;
  final recommendItems = <RecommendApiItem>[].obs;
  final isLoadingSimilar = false.obs;
  final isLoadingRecommend = false.obs;
  final errorSimilar = RxnString();
  final errorRecommend = RxnString();
  final similarSupported = false.obs;
  final recommendSupported = false.obs;

  String? _relatedKey;

  late final MediaDetailArgs _args;

  MediaDetailArgs get args => _args;

  @override
  void onInit() {
    super.onInit();
    _args = MediaDetailArgs.fromRoute(
      parameters: Get.parameters as Map<String, String>?,
      arguments: Get.arguments,
    );
    if (!_args.isValid) {
      errorText.value = _args.validationMessage;
      return;
    }
    fetchDetail();
  }

  Future<void> fetchDetail() async {
    if (!_args.isValid) {
      errorText.value = _args.validationMessage;
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading.value = true;
    errorText.value = null;
    statusCode.value = null;

    try {
      final path = _buildPath(_args);
      final query = _buildQuery(_args);
      final response = await _apiClient.get<dynamic>(
        path,
        queryParameters: query,
      );

      statusCode.value = response.statusCode ?? 0;
      final detail = _parseResponse(response.data);
      if (detail != null) {
        mediaDetail.value = detail;
        _fetchRelated(detail);
      }

      if (response.statusCode == null ||
          response.statusCode! < 200 ||
          response.statusCode! >= 300) {
        errorText.value = _buildErrorMessage(
          response.statusCode,
          response.data,
        );
      } else if (detail == null) {
        errorText.value = '响应解析失败';
      }
    } catch (e) {
      errorText.value = '请求异常: $e';
      ToastUtil.error('加载失败');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshDetail() => fetchDetail();

  String _buildPath(MediaDetailArgs args) {
    final path = _normalizePath(args.path);
    if (path.isEmpty) return '/api/v1/media/';
    return '/api/v1/media/$path';
  }

  Map<String, dynamic> _buildQuery(MediaDetailArgs args) {
    final query = <String, dynamic>{};
    if (args.title.trim().isNotEmpty) {
      query['title'] = args.title.trim();
    }
    if (args.year?.trim().isNotEmpty == true) {
      query['year'] = args.year!.trim();
    }
    if (args.typeName?.trim().isNotEmpty == true) {
      query['type_name'] = args.typeName!.trim();
    }
    if (args.session?.trim().isNotEmpty == true) {
      query['session'] = args.session!.trim();
    }
    return query;
  }

  String _normalizePath(String raw) {
    var path = raw.trim();
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    return path;
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

  MediaDetail? _parseResponse(dynamic data) {
    if (data == null) return null;
    try {
      if (data is Map) {
        return MediaDetail.fromJson(Map<String, dynamic>.from(data));
      }
      if (data is String) {
        final trimmed = data.trim();
        if (!_looksLikeJson(trimmed)) return null;
        final decoded = jsonDecode(trimmed);
        if (decoded is Map) {
          return MediaDetail.fromJson(Map<String, dynamic>.from(decoded));
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

  void _fetchRelated(MediaDetail detail, {bool force = false}) {
    final ref = _resolveRelatedRef(detail);
    if (ref == null) {
      similarSupported.value = false;
      recommendSupported.value = false;
      _clearRelatedState();
      return;
    }
    final provider = ref.provider.toLowerCase();
    if (provider == 'tmdb') {
      similarSupported.value = true;
      recommendSupported.value = true;
    } else if (provider == 'douban') {
      similarSupported.value = false;
      recommendSupported.value = true;
    } else {
      similarSupported.value = false;
      recommendSupported.value = false;
      _clearRelatedState();
      return;
    }
    final typeName = _mediaTypeName(detail);
    final key = '${ref.provider}:${ref.id}::$typeName';
    if (!force &&
        _relatedKey == key &&
        (similarItems.isNotEmpty || recommendItems.isNotEmpty)) {
      return;
    }
    _relatedKey = key;
    if (similarSupported.value) {
      _fetchSimilar(ref.provider, ref.id, typeName);
    } else {
      similarItems.clear();
      errorSimilar.value = null;
      isLoadingSimilar.value = false;
    }
    if (recommendSupported.value) {
      _fetchRecommend(ref.provider, ref.id, typeName);
    } else {
      recommendItems.clear();
      errorRecommend.value = null;
      isLoadingRecommend.value = false;
    }
  }

  Future<void> _fetchSimilar(
    String provider,
    String id,
    String typeName,
  ) async {
    isLoadingSimilar.value = true;
    errorSimilar.value = null;
    try {
      final items = await _requestRelatedList(
        provider: provider,
        kind: 'similar',
        id: id,
        typeName: typeName,
        title: '类似',
      );
      similarItems.assignAll(items);
    } catch (e) {
      errorSimilar.value = '请求异常: $e';
    } finally {
      isLoadingSimilar.value = false;
    }
  }

  Future<void> _fetchRecommend(
    String provider,
    String id,
    String typeName,
  ) async {
    isLoadingRecommend.value = true;
    errorRecommend.value = null;
    try {
      final items = await _requestRelatedList(
        provider: provider,
        kind: 'recommend',
        id: id,
        typeName: typeName,
        title: '推荐',
      );
      recommendItems.assignAll(items);
    } catch (e) {
      errorRecommend.value = '请求异常: $e';
    } finally {
      isLoadingRecommend.value = false;
    }
  }

  Future<List<RecommendApiItem>> _requestRelatedList({
    required String provider,
    required String kind,
    required String id,
    required String typeName,
    required String title,
  }) async {
    final normalizedProvider = provider.toLowerCase();
    final path = _buildRelatedPath(
      provider: normalizedProvider,
      kind: kind,
      id: id,
      typeName: typeName,
    );
    final response = await _apiClient.get<dynamic>(
      path,
      queryParameters: {'page': 1, 'title': title},
    );
    final status = response.statusCode ?? 0;
    if (status >= 400) {
      throw ApiHttpException(status, response.statusMessage);
    }
    final payload = _decodePayload(response.data);
    final list = _extractList(payload);
    return list
        .whereType<Map>()
        .map(
          (item) => RecommendApiItem.fromJson(Map<String, dynamic>.from(item)),
        )
        .toList();
  }

  String _buildRelatedPath({
    required String provider,
    required String kind,
    required String id,
    required String typeName,
  }) {
    final uri = Uri(pathSegments: ['api', 'v1', provider, kind, id, typeName]);
    return '/${uri.path}';
  }

  dynamic _decodePayload(dynamic data) {
    if (data == null) return null;
    if (data is String) {
      final trimmed = data.trim();
      if (!_looksLikeJson(trimmed)) return data;
      try {
        return jsonDecode(trimmed);
      } catch (_) {
        return data;
      }
    }
    return data;
  }

  List<dynamic> _extractList(dynamic payload) {
    if (payload is List) return payload;
    if (payload is Map) {
      for (final key in ['results', 'data', 'items', 'list']) {
        final value = payload[key];
        if (value is List) return value;
        if (value is Map) {
          for (final inner in value.values) {
            if (inner is List) return inner;
          }
        }
      }
      for (final value in payload.values) {
        if (value is List) return value;
      }
    }
    return const [];
  }

  _RelatedRef? _resolveRelatedRef(MediaDetail detail) {
    final fromPath = _parseRefFromPath(_args.path);
    if (fromPath != null) return fromPath;
    final provider = _sourceToProvider(detail.source);
    if (provider == null) return null;
    final id = _idForProvider(provider, detail);
    if (id == null || id.isEmpty) return null;
    return _RelatedRef(provider: provider, id: id);
  }

  _RelatedRef? _parseRefFromPath(String rawPath) {
    final trimmed = rawPath.trim();
    if (trimmed.isEmpty) return null;
    if (trimmed.contains(':')) {
      final parts = trimmed.split(':');
      if (parts.length >= 2) {
        final provider = parts.first.trim();
        final id = parts.sublist(1).join(':').trim();
        if (provider.isNotEmpty && id.isNotEmpty) {
          return _RelatedRef(provider: provider, id: id);
        }
      }
    }
    return null;
  }

  String? _sourceToProvider(String? source) {
    final raw = source?.toLowerCase().trim();
    if (raw == null || raw.isEmpty) return null;
    if (raw.contains('themoviedb') || raw == 'tmdb') return 'tmdb';
    if (raw.contains('douban')) return 'douban';
    if (raw.contains('bangumi')) return 'bangumi';
    return null;
  }

  String? _idForProvider(String provider, MediaDetail detail) {
    switch (provider.toLowerCase()) {
      case 'tmdb':
        return detail.tmdb_id?.toString();
      case 'douban':
        return detail.douban_id?.toString();
      case 'bangumi':
        return detail.bangumi_id?.toString();
      default:
        return null;
    }
  }

  String _mediaTypeName(MediaDetail detail) {
    final rawValue = detail.type ?? _args.typeName ?? '';
    final raw = rawValue.toLowerCase();
    if (raw.contains('剧') || raw.contains('tv') || raw.contains('series')) {
      return '电视剧';
    }
    if (raw.contains('电影') || raw.contains('movie')) {
      return '电影';
    }
    if ((detail.number_of_seasons ?? 0) > 0) {
      return '电视剧';
    }
    return '电影';
  }

  void _clearRelatedState() {
    similarItems.clear();
    recommendItems.clear();
    errorSimilar.value = null;
    errorRecommend.value = null;
    isLoadingSimilar.value = false;
    isLoadingRecommend.value = false;
  }
}

class _RelatedRef {
  const _RelatedRef({required this.provider, required this.id});

  final String provider;
  final String id;
}

class MediaDetailArgs {
  const MediaDetailArgs({
    required this.path,
    required this.title,
    this.year,
    this.typeName,
    this.session,
  });

  final String path;
  final String title;
  final String? year;
  final String? typeName;
  final String? session;

  bool get isValid => path.trim().isNotEmpty;

  String get validationMessage {
    if (path.trim().isEmpty) {
      return '缺少参数：path';
    }
    return '';
  }

  factory MediaDetailArgs.fromRoute({
    Map<String, String>? parameters,
    Object? arguments,
  }) {
    if (arguments is MediaDetailArgs) return arguments;
    final merged = <String, dynamic>{};
    if (parameters != null) {
      merged.addAll(parameters);
    }
    if (arguments is Map) {
      arguments.forEach((key, value) {
        if (key != null) {
          merged[key.toString()] = value;
        }
      });
    } else if (arguments is String) {
      merged['path'] = arguments;
    }

    String? readKey(List<String> keys) {
      for (final key in keys) {
        final value = merged[key];
        if (value != null && value.toString().trim().isNotEmpty) {
          return value.toString();
        }
      }
      return null;
    }

    final path = readKey(['path', 'id', 'mediaId']) ?? '';
    final title = readKey(['title', 'name']) ?? '';
    final year = readKey(['year']);
    final typeName = readKey(['type_name', 'typeName', 'type']);
    final session = readKey(['session']);
    return MediaDetailArgs(
      path: path,
      title: title,
      year: year,
      typeName: typeName,
      session: session,
    );
  }
}
