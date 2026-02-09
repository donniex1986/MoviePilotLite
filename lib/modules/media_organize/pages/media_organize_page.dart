import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/media_organize/controllers/media_organize_controller.dart';
import 'package:moviepilot_mobile/modules/media_organize/widgets/media_organize_item_card.dart';

class MediaOrganizePage extends GetView<MediaOrganizeController> {
  const MediaOrganizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('媒体整理'),
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
        onRefresh: () async {
          await controller.loadStorages();
          await controller.load();
        },
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [_buildSliverContent(context)],
        ),
      ),
    );
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
              '暂无整理记录',
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

      return SliverMainAxisGroup(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return MediaOrganizeItemCard(
                  item: items[index],
                  srcStorageName: controller.getStorageName(
                    items[index].src_storage,
                  ),
                  destStorageName: controller.getStorageName(
                    items[index].dest_storage,
                  ),
                );
              }, childCount: items.length),
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(() {
              if (items.isEmpty) return const SizedBox.shrink();
              if (!controller.hasMore.value) {
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
              final loading = controller.isLoading.value;
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 80),
                child: Center(
                  child: CupertinoButton(
                    onPressed: loading ? null : () => controller.loadMore(),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: loading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        : Text(
                            '加载更多',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                            ),
                          ),
                  ),
                ),
              );
            }),
          ),
        ],
      );
    });
  }
}
