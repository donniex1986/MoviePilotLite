import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class RecommendIosListItem extends StatelessWidget {
  const RecommendIosListItem({
    super.key,
    required this.item,
    this.onTap,
    this.width,
  });

  final RecommendApiItem item;
  final VoidCallback? onTap;
  final double? width;

  static const double _defaultWidth = 120;
  static const double _radius = 12;
  static const double _aspect = 1.2;

  double get _w => width ?? _defaultWidth;
  double get _h => _w * _aspect;

  @override
  Widget build(BuildContext context) {
    final imageUrl = item.poster_path ?? item.backdrop_path;
    return SizedBox(
      width: _w,
      child: Column(
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
                  width: _w,
                  height: _h,
                  child: imageUrl != null && imageUrl.isNotEmpty
                      ? CachedImage(
                          imageUrl: ImageUtil.convertCacheImageUrl(imageUrl),
                          fit: BoxFit.cover,
                          width: _w,
                          height: _h,
                        )
                      : Container(
                          color: const Color(0xFF2C2C2E),
                          child: const Center(
                            child: Icon(Icons.image_not_supported_outlined,
                                color: Colors.white54, size: 32),
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
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
