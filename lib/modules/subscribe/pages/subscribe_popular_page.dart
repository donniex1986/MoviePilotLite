import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_popular_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/widgets/subscribe_popular_filter_bar.dart';
import 'package:moviepilot_mobile/modules/subscribe/widgets/subscribe_popular_filter_sheet.dart';
import 'package:moviepilot_mobile/modules/subscribe/widgets/subscribe_popular_item_card.dart';

class SubscribePopularPage extends GetView<SubscribePopularController> {
  const SubscribePopularPage({super.key});

  static const double _horizontalPadding = 16;
  static const double _gridCrossAxisSpacing = 12;
  static const double _gridMainAxisSpacing = 16;

  /// 宽屏断点：>= 此宽度时每行 5 个，否则每行 2 个
  static const double _wideBreakpoint = 600;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.ensureUserCookieRefreshed();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('热门订阅'),
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
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverToBoxAdapter(child: _buildSearchBar(context)),
          SliverToBoxAdapter(
            child: Obx(
              () => SubscribePopularFilterBar(
                sortValue: controller.sortType.value,
                onSortChanged: controller.setSortType,
                genreLabel: controller.genreLabel,
                onGenreTap: () => _openFilterSheet(context),
                ratingLabel: controller.ratingLabel,
                onRatingTap: () => _openFilterSheet(context),
                onFilterTap: () => _openFilterSheet(context),
              ),
            ),
          ),
          _buildSliverContent(context),
        ],
      ),
    );
  }

  void _openFilterSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SubscribePopularFilterSheet(
        initialGenres: controller.selectedGenres.toList(),
        initialRatingMin: controller.voteMin.value,
        isTv: controller.isTv,
        onApply: (genres, ratingMin) {
          controller.applyFilter(genres, ratingMin);
        },
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 0, left: 16, right: 16),
      child: CupertinoSearchTextField(
        onSubmitted: controller.updateKeyword,
        placeholder: '搜索订阅名称…',
        backgroundColor: CupertinoDynamicColor.resolve(
          CupertinoColors.tertiarySystemFill,
          context,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildSliverContent(BuildContext context) {
    return Obx(() {
      final loading = controller.isLoading.value;
      final error = controller.errorText.value;
      final items = controller.visibleItems;
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
              '暂无热门订阅',
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
      final crossAxisCount = width >= _wideBreakpoint ? 5 : 2;
      return SliverPadding(
        padding: const EdgeInsets.fromLTRB(
          _horizontalPadding,
          0,
          _horizontalPadding,
          80,
        ),
        sliver: SliverMainAxisGroup(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: _gridMainAxisSpacing,
                crossAxisSpacing: _gridCrossAxisSpacing,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return SubscribePopularItemCard(
                    item: items[index], onTap: () {});
              }, childCount: items.length),
            ),
            SliverToBoxAdapter(
              child: Obx(() {
                if (controller.isLoading.value && items.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                }
                if (!controller.hasMore.value && items.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
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
                return const SizedBox.shrink();
              }),
            ),
          ],
        ),
      );
    });
  }
}
