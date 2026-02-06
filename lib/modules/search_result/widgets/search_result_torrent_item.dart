import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/utils/open_url.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';

import '../models/search_result_models.dart';

class SearchResultTorrentItem extends StatelessWidget {
  const SearchResultTorrentItem({super.key, required this.item});
  final SearchResultItem item;
  @override
  Widget build(BuildContext context) {
    final meta = item.meta_info;
    final torrent = item.torrent_info;
    final accent = context.primaryColor;
    final title = _displayTitle(item);
    final season = _seasonLabel(item);
    final tags = _buildTags(item);
    final promotion = _promotionBadgeLabel(item);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (season != null) _buildSeasonChip(season, accent: accent),
              if (promotion != null) ...[
                const SizedBox(width: 8),
                _buildPromotionBadge(promotion),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildSiteBadge(_siteName(item)),
              const SizedBox(width: 10),
              if ((torrent?.seeders ?? 0) > 0) ...[
                Icon(
                  Icons.arrow_upward,
                  size: 18,
                  color: Colors.green.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  '${torrent?.seeders ?? 0}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
              const Spacer(),
              _buildSizePill(context, item),
              const SizedBox(width: 6),
              InkWell(
                onTap: () => _openInfoSheet(context, item),
                child: Icon(Icons.info_outline, color: accent),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            torrent?.title ?? meta?.title ?? '',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if ((meta?.subtitle ?? torrent?.description)?.isNotEmpty ??
              false) ...[
            const SizedBox(height: 6),
            Text(
              meta?.subtitle ?? torrent?.description ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.schedule,
                size: 18,
                color: AppTheme.textSecondaryColor,
              ),
              const SizedBox(width: 6),
              Text(
                _timeLabel(item),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondaryColor,
                ),
              ),
            ],
          ),
          if (tags.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(spacing: 8, runSpacing: 8, children: tags),
          ],
        ],
      ),
    );
  }

  Widget _buildSiteBadge(String label, {bool dense = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 8 : 10,
        vertical: dense ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: AppTheme.textSecondaryColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: dense ? 11 : 12,
          fontWeight: FontWeight.w600,
          color: AppTheme.textSecondaryColor,
        ),
      ),
    );
  }

  Widget _buildSeasonChip(
    String text, {
    required Color accent,
    bool dense = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 8 : 12,
        vertical: dense ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: accent.withOpacity(0.16),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: accent,
          fontWeight: FontWeight.bold,
          fontSize: dense ? 11 : 12,
        ),
      ),
    );
  }

  Widget _buildSizePill(
    BuildContext context,
    SearchResultItem item, {
    bool dense = false,
  }) {
    final size = item.torrent_info?.size;
    final label = size == null ? '--' : SizeFormatter.formatSize(size, 2);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 10 : 12,
        vertical: dense ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: context.primaryColor.withOpacity(0.14),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: context.primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: dense ? 11 : 12,
        ),
      ),
    );
  }

  List<Widget> _buildTags(SearchResultItem item, {int? maxCount}) {
    final meta = item.meta_info;
    final torrent = item.torrent_info;
    final tags = <String>[
      if ((meta?.resource_type ?? '').isNotEmpty) meta!.resource_type!,
      if ((meta?.resource_pix ?? '').isNotEmpty) meta!.resource_pix!,
      if ((meta?.video_encode ?? '').isNotEmpty) meta!.video_encode!,
      if ((meta?.resource_team ?? '').isNotEmpty) meta!.resource_team!,
      ...?torrent?.labels,
    ];

    final unique = <String>{};
    final result = <Widget>[];
    for (final tag in tags) {
      final cleaned = tag.trim();
      if (cleaned.isEmpty || unique.contains(cleaned)) continue;
      unique.add(cleaned);
      result.add(_buildTagChip(cleaned));
      if (maxCount != null && result.length >= maxCount) break;
    }
    return result;
  }

  Widget _buildTagChip(String text) {
    final color = _tagColor(text);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.16),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPromotionBadge(String text, {bool dense = false}) {
    final color = _promotionColor(text);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 8 : 10,
        vertical: dense ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: dense ? 11 : 12,
        ),
      ),
    );
  }

  Color _tagColor(String text) {
    final palette = [
      const Color(0xFF7C3AED),
      const Color(0xFF2563EB),
      const Color(0xFF059669),
      const Color(0xFFF97316),
      const Color(0xFFDB2777),
      const Color(0xFF0EA5E9),
    ];
    final index = text.codeUnits.fold<int>(0, (a, b) => a + b);
    return palette[index % palette.length];
  }

  String? _promotionBadgeLabel(SearchResultItem item) {
    final torrent = item.torrent_info;
    if (torrent == null) return null;
    final downloadFactor = torrent.downloadvolumefactor;
    if (downloadFactor != null) {
      if (downloadFactor == 0) return '免费';
      if (downloadFactor > 0 && downloadFactor < 1) {
        return '${(downloadFactor * 100).round()}%';
      }
    }
    final volume = torrent.volume_factor ?? '';
    if (volume.contains('%')) return volume;
    if (volume.contains('免费')) return '免费';
    if (torrent.freedate != null && torrent.freedate!.isNotEmpty) return '免费';
    return null;
  }

  Color _promotionColor(String text) {
    if (text.contains('免费')) return const Color(0xFFEF4444);
    return const Color(0xFFF97316);
  }

  String _displayTitle(SearchResultItem item) {
    final meta = item.meta_info;
    return meta?.name?.trim().isNotEmpty == true
        ? meta!.name!.trim()
        : meta?.cn_name?.trim().isNotEmpty == true
        ? meta!.cn_name!.trim()
        : meta?.en_name?.trim().isNotEmpty == true
        ? meta!.en_name!.trim()
        : meta?.title?.trim().isNotEmpty == true
        ? meta!.title!.trim()
        : item.torrent_info?.title ?? '未知标题';
  }

  String? _seasonLabel(SearchResultItem item) {
    final season = item.meta_info?.season_episode?.trim();
    if (season != null && season.isNotEmpty) return season;
    final value = item.meta_info?.begin_season ?? item.meta_info?.total_season;
    if (value != null && value > 0) {
      return 'S${value.toString().padLeft(2, '0')}';
    }
    return null;
  }

  String _siteName(SearchResultItem item) {
    return item.torrent_info?.site_name ?? '未知站点';
  }

  String _timeLabel(SearchResultItem item) {
    final torrent = item.torrent_info;
    final elapsed = torrent?.date_elapsed?.replaceAll('\n', ' ').trim();
    if (elapsed != null && elapsed.isNotEmpty) {
      return elapsed;
    }
    final raw = torrent?.pubdate;
    if (raw == null || raw.isEmpty) return '未知时间';
    final parsed = _parseDate(raw);
    if (parsed == null) return raw;
    final diff = DateTime.now().difference(parsed);
    if (diff.inDays >= 1) return '${diff.inDays}天前';
    if (diff.inHours >= 1) return '${diff.inHours}小时前';
    if (diff.inMinutes >= 1) return '${diff.inMinutes}分钟前';
    return '刚刚';
  }

  DateTime? _parseDate(String raw) {
    final format = DateFormat('yyyy-MM-dd HH:mm:ss');
    try {
      return format.parseUtc(raw).toLocal();
    } catch (_) {
      try {
        return format.parse(raw);
      } catch (_) {
        return null;
      }
    }
  }

  _openInfoSheet(BuildContext context, SearchResultItem item) async {
    WebUtil.open(url: item.torrent_info?.page_url);
  }
}
