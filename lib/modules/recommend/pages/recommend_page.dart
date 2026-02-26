import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/recommend/controllers/recommend_controller.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/modules/recommend/widgets/recommend_item_card.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/utils/http_path_builder_util.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moviepilot_mobile/modules/recommend/widgets/recommond_category_group_edit_pannel.dart';

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
          SliverToBoxAdapter(child: _buildSectionList(context)),
          SliverToBoxAdapter(child: SizedBox(height: _bottomSpacer(context))),
        ],
      ),
    );
  }

  double _bottomSpacer(BuildContext context) {
    return 100;
  }

  AppBar _buildNavigationBar(BuildContext context) {
    return AppBar(
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: const Icon(Icons.recommend_outlined),
      ),
      title: Text(
        'Recommend',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
            onPressed: () => showCupertinoModalBottomSheet(
              context: context,
              builder: (sheetContext) => RecommondCategoryGroupEditPannelWidget(
                sheetContext: sheetContext,
                controller: controller,
              ),
            ),
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
    return Obx(() {
      final subCategories = controller.currentSubCategories;
      if (subCategories.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            '暂无可展示的分组，请在筛选中开启。',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: subCategories.map((subCategory) {
            return KeyedSubtree(
              key: ValueKey(subCategory),
              child: Column(
                children: [
                  _buildSectionHeader(context, subCategory: subCategory),
                  SizedBox(height: 8),
                  _buildPosterRail(context, subCategory),
                  SizedBox(height: 8),
                ],
              ),
            );
          }).toList(),
        ),
      );
    });
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String subCategory,
  }) {
    final theme = Theme.of(context);
    final key = controller.keyForSubCategory(subCategory);
    final canOpenMore = key != null && key.isNotEmpty;
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
            subCategory,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (canOpenMore)
          InkWell(
            onTap: () => _openCategoryList(key: key, title: subCategory),
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
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
              ),
            ),
          )
        else
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '更多',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right, size: 18, color: AppTheme.textSecondaryColor),
            ],
          ),
      ],
    );
  }

  void _openCategoryList({required String key, required String title}) {
    Get.toNamed(
      '/recommend-category-list',
      parameters: {'key': key, 'title': title},
    );
  }

  Widget _buildPosterRail(BuildContext context, String subCategory) {
    return Obx(() {
      final items = controller
          .itemsForSubCategory(subCategory)
          .take(8)
          .toList();
      final isLoading = controller.isLoadingForSubCategory(subCategory);
      final errorText = controller.errorForSubCategory(subCategory);
      if (items.isEmpty && errorText != null) {
        return _buildEmptyRail(context, errorText);
      }
      return Skeletonizer(
        enabled: isLoading,
        child: _buildItemsRail(items, storageKey: subCategory),
      );
    });
  }

  Widget _buildItemsRail(
    List<RecommendApiItem> items, {
    required String storageKey,
  }) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        key: PageStorageKey<String>('recommend-rail-$storageKey'),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 8),
        itemBuilder: (context, index) {
          final item = items[index];
          return RecommendItemCard(
            key: ValueKey(_itemKey(item)),
            item: item,
            onTap: () => _openDetail(item),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemCount: items.length,
      ),
    );
  }

  String _itemKey(RecommendApiItem item) {
    return HttpPathBuilderUtil.buildMediaPath(item);
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

  void _openDetail(RecommendApiItem item) {
    final path = _buildMediaPath(item);
    if (path == null) {
      ToastUtil.info('暂无可用详情信息');
      return;
    }
    final title = _bestTitle(item);
    final params = <String, String>{
      'path': path,
      if (title != null && title.isNotEmpty) 'title': title,
      if (item.year != null && item.year!.isNotEmpty) 'year': item.year!,
      if (item.type != null && item.type!.isNotEmpty) 'type_name': item.type!,
    };
    Get.toNamed('/media-detail', parameters: params);
  }

  String? _bestTitle(RecommendApiItem item) {
    final title = item.title;
    if (title != null && title.trim().isNotEmpty) return title.trim();
    final enTitle = item.en_title;
    if (enTitle != null && enTitle.trim().isNotEmpty) return enTitle.trim();
    final original = item.original_title ?? item.original_name;
    if (original != null && original.trim().isNotEmpty) {
      return original.trim();
    }
    return null;
  }

  String? _buildMediaPath(RecommendApiItem item) {
    final prefix = item.mediaid_prefix;
    final mediaId = item.media_id;
    if (prefix != null &&
        prefix.isNotEmpty &&
        mediaId != null &&
        mediaId.isNotEmpty) {
      return '$prefix:$mediaId';
    }
    final tmdbId = item.tmdb_id;
    if (tmdbId != null && tmdbId.isNotEmpty) {
      return 'tmdb:$tmdbId';
    }
    final doubanId = item.douban_id;
    if (doubanId != null && doubanId.isNotEmpty) {
      return 'douban:$doubanId';
    }
    final bangumiId = item.bangumi_id;
    if (bangumiId != null && bangumiId.isNotEmpty) {
      return 'bangumi:$bangumiId';
    }
    return null;
  }
}
