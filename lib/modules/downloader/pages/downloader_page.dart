import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/downloader/controllers/downloader_controller.dart';
import 'package:moviepilot_mobile/modules/downloader/models/download_task.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class DownloaderPage extends GetView<DownloaderController> {
  const DownloaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('下载管理'), centerTitle: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => _buildDownloaderTabs(context)),
          Expanded(child: _buildTaskList(context)),
        ],
      ),
    );
  }

  Widget _buildDownloaderTabs(BuildContext context) {
    if (controller.downloaders.length <= 1) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          for (int i = 0; i < controller.downloaders.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Material(
                color: controller.selectedIndex.value == i
                    ? theme.colorScheme.primary.withOpacity(0.2)
                    : theme.cardColor,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () => controller.switchDownloader(i),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(
                      controller.downloaders[i].name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: controller.selectedIndex.value == i
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: controller.selectedIndex.value == i
                            ? theme.colorScheme.primary
                            : theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTaskList(BuildContext context) {
    return Obx(() {
      if (controller.downloaders.isEmpty &&
          !controller.isLoadingDownloaders.value) {
        return const Center(child: Text('暂无下载器'));
      }
      return RefreshIndicator(
        onRefresh: controller.refreshTasks,
        child: Obx(() {
          if (controller.isLoading.value && controller.tasks.isEmpty) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (controller.tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download_outlined,
                    size: 64,
                    color: CupertinoColors.systemGrey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无下载任务',
                    style: TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              final task = controller.tasks[index];
              return _DownloadTaskCard(
                task: task,
                onPauseResume: () => controller.togglePauseResume(task),
                onDelete: () => controller.deleteTask(task),
                isDownloading: controller.isDownloading(task),
                isOperating:
                    task.hash != null &&
                    controller.operatingHashes.contains(task.hash),
              );
            },
          );
        }),
      );
    });
  }
}

class _DownloadTaskCard extends StatelessWidget {
  const _DownloadTaskCard({
    required this.task,
    required this.onPauseResume,
    required this.onDelete,
    required this.isDownloading,
    required this.isOperating,
  });

  final DownloadTask task;
  final VoidCallback onPauseResume;
  final VoidCallback onDelete;
  final bool isDownloading;
  final bool isOperating;

  @override
  Widget build(BuildContext context) {
    final imageUrl = task.media?.image;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // 背景图（模糊）
            if (imageUrl != null && imageUrl.isNotEmpty)
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 0),
                  child: CachedImage(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: _buildPlaceholderBackground(),
                  ),
                ),
              )
            else
              Positioned.fill(child: _buildPlaceholderBackground()),

            // 渐变遮罩
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.85),
                    ],
                  ),
                ),
              ),
            ),

            // 内容
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 主标题
                  Text(
                    task.displayTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // 文件名
                  Text(
                    task.title ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.85),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),

                  // 进度信息行
                  Row(
                    children: [
                      Text(
                        _formatSize(task.size),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.arrow_upward,
                        size: 14,
                        color: const Color(0xFF4DD0E1),
                      ),
                      Text(
                        task.upspeed ?? '0.0B',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4DD0E1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_downward,
                        size: 14,
                        color: const Color(0xFF66BB6A),
                      ),
                      Text(
                        task.dlspeed ?? '0.0B',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF66BB6A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        task.leftTime ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFFB74D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // 进度条
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (task.progress ?? 0) / 100,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF34D399),
                      ),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 操作按钮
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 暂停/继续
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        minSize: 0,
                        onPressed: isOperating ? null : onPauseResume,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isDownloading ? Icons.pause : Icons.play_arrow,
                              size: 22,
                              color: const Color(0xFF8F67FF),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              isDownloading ? '暂停' : '继续',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8F67FF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 删除
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        minSize: 0,
                        onPressed: isOperating ? null : onDelete,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              size: 22,
                              color: CupertinoColors.systemRed,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '删除',
                              style: TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.systemRed,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderBackground() {
    return Container(color: CupertinoColors.systemGrey5);
  }

  String _formatSize(double? bytes) {
    if (bytes == null || bytes <= 0) return '0 B';
    return SizeFormatter.formatSize(bytes, 2);
  }
}
