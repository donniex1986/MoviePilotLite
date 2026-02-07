import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_calendar_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/subscribe_calendar_models.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class SubscribeCalendarPage extends GetView<SubscribeCalendarController> {
  const SubscribeCalendarPage({super.key});

  static const double _horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('订阅日历'),
        centerTitle: false,
        actions: [
          Obx(() {
            final selected = controller.hideExpired.value;
            final theme = Theme.of(context);
            return IconButton(
              icon: Icon(
                CupertinoIcons.calendar,
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface,
              ),
              tooltip: selected ? '隐藏已过期（点击显示全部）' : '显示全部（点击隐藏已过期）',
              onPressed: controller.toggleHideExpired,
            );
          }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildShowFilter(context),
          Expanded(child: _buildBody(context)),
        ],
      ),
    );
  }

  Widget _buildShowFilter(BuildContext context) {
    return Obx(() {
      final options = controller.showOptions;
      if (options.isEmpty) return const SizedBox.shrink();
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(
          _horizontalPadding,
          8,
          _horizontalPadding,
          8,
        ),
        child: Row(
          children: [
            _FilterChip(
              label: '全部',
              selected: controller.selectedShowKey.value == null,
              onTap: () => controller.setShowFilter(null),
            ),
            ...options.map(
              (e) => _FilterChip(
                label: e.value,
                selected: controller.selectedShowKey.value == e.key,
                onTap: () => controller.setShowFilter(e.key),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return Obx(() {
      final loading = controller.isLoading.value;
      final error = controller.errorText.value;
      final items = controller.visibleItems;
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
            '暂无剧集日历',
            style: TextStyle(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.secondaryLabel,
                context,
              ),
            ),
          ),
        );
      }
      final grouped = controller.visibleItemsGroupedByDate;
      return ListView.builder(
        padding: const EdgeInsets.fromLTRB(
          _horizontalPadding,
          12,
          _horizontalPadding,
          80,
        ),
        itemCount: _totalGroupedItemCount(grouped),
        itemBuilder: (context, index) {
          return _buildGroupedItem(context, grouped, index);
        },
      );
    });
  }

  int _totalGroupedItemCount(
    List<MapEntry<String, List<CalendarEpisodeItem>>> grouped,
  ) {
    var count = 0;
    for (final e in grouped) {
      count += 1; // date header
      count += e.value.length; // tiles
    }
    return count;
  }

  Widget _buildGroupedItem(
    BuildContext context,
    List<MapEntry<String, List<CalendarEpisodeItem>>> grouped,
    int index,
  ) {
    var offset = 0;
    for (final e in grouped) {
      final date = e.key;
      final items = e.value;
      if (index == offset) {
        return _DayHeader(date: date);
      }
      offset += 1;
      if (index < offset + items.length) {
        final item = items[index - offset];
        final isFirst = index - offset == 0;
        final isLast = index - offset == items.length - 1;
        return _TimelineEpisodeTile(
          item: item,
          isFirst: isFirst,
          isLast: isLast,
        );
      }
      offset += items.length;
    }
    return const SizedBox.shrink();
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({required this.date});

  final String date;

  static String get _today =>
      DateTime.now().toUtc().toIso8601String().substring(0, 10);

  bool get _isPast =>
      date.isNotEmpty && date != '未定' && date.compareTo(_today) < 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isToday = date == _today;
    final isPast = _isPast;
    final bgColor = isToday
        ? theme.colorScheme.primary.withValues(alpha: 0.18)
        : isPast
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.9)
        : theme.colorScheme.surfaceContainerHighest;
    final textColor = isToday
        ? theme.colorScheme.primary
        : isPast
        ? theme.colorScheme.outline
        : theme.colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              isToday ? '今天 $date' : date,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        color: selected
            ? theme.colorScheme.primary.withValues(alpha: 0.2)
            : theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TimelineEpisodeTile extends StatelessWidget {
  const _TimelineEpisodeTile({
    required this.item,
    required this.isFirst,
    required this.isLast,
  });

  static const double _timelineLineWidth = 2;
  static const double _dotSize = 12;
  static const double _posterWidth = 100;
  static const double _posterHeight = 150;

  final CalendarEpisodeItem item;
  final bool isFirst;
  final bool isLast;

  static String get _today =>
      DateTime.now().toUtc().toIso8601String().substring(0, 10);

  bool get _isPast =>
      item.airDate.isNotEmpty && item.airDate.compareTo(_today) < 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ep = item.episode;
    final isPast = _isPast;
    final timelineColor = isPast
        ? theme.colorScheme.outline.withValues(alpha: 0.25)
        : theme.colorScheme.outline.withValues(alpha: 0.35);
    final dotColor = isPast
        ? theme.colorScheme.outline
        : theme.colorScheme.primary;
    final cardColor = isPast
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
        : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.7);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                if (!isFirst)
                  Container(
                    width: _timelineLineWidth,
                    height: 12,
                    color: timelineColor,
                  ),
                Container(
                  width: _dotSize,
                  height: _dotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dotColor,
                    border: Border.all(
                      color: theme.colorScheme.surface,
                      width: 2,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: _timelineLineWidth,
                      color: timelineColor,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Material(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPoster(context),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ep.name ?? '第 ${ep.episodeNumber ?? 0} 集',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (ep.overview != null &&
                                  ep.overview!.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Text(
                                  ep.overview!,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    item.showName,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.secondary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (ep.runtime != null &&
                                      ep.runtime! > 0) ...[
                                    const SizedBox(width: 8),
                                    Text(
                                      '${ep.runtime} 分钟',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: theme.colorScheme.outline,
                                          ),
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    final ep = item.episode;
    String? url = ep.stillPath;
    if (url == null || url.isEmpty) url = item.showPoster;
    if (url != null && url.isNotEmpty) {
      if (!url.startsWith('http')) {
        url = 'https://image.tmdb.org/t/p/w500$url';
      }
      url = ImageUtil.convertCacheImageUrl(url);
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
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
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Icon(
        CupertinoIcons.tv,
        color: Theme.of(context).colorScheme.outline,
        size: 28,
      ),
    );
  }
}
