import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/mediaserver/controllers/mediaserver_controller.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 最近添加组件
class RecentlyAddedWidget extends StatelessWidget {
  const RecentlyAddedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaServerController = Get.find<MediaServerController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(CupertinoIcons.add_circled, size: 20),
            const SizedBox(width: 8),
            const Text(
              '最近添加',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Obx(() {
          final latestMediaList = mediaServerController.latestMediaList;
          if (latestMediaList.value.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.film,
                      size: 48,
                      color: CupertinoColors.systemGrey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      '暂无最近添加的媒体',
                      style: TextStyle(color: CupertinoColors.systemGrey),
                    ),
                  ],
                ),
              ),
            );
          }

          return Section(
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: latestMediaList.value.length,
                itemBuilder: (context, index) {
                  final media = latestMediaList.value[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 媒体封面卡片
                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoColors.systemGrey.withAlpha(20),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: media.image.isNotEmpty
                                ? Stack(
                                    children: [
                                      // 封面图
                                      CachedImage(
                                        imageUrl: media.image.isNotEmpty
                                            ? ImageUtil.convertInternalImageUrl(
                                                media.image,
                                              )
                                            : '',
                                        width: 110,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      // 媒体类型标签
                                      if (media.type.isNotEmpty)
                                        Positioned(
                                          top: 8,
                                          left: 8,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CupertinoColors.systemBlue
                                                  .withAlpha(180),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              media.type,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: CupertinoColors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                : Container(
                                    color: CupertinoColors.systemGrey5,
                                    child: const Center(
                                      child: Icon(
                                        CupertinoIcons.film,
                                        size: 40,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // 媒体信息
                        SizedBox(
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // 媒体标题
                              Text(
                                media.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              // 媒体库名称
                              if (media.libraryName.isNotEmpty)
                                Text(
                                  media.libraryName,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              const SizedBox(height: 2),
                              // 媒体年份
                              Text(
                                media.subtitle,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: CupertinoColors.systemGrey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}
