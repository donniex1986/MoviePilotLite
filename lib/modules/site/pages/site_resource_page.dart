import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_resource_controller.dart';
import 'package:moviepilot_mobile/modules/site/widgets/site_resource_filter_sheet.dart';
import 'package:moviepilot_mobile/modules/site/widgets/site_resource_item_card.dart';

class SiteResourcePage extends GetView<SiteResourceController> {
  const SiteResourcePage({super.key});

  static const double _horizontalPadding = 16;
  static const double _cardSpacing = 12;

  @override
  Widget build(BuildContext context) {
    final title = controller.siteName.isNotEmpty
        ? '${controller.siteName} · 资源'
        : '站点资源';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: controller.loadResources,
            child: const Icon(CupertinoIcons.refresh),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildSearchAndFilter(context)),
          _buildSliverContent(context),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(_horizontalPadding, 8, _horizontalPadding, 12),
      child: Row(
        children: [
          Expanded(
            child: CupertinoSearchTextField(
              placeholder: '搜索资源…',
              onSubmitted: controller.onSearchSubmitted,
              backgroundColor: CupertinoDynamicColor.resolve(
                CupertinoColors.tertiarySystemFill,
                context,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
          const SizedBox(width: 10),
          _buildFilterButton(context),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return Obx(() {
      final hasFilters = controller.hasActiveFilters;
      final accent = Theme.of(context).colorScheme.primary;
      return CupertinoButton(
        padding: EdgeInsets.zero,
        pressedOpacity: 0.7,
        onPressed: () => _openFilterSheet(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: accent.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.line_horizontal_3_decrease_circle_fill,
                size: 20,
                color: hasFilters ? accent : accent.withOpacity(0.7),
              ),
              const SizedBox(width: 6),
              Text(
                controller.categoryFilterLabel,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: hasFilters
                      ? accent
                      : CupertinoDynamicColor.resolve(
                          CupertinoColors.secondaryLabel,
                          context,
                        ),
                ),
              ),
              if (hasFilters) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSliverContent(BuildContext context) {
    return Obx(() {
      final loading = controller.isLoading.value;
      final error = controller.errorText.value;
      final items = controller.items;

      if (loading && items.isEmpty) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      }
      if (error != null && items.isEmpty) {
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
                    onPressed: controller.loadResources,
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
              '暂无资源',
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
      return SliverPadding(
        padding: const EdgeInsets.fromLTRB(
          _horizontalPadding,
          0,
          _horizontalPadding,
          80,
        ),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index < items.length - 1 ? _cardSpacing : 0,
                ),
                child: SiteResourceItemCard(item: items[index]),
              );
            },
            childCount: items.length,
          ),
        ),
      );
    });
  }

  Future<void> _openFilterSheet(BuildContext context) {
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SizedBox(
          height: MediaQuery.of(sheetContext).size.height * 0.4,
          child: Obx(
            () => SiteResourceFilterSheet(
              categories: controller.categories,
              selectedCategoryId: controller.selectedCategoryId.value,
              onSelectCategory: (id) {
                controller.setCategoryFilter(id);
                Navigator.of(sheetContext).pop();
                controller.loadResources();
              },
              onClear: () {
                controller.clearCategoryFilter();
                Navigator.of(sheetContext).pop();
                controller.loadResources();
              },
            ),
          ),
        );
      },
    );
  }
}
