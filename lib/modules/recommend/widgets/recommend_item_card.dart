import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class RecommendItemCard extends StatelessWidget {
  const RecommendItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.width,
  }) : isPlaceholder = false;

  const RecommendItemCard.placeholder({super.key, this.width})
    : item = null,
      isPlaceholder = true,
      onTap = null;

  final RecommendApiItem? item;
  final bool isPlaceholder;
  final VoidCallback? onTap;
  final double? width;

  static const double cardWidth = 150;
  static const double cardRadius = 10;

  double get _cardWidth => width ?? cardWidth;
  double get _cardHeight => _cardWidth * 1.4;

  @override
  Widget build(BuildContext context) {
    if (isPlaceholder) {
      return _buildPlaceholder();
    }
    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
          trailingIcon: Icons.favorite,
          child: const Text('订阅'),
        ),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final data = item!;
    return SizedBox(
      width: _cardWidth,
      height: _cardHeight,
      child: Stack(
        children: [
          _buildPoster(data),
          if (data.type != null && data.type!.isNotEmpty)
            Positioned(left: 10, top: 10, child: _buildPill(data.type!)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildTitle(data.title ?? ''),
          ),
          if (data.vote_average != null && data.vote_average! > 0)
            Positioned(
              right: 10,
              top: 10,
              child: _buildPill(
                data.vote_average!.toStringAsFixed(1),
                background: const Color(0xFF7C4DFF),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(cardRadius),
          bottomRight: Radius.circular(cardRadius),
        ),
        gradient: LinearGradient(colors: [Colors.black, Colors.transparent]),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildPoster(RecommendApiItem data) {
    var imageUrl = data.poster_path;
    if (imageUrl != null && imageUrl.isNotEmpty) {
      imageUrl = ImageUtil.convertCacheImageUrl(imageUrl);
      return CachedImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: _cardWidth,
        height: _cardHeight,
        borderRadius: BorderRadius.circular(cardRadius),
      );
    }
    return Container(
      width: _cardWidth,
      height: _cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
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
      width: _cardWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardRadius),
        child: Container(
          height: _cardHeight,
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
