import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/subscribe_models.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

enum SubscribeItemCardType {
  edit,
  search,
  detail,
  pause,
  resume,
  reset,
  shared,
  delete,
}

/// 订阅项大卡片：以 backdrop 为背景，左上角小海报 + 标题/季/集数/订阅者/更新时间，底部进度条
class SubscribeItemCard extends StatelessWidget {
  const SubscribeItemCard({
    super.key,
    required this.item,
    required this.isTv,
    this.onTap,
    this.onMoreTap,
  });

  final SubscribeItem item;
  final bool isTv;
  final VoidCallback? onTap;
  final Function(SubscribeItemCardType type)? onMoreTap;

  static const double _cardRadius = 12;
  static const double _posterWidth = 80;
  static const double _posterHeight = 120;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_cardRadius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildBackdrop(),
              Positioned.fill(child: _buildGradientOverlay()),
              Positioned(
                left: 12,
                top: 12,
                right: 12,
                child: _buildContent(context),
              ),
              Positioned(bottom: 25, left: 12, child: _buildEpisodeInfo()),
              Positioned(bottom: 25, right: 12, child: _buildLastUpdate()),
              Positioned(top: 12, right: 12, child: _buildMoreButton(context)),
              if (_hasProgressBar)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _buildProgressBar(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackdrop() {
    var url = item.backdrop;
    if (url == null || url.isEmpty) url = item.poster;
    if (url != null && url.isNotEmpty) {
      url = ImageUtil.convertCacheImageUrl(url);
      return CachedImage(imageUrl: url, fit: BoxFit.cover);
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
            // Colors.transparent,
            Colors.black.withValues(alpha: 0.75),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
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
                  item.year ?? '',
                  style: TextStyle(fontSize: 12, color: Colors.white),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLastUpdate() {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              CupertinoIcons.arrow_down_circle,
              size: 14,
              color: Colors.white.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 4),
            Text(
              SubscribeController.formatRelativeTime(
                item.lastUpdate ?? item.date,
              ),
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEpisodeInfo() {
    return Row(
      children: [
        if (isTv && _hasEpisodeInfo) ...[
          const SizedBox(height: 6),
          Icon(
            CupertinoIcons.arrow_2_circlepath,
            size: 14,
            color: Colors.white.withValues(alpha: 0.85),
          ),
          const SizedBox(width: 4),
          Text(
            _episodeProgress,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(width: 12),
        ],
        Icon(
          CupertinoIcons.person_solid,
          size: 14,
          color: Colors.white.withValues(alpha: 0.85),
        ),
        const SizedBox(width: 4),
        Text(
          item.username ?? 'admin',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: 0.9),
          ),
        ),
      ],
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
    final isPaused = item.state?.toUpperCase() == 'S';
    final isRunning = item.state?.toUpperCase() == 'R';
    final items = [
      SubscribeItemCardType.edit,
      SubscribeItemCardType.search,
      SubscribeItemCardType.detail,
    ];
    if (isPaused) {
      items.add(SubscribeItemCardType.resume);
    }
    if (isRunning) {
      items.add(SubscribeItemCardType.pause);
    }
    items.add(SubscribeItemCardType.reset);
    if (isTv) {
      items.add(SubscribeItemCardType.shared);
    }
    items.add(SubscribeItemCardType.delete);
    return PopupMenuButton(
      onSelected: onMoreTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.zero,
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      offset: Offset(0, 10),
      surfaceTintColor: Colors.white,
      itemBuilder: (context) => items
          .map(
            (e) => PopupMenuItem(
              value: e,
              child: Row(
                children: [
                  Icon(_iconButton(e), size: 16, color: _iconButtonColor(e)),
                  const SizedBox(width: 8),
                  Text(
                    _iconButtonLabel(e),
                    style: TextStyle(fontSize: 14, color: _iconButtonColor(e)),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 24,
        height: 24,
        child: Icon(Icons.more_vert, size: 16, color: Colors.white),
      ),
    );
  }

  IconData _iconButton(SubscribeItemCardType type) {
    switch (type) {
      case SubscribeItemCardType.edit:
        return Icons.edit;
      case SubscribeItemCardType.detail:
        return Icons.info;
      case SubscribeItemCardType.pause:
        return Icons.pause;
      case SubscribeItemCardType.resume:
        return Icons.play_arrow;
      case SubscribeItemCardType.reset:
        return Icons.refresh;
      case SubscribeItemCardType.shared:
        return Icons.share;
      case SubscribeItemCardType.delete:
        return Icons.delete;
      case SubscribeItemCardType.search:
        return Icons.search;
      default:
        return Icons.more_vert;
    }
  }

  String _iconButtonLabel(SubscribeItemCardType type) {
    switch (type) {
      case SubscribeItemCardType.edit:
        return '编辑';
      case SubscribeItemCardType.detail:
        return '详情';

      case SubscribeItemCardType.pause:
        return '暂停';
      case SubscribeItemCardType.resume:
        return '继续';
      case SubscribeItemCardType.reset:
        return '重置';
      case SubscribeItemCardType.shared:
        return '分享';
      case SubscribeItemCardType.delete:
        return '删除';
      case SubscribeItemCardType.search:
        return '搜索';
      default:
        return '更多';
    }
  }

  Color _iconButtonColor(SubscribeItemCardType type) {
    switch (type) {
      case SubscribeItemCardType.edit:
        return Colors.blue;
      case SubscribeItemCardType.detail:
        return Colors.green;

      case SubscribeItemCardType.pause:
        return Colors.orange;
      case SubscribeItemCardType.resume:
        return Colors.green;
      case SubscribeItemCardType.reset:
        return Colors.blue;
      case SubscribeItemCardType.shared:
        return Colors.purple;
      case SubscribeItemCardType.delete:
        return Colors.red;
      case SubscribeItemCardType.search:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Widget _buildProgressBar(BuildContext context) {
    final total = item.totalEpisode ?? 1;
    final current = total - (item.lackEpisode ?? total);
    final progress = total > 0 ? (current / total).clamp(0.0, 1.0) : 0.0;

    return Container(
      height: 4,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white.withValues(alpha: 0.25),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth * progress;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              if (w > 0)
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: w,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: const Color(0xFF4ADE80),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  String get _titleWithSeason {
    final name = item.name ?? '未知';
    if (isTv && item.season != null && item.season! > 0) {
      return '$name S${item.season.toString().padLeft(2, '0')}';
    }
    return name;
  }

  bool get _hasProgressBar {
    if (!isTv) return false;
    final total = item.totalEpisode;
    return total != null && total > 0;
  }

  bool get _hasEpisodeInfo {
    final total = item.totalEpisode;
    final lack = item.lackEpisode;
    return (total != null && total > 0) || (lack != null && lack >= 0);
  }

  String get _episodeProgress {
    final total = item.totalEpisode ?? 0;
    final lack = item.lackEpisode ?? total;
    final current = total > 0 ? (total - lack).clamp(0, total) : 0;
    return '$current / $total';
  }
}
