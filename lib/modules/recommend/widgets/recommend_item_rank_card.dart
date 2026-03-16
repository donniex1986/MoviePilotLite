import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/plugin/services/plugin_palette_cache.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class RecommendItemRankCard extends StatelessWidget {
  const RecommendItemRankCard({
    super.key,
    required this.item,
    required this.rank,
    this.onTap,
  });

  final RecommendApiItem item;
  final int rank;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final posterUrl = item.poster_path ?? item.backdrop_path ?? '';
    final url = ImageUtil.convertCacheImageUrl(posterUrl);
    final cache = Get.find<PluginPaletteCache>();
    return GestureDetector(
      onTap: onTap,
      child: Obx(() {
        final color = cache.watchColor(url) ?? Colors.blueGrey;
        final rankColor = Color.alphaBlend(
          Colors.white.withValues(alpha: 0.4),
          color,
        );
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withValues(alpha: 0.1),
                color.withValues(alpha: 0.3),
                color.withValues(alpha: 0.5),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: 110,
                  height: 130,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '$rank',
                          style: TextStyle(
                            color: rankColor,
                            fontSize: 100,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _buildPoster(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 35, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if ((item.overview ?? '').trim().isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          item.overview!,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      minSize: 0,
                      onPressed: onTap,
                      child: Text(
                        '查看',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildPoster() {
    final imageUrl = item.poster_path ?? item.backdrop_path;
    if (imageUrl == null || imageUrl.isEmpty) {
      return SizedBox(
        width: 60,
        height: 60,
        child: Icon(
          Icons.movie_outlined,
          color: Colors.white.withValues(alpha: 0.5),
          size: 40,
        ),
      );
    }
    return CachedImage(
      imageUrl: ImageUtil.convertCacheImageUrl(imageUrl),
      width: 60,
      height: 60,
      fit: BoxFit.cover,
    );
  }
}
