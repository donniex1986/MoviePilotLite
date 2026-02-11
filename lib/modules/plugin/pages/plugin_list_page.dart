import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/plugin/controllers/plugin_list_controller.dart';
import 'package:moviepilot_mobile/modules/plugin/defines/plugin_list_filter_defines.dart';
import 'package:moviepilot_mobile/modules/plugin/models/plugin_models.dart';
import 'package:moviepilot_mobile/modules/plugin/pages/plugin_info_sheet.dart';
import 'package:moviepilot_mobile/modules/plugin/widgets/plugin_item_card.dart';
import 'package:moviepilot_mobile/modules/plugin/widgets/plugin_list_filter_sheet.dart';
import 'package:moviepilot_mobile/modules/search_result/widgets/sort_pull_down_widget.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';

class PluginListPage extends GetView<PluginListController> {
  const PluginListPage({super.key});

  static const double _wideBreakpoint = 500;
  static const double _itemWidth = 250;
  static const double _horizontalPadding = 16;
  static const double _gridSpacing = 12;

  static const Map<PluginListFilterType, String> _filterSectionTitles = {
    PluginListFilterType.author: '作者',
    PluginListFilterType.label: '标签',
    PluginListFilterType.repo: '仓库',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('插件列表'),
        centerTitle: false,
        actions: [
          Obx(() {
            if (!controller.isLoading.value) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.load,
        child: CustomScrollView(
          controller: controller.scrollController,
          cacheExtent: 400,
          slivers: [
            SliverToBoxAdapter(child: _buildSearchBar(context)),
            SliverToBoxAdapter(child: _buildToolbar(context)),
            _buildSliverContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        _horizontalPadding,
        12,
        _horizontalPadding,
        8,
      ),
      child: CupertinoSearchTextField(
        onSubmitted: controller.updateKeyword,
        placeholder: '搜索插件名称、描述、作者…',
        backgroundColor: CupertinoDynamicColor.resolve(
          CupertinoColors.tertiarySystemFill,
          context,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        _horizontalPadding,
        0,
        _horizontalPadding,
        8,
      ),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Obx(
              () => SortPullDownWidget<PluginListSortKey>(
                isAscending: controller.sortAscending.value,
                currentValue: controller.sortKey.value,
                options: PluginListSortKey.values,
                labelBuilder: _sortLabel,
                onDirectionChanged: (asc) {
                  if (controller.sortAscending.value != asc) {
                    controller.toggleSortDirection();
                  }
                },
                onValueChanged: controller.updateSortKey,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: _buildFilterBar(context)),
            const SizedBox(width: 6),
            _buildFilterButton(context),
          ],
        ),
      ),
    );
  }

  static String _sortLabel(PluginListSortKey key) {
    switch (key) {
      case PluginListSortKey.defaultSort:
        return '默认';
      case PluginListSortKey.installCount:
        return '安装量';
      case PluginListSortKey.pluginName:
        return '名称';
      case PluginListSortKey.addTime:
        return '添加时间';
    }
  }

  Widget _buildFilterButton(BuildContext context) {
    return Obx(() {
      final hasFilters = controller.hasActiveFilters;
      final accent = context.primaryColor;
      return CupertinoButton(
        padding: const EdgeInsets.all(6),
        minimumSize: Size.zero,
        pressedOpacity: 0.7,
        onPressed: () => _openFilterSheet(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: CupertinoDynamicColor.resolve(
              CupertinoColors.tertiarySystemFill,
              context,
            ),
            borderRadius: BorderRadius.circular(8),
            border: hasFilters
                ? Border.all(color: accent.withValues(alpha: 0.5), width: 1)
                : null,
          ),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Icon(
                CupertinoIcons.slider_horizontal_3,
                size: 16,
                color: hasFilters
                    ? accent
                    : CupertinoDynamicColor.resolve(
                        CupertinoColors.tertiaryLabel,
                        context,
                      ),
              ),
              if (hasFilters)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildFilterBar(BuildContext context) {
    return Obx(() {
      final items = [
        _FilterChipItem(
          filterType: PluginListFilterType.author,
          label: _filterSectionTitles[PluginListFilterType.author]!,
          icon: CupertinoIcons.person,
          count: controller.selectedAuthors.length,
        ),
        _FilterChipItem(
          filterType: PluginListFilterType.label,
          label: _filterSectionTitles[PluginListFilterType.label]!,
          icon: CupertinoIcons.tag,
          count: controller.selectedLabels.length,
        ),
        _FilterChipItem(
          filterType: PluginListFilterType.repo,
          label: _filterSectionTitles[PluginListFilterType.repo]!,
          icon: CupertinoIcons.cube_box,
          count: controller.selectedRepos.length,
        ),
      ];

      return SizedBox(
        height: 32,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              _buildFilterPill(context, items[index]),
          separatorBuilder: (_, __) => const SizedBox(width: 6),
          itemCount: items.length,
        ),
      );
    });
  }

  Widget _buildFilterPill(BuildContext context, _FilterChipItem item) {
    final hasCount = item.count > 0;
    const chipColors = {
      PluginListFilterType.author: Color(0xFF3B82F6),
      PluginListFilterType.label: Color(0xFF8B5CF6),
      PluginListFilterType.repo: Color(0xFF10B981),
    };
    final chipColor = chipColors[item.filterType] ?? const Color(0xFF6B7280);
    final bgColor = hasCount ? chipColor : chipColor.withValues(alpha: 0.12);
    final borderColor = hasCount
        ? chipColor
        : chipColor.withValues(alpha: 0.35);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      pressedOpacity: 0.7,
      onPressed: () => _openFilterSheet(context, item.filterType),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item.icon,
              size: 14,
              color: hasCount ? Colors.white : chipColor,
            ),
            const SizedBox(width: 4),
            Text(
              item.label,
              style: TextStyle(
                color: hasCount ? Colors.white : chipColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (hasCount) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: chipColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${item.count}',
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<PluginListFilterSectionConfig> _buildFilterSections() {
    return [
      PluginListFilterSectionConfig(
        filterType: PluginListFilterType.author,
        title: _filterSectionTitles[PluginListFilterType.author]!,
        options: controller.availableAuthors,
        selected: controller.selectedAuthors.toSet(),
        onToggle: (v) =>
            controller.toggleFilter(PluginListFilterType.author, v),
      ),
      PluginListFilterSectionConfig(
        filterType: PluginListFilterType.label,
        title: _filterSectionTitles[PluginListFilterType.label]!,
        options: controller.availableLabels,
        selected: controller.selectedLabels.toSet(),
        onToggle: (v) => controller.toggleFilter(PluginListFilterType.label, v),
      ),
      PluginListFilterSectionConfig(
        filterType: PluginListFilterType.repo,
        title: _filterSectionTitles[PluginListFilterType.repo]!,
        options: controller.availableRepos,
        selected: controller.selectedRepos.toSet(),
        onToggle: (v) => controller.toggleFilter(PluginListFilterType.repo, v),
      ),
    ];
  }

  Future<void> _openFilterSheet(
    BuildContext context, [
    PluginListFilterType? filterMode,
  ]) {
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SizedBox(
          height: MediaQuery.of(sheetContext).size.height * 0.78,
          child: Obx(
            () => PluginListFilterSheet(
              title: '筛选',
              clearLabel: '清空',
              onClear: controller.clearFilters,
              sections: _buildFilterSections(),
              filterMode: filterMode,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSliverContent(BuildContext context) {
    return Obx(() {
      final loading = controller.isLoading.value;
      final error = controller.errorText.value;
      final items = controller.visibleItems;

      if (loading && items.isEmpty && controller.items.isEmpty) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      }
      if (error != null && controller.items.isEmpty) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
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
          ),
        );
      }
      if (items.isEmpty) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text(
              controller.keyword.value.trim().isEmpty &&
                      !controller.hasActiveFilters
                  ? '暂无插件'
                  : '未找到匹配的插件',
              style: TextStyle(
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel,
                  context,
                ),
              ),
            ),
          ),
        );
      }

      final width = MediaQuery.sizeOf(context).width;
      final useGrid = width > _wideBreakpoint;

      return SliverMainAxisGroup(
        slivers: [
          if (useGrid)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                _horizontalPadding,
                16,
                _horizontalPadding,
                0,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ((width - _horizontalPadding * 2) /
                              (_itemWidth + _gridSpacing))
                          .floor()
                          .clamp(1, 10)
                          .toInt(),
                  mainAxisSpacing: _gridSpacing,
                  crossAxisSpacing: _gridSpacing,
                  mainAxisExtent: 140,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildCard(context, items[index]),
                  childCount: items.length,
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                _horizontalPadding,
                16,
                _horizontalPadding,
                0,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: _gridSpacing),
                    child: _buildCard(context, items[index]),
                  ),
                  childCount: items.length,
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                ),
              ),
            ),
          SliverToBoxAdapter(child: _buildLoadMoreFooter(context)),
        ],
      );
    });
  }

  Widget _buildLoadMoreFooter(BuildContext context) {
    return Obx(() {
      if (controller.visibleItems.isEmpty) return const SizedBox.shrink();
      if (!controller.hasMore) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 80),
          child: Center(
            child: Text(
              '没有更多了',
              style: TextStyle(
                fontSize: 13,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel,
                  context,
                ),
              ),
            ),
          ),
        );
      }
      final loading = controller.isLoadingMore.value;
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 80),
        child: Center(
          child: loading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : CupertinoButton(
                  onPressed: controller.loadMore,
                  child: Text(
                    '加载更多',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
        ),
      );
    });
  }

  Widget _buildCard(BuildContext context, PluginItem item) {
    final iconUrl = item.pluginIcon != null && item.pluginIcon!.isNotEmpty
        ? ImageUtil.convertPluginIconUrl(item.pluginIcon!)
        : '';
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(PluginInfoSheet(item: item));
      },
      child: PluginItemCard(
        item: item,
        iconUrl: iconUrl,
        installCount: item.installCount,
      ),
    );
  }
}

class _FilterChipItem {
  const _FilterChipItem({
    required this.filterType,
    required this.label,
    required this.icon,
    required this.count,
  });

  final PluginListFilterType filterType;
  final String label;
  final IconData icon;
  final int count;
}
