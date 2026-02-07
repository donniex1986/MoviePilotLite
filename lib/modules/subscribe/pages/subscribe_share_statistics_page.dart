import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_share_statistics_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/share_statistics_model.dart';

class SubscribeShareStatisticsPage extends GetView<SubscribeShareStatisticsController> {
  const SubscribeShareStatisticsPage({super.key});

  static const double _horizontalPadding = 16;
  static const double _cardSpacing = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分享统计'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.refresh),
            tooltip: '刷新',
            onPressed: controller.load,
          ),
        ],
      ),
      body: Obx(() {
        final loading = controller.isLoading.value;
        final error = controller.errorText.value;
        final items = controller.items;
        if (loading && items.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        if (error != null && items.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(error, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  CupertinoButton.filled(
                    onPressed: controller.load,
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
          );
        }
        if (items.isEmpty) {
          return Center(
            child: Text(
              '暂无分享统计',
              style: TextStyle(
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel,
                  context,
                ),
              ),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(
            _horizontalPadding,
            12,
            _horizontalPadding,
            80,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final rank = index + 1;
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < items.length - 1 ? _cardSpacing : 0,
              ),
              child: rank <= 3
                  ? _TopThreeStatItem(rank: rank, item: item)
                  : _StatItemTile(rank: rank, item: item),
            );
          },
        );
      }),
    );
  }
}

/// 前三名专用：奖牌 + 姓名 + 数量
class _TopThreeStatItem extends StatelessWidget {
  const _TopThreeStatItem({required this.rank, required this.item});

  final int rank;
  final ShareStatisticsItem item;

  static const List<Color> _medalColors = [
    Color(0xFFFFD700), // 金
    Color(0xFFC0C0C0), // 银
    Color(0xFFCD7F32), // 铜
  ];

  static const List<String> _medalEmoji = ['🥇', '🥈', '🥉'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final medalColor = _medalColors[rank - 1];
    final name = item.shareUser ?? '—';
    final shareCount = item.shareCount ?? 0;
    final reuseCount = item.totalReuseCount ?? 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            medalColor.withValues(alpha: 0.22),
            medalColor.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: medalColor.withValues(alpha: 0.55),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: medalColor.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildMedal(medalColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _CountChip(
                      label: '分享',
                      value: shareCount,
                      unit: '个',
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 10),
                    _CountChip(
                      label: '复用',
                      value: reuseCount,
                      unit: '次',
                      color: theme.colorScheme.secondary,
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

  Widget _buildMedal(Color medalColor) {
    return Container(
      width: 52,
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            medalColor.withValues(alpha: 0.35),
            medalColor.withValues(alpha: 0.15),
          ],
        ),
        border: Border.all(color: medalColor.withValues(alpha: 0.7), width: 2),
        boxShadow: [
          BoxShadow(
            color: medalColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        _medalEmoji[rank - 1],
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}

class _CountChip extends StatelessWidget {
  const _CountChip({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  final String label;
  final int value;
  final String unit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label ',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            '$value$unit',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItemTile extends StatelessWidget {
  const _StatItemTile({required this.rank, required this.item});

  final int rank;
  final ShareStatisticsItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _buildRankBadge(context),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.shareUser ?? '—',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  _buildStatsRow(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankBadge(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.outline.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
      ),
      child: Text(
        '$rank',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: theme.colorScheme.outline,
        ),
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    final theme = Theme.of(context);
    final shareCount = item.shareCount ?? 0;
    final reuseCount = item.totalReuseCount ?? 0;
    return Wrap(
      spacing: 16,
      runSpacing: 4,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.share_solid,
              size: 14,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 4),
            Text(
              '分享 $shareCount 个',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.arrow_2_circlepath,
              size: 14,
              color: theme.colorScheme.secondary,
            ),
            const SizedBox(width: 4),
            Text(
              '被复用 $reuseCount 次',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
