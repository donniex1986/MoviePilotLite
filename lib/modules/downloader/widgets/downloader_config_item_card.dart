import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/gen/assets.gen.dart';
import 'package:moviepilot_mobile/modules/downloader/models/downloader_stats.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';

class DownloaderConfigItemCard extends StatelessWidget {
  const DownloaderConfigItemCard({
    super.key,
    required this.downloader,
    required this.stats,
    required this.onTap,
    this.obscureHost = false,
  });

  final DownloadClient downloader;
  final DownloaderStats? stats;
  final VoidCallback onTap;
  final bool obscureHost;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.colorScheme.surface;
    final outline = theme.colorScheme.outline;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: outline.withValues(alpha: 0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopStatus(context),
                _buildInfoBlock(context),
                const SizedBox(height: 10),
                _buildMetricsPanel(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopStatus(BuildContext context) {
    final onSurfaceVariant = Theme.of(context).colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(Icons.tune_rounded, size: 14, color: onSurfaceVariant),
          const SizedBox(width: 6),
          Text(
            '连接信息',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 12,
              color: onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceContainer = theme.colorScheme.surfaceContainer;
    final onSurfaceVariant = theme.colorScheme.onSurfaceVariant;
    final logo = switch (downloader.type) {
      'qbittorrent' => Assets.images.logos.qbittorrent,
      'transmission' => Assets.images.logos.transmission,
      _ => Assets.images.logos.downloader,
    };

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: surfaceContainer.withValues(alpha: 0.24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(width: 56, height: 56, child: logo.image()),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        downloader.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        (downloader.type.isEmpty ? '-' : downloader.type)
                            .toUpperCase(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.primary,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.link_rounded,
                      size: 14,
                      color: onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _buildHostText(theme, onSurfaceVariant),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsPanel(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceContainer = theme.colorScheme.surfaceContainer;
    final outline = theme.colorScheme.outline;

    if (stats == null) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: surfaceContainer.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: outline.withValues(alpha: 0.08), width: 1),
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
      );
    }

    final isActive = stats!.downloadSpeed > 0 || stats!.uploadSpeed > 0;
    final badgeColor = isActive ? const Color(0xFF34D399) : const Color(0xFF90A4AE);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: surfaceContainer.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: outline.withValues(alpha: 0.08), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.monitor_heart_rounded,
                size: 14,
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.85),
              ),
              const SizedBox(width: 5),
              Text(
                '运行指标',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: badgeColor.withValues(alpha: 0.34),
                    width: 0.8,
                  ),
                ),
                child: Text(
                  isActive ? '活动中' : '空闲',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: badgeColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildDataItem(
                  context,
                  Icons.arrow_downward_rounded,
                  '下行',
                  _formatSpeed(stats!.downloadSpeed),
                  const Color(0xFF4CAF50),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildDataItem(
                  context,
                  Icons.arrow_upward_rounded,
                  '上行',
                  _formatSpeed(stats!.uploadSpeed),
                  const Color(0xFF00BCD4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildStorageSummaryBar(context),
          const SizedBox(height: 10),
          _buildDataItem(
            context,
            Icons.folder_open_rounded,
            '剩余空间',
            SizeFormatter.formatSize(stats!.freeSpace, 2),
            const Color(0xFFFF9800),
          ),
        ],
      ),
    );
  }

  Widget _buildStorageSummaryBar(BuildContext context) {
    final theme = Theme.of(context);
    final outline = theme.colorScheme.outline;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: outline.withValues(alpha: 0.1),
          width: 0.8,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryColumn(
              context: context,
              label: '总下载',
              value: SizeFormatter.formatSize(stats!.downloadSize, 2),
              color: theme.colorScheme.primary,
              icon: Icons.download_done_rounded,
            ),
          ),
          _buildSummaryDivider(outline),
          Expanded(
            child: _buildSummaryColumn(
              context: context,
              label: '总上传',
              value: SizeFormatter.formatSize(stats!.uploadSize, 2),
              color: theme.colorScheme.secondary,
              icon: Icons.upload_rounded,
            ),
          ),
          _buildSummaryDivider(outline),
          Expanded(
            child: _buildSummaryColumn(
              context: context,
              label: '上/下比',
              value: _formatFlowRatio(stats!.uploadSize, stats!.downloadSize),
              color: theme.colorScheme.tertiary,
              icon: Icons.sync_rounded,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryDivider(Color outline) {
    return Container(
      width: 1,
      height: 44,
      color: outline.withValues(alpha: 0.12),
    );
  }

  Widget _buildSummaryColumn({
    required BuildContext context,
    required String label,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    final onSurfaceVariant = Theme.of(context).colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 12, color: color),
              const SizedBox(width: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildDataItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    final onSurfaceVariant = Theme.of(context).colorScheme.onSurfaceVariant;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color.withValues(alpha: 0.16),
          width: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: color,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _hostText() {
    final host = downloader.config?.host?.trim() ?? '';
    return host.isEmpty ? '未配置地址' : host;
  }

  Widget _buildHostText(ThemeData theme, Color onSurfaceVariant) {
    final textWidget = Text(
      _hostText(),
      style: theme.textTheme.bodySmall?.copyWith(
        fontSize: 13,
        color: onSurfaceVariant,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    if (!obscureHost) return textWidget;
    return ClipRect(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 3.2, sigmaY: 3.2),
        child: textWidget,
      ),
    );
  }

  String _formatSpeed(double bytesPerSecond) {
    if (bytesPerSecond <= 0) return '0 B/s';
    return '${SizeFormatter.formatSize(bytesPerSecond, 2)}/s';
  }

  String _formatFlowRatio(double upload, double download) {
    if (upload <= 0 && download <= 0) return '0.00';
    if (download <= 0) return '∞';
    return (upload / download).toStringAsFixed(2);
  }
}
