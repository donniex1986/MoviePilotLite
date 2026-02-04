import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/recommend/controllers/recommend_controller.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_media_item.dart';
import 'package:moviepilot_mobile/modules/recommend/widgets/recommend_item_card.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendPage extends GetView<RecommendController> {
  const RecommendPage({super.key, this.scrollController});

  final ScrollController? scrollController;

  Color _accentColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.ensureUserCookieRefreshed();
    });
    return Scaffold(
      appBar: _buildNavigationBar(context),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(child: Obx(() => _buildCategoryBar(context))),
          const SliverToBoxAdapter(child: SizedBox(height: 6)),
          SliverToBoxAdapter(child: Obx(() => _buildSectionList(context))),
        ],
      ),
    );
  }

  AppBar _buildNavigationBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: _accentColor(context),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          const Text('推荐'),
        ],
      ),
      centerTitle: false,
    );
  }

  Widget _buildCategoryBar(BuildContext context) {
    final categories = controller.visibleCategories;
    final selectedCategory = controller.selectedCategory.value;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 6),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 46,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final selected = selectedCategory == category;
                  return _buildCategoryTab(
                    context: context,
                    label: category.label,
                    icon: _iconForCategory(category),
                    selected: selected,
                    onTap: () => controller.selectCategory(category),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 18),
                itemCount: categories.length,
              ),
            ),
          ),
          IconButton(
            onPressed: () => _openGroupManager(context),
            icon: const Icon(Icons.tune),
            color: AppTheme.textSecondaryColor,
            tooltip: '筛选',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab({
    required BuildContext context,
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    final color = selected
        ? _accentColor(context)
        : AppTheme.textSecondaryColor;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 20, color: color),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3,
              width: selected ? 42 : 0,
              decoration: BoxDecoration(
                color: _accentColor(context),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionList(BuildContext context) {
    final subCategories = controller.currentSubCategories;
    if (subCategories.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Text(
          '暂无可展示的分组，请在筛选中开启。',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondaryColor),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: subCategories.map((subCategory) {
          return Column(
            children: [
              _buildSectionHeader(context, title: subCategory),
              SizedBox(height: 8),
              _buildPosterRail(context, subCategory),
              SizedBox(height: 8),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, {required String title}) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: _accentColor(context),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '更多',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: _accentColor(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Icon(Icons.chevron_right, size: 18, color: _accentColor(context)),
      ],
    );
  }

  Widget _buildPosterRail(BuildContext context, String subCategory) {
    controller.ensureSubCategoryLoaded(subCategory);
    final items = controller.itemsForSubCategory(subCategory).take(8).toList();
    final isLoading = controller.isLoadingForSubCategory(subCategory);
    final errorText = controller.errorForSubCategory(subCategory);
    if (items.isEmpty && errorText != null) {
      return _buildEmptyRail(context, errorText);
    }
    return Skeletonizer(enabled: isLoading, child: _buildItemsRail(items));
  }

  Widget _buildItemsRail(List<RecommendApiItem> items) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 8),
        itemBuilder: (context, index) => RecommendItemCard(item: items[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemCount: items.length,
      ),
    );
  }

  Widget _buildEmptyRail(BuildContext context, String message) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 120,
      child: Center(
        child: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppTheme.textSecondaryColor,
          ),
        ),
      ),
    );
  }

  IconData _iconForCategory(RecommendCategory category) {
    switch (category) {
      case RecommendCategory.all:
        return Icons.grid_view_rounded;
      case RecommendCategory.movie:
        return Icons.local_movies_outlined;
      case RecommendCategory.tv:
        return Icons.tv_outlined;
      case RecommendCategory.anime:
        return Icons.toys_outlined;
      case RecommendCategory.chart:
        return Icons.emoji_events_outlined;
    }
  }

  void _openGroupManager(BuildContext context) {
    final theme = Theme.of(context);
    showCupertinoModalBottomSheet(
      context: context,
      builder: (sheetContext) => Scaffold(
        appBar: AppBar(
          title: Text('分组管理'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(sheetContext).pop(),
              child: const Text('完成'),
            ),
          ],
        ),
        body: Obx(() {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              12,
              16,
              20 + MediaQuery.of(sheetContext).padding.bottom,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  '至少保留一个主分组',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text('主分组', style: theme.textTheme.titleSmall),
                const SizedBox(height: 8),
                for (final category in RecommendCategory.values)
                  _buildCategoryToggle(category),
                const SizedBox(height: 12),
                Divider(color: AppTheme.borderColor.withOpacity(0.4)),
                const SizedBox(height: 12),
                Text('子分组', style: theme.textTheme.titleSmall),
                const SizedBox(height: 8),
                for (final category in RecommendCategory.values)
                  if (category != RecommendCategory.all)
                    _buildSubCategorySection(context, category),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCategoryToggle(RecommendCategory category) {
    return SwitchListTile(
      value: controller.isCategoryVisible(category),
      onChanged: (value) => controller.setCategoryVisibility(category, value),
      title: Text(category.label),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildSubCategorySection(
    BuildContext context,
    RecommendCategory category,
  ) {
    final theme = Theme.of(context);
    final categoryVisible = controller.isCategoryVisible(category);
    final titleColor = categoryVisible
        ? theme.textTheme.bodyLarge?.color
        : Colors.grey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            category.label,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
          ),
        ),
        for (final subCategory in category.subCategories)
          CheckboxListTile(
            value: controller.isSubCategoryVisible(category, subCategory),
            onChanged: categoryVisible
                ? (value) => controller.setSubCategoryVisibility(
                    category,
                    subCategory,
                    value ?? true,
                  )
                : null,
            title: Text(subCategory),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        const SizedBox(height: 4),
      ],
    );
  }
}
