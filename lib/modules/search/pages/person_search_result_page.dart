import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/media_detail/models/media_detail_model.dart'
    show Actor;
import 'package:moviepilot_mobile/modules/search/controllers/person_search_list_controller.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/utils/media_source_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PersonSearchResultPage extends GetView<PersonSearchListController> {
  const PersonSearchResultPage({super.key});

  static const double _gridSpacing = 10;
  static const double _gridPadding = 16;
  static const double _cardAspectRatio = 1 / 1.15;
  static const int _skeletonGridCount = 8;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = controller.items;
      final isLoading = controller.isLoading.value;
      final error = controller.error.value;
      final hasMore = controller.hasMore.value;
      final showSkeletonGrid = isLoading && items.isEmpty;

      return Scaffold(
        appBar: AppBar(title: const Text('演员搜索')),
        body: RefreshIndicator(
          onRefresh: controller.search,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              if (error != null && items.isEmpty && !showSkeletonGrid)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            error,
                            style: const TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: controller.search,
                            child: const Text('重新加载'),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    _gridPadding,
                    12,
                    _gridPadding,
                    0,
                  ),
                  sliver: Skeletonizer.sliver(
                    enabled: showSkeletonGrid,
                    child: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: _gridSpacing,
                            crossAxisSpacing: _gridSpacing,
                            childAspectRatio: _cardAspectRatio,
                          ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (showSkeletonGrid) {
                            return _buildSkeletonCell();
                          }
                          return _buildPersonCell(context, items[index]);
                        },
                        childCount: showSkeletonGrid
                            ? _skeletonGridCount
                            : items.length,
                      ),
                    ),
                  ),
                ),
              if (hasMore)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: Center(
                      child: CupertinoButton.filled(
                        sizeStyle: CupertinoButtonSize.small,
                        onPressed: controller.loadMore,
                        child: const Text('加载更多'),
                      ),
                    ),
                  ),
                ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSkeletonCell() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonCell(BuildContext context, Actor item) {
    final avatar = item.profile_path != null && item.profile_path!.isNotEmpty
        ? item.profile_path
        : item.images?.large?.url;
    final avatarUrl = avatar != null && avatar.isNotEmpty
        ? ImageUtil.convertCacheImageUrl(avatar)
        : '';

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        final id = item.id;
        if (id == null) return;
        final source = MediaSourceUtil.sourceValue(item.source ?? '');
        Get.toNamed(
          '/person-detail',
          parameters: {'id': id.toString(), 'source': source},
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: avatarUrl.isNotEmpty
                  ? CachedImage(
                      imageUrl: avatarUrl,
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.grey.shade300,
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              item.name ?? '',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
