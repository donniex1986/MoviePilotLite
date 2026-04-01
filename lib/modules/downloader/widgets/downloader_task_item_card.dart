import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/downloader/models/download_task.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

class DownloaderTaskItemCard extends StatelessWidget {
  const DownloaderTaskItemCard({
    super.key,
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
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
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
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.85),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Text(
                    task.title ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        _formatSize(task.size),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.arrow_upward,
                        size: 14,
                        color: Color(0xFF4DD0E1),
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
                      const Icon(
                        Icons.arrow_downward,
                        size: 14,
                        color: Color(0xFF66BB6A),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (task.progress ?? 0) / 100,
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF34D399),
                      ),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        minSize: 0,
                        onPressed: isOperating ? null : onDelete,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              size: 22,
                              color: CupertinoColors.systemRed,
                            ),
                            SizedBox(width: 6),
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
