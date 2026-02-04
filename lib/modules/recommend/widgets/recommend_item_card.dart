import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_media_item.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class RecommendItemCard extends StatelessWidget {
  const RecommendItemCard({super.key, required this.item})
    : isPlaceholder = false;

  const RecommendItemCard.placeholder({super.key})
    : item = null,
      isPlaceholder = true;

  final RecommendMediaItem? item;
  final bool isPlaceholder;

  static const double cardWidth = 150;
  static const double cardRadius = 20;

  @override
  Widget build(BuildContext context) {
    if (isPlaceholder) {
      return _buildPlaceholder();
    }
    final data = item!;
    return SizedBox(
      width: cardWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardRadius),
        child: Stack(
          children: [
            _buildPoster(data),
            Positioned(left: 10, top: 10, child: _buildPill(data.mediaType)),
            if (data.rating != null && data.rating! > 0)
              Positioned(
                right: 10,
                top: 10,
                child: _buildPill(
                  data.rating!.toStringAsFixed(1),
                  background: const Color(0xFF7C4DFF),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoster(RecommendMediaItem data) {
    final imageUrl = data.imageUrl;
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return CachedImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: cardWidth,
        height: cardWidth * 1.4,
      );
    }
    return Container(
      width: cardWidth,
      height: cardWidth * 1.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9FA8DA), Color(0xFF5C6BC0)],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return SizedBox(
      width: cardWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardRadius),
        child: Container(
          height: cardWidth * 1.4,
          decoration: BoxDecoration(
            color: const Color(0xFFE1E3EA),
            borderRadius: BorderRadius.circular(cardRadius),
          ),
        ),
      ),
    );
  }

  Widget _buildPill(String text, {Color background = const Color(0xFF4C6FFF)}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
