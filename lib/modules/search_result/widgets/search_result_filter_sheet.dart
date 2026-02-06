import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/search_result/controllers/search_result_controller.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';

/// 按筛选类型返回默认色与选中色，供 sheet 与 page 共用。
Color chipColorForType(SearchResultFilterType type, {required bool selected}) {
  final colors = {
    SearchResultFilterType.site: (Color(0xFF3B82F6), Color(0xFF2563EB)),
    SearchResultFilterType.season: (Color(0xFF8B5CF6), Color(0xFF7C3AED)),
    SearchResultFilterType.promotion: (Color(0xFFF59E0B), Color(0xFFD97706)),
    SearchResultFilterType.videoEncode: (Color(0xFF06B6D4), Color(0xFF0891B2)),
    SearchResultFilterType.quality: (Color(0xFF10B981), Color(0xFF059669)),
    SearchResultFilterType.resolution: (Color(0xFFEC4899), Color(0xFFDB2777)),
    SearchResultFilterType.team: (Color(0xFF6366F1), Color(0xFF4F46E5)),
  };
  final (unsel, sel) =
      colors[type] ?? (const Color(0xFF6B7280), const Color(0xFF4B5563));
  return selected ? sel : unsel;
}

/// 单个筛选区块的配置，均由外界传入，无字面量。
class SearchResultFilterSectionConfig {
  const SearchResultFilterSectionConfig({
    required this.filterType,
    required this.title,
    required this.options,
    required this.selected,
    required this.onToggle,
  });

  final SearchResultFilterType filterType;
  final String title;
  final List<String> options;
  final Set<String> selected;
  final void Function(String value) onToggle;
}

/// 筛选弹层：支持按 type 全量或单条件展示，点击选项即时生效，Cupertino modal 样式。
/// [filterMode] 为 null 表示全量筛选，非 null 仅显示该类型的区块。
/// [title]、[clearLabel]、[sections] 等文案与数据均由外界传入。
class SearchResultFilterSheet extends StatelessWidget {
  const SearchResultFilterSheet({
    super.key,
    required this.title,
    required this.clearLabel,
    required this.onClear,
    required this.sections,
    this.filterMode,
  });

  /// 弹层标题（如「筛选」）
  final String title;

  /// 清空按钮文案（如「清空」）
  final String clearLabel;

  /// 点击清空时的回调
  final VoidCallback onClear;

  /// 所有筛选区块配置（由外界根据数据与类型组装）
  final List<SearchResultFilterSectionConfig> sections;

  /// null = 全量筛选，非 null = 仅显示该 [SearchResultFilterType] 对应区块
  final SearchResultFilterType? filterMode;

  List<SearchResultFilterSectionConfig> get _visibleSections {
    if (filterMode == null) return sections;
    return sections.where((s) => s.filterType == filterMode).toList();
  }

  @override
  Widget build(BuildContext context) {
    final labelColor = CupertinoDynamicColor.resolve(
      CupertinoColors.label,
      context,
    );
    final secondaryColor = CupertinoDynamicColor.resolve(
      CupertinoColors.secondaryLabel,
      context,
    );
    final primary = context.primaryColor;

    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.systemBackground,
            context,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: labelColor,
                      ),
                    ),
                    const Spacer(),
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      onPressed: onClear,
                      child: Text(
                        clearLabel,
                        style: TextStyle(
                          fontSize: 16,
                          color: primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  children: [
                    for (final section in _visibleSections)
                      if (section.options.isNotEmpty) ...[
                        _SectionChipsBlock(
                          sectionTitle: section.title,
                          filterType: section.filterType,
                          options: section.options,
                          selected: section.selected,
                          onToggle: section.onToggle,
                          secondaryColor: secondaryColor,
                        ),
                        const SizedBox(height: 16),
                      ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionChipsBlock extends StatelessWidget {
  const _SectionChipsBlock({
    required this.sectionTitle,
    required this.filterType,
    required this.options,
    required this.selected,
    required this.onToggle,
    required this.secondaryColor,
  });

  final String sectionTitle;
  final SearchResultFilterType filterType;
  final List<String> options;
  final Set<String> selected;
  final void Function(String value) onToggle;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: secondaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = selected.contains(option);
            final color = chipColorForType(filterType, selected: isSelected);
            return GestureDetector(
              onTap: () => onToggle(option),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: isSelected ? color : color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: isSelected ? color : color.withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? Colors.white : color,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
