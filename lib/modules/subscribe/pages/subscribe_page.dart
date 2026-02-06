import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/widgets/subscribe_filter_sheet.dart';
import 'package:moviepilot_mobile/modules/subscribe/widgets/subscribe_item_card.dart';

class SubscribePage extends GetView<SubscribeController> {
  const SubscribePage({super.key, this.scrollController});

  final ScrollController? scrollController;

  static const double _horizontalPadding = 16;
  static const double _cardSpacing = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(child: _buildSearchBar(context)),
          _buildSliverContent(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(controller.subscribeType.displayName),
      centerTitle: false,
      actions: [
        if (controller.isTv)
          IconButton(
            icon: const Icon(CupertinoIcons.share),
            tooltip: '订阅分享',
            onPressed: () => Get.toNamed(
              '/subscribe-share',
              arguments: controller.subscribeType,
            ),
          ),
        IconButton(
          icon: const Icon(CupertinoIcons.flame),
          tooltip: '热门订阅',
          onPressed: () => Get.toNamed(
            '/subscribe-popular',
            arguments: controller.subscribeType,
          ),
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.settings_solid),
          tooltip: '默认规则',
          onPressed: controller.openDefaultRules,
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        _horizontalPadding,
        8,
        _horizontalPadding,
        12,
      ),
      child: Row(
        children: [
          Expanded(
            child: CupertinoSearchTextField(
              onSubmitted: controller.updateKeyword,
              placeholder: '搜索订阅名称…',
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
      final accent = Theme.of(context).primaryColor; // 紫色点缀
      return CupertinoButton(
        padding: EdgeInsets.zero,
        pressedOpacity: 0.7,
        onPressed: () => _openFilterSheet(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: accent.withValues(alpha: 0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.line_horizontal_3_decrease_circle_fill,
                size: 20,
                color: hasFilters ? accent : accent.withValues(alpha: 0.7),
              ),
              const SizedBox(width: 6),
              Text(
                '筛选',
                style: TextStyle(
                  fontSize: 14,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${controller.selectedStates.length}',
                    style: const TextStyle(
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
      final loading = controller.userLoading.value;
      final error = controller.errorText.value;
      final items = controller.visibleUserItems;
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
                    onPressed: controller.loadUserSubscribes,
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
              '暂无订阅',
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
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < items.length - 1 ? _cardSpacing : 0,
              ),
              child: SubscribeItemCard(
                item: items[index],
                isTv: controller.isTv,
                onTap: () {},
                onMoreTap: () {},
              ),
            );
          }, childCount: items.length),
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
            () => SubscribeFilterSheet(
              states: controller.availableStates,
              selected: controller.selectedStates.toSet(),
              onToggle: controller.toggleStateFilter,
              onClear: controller.clearStateFilters,
            ),
          ),
        );
      },
    );
  }
}
