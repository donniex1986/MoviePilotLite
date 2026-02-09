import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/plugin/defines/plugin_list_filter_defines.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';

Color _chipColorForType(PluginListFilterType type, {required bool selected}) {
  const colors = {
    PluginListFilterType.author: Color(0xFF3B82F6),
    PluginListFilterType.label: Color(0xFF8B5CF6),
    PluginListFilterType.repo: Color(0xFF10B981),
  };
  final color = colors[type] ?? const Color(0xFF6B7280);
  return selected ? color : color;
}

/// 插件列表筛选区块配置
class PluginListFilterSectionConfig {
  const PluginListFilterSectionConfig({
    required this.filterType,
    required this.title,
    required this.options,
    required this.selected,
    required this.onToggle,
  });

  final PluginListFilterType filterType;
  final String title;
  final List<String> options;
  final Set<String> selected;
  final void Function(String value) onToggle;
}

/// 插件列表筛选弹层
class PluginListFilterSheet extends StatelessWidget {
  const PluginListFilterSheet({
    super.key,
    required this.title,
    required this.clearLabel,
    required this.onClear,
    required this.sections,
    this.filterMode,
  });

  final String title;
  final String clearLabel;
  final VoidCallback onClear;
  final List<PluginListFilterSectionConfig> sections;
  final PluginListFilterType? filterMode;

  List<PluginListFilterSectionConfig> get _visibleSections {
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
  final PluginListFilterType filterType;
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
            final color = _chipColorForType(filterType, selected: isSelected);
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
