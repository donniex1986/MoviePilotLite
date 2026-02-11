import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/download/controllers/download_controller.dart';
import 'package:moviepilot_mobile/modules/search_result/models/search_result_models.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';

class DownloadSheet extends GetView<DownloadController> {
  const DownloadSheet({super.key, required this.item});

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Material(
      color: theme.scaffoldBackgroundColor,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 标题栏
            _buildHeader(context, primaryColor),
            // 内容区域
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    // 媒体信息
                    _buildMediaInfo(context),
                    const SizedBox(height: 24),
                    // 下载器选择
                    _buildDownloaderSelector(context, primaryColor),
                    const SizedBox(height: 20),
                    // 保存目录选择
                    _buildDirectorySelector(context, primaryColor),
                    const SizedBox(height: 20),
                    // TMDB ID 输入
                    _buildTmdbIdInput(context, primaryColor),
                    const SizedBox(height: 24),
                    // 开始下载按钮
                    _buildDownloadButton(context, primaryColor),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Color accentColor) {
    final mediaInfo = item.media_info;
    final metaInfo = item.meta_info;
    final title =
        mediaInfo?.title ?? metaInfo?.title ?? metaInfo?.cn_name ?? '';
    final year = mediaInfo?.year ?? metaInfo?.year ?? '';

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CupertinoColors.separator.withOpacity(0.2),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.cloud_download, color: accentColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '确认下载',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
                if (title.isNotEmpty || year.isNotEmpty)
                  Text(
                    '${title.isNotEmpty ? title : ''}${year.isNotEmpty ? ' ($year)' : ''}',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.secondaryLabel.resolveFrom(
                        context,
                      ),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () => Get.back(),
            child: Icon(
              CupertinoIcons.xmark,
              size: 20,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaInfo(BuildContext context) {
    final torrent = item.torrent_info;
    final meta = item.meta_info;
    final title = torrent?.title ?? meta?.title ?? '';
    final description = meta?.subtitle ?? meta?.name ?? '';
    final size = torrent?.size ?? 0.0;
    final seeders = torrent?.seeders ?? 0;
    final peers = torrent?.peers ?? 0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.resolveFrom(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            Row(
              children: [
                Icon(
                  CupertinoIcons.globe,
                  size: 16,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
          if (description.isNotEmpty) ...[
            Row(
              children: [
                Icon(
                  CupertinoIcons.doc_text,
                  size: 16,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: CupertinoColors.secondaryLabel.resolveFrom(
                        context,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
          Row(
            children: [
              Icon(
                Icons.storage,
                size: 16,
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
              const SizedBox(width: 8),
              Text(
                SizeFormatter.formatSize(size, 2),
                style: TextStyle(
                  fontSize: 13,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
              const Spacer(),
              if (seeders > 0) ...[
                Icon(
                  CupertinoIcons.arrow_up,
                  size: 14,
                  color: CupertinoColors.systemGreen,
                ),
                const SizedBox(width: 4),
                Text(
                  '$seeders',
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.systemGreen,
                  ),
                ),
              ],
              if (peers > 0) ...[
                const SizedBox(width: 12),
                Icon(
                  CupertinoIcons.arrow_down,
                  size: 14,
                  color: CupertinoColors.systemRed,
                ),
                const SizedBox(width: 4),
                Text(
                  '$peers',
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.systemRed,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDownloaderSelector(BuildContext context, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(CupertinoIcons.cloud_download, size: 16, color: accentColor),
            const SizedBox(width: 6),
            Text(
              '下载器',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.label.resolveFrom(context),
              ),
            ),
            Obx(() {
              final selected = controller.selectedDownloader.value;
              if (selected?.isDefault == true) {
                return Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    '(默认)',
                    style: TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.secondaryLabel.resolveFrom(
                        context,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
        const SizedBox(height: 8),
        Obx(() {
          if (controller.isLoadingDownloaders.value) {
            return Container(
              height: 44,
              alignment: Alignment.center,
              child: const CupertinoActivityIndicator(),
            );
          }

          final downloaders = controller.downloaders;
          final selected = controller.selectedDownloader.value;

          return GestureDetector(
            onTap: () => _showDownloaderPicker(context, downloaders),
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: accentColor.withOpacity(0.3),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selected?.name ?? '请选择下载器',
                      style: TextStyle(
                        fontSize: 15,
                        color: selected != null
                            ? CupertinoColors.label.resolveFrom(context)
                            : CupertinoColors.placeholderText.resolveFrom(
                                context,
                              ),
                      ),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 16,
                    color: accentColor,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDirectorySelector(BuildContext context, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(CupertinoIcons.folder, size: 16, color: accentColor),
            const SizedBox(width: 6),
            Text(
              '保存目录',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.label.resolveFrom(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                '(自动)',
                style: TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Obx(() {
          final selected = controller.selectedDirectory.value;
          final suggestions = controller.directorySuggestions;

          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CupertinoTextField(
                      placeholder: '留空自动匹配',
                      controller: TextEditingController(text: selected),
                      onChanged: controller.setDirectory,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: accentColor.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  if (suggestions.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () => _showDirectoryPicker(
                        context,
                        suggestions,
                        accentColor,
                      ),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: accentColor.withOpacity(0.3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          CupertinoIcons.chevron_down,
                          size: 16,
                          color: accentColor,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              if (suggestions.isNotEmpty) ...[
                const SizedBox(height: 8),
                ...suggestions
                    .take(5)
                    .map(
                      (dir) =>
                          _buildDirectorySuggestion(context, dir, accentColor),
                    ),
              ],
            ],
          );
        }),
      ],
    );
  }

  Widget _buildDirectorySuggestion(
    BuildContext context,
    String directory,
    Color accentColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: GestureDetector(
        onTap: () => controller.setDirectory(directory),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6.resolveFrom(context),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: accentColor.withOpacity(0.2), width: 1),
          ),
          child: Row(
            children: [
              Icon(CupertinoIcons.folder_fill, size: 16, color: accentColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  directory,
                  style: TextStyle(
                    fontSize: 13,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTmdbIdInput(BuildContext context, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '按名称查询媒体编号,留空自动识别',
          style: TextStyle(
            fontSize: 13,
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
          ),
        ),
        const SizedBox(height: 8),
        Obx(() {
          return CupertinoTextField(
            placeholder: 'TMDB ID',
            controller: TextEditingController(text: controller.tmdbId.value),
            onChanged: controller.setTmdbId,
            keyboardType: TextInputType.number,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: accentColor.withOpacity(0.3), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDownloadButton(BuildContext context, Color accentColor) {
    return Obx(() {
      final isDownloading = controller.isDownloading.value;
      final hasDownloader = controller.selectedDownloader.value != null;

      return SizedBox(
        height: 50,
        child: CupertinoButton.filled(
          onPressed: (isDownloading || !hasDownloader)
              ? null
              : () => controller.startDownload(
                  item: item,
                  customTmdbId: controller.tmdbId.value.isEmpty
                      ? null
                      : controller.tmdbId.value,
                ),
          color: accentColor,
          borderRadius: BorderRadius.circular(12),
          child: isDownloading
              ? const CupertinoActivityIndicator(color: CupertinoColors.white)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(CupertinoIcons.cloud_download, size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      '开始下载',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }

  void _showDownloaderPicker(
    BuildContext context,
    List<DownloaderItem> downloaders,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: downloaders.map((downloader) {
          return CupertinoActionSheetAction(
            onPressed: () {
              controller.setDownloader(downloader);
              Navigator.pop(context);
            },
            child: Text(
              downloader.isDefault
                  ? '${downloader.name} (默认)'
                  : downloader.name,
            ),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  void _showDirectoryPicker(
    BuildContext context,
    List<String> suggestions,
    Color accentColor,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              controller.setDirectory('');
              Navigator.pop(context);
            },
            child: const Text('留空自动匹配'),
          ),
          ...suggestions.map((dir) {
            return CupertinoActionSheetAction(
              onPressed: () {
                controller.setDirectory(dir);
                Navigator.pop(context);
              },
              child: Text(dir),
            );
          }),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }
}
