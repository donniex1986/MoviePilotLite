import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class RecommendIosGridItem extends StatelessWidget {
  const RecommendIosGridItem({
    super.key,
    required this.item,
    this.onTap,
  });

  final RecommendApiItem item;
  final VoidCallback? onTap;

  static const double _radius = 12;
  static const double _imageAspect = 1.4;

  @override
  Widget build(BuildContext context) {
    final imageUrl = item.poster_path ?? item.backdrop_path;
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        final imageHeight = (h - 42).clamp(0.0, w * _imageAspect);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(_radius),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(_radius),
                  child: SizedBox(
                    width: w,
                    height: imageHeight,
                    child: imageUrl != null && imageUrl.isNotEmpty
                        ? CachedImage(
                            imageUrl:
                                ImageUtil.convertCacheImageUrl(imageUrl),
                            fit: BoxFit.cover,
                            width: w,
                            height: imageHeight,
                          )
                        : Container(
                            color: const Color(0xFF2C2C2E),
                            child: const Center(
                              child: Icon(Icons.image_not_supported_outlined,
                                  color: Colors.white54, size: 28),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              item.title ?? item.en_title ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}
