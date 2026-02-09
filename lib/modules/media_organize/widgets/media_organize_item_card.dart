import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/media_organize/models/media_organize_models.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 媒体整理历史卡片
class MediaOrganizeItemCard extends StatelessWidget {
  const MediaOrganizeItemCard({
    super.key,
    required this.item,
    required this.srcStorageName,
    required this.destStorageName,
    this.onDeleteTransferRecordOnly,
    this.onDeleteTransferRecordAndSourceFile,
    this.onDeleteTransferRecordAndMediaLibraryFile,
    this.onDeleteTransferRecordAndSourceFileAndMediaLibraryFile,
  });

  final MediaOrganizeTransferItem item;
  final String srcStorageName;
  final String destStorageName;
  static const double cardRadius = 8;
  final void Function()? onDeleteTransferRecordOnly;
  final void Function()? onDeleteTransferRecordAndSourceFile;
  final void Function()? onDeleteTransferRecordAndMediaLibraryFile;
  final void Function()? onDeleteTransferRecordAndSourceFileAndMediaLibraryFile;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPoster(context),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title ?? '未知',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          PopupMenuButton(
                            borderRadius: BorderRadius.circular(12),

                            icon: Icon(Icons.more_vert_outlined),
                            onSelected: (value) {
                              switch (value) {
                                case '仅删除转移记录':
                                  onDeleteTransferRecordOnly?.call();
                                  break;
                                case '删除转移记录和源文件':
                                  onDeleteTransferRecordAndSourceFile?.call();
                                  break;
                                case '删除转移记录和媒体库文件':
                                  onDeleteTransferRecordAndMediaLibraryFile
                                      ?.call();
                                  break;
                                case '删除转移记录、源文件和媒体库文件':
                                  onDeleteTransferRecordAndSourceFileAndMediaLibraryFile
                                      ?.call();
                                  break;
                              }
                            },
                            itemBuilder: (context) => [
                              _buildActionButton(
                                context,
                                '仅删除转移记录',
                                '仅删除转移记录',
                                Icons.delete_outlined,
                                CupertinoColors.systemPurple,
                              ),
                              _buildActionButton(
                                context,
                                '删除转移记录和源文件',
                                '删除转移记录和源文件',
                                Icons.delete_outlined,
                                CupertinoColors.systemYellow,
                              ),
                              _buildActionButton(
                                context,
                                '删除转移记录和媒体库文件',
                                '删除转移记录和媒体库文件',
                                Icons.delete_outlined,
                                CupertinoColors.systemCyan,
                              ),
                              _buildActionButton(
                                context,
                                '删除转移记录、源文件和媒体库文件',
                                '删除转移记录、源文件和媒体库文件',
                                Icons.delete_outlined,
                                CupertinoColors.systemRed,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _buildPill(
                            context,
                            '${item.type ?? ''} | ${item.category ?? ''}',
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),

                      const SizedBox(height: 12),
                      if (item.mode != null)
                        Row(
                          children: [
                            Icon(
                              Icons.auto_mode_outlined,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.mode ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.status == true ? '成功' : '失败',
                              style: TextStyle(
                                fontSize: 14,
                                color: item.status == true
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Text(
                            item.errmsg ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              color: item.status == true
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildPathRow(
              context,
              label: '来源',
              path: item.src,
              storageName: srcStorageName,
            ),
            const SizedBox(height: 6),
            _buildPathRow(
              context,
              label: '目标',
              path: item.dest,
              storageName: destStorageName,
            ),
            if (item.date != null) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.file_present_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    SizeFormatter.formatSize(item.src_fileitem?.size ?? 0),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 4),
                  Spacer(),
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    item.date!,
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(
                        context,
                      ).colorScheme.outline.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  PopupMenuItem _buildActionButton(
    BuildContext context,
    String action,
    String label,
    IconData icon,
    Color color,
  ) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    final url = item.image;
    final size = 80.0;
    if (url != null && url.isNotEmpty) {
      final cacheUrl = ImageUtil.convertCacheImageUrl(url);
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          width: size,
          height: size * 1.5,
          child: CachedImage(imageUrl: cacheUrl, fit: BoxFit.cover),
        ),
      );
    }
    return Container(
      width: size,
      height: size * 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: Icon(
        Icons.movie_outlined,
        size: 32,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }

  Widget _buildPill(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildPathRow(
    BuildContext context, {
    required String label,
    required String? path,
    required String storageName,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 36,
          child: Text(
            '$label:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (storageName.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    '[$storageName]',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              Text(
                path ?? '-',
                style: const TextStyle(fontSize: 11, fontFamily: 'monospace'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
