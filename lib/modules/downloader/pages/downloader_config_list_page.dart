import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/download/controllers/download_controller.dart';
import 'package:moviepilot_mobile/modules/downloader/models/downloader_stats.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 下载器配置列表：使用 DownloadController 的下载器列表与状态，支持新增、编辑
class DownloaderConfigListPage extends GetView<DownloadController> {
  const DownloaderConfigListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('下载器'), centerTitle: false),
      body: Obx(() {
        if (controller.isLoadingDownloaders && controller.downloaders.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.downloaders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.download_for_offline_outlined,
                  size: 64,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(height: 16),
                Text(
                  '暂无下载器配置',
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => _navigateToForm(null),
                  icon: const Icon(Icons.add),
                  label: const Text('添加下载器'),
                ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: controller.refreshDownloaders,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.downloaders.length,
            itemBuilder: (context, index) {
              final downloader = controller.downloaders[index];
              return Obx(
                () => _DownloaderItemCard(
                  downloader: downloader,
                  stats: controller.statsFor(downloader.name),
                  onTap: () => _navigateToForm(downloader.name),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: Obx(() {
        if (controller.downloaders.isEmpty) return const SizedBox.shrink();
        return FloatingActionButton(
          onPressed: () => _navigateToForm(null),
          child: const Icon(Icons.add),
        );
      }),
    );
  }

  void _navigateToForm(String? name) {
    ToastUtil.info('暂未开放');
    return;
    if (name != null) {
      Get.toNamed('/downloader-config/form', parameters: {'name': name});
    } else {
      Get.toNamed('/downloader-config/form');
    }
  }
}

class _DownloaderItemCard extends StatelessWidget {
  const _DownloaderItemCard({
    required this.downloader,
    required this.stats,
    required this.onTap,
  });

  final DownloadClient downloader;
  final DownloaderStats? stats;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardBg = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : theme.colorScheme.surface;
    final statsBg = isDark
        ? theme.colorScheme.surface.withValues(alpha: 0.5)
        : theme.colorScheme.surfaceContainerLow.withValues(alpha: 0.6);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: isDark ? 0 : 1,
      shadowColor: theme.colorScheme.shadow.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: cardBg,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            theme.colorScheme.primary.withValues(alpha: 0.85),
                            theme.colorScheme.primary.withValues(alpha: 0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withValues(
                              alpha: 0.25,
                            ),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.download_for_offline_outlined,
                        color: theme.colorScheme.onPrimary,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            downloader.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (downloader.type.isNotEmpty) ...[
                            const SizedBox(height: 2),
                            Text(
                              downloader.type,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                letterSpacing: 0.2,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: theme.colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.7,
                      ),
                      size: 22,
                    ),
                  ],
                ),
              ),
              if (stats != null) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: statsBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(
                          alpha: 0.08,
                        ),
                        width: 1,
                      ),
                    ),
                    child: _StatGrid(stats: stats!),
                  ),
                ),
              ] else
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: statsBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '获取状态中…',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatGrid extends StatelessWidget {
  const _StatGrid({required this.stats});

  final DownloaderStats stats;

  String _formatSpeed(double bytesPerSecond) {
    if (bytesPerSecond <= 0) return '0 B/s';
    return '${SizeFormatter.formatSize(bytesPerSecond, 2)}/s';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _SpeedPill(
              icon: Icons.arrow_downward_rounded,
              label: '下行',
              value: _formatSpeed(stats.downloadSpeed),
              color: const Color(0xFF4CAF50),
            ),
            const SizedBox(width: 12),
            _SpeedPill(
              icon: Icons.arrow_upward_rounded,
              label: '上行',
              value: _formatSpeed(stats.uploadSpeed),
              color: const Color(0xFF00BCD4),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _StatTile(
                icon: Icons.download_done_rounded,
                label: '总下载',
                value: SizeFormatter.formatSize(stats.downloadSize, 2),
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _StatTile(
                icon: Icons.upload_rounded,
                label: '总上传',
                value: SizeFormatter.formatSize(stats.uploadSize, 2),
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: _StatTile(
                icon: Icons.folder_open_rounded,
                label: '剩余',
                value: SizeFormatter.formatSize(stats.freeSpace, 2),
                color: const Color(0xFFFF9800),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SpeedPill extends StatelessWidget {
  const _SpeedPill({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.35), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, size: 14, color: color),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    value,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                      letterSpacing: -0.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 13, color: color),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
