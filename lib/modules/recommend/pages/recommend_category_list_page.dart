import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/recommend/controllers/recommend_category_list_controller.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/modules/recommend/widgets/recommend_item_card.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/utils/http_path_builder_util.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class RecommendCategoryListPage
    extends GetView<RecommendCategoryListController> {
  const RecommendCategoryListPage({super.key});

  static const double _gridSpacing = 12;
  static const double _gridPadding = 16;
  static const double _cardAspectRatio = 1 / 1.4;

  @override
  Widget build(BuildContext context) {
    final themeColor = controller.appBarThemeColor;
    if (themeColor == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: Get.back,
          ),
          title: Text(controller.categoryTitle),
          centerTitle: false,
        ),
        body: _buildBody(context, immersive: false),
      );
    }

    final bodyColor = AppTheme.darkBackgroundColor;
    return Scaffold(
      backgroundColor: bodyColor,
      body: _buildBody(context, immersive: true, bodyColor: bodyColor),
    );
  }

  Widget _buildBody(
    BuildContext context, {
    required bool immersive,
    Color? bodyColor,
  }) {
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
            if (immersive)
              _buildImmersiveHeader(context, items, bodyColor: bodyColor)
            else
              const SliverToBoxAdapter(child: SizedBox.shrink()),
            if (items.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: _buildPlaceholderState(isLoading, error),
              )
            else ...[
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    controller.categoryTitle,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  _gridPadding,
                  immersive ? 0 : 8,
                  _gridPadding,
                  _gridPadding,
                ),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = items[index];
                    return RecommendItemCard(
                      item: item,
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
            ],
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

  SliverAppBar _buildImmersiveHeader(
    BuildContext context,
    List<RecommendApiItem> items, {
    Color? bodyColor,
  }) {
    final themeColor = controller.appBarThemeColor ?? Colors.black;
    final secondaryColor = controller.appBarSecondaryThemeColor ?? Colors.black;
    final topItems = items.take(3).toList();
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: Get.back,
      ),

      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                secondaryColor,
                themeColor.withValues(alpha: 0.5),
                bodyColor ?? Colors.black87,
              ],
              stops: const [0, 0.6, 1.0],
            ),
          ),
          child: Center(
            child: SizedBox(height: 160, child: _buildPosterRow(topItems)),
          ),
        ),
      ),
    );
  }

  Widget _buildPosterRow(List<RecommendApiItem> items) {
    final posters = items
        .map((e) => e.poster_path ?? e.backdrop_path)
        .whereType<String>()
        .where((url) => url.isNotEmpty)
        .toList();
    if (posters.isEmpty) {
      return const SizedBox.shrink();
    }
    final size = 90.0;
    final children = <Widget>[];
    for (var i = 0; i < posters.length && i < 3; i++) {
      var angleValue = 0.0;
      var offsetValue = Offset(0, 0);
      if (i == 0) {
        angleValue = 10;
        offsetValue = Offset(-size + 10, 0);
      } else if (i == 1) {
        angleValue = -5;
        offsetValue = Offset(0, size / 4);
      } else {
        angleValue = 8;
        offsetValue = Offset(size - 10, size - 30);
      }

      final angle = angleValue * math.pi / 180;

      children.add(
        Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: offsetValue,
            child: Transform.rotate(
              angle: angle,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedImage(
                  imageUrl: ImageUtil.convertCacheImageUrl(posters[i]),
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Stack(
      children: [if (children.length == 1) children[0] else ...children],
    );
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
