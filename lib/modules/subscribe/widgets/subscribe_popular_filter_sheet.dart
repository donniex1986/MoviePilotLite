import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/subscribe/defines/subscribe_popular_filter_defines.dart';

/// 热门订阅/订阅分享 筛选弹窗
/// 扁平化：风格单选 + 评分滑块
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

class _SubscribePopularFilterSheetState
    extends State<SubscribePopularFilterSheet> {
  /// 风格单选：只保留 0 或 1 个
  late List<String> _selectedGenres;
  late int _ratingMin;

  @override
  void initState() {
    super.initState();
    _selectedGenres = widget.initialGenres.isEmpty
        ? []
        : [widget.initialGenres.first];
    _ratingMin = widget.initialRatingMin.clamp(0, 8);
  }

  List<Map<String, String>> get _genreOptions => widget.isTv
      ? SubscribePopularFilterDefines.tvGenreOptions
      : SubscribePopularFilterDefines.movieGenreOptions;

  void _apply() {
    widget.onApply(_selectedGenres, _ratingMin);
    if (mounted) Navigator.of(context).pop();
  }

  void _onGenreTap(String value) {
    setState(() {
      if (_selectedGenres.contains(value)) {
        _selectedGenres = [];
      } else {
        _selectedGenres = [value];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.sizeOf(context).height * 0.5;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return SizedBox(
      height: height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('筛选条件'),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: _apply,
              child: Text(
                '应用',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: ListView(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 24 + bottomPadding),
            children: [
              _buildFlatSectionTitle('风格', '单选'),
              const SizedBox(height: 8),
              _buildGenreSingleSelect(theme),
              const SizedBox(height: 20),
              _buildFlatSectionTitle(
                '评分',
                _ratingMin <= 0 ? '不限' : '不低于 $_ratingMin 分',
              ),
              const SizedBox(height: 8),
              _buildRatingSlider(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlatSectionTitle(String title, String subtitle) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildGenreSingleSelect(ThemeData theme) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _genreOptions.map((opt) {
        final value = opt['value'] ?? '';
        final label = opt['label'] ?? value;
        final isSelected = _selectedGenres.contains(value);

        return _FlatSelectChip(
          label: label,
          selected: isSelected,
          onTap: () => _onGenreTap(value),
        );
      }).toList(),
    );
  }

  Widget _buildRatingSlider(ThemeData theme) {
    final primary = theme.colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: primary,
              inactiveTrackColor: primary.withValues(alpha: 0.24),
              thumbColor: primary,
              overlayColor: primary.withValues(alpha: 0.2),
              trackHeight: 3,
            ),
            child: Slider(
              value: _ratingMin.toDouble(),
              min: 0,
              max: 8,
              divisions: 8,
              onChanged: (v) => setState(() => _ratingMin = v.round()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '不限',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              Text(
                '8分+',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 扁平化单选/多选项，无 chip 立体感
class _FlatSelectChip extends StatelessWidget {
  const _FlatSelectChip({
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
    final primary = theme.colorScheme.primary;
    final surfaceVariant = theme.colorScheme.surfaceContainerHighest;

    return Material(
      color: selected
          ? primary.withValues(alpha: 0.12)
          : surfaceVariant.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              color: selected
                  ? primary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.85),
            ),
          ),
        ),
      ),
    );
  }
}
