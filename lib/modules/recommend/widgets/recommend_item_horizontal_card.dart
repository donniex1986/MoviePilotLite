import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class RecommendItemHorizontalCard extends StatelessWidget {
  const RecommendItemHorizontalCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final RecommendApiItem? item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final posterUrl = item?.poster_path ?? item?.backdrop_path ?? '';
    final url = ImageUtil.convertCacheImageUrl(posterUrl);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black26,
        ),
        child: Row(
          children: [
            Transform.rotate(
              angle: -10 * math.pi / 180,
              child: CachedImage(
                borderRadius: BorderRadius.circular(10),
                imageUrl: url,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.title ?? '',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    item?.overview ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 70,
              height: 30,
              child: FilledButton(
                onPressed: onTap,
                style: FilledButton.styleFrom(
                  backgroundColor: CupertinoColors.inactiveGray
                      .resolveFrom(context)
                      .withValues(alpha: 0.4),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  minimumSize: const Size(0, 34),
                ),
                child: const Text(
                  '查看',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
