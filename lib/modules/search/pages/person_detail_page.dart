import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/modules/recommend/widgets/recommend_item_card.dart';
import 'package:moviepilot_mobile/modules/search/controllers/person_detail_controller.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class PersonDetailPage extends GetView<PersonDetailController> {
  const PersonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = controller.isLoading.value;
      final error = controller.error.value;

      return Scaffold(
        backgroundColor: AppTheme.darkBackgroundColor,
        body: isLoading
            ? Center(
                child: CupertinoActivityIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : error != null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    error,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    expandedHeight: 280,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(CupertinoIcons.chevron_left),
                      onPressed: () => Get.back(),
                      color: Colors.white,
                    ),
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) {
                        return FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          titlePadding: const EdgeInsetsDirectional.only(
                            start: 56,
                            bottom: 14,
                          ),
                          // title: Text(
                          //   controller.name.value ?? '',
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w600,
                          //   ),
                          // ),
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              if (controller.avatarUrl.value != null &&
                                  controller.avatarUrl.value!.isNotEmpty)
                                CachedImage(
                                  imageUrl: controller.avatarUrl.value!,
                                  fit: BoxFit.cover,
                                )
                              else
                                Container(color: Colors.black26),
                              Positioned.fill(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withValues(alpha: 0.6),
                                        Colors.black,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    16,
                                    180,
                                    16,
                                    16,
                                  ),
                                  child: _PersonalInfoCard(
                                    avatarUrl: controller.avatarUrl.value,
                                    name: controller.name.value,
                                    biography: controller.biography.value,
                                    alsoKnownAs: controller.alsoKnownAs
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                      child: Text(
                        '作品列表',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                    sliver: controller.works.isEmpty
                        ? SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: Text(
                                '暂无作品',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ),
                          )
                        : SliverGrid(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final work = controller.works[index];
                              return RecommendItemCard(
                                item: work,
                                onTap: () => _openWorkDetail(context, work),
                              );
                            }, childCount: controller.works.length),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1 / 1.3,
                                ),
                          ),
                  ),
                  if (controller.works.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                        child: _buildWorksPaginationFooter(),
                      ),
                    ),
                ],
              ),
      );
    });
  }

  void _openWorkDetail(BuildContext context, RecommendApiItem item) {
    final path = _buildMediaPath(item);
    if (path == null) return;
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
    if (original != null && original.trim().isNotEmpty) return original.trim();
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

  Widget _buildWorksPaginationFooter() {
    if (controller.isLoadingMoreWorks.value) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (controller.worksHasMore.value) {
      return Center(
        child: CupertinoButton.filled(
          sizeStyle: CupertinoButtonSize.small,
          onPressed: controller.loadMoreWorks,
          child: const Text('加载更多'),
        ),
      );
    }
    return const Center(
      child: Text(
        '没有更多数据',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}

class _PersonalInfoCard extends StatelessWidget {
  const _PersonalInfoCard({
    required this.avatarUrl,
    required this.name,
    required this.biography,
    required this.alsoKnownAs,
  });

  final String? avatarUrl;
  final String? name;
  final String? biography;
  final List<String> alsoKnownAs;

  @override
  Widget build(BuildContext context) {
    final hasBio = biography != null && biography!.trim().isNotEmpty;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: avatarUrl != null && avatarUrl!.isNotEmpty
                    ? CachedImage(
                        imageUrl: avatarUrl!,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 64,
                        height: 64,
                        color: Colors.grey.shade300,
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (hasBio) ...[
                      const SizedBox(height: 8),
                      Text(
                        biography!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
