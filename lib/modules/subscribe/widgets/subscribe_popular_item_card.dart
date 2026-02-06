import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 热门订阅/分享 专用卡片，基于 RecommendApiItem 结构
/// 展示 poster_path、vote_average、title_year、genres 等
class SubscribePopularItemCard extends StatelessWidget {
  const SubscribePopularItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.width,
  });

  final RecommendApiItem item;
  final VoidCallback? onTap;
  final double? width;

  static const double cardWidth = 110;
  static const double cardRadius = 10;

  double get _cardWidth => width ?? cardWidth;
  double get _cardHeight => _cardWidth * 1.4;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: _cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPoster(),
            const SizedBox(height: 8),
            Text(
              item.title ?? item.title_year ?? '未知',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            if (_genreLabel != null)
              Text(
                _genreLabel!,
                style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).hintColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster() {
    return SizedBox(
      width: _cardWidth,
      height: _cardHeight,
      child: Stack(
        children: [
          _buildPosterImage(),
          if (item.type != null && item.type!.isNotEmpty)
            Positioned(left: 6, top: 6, child: _buildPill(item.type!)),
          if (item.vote_average != null && item.vote_average! > 0)
            Positioned(
              right: 6,
              top: 6,
              child: _buildPill(
                item.vote_average!.toStringAsFixed(1),
                background: const Color(0xFF7C4DFF),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPosterImage() {
    final url = item.poster_path;
    if (url != null && url.isNotEmpty) {
      final cacheUrl = ImageUtil.convertCacheImageUrl(url);
      return ClipRRect(
        borderRadius: BorderRadius.circular(cardRadius),
        child: CachedImage(
          imageUrl: cacheUrl,
          fit: BoxFit.cover,
          width: _cardWidth,
          height: _cardHeight,
        ),
      );
    }
    return Container(
      width: _cardWidth,
      height: _cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9FA8DA), Color(0xFF5C6BC0)],
        ),
      ),
    );
  }

  Widget _buildPill(String text, {Color background = const Color(0xFF4C6FFF)}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: background.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String? get _genreLabel {
    final genres = item.genres;
    if (genres == null || genres.isEmpty) return null;
    final list = genres
        .whereType<Map<String, dynamic>>()
        .map((e) => e['name'] ?? e['title'])
        .whereType<String>()
        .take(2)
        .toList();
    if (list.isEmpty) return null;
    return list.join(' · ');
  }
}
