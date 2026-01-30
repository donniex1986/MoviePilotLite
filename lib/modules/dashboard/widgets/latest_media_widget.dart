import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

/// 最新媒体入库组件
class LatestMediaWidget extends StatelessWidget {
  const LatestMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.film, size: 20),
              const SizedBox(width: 8),
              const Text(
                '最新入库',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final latestData = controller.latestMediaData.value;

            if (latestData == null ||
                !latestData.containsKey('data') ||
                (latestData['data'] as List).isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    '暂无最新入库数据',
                    style: TextStyle(color: CupertinoColors.systemGrey),
                  ),
                ),
              );
            }

            final mediaItems = latestData['data'] as List;
            final firstItem = mediaItems[0];

            return Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 海报图片
                    if (firstItem['image'] != null &&
                        firstItem['image'].isNotEmpty)
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(firstItem['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CupertinoColors.systemGrey5,
                        ),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.film,
                            size: 40,
                            color: CupertinoColors.systemGrey3,
                          ),
                        ),
                      ),
                    const SizedBox(width: 16),
                    // 媒体信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            firstItem['title'] ?? '未知标题',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (firstItem['subtitle'] != null &&
                              firstItem['subtitle'].isNotEmpty)
                            Text(
                              firstItem['subtitle'],
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          const SizedBox(height: 8),
                          if (firstItem['type'] != null)
                            Text(
                              firstItem['type'],
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          const SizedBox(height: 8),
                          if (firstItem['server_type'] != null)
                            Text(
                              '服务器类型: ${firstItem['server_type']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          const SizedBox(height: 8),
                          if (firstItem['link'] != null)
                            InkWell(
                              onTap: () {
                                // 这里可以添加打开链接的逻辑
                              },
                              child: Text(
                                '查看详情',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.activeBlue,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
