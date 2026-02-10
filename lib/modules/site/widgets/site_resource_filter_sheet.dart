import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/site/models/site_resource_models.dart';

/// 站点资源分类筛选弹层（参考订阅列表筛选）
class SiteResourceFilterSheet extends StatelessWidget {
  const SiteResourceFilterSheet({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onSelectCategory,
    required this.onClear,
  });

  final List<SiteResourceCategory> categories;
  final int? selectedCategoryId;
  final void Function(int? categoryId) onSelectCategory;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final labelColor = CupertinoDynamicColor.resolve(
      CupertinoColors.label,
      context,
    );
    final primary = Theme.of(context).colorScheme.primary;

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
                      '按分类筛选',
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
                        '清空',
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
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildChip(
                          context,
                          label: '全部',
                          categoryId: null,
                          primary: primary,
                        ),
                        ...categories.map((c) => _buildChip(
                              context,
                              label: c.desc.isNotEmpty ? c.desc : c.cat,
                              categoryId: c.id,
                              primary: primary,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required String label,
    required int? categoryId,
    required Color primary,
  }) {
    final isSelected = selectedCategoryId == categoryId;
    return GestureDetector(
      onTap: () => onSelectCategory(categoryId),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primary : primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? primary : primary.withValues(alpha: 0.35),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.white : primary,
          ),
        ),
      ),
    );
  }
}
