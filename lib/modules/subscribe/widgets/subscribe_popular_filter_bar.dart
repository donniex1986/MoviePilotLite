import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/subscribe/defines/subscribe_popular_filter_defines.dart';

/// 热门订阅/订阅分享 筛选栏
/// 扁平化：排序 + 风格·评分合并展示（无 chip 风格）+ 筛选入口
class SubscribePopularFilterBar extends StatelessWidget {
  const SubscribePopularFilterBar({
    super.key,
    required this.sortValue,
    required this.onSortChanged,
    required this.genreLabel,
    required this.onGenreTap,
    required this.ratingLabel,
    required this.onRatingTap,
    required this.onFilterTap,
  });

  final String sortValue;
  final ValueChanged<String> onSortChanged;
  final String genreLabel;
  final VoidCallback onGenreTap;
  final String ratingLabel;
  final VoidCallback onRatingTap;
  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSortSegmented(context, accent, isDark),
            const SizedBox(width: 10),
            _buildMergedFilterRow(context, theme, isDark),
            const SizedBox(width: 8),
            _buildFilterIconButton(context, accent),
          ],
        ),
      ),
    );
  }

  Widget _buildSortSegmented(BuildContext context, Color accent, bool isDark) {
    return CupertinoSlidingSegmentedControl<String>(
      groupValue: sortValue,
      children: {
        for (final opt in SubscribePopularFilterDefines.sortOptions)
          opt.value: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              opt.label,
              style: TextStyle(
                fontSize: 13,
                color: sortValue == opt.value
                    ? CupertinoColors.white
                    : (isDark
                          ? CupertinoColors.label.resolveFrom(context)
                          : CupertinoColors.label.resolveFrom(context)),
              ),
            ),
          ),
      },
      thumbColor: accent,
      backgroundColor: isDark
          ? CupertinoColors.tertiarySystemFill.resolveFrom(context)
          : CupertinoColors.tertiarySystemFill.resolveFrom(context),
      padding: const EdgeInsets.all(2),
      onValueChanged: (value) {
        if (value != null) onSortChanged(value);
      },
    );
  }

  /// 风格与评分合并为一行扁平展示，无 chip 样式
  Widget _buildMergedFilterRow(
    BuildContext context,
    ThemeData theme,
    bool isDark,
  ) {
    final onSurface = theme.colorScheme.onSurface;
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.6);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onFilterTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.tune, size: 16, color: muted),
              const SizedBox(width: 6),
              Text(
                genreLabel,
                style: TextStyle(
                  fontSize: 13,
                  color: onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('·', style: TextStyle(fontSize: 13, color: muted)),
              ),
              Text(
                ratingLabel,
                style: TextStyle(
                  fontSize: 13,
                  color: onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.expand_more, size: 18, color: muted),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterIconButton(BuildContext context, Color accent) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onFilterTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(Icons.tune, size: 22, color: accent),
        ),
      ),
    );
  }
}
