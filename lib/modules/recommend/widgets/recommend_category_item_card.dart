import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

final List<List<Color>> _categoryGradients = [
  [Colors.indigo.shade700, Colors.purple.shade800],
  [Colors.teal.shade700, Colors.cyan.shade800],
  [Colors.orange.shade700, Colors.deepOrange.shade800],
  [Colors.blueGrey.shade700, Colors.blue.shade900],
  [Colors.pink.shade600, Colors.purple.shade700],
  [Colors.amber.shade700, Colors.orange.shade800],
  [Colors.green.shade700, Colors.teal.shade800],
  [Colors.deepPurple.shade600, Colors.indigo.shade800],
];

class RecommendCategoryItemCard extends StatelessWidget {
  const RecommendCategoryItemCard({
    super.key,
    required this.name,
    required this.items,
    this.colorIndex = 0,
    this.onTap,
  });

  final String name;
  final List<RecommendApiItem> items;
  final int colorIndex;
  final Function(Color themeColor, Color secondaryThemeColor)? onTap;

  @override
  Widget build(BuildContext context) {
    final posterUrls = items
        .take(2)
        .map((e) => e.poster_path ?? e.backdrop_path)
        .where((e) => e != null && e.isNotEmpty)
        .cast<String>()
        .toList();
    final colors = _categoryGradients[colorIndex % _categoryGradients.length];
    return GestureDetector(
      onTap: () => onTap?.call(colors[0], colors[1]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors[0].withValues(alpha: 0.9),
              colors[1].withValues(alpha: 0.95),
            ],
          ),
        ),
        child: Stack(
          children: [
            if (posterUrls.isNotEmpty)
              Positioned(
                top: 12,
                right: 12,
                child: _buildPosterStack(posterUrls),
              ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPosterStack(List<String> posterUrls) {
    const size = 48.0;
    const radius = 10.0;
    const angles = [-15.0, 15.0];
    final widgets = <Widget>[];
    for (var i = 0; i < posterUrls.length; i++) {
      final angle = angles[i % 2] * math.pi / 180;
      widgets.add(
        Positioned(
          left: i * 28.0,
          top: i * 5,
          child: Transform.rotate(
            angle: angle,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: CachedImage(
                imageUrl: ImageUtil.convertCacheImageUrl(posterUrls[i]),
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      width: size + (posterUrls.length > 1 ? 28.0 : 0),
      height: size + 12,
      child: Stack(children: widgets.reversed.toList()),
    );
  }
}
