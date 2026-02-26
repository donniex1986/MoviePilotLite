import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/recommend/controllers/recommend_category_list_controller.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/modules/recommend/widgets/recommend_item_card.dart';
import 'package:moviepilot_mobile/utils/http_path_builder_util.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class RecommendCategoryListPage
    extends GetView<RecommendCategoryListController> {
  const RecommendCategoryListPage({super.key});

  static const double _gridSpacing = 12;
  static const double _gridPadding = 16;
  static const double _cardAspectRatio = 1 / 1.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Get.back,
        ),
        title: Text(controller.categoryTitle),
        centerTitle: false,
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Obx(() {
      final items = controller.items.toList();
      final isLoading = controller.isLoading.value;
      final error = controller.error.value;
      final hasMore = controller.hasMore.value;
      final layout = _gridLayout(context);

      return RefreshIndicator(
        onRefresh: () => controller.refreshData(),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            if (items.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: _buildPlaceholderState(isLoading, error),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  _gridPadding,
                  8,
                  _gridPadding,
                  _gridPadding,
                ),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = items[index];
                    return RecommendItemCard(
                      item: item,
                      width: layout.cardWidth,
                      onTap: () => _openDetail(item),
                    );
                  }, childCount: items.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: layout.crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: _gridSpacing,
                    childAspectRatio: _cardAspectRatio,
                  ),
                ),
              ),
            SliverToBoxAdapter(
              child: _buildBottomStatus(
                context,
                isLoading: isLoading,
                hasMore: hasMore,
                hasItems: items.isNotEmpty,
                error: error,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
          ],
        ),
      );
    });
  }

  Widget _buildPlaceholderState(bool isLoading, String? error) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final message = error ?? '暂无数据';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => controller.loadFirst(),
          child: const Text('重新加载'),
        ),
      ],
    );
  }

  Widget _buildBottomStatus(
    BuildContext context, {
    required bool isLoading,
    required bool hasMore,
    required bool hasItems,
    required String? error,
  }) {
    if (!hasItems) {
      return const SizedBox.shrink();
    }
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (hasMore) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: OutlinedButton(
          onPressed: controller.loadMore,
          child: const Text('加载更多'),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          if (error != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                error,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          Text(
            '已经到底啦',
            style: TextStyle(color: Theme.of(context).colorScheme.outline),
          ),
        ],
      ),
    );
  }

  _GridLayout _gridLayout(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width >= 520 ? 4 : 2;
    final available =
        width - (_gridPadding * 2) - (_gridSpacing * (crossAxisCount - 1));
    final cardWidth = available / crossAxisCount;
    return _GridLayout(crossAxisCount: crossAxisCount, cardWidth: cardWidth);
  }

  void _openDetail(RecommendApiItem item) {
    final path = HttpPathBuilderUtil.buildMediaPath(item);
    if (path.isEmpty) {
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
}

class _GridLayout {
  const _GridLayout({required this.crossAxisCount, required this.cardWidth});

  final int crossAxisCount;
  final double cardWidth;
}
