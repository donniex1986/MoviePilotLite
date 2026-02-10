import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/site/models/site_resource_models.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/utils/open_url.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';

/// 站点资源项卡片：标题、描述、hit_and_run（重点）、volume、labels、pubdate/date_elapsed，右下角 PopupMenu（查看详情、下载种子）
class SiteResourceItemCard extends StatelessWidget {
  const SiteResourceItemCard({super.key, required this.item});

  final SiteResourceItem? item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withOpacity(0.18)),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          Text(
            item?.title ?? '',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          // 站点 + 做种/下载 + 促销/体积因子
          Row(
            children: [
              _buildSiteBadge(item?.siteName ?? ''),
              const Spacer(),
              if (item?.seeders != null && item!.seeders > 0) ...[
                Icon(
                  Icons.arrow_upward,
                  size: 18,
                  color: Colors.green.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  '${item?.seeders}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
              const SizedBox(width: 10),
              if (item?.peers != null && item!.peers > 0) ...[
                Icon(
                  Icons.arrow_downward,
                  size: 18,
                  color: Colors.red.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  '${item?.peers}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          // 描述
          if (item?.description.isNotEmpty ?? false)
            Text(
              item?.description ?? '',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          if (item?.description.isNotEmpty ?? false) const SizedBox(height: 8),
          // hit_and_run 重点显示
          if (item?.hitAndRun ?? false) ...[
            _buildHitAndRunBadge(context),
            const SizedBox(height: 8),
          ],
          // 体积因子 / 促销
          if (item?.volumeFactor.isNotEmpty ?? false) ...[
            _buildVolumeFactorChip(context),
            const SizedBox(height: 8),
          ],
          // 时间：pubdate、date_elapsed
          Row(
            children: [
              Icon(
                Icons.schedule,
                size: 18,
                color: AppTheme.textSecondaryColor,
              ),
              const SizedBox(width: 6),
              Text(
                _timeLabel(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondaryColor,
                ),
              ),
            ],
          ),
          if (item?.labels.isNotEmpty ?? false) ...[
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: _buildLabelChips()),
          ],
          // 底栏：大小 + PopupMenu（查看详情、下载种子）
          const SizedBox(height: 10),
          const Divider(height: 1),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildSizePill(context),
              const Spacer(),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: accent),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 120),
                onSelected: (value) {
                  if (value == 'detail') {
                    _openDetail();
                  } else if (value == 'download') {
                    _downloadTorrent();
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'detail',
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, size: 20),
                        SizedBox(width: 8),
                        Text('查看详情'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'download',
                    child: Row(
                      children: [
                        Icon(Icons.download, size: 20),
                        SizedBox(width: 8),
                        Text('下载种子'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSiteBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.textSecondaryColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppTheme.textSecondaryColor,
        ),
      ),
    );
  }

  Widget _buildHitAndRunBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.errorColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'H&R',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildVolumeFactorChip(BuildContext context) {
    final color = item?.downloadVolumeFactor == 0
        ? AppTheme.errorColor
        : Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.16),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        item?.volumeFactor ?? '',
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  List<Widget> _buildLabelChips() {
    const palette = [
      Color(0xFF7C3AED),
      Color(0xFF2563EB),
      Color(0xFF059669),
      Color(0xFFF97316),
      Color(0xFFDB2777),
      Color(0xFF0EA5E9),
    ];
    final labels = item?.labels ?? [];
    return labels.take(6).map((label) {
      final color = palette[label.hashCode.abs() % palette.length];
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.16),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }).toList();
  }

  Widget _buildSizePill(BuildContext context) {
    final t = Theme.of(context);
    final label = item?.size != null && item!.size > 0
        ? SizeFormatter.formatSize(item!.size.toInt(), 2)
        : '--';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: t.colorScheme.primary.withOpacity(0.14),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: t.colorScheme.primary,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  String _timeLabel() {
    final elapsed = item?.dateElapsed?.replaceAll('\n', ' ').trim();
    if (elapsed != null && elapsed.isNotEmpty) return elapsed;
    return item?.pubdate ?? '未知时间';
  }

  void _openDetail() {
    final url = item?.pageUrl;
    if (url != null && url.isNotEmpty) {
      WebUtil.open(url: url);
    }
  }

  void _downloadTorrent() {
    final url = item?.enclosure;
    if (url != null && url.isNotEmpty) {
      WebUtil.open(url: url);
    }
  }
}
