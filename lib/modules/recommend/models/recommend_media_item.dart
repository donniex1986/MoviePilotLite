import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';

class RecommendMediaItem {
  const RecommendMediaItem({
    required this.id,
    required this.title,
    required this.mediaType,
    this.imageUrl,
    this.rating,
  });

  final String id;
  final String title;
  final String mediaType;
  final String? imageUrl;
  final double? rating;

  static RecommendMediaItem fromApi(
    RecommendApiItem api, {
    required String fallbackMediaType,
    required String fallbackId,
    String? imageProxyBaseUrl,
  }) {
    final title = _readTitle(api) ?? '';
    final mediaType = _readMediaType(api, fallbackMediaType);
    final rating = api.vote_average;
    var imageUrl = _normalizeImageUrl(
      api.poster_path ?? api.backdrop_path ?? '',
    );
    if (imageUrl.isNotEmpty) {
      imageUrl = ImageUtil.convertCacheImageUrl(
        imageUrl,
        baseUrl: imageProxyBaseUrl,
      );
    }
    final id = _readId(api) ?? fallbackId;

    return RecommendMediaItem(
      id: id.isEmpty ? fallbackId : id,
      title: title.isEmpty ? fallbackId : title,
      mediaType: mediaType,
      imageUrl: imageUrl.isEmpty ? null : imageUrl,
      rating: rating,
    );
  }

  static String? _readTitle(RecommendApiItem api) {
    final title = api.title?.trim();
    if (title != null && title.isNotEmpty) return title;
    final titleYear = api.title_year?.trim();
    if (titleYear != null && titleYear.isNotEmpty) return titleYear;
    return null;
  }

  static String? _readId(RecommendApiItem api) {
    return api.douban_id ??
        api.tmdb_id ??
        api.imdb_id ??
        api.tvdb_id ??
        api.media_id;
  }

  static String _readMediaType(RecommendApiItem api, String fallbackMediaType) {
    final type = api.type?.trim();
    if (type != null && type.isNotEmpty) return type;
    return fallbackMediaType;
  }

  static String _normalizeImageUrl(String url) {
    final trimmed = url.trim();
    if (trimmed.isEmpty) return trimmed;
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return trimmed;
    }
    if (trimmed.startsWith('/')) {
      return 'https://image.tmdb.org/t/p/w500$trimmed';
    }
    return trimmed;
  }
}
