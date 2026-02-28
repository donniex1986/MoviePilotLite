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
                    // 媒体信息（完整种子信息）
                    _buildMediaInfo(context),
                    const SizedBox(height: 24),
                    // 下载器选择（横向 chips）
                    _buildDownloaderSelector(context, primaryColor),
                    const SizedBox(height: 20),
                    // 保存目录选择（横向 chips）
                    _buildDirectorySelector(context, primaryColor),
                    const SizedBox(height: 20),
                    // 高级选项（可展开）
                    _buildAdvancedOptions(context, primaryColor),
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
            child: Text(
              '确认下载',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.label.resolveFrom(context),
              ),
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
    final grabs = torrent?.grabs ?? 0;
    final siteName = torrent?.site_name ?? '未知站点';
    final pubdate = torrent?.pubdate ?? '';
    final volumeFactor = torrent?.volume_factor ?? '';
    final downloadFactor = torrent?.downloadvolumefactor ?? 1.0;
    final uploadFactor = torrent?.uploadvolumefactor ?? 1.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.resolveFrom(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
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
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
          // 描述
          if (description.isNotEmpty) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 12),
          ],
          // 详细信息行
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              _buildInfoChip(
                context,
                icon: Icons.storage,
                label: SizeFormatter.formatSize(size, 2),
              ),
              _buildInfoChip(
                context,
                icon: CupertinoIcons.cube_box,
                label: siteName,
              ),
              if (seeders > 0)
                _buildInfoChip(
                  context,
                  icon: CupertinoIcons.arrow_up,
                  label: '↑$seeders',
                  color: CupertinoColors.systemGreen,
                ),
              if (peers > 0)
                _buildInfoChip(
                  context,
                  icon: CupertinoIcons.arrow_down,
                  label: '↓$peers',
                  color: CupertinoColors.systemRed,
                ),
              if (grabs > 0)
                _buildInfoChip(
                  context,
                  icon: CupertinoIcons.download_circle,
                  label: '下载 $grabs',
                ),
              if (pubdate.isNotEmpty)
                _buildInfoChip(
                  context,
                  icon: CupertinoIcons.calendar,
                  label: _formatDate(pubdate),
                ),
              if (volumeFactor.isNotEmpty)
                _buildInfoChip(
                  context,
                  icon: CupertinoIcons.tag,
                  label: volumeFactor,
                  color: CupertinoColors.systemOrange,
                ),
              if (downloadFactor != 1.0 || uploadFactor != 1.0)
                _buildInfoChip(
                  context,
                  icon: CupertinoIcons.star,
                  label: '${downloadFactor}x/${uploadFactor}x',
                  color: CupertinoColors.systemYellow,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    Color? color,
  }) {
    final chipColor =
        color ?? CupertinoColors.secondaryLabel.resolveFrom(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: chipColor),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: chipColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _formatDate(String dateStr) {
    if (dateStr.isEmpty) return '';
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final diff = now.difference(date);
      if (diff.inDays > 0) {
        return '${diff.inDays}天前';
      } else if (diff.inHours > 0) {
        return '${diff.inHours}小时前';
      } else if (diff.inMinutes > 0) {
        return '${diff.inMinutes}分钟前';
      }
      return '刚刚';
    } catch (_) {
      return dateStr;
    }
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
                fontWeight: FontWeight.w600,
                color: CupertinoColors.label.resolveFrom(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Obx(() {
          if (controller.isLoadingDownloaders) {
            return Container(
              height: 40,
              alignment: Alignment.center,
              child: const CupertinoActivityIndicator(),
            );
          }

          final downloaders = controller.downloaders;
          final selected = controller.selectedDownloader.value;

          if (downloaders.isEmpty) {
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6.resolveFrom(context),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '暂无可用下载器',
                style: TextStyle(
                  fontSize: 13,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            );
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: downloaders.map((downloader) {
                final isSelected = selected?.name == downloader.name;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _buildSelectableChip(
                    context,
                    label: downloader.type.isNotEmpty
                        ? '${downloader.name} (${downloader.type})'
                        : downloader.name,
                    isSelected: isSelected,
                    accentColor: accentColor,
                    onTap: () => controller.setDownloader(downloader),
                  ),
                );
              }).toList(),
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
                fontWeight: FontWeight.w600,
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
        const SizedBox(height: 12),
        Obx(() {
          final selected = controller.selectedDirectory.value;
          final suggestions = controller.directorySuggestions;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // 留空自动匹配选项
                _buildSelectableChip(
                  context,
                  label: '留空自动匹配',
                  isSelected: selected.isEmpty,
                  accentColor: accentColor,
                  onTap: () => controller.setDirectory(''),
                ),
                const SizedBox(width: 8),
                // 目录建议选项
                ...suggestions.map((dir) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _buildSelectableChip(
                      context,
                      label: dir,
                      isSelected: selected == dir,
                      accentColor: accentColor,
                      onTap: () => controller.setDirectory(dir),
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSelectableChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor
              : CupertinoColors.systemGrey6.resolveFrom(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? accentColor : accentColor.withOpacity(0.3),
            width: isSelected ? 0 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              Icon(
                CupertinoIcons.checkmark_circle_fill,
                size: 16,
                color: Colors.white,
              )
            else
              Icon(
                CupertinoIcons.circle,
                size: 16,
                color: accentColor.withOpacity(0.5),
              ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : CupertinoColors.label.resolveFrom(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedOptions(BuildContext context, Color accentColor) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
              controller.showAdvanced.value = !controller.showAdvanced.value;
            },
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.slider_horizontal_3,
                  size: 16,
                  color: accentColor,
                ),
                const SizedBox(width: 6),
                Text(
                  '高级选项',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: accentColor,
                  ),
                ),
                const Spacer(),
                Icon(
                  controller.showAdvanced.value
                      ? CupertinoIcons.chevron_up
                      : CupertinoIcons.chevron_down,
                  size: 16,
                  color: accentColor,
                ),
              ],
            ),
          ),
          if (controller.showAdvanced.value) ...[
            const SizedBox(height: 12),
            _buildTmdbIdInput(context, accentColor),
          ],
        ],
      );
    });
  }

  Widget _buildTmdbIdInput(BuildContext context, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '按名称查询媒体编号,留空自动识别',
          style: TextStyle(
            fontSize: 12,
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
}
