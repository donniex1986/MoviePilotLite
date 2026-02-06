import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/subscribe/defines/subscribe_popular_filter_defines.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/theme/section.dart';

/// 热门订阅/订阅分享 筛选弹窗
/// 筛选维度：风格、评分
class SubscribePopularFilterSheet extends StatefulWidget {
  const SubscribePopularFilterSheet({
    super.key,
    required this.initialGenres,
    required this.initialRatingMin,
    required this.isTv,
    required this.onApply,
  });

  final List<String> initialGenres;
  final int initialRatingMin;
  final bool isTv;
  final void Function(List<String> genres, int ratingMin) onApply;

  @override
  State<SubscribePopularFilterSheet> createState() =>
      _SubscribePopularFilterSheetState();
}

class _SubscribePopularFilterSheetState extends State<SubscribePopularFilterSheet> {
  static const Color _genreColor = Color(0xFFF79009);
  static const Color _ratingColor = Color(0xFF875BF7);

  late List<String> _selectedGenres;
  late int _ratingMin;

  @override
  void initState() {
    super.initState();
    _selectedGenres = List.from(widget.initialGenres);
    _ratingMin = widget.initialRatingMin;
  }

  List<Map<String, String>> get _genreOptions =>
      widget.isTv
          ? SubscribePopularFilterDefines.tvGenreOptions
          : SubscribePopularFilterDefines.movieGenreOptions;

  void _apply() {
    widget.onApply(_selectedGenres, _ratingMin);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SizedBox(
      height: height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('筛选条件'),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: _apply,
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                '应用',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 20 + bottomPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionBlock(
                  context,
                  title: '风格',
                  color: _genreColor,
                  child: _buildGenreChips(),
                ),
                const SizedBox(height: 16),
                _buildSectionBlock(
                  context,
                  title: '评分',
                  color: _ratingColor,
                  child: _buildRatingChips(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionBlock(
    BuildContext context, {
    required String title,
    required Color color,
    required Widget child,
  }) {
    final theme = Theme.of(context);
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildGenreChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _genreOptions.map((opt) {
        final value = opt['value'] ?? '';
        final label = opt['label'] ?? value;
        final isSelected = _selectedGenres.contains(value);

        return _FilterChipButton(
          label: label,
          selected: isSelected,
          color: _genreColor,
          onTap: () {
            setState(() {
              if (isSelected) {
                _selectedGenres.remove(value);
              } else {
                _selectedGenres.add(value);
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildRatingChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: SubscribePopularFilterDefines.ratingOptions.map((opt) {
        final value = opt['value'] ?? '0';
        final label = opt['label'] ?? value;
        final intVal = int.tryParse(value) ?? 0;
        final isSelected = _ratingMin == intVal;

        return _FilterChipButton(
          label: label,
          selected: isSelected,
          color: _ratingColor,
          onTap: () {
            setState(() => _ratingMin = intVal);
          },
        );
      }).toList(),
    );
  }
}

class _FilterChipButton extends StatelessWidget {
  const _FilterChipButton({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = selected
        ? color.withOpacity(0.14)
        : theme.colorScheme.surfaceVariant;
    final borderColor = selected
        ? color.withOpacity(0.45)
        : theme.dividerColor.withOpacity(0.45);
    final textColor = selected
        ? color
        : theme.textTheme.bodySmall?.color?.withOpacity(0.55) ??
            theme.hintColor;
    final fontWeight = selected ? FontWeight.w600 : FontWeight.w400;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selected) ...[
                Icon(Icons.check, size: 16, color: textColor),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
