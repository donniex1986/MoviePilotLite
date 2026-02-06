import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 热门订阅/分享 专用卡片，基于 RecommendApiItem 结构
/// 展示 poster_path、vote_average、popularity、title_year 等
class SubscribePopularItemCard extends StatelessWidget {
  const SubscribePopularItemCard({super.key, required this.item, this.onTap});

  final RecommendApiItem item;
  final VoidCallback? onTap;

  static const double cardRadius = 8;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(cardRadius),
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildPosterImage(),
                // 底部渐变 + 标题
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(cardRadius),
                        bottomRight: Radius.circular(cardRadius),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.85),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(6, 20, 6, 6),
                      child: Text(
                        item.title ?? item.title_year ?? '未知',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                // 类型角标
                if (item.type != null && item.type!.isNotEmpty)
                  Positioned(
                    left: 5,
                    top: 5,
                    child: _buildPill(
                      item.type!,
                      background: const Color(0xFF4C6FFF),
                    ),
                  ),
                // 评分角标
                if (item.vote_average != null && item.vote_average! > 0)
                  Positioned(
                    right: 5,
                    top: 5,
                    child: _buildPill(
                      '★ ${item.vote_average!.toStringAsFixed(1)}',
                      background: const Color(0xFF7C4DFF),
                    ),
                  ),
                // 热度角标（右下角，避免与标题重叠）
                if (_popularityText != null)
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: _buildHeatBadge(_popularityText!),
                  ),
              ],
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
      return CachedImage(imageUrl: cacheUrl, fit: BoxFit.cover);
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9FA8DA), Color(0xFF5C6BC0)],
        ),
      ),
    );
  }

  Widget _buildPill(String text, {Color background = const Color(0xFF4C6FFF)}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: background.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildHeatBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.local_fire_department,
            size: 12,
            color: Colors.orange.shade300,
          ),
          const SizedBox(width: 2),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String? get _popularityText {
    final p = item.popularity;
    if (p == null || p <= 0) return null;
    if (p >= 10000) {
      return '${(p / 10000).toStringAsFixed(1)}万';
    }
    if (p >= 1000) {
      return '${(p / 1000).toStringAsFixed(1)}k';
    }
    return p.toInt().toString();
  }
}
