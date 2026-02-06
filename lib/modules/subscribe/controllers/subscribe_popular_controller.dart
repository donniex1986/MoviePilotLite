import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/defines/subscribe_popular_filter_defines.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';

class SubscribePopularController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  late final SubscribeType subscribeType;

  final items = <RecommendApiItem>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();
  final keyword = ''.obs;

  /// 排序：time 最新、count 热门、vote 评分
  final sortType = 'count'.obs;
  final selectedGenres = <String>[].obs;
  final voteMin = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is SubscribeType) {
      subscribeType = args;
    } else if (args is Map && args['type'] is SubscribeType) {
      subscribeType = args['type'] as SubscribeType;
    } else {
      final route = Get.currentRoute;
      subscribeType =
          route.contains('movie') ? SubscribeType.movie : SubscribeType.tv;
    }
  }

  @override
  void onReady() {
    super.onReady();
    load();
  }

  bool get isTv => subscribeType == SubscribeType.tv;

  String? _getToken() =>
      _appService.loginResponse?.accessToken ??
      _appService.latestLoginProfileAccessToken ??
      _apiClient.token;

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
        '/api/v1/subscribe/popular',
        queryParameters: {
          'stype': subscribeType.stype,
          'page': 1,
          'count': 30,
          'sort_type': sortType.value,
        },
        token: token,
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '请求失败 (HTTP $status)';
        items.clear();
        return;
      }
      final list = _extractList(response.data);
      final parsed = <RecommendApiItem>[];
      for (final raw in list) {
        if (raw is Map<String, dynamic>) {
          try {
            parsed.add(RecommendApiItem.fromJson(raw));
          } catch (_) {}
        }
      }
      items.assignAll(parsed);
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取热门订阅失败');
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

  void updateKeyword(String value) => keyword.value = value.trim();

  void setSortType(String value) {
    sortType.value = value;
    load();
  }

  void setGenres(List<String> value) {
    selectedGenres.assignAll(value);
  }

  void setVoteMin(int value) {
    voteMin.value = value;
  }

  void applyFilter(List<String> genres, int ratingMin) {
    selectedGenres.assignAll(genres);
    voteMin.value = ratingMin;
  }

  String get genreLabel {
    if (selectedGenres.isEmpty) return '风格';
    final opts = isTv
        ? SubscribePopularFilterDefines.tvGenreOptions
        : SubscribePopularFilterDefines.movieGenreOptions;
    final map = {for (final o in opts) o['value']!: o['label']!};
    final labels = selectedGenres.map((v) => map[v] ?? v).toList();
    return labels.length <= 2 ? labels.join('、') : '${labels.take(2).join('、')}等';
  }

  String get ratingLabel {
    if (voteMin.value <= 0) return '评分';
    return '${voteMin.value}分+';
  }

  List<RecommendApiItem> get visibleItems {
    var list = items.toList();
    final key = keyword.value.trim().toLowerCase();
    if (key.isNotEmpty) {
      list = list.where((e) {
        final t = '${e.title ?? ''} ${e.title_year ?? ''} ${e.overview ?? ''}'
            .toLowerCase();
        return t.contains(key);
      }).toList();
    }
    final genres = selectedGenres.toList();
    if (genres.isNotEmpty) {
      list = list.where((e) {
        final ids = e.genre_ids ?? [];
        for (final g in ids) {
          final s = g is int ? g.toString() : g?.toString();
          if (s != null && genres.contains(s)) return true;
        }
        return false;
      }).toList();
    }
    final min = voteMin.value;
    if (min > 0) {
      list = list
          .where((e) => (e.vote_average ?? 0) >= min.toDouble())
          .toList();
    }
    return list;
  }
}
