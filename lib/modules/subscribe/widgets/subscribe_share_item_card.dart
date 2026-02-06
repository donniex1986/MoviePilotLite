import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/subscribe_models.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 订阅分享项大卡片：与 SubscribeItemCard 同风格
class SubscribeShareItemCard extends StatelessWidget {
  const SubscribeShareItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.onMoreTap,
  });

  final SubscribeShareItem item;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;

  static const double _cardRadius = 12;
  static const double _posterWidth = 56;
  static const double _posterHeight = 80;
  static const double _aspectRatio = 2.1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = width / _aspectRatio;
          return ClipRRect(
            borderRadius: BorderRadius.circular(_cardRadius),
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildBackdrop(width, height),
                _buildGradientOverlay(),
                _buildContent(context),
                Positioned(
                  top: 12,
                  right: 12,
                  child: _buildMoreButton(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackdrop(double width, double height) {
    var url = item.backdrop;
    if (url == null || url.isEmpty) url = item.poster;
    if (url != null && url.isNotEmpty) {
      url = ImageUtil.convertCacheImageUrl(url);
      return CachedImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        height: height,
      );
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5C6BC0), Color(0xFF3949AB)],
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.2),
            Colors.transparent,
            Colors.black.withValues(alpha: 0.75),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildPosterThumb(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (item.year != null && item.year!.isNotEmpty)
                  Text(
                    item.year!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                const SizedBox(height: 4),
                Text(
                  _titleWithSeason,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (item.shareUser != null && item.shareUser!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_solid,
                        size: 14,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.shareUser!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.clock,
                      size: 14,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      SubscribeController.formatRelativeTime(item.shareTime),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPosterThumb() {
    var url = item.poster;
    if (url != null && url.isNotEmpty) {
      url = ImageUtil.convertCacheImageUrl(url);
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CachedImage(
          imageUrl: url,
          fit: BoxFit.cover,
          width: _posterWidth,
          height: _posterHeight,
        ),
      );
    }
    return Container(
      width: _posterWidth,
      height: _posterHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white.withValues(alpha: 0.2),
      ),
    );
  }

  Widget _buildMoreButton(BuildContext context) {
    return GestureDetector(
      onTap: () => onMoreTap?.call(),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.4),
          shape: BoxShape.circle,
        ),
        child: Icon(
          CupertinoIcons.ellipsis_vertical,
          size: 16,
          color: Colors.white.withValues(alpha: 0.9),
        ),
      ),
    );
  }

  String get _titleWithSeason {
    final name = item.name ?? '未知';
    if (item.season != null && item.season! > 0) {
      return '$name S${item.season.toString().padLeft(2, '0')}';
    }
    return name;
  }
}
