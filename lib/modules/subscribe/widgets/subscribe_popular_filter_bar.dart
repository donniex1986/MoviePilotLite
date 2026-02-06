import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/subscribe/defines/subscribe_popular_filter_defines.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';

/// 热门订阅/订阅分享 筛选栏
/// 布局：排序[最新、热门、评分] -- 风格 --- 评分 --- filter button
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
    final accent = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            _buildSortChips(context, accent),
            const SizedBox(width: 12),
            _buildChip(
              context,
              label: genreLabel,
              icon: Icons.movie_filter_outlined,
              onTap: onGenreTap,
            ),
            const SizedBox(width: 8),
            _buildChip(
              context,
              label: ratingLabel,
              icon: Icons.star_outline,
              onTap: onRatingTap,
            ),
            const SizedBox(width: 8),
            _buildFilterButton(context, accent),
          ],
        ),
      ),
    );
  }

  Widget _buildSortChips(BuildContext context, Color accent) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: SubscribePopularFilterDefines.sortOptions.map((opt) {
        final selected = opt.value == sortValue;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => onSortChanged(opt.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: selected
                    ? accent.withOpacity(0.14)
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selected
                      ? accent.withOpacity(0.45)
                      : AppTheme.borderColor.withOpacity(0.4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                opt.label,
                style: TextStyle(
                  color: selected ? accent : null,
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderColor.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: theme.colorScheme.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.expand_more,
              size: 16,
              color: theme.colorScheme.primary.withOpacity(0.8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, Color accent) {
    return GestureDetector(
      onTap: onFilterTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: accent.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: accent.withOpacity(0.35)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(Icons.tune, size: 20, color: accent),
      ),
    );
  }
}
