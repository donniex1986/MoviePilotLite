import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/plugin/models/plugin_models.dart';
import 'package:moviepilot_mobile/modules/plugin/services/plugin_palette_cache.dart';

/// 插件卡片，两段式布局：深色渐变区 + 浅色信息区，主题色由 PluginPaletteCache 缓存
class PluginItemCard extends StatelessWidget {
  const PluginItemCard({
    super.key,
    required this.item,
    required this.iconUrl,
    this.onMoreTap,
  });

  final PluginItem item;
  final String iconUrl;
  final VoidCallback? onMoreTap;

  static const double _cardRadius = 12;
  static const Color _darkBg = Color(0xFF1A2024);
  static const double _iconSize = 48;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final cache = Get.find<PluginPaletteCache>();
      final themeColor =
          cache.watchColor(iconUrl) ?? PluginPaletteCache.defaultColor;

      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_cardRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_cardRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDarkSection(context, themeColor),
              _buildLightSection(context),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDarkSection(BuildContext context, Color themeColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            themeColor.withValues(alpha: 0.85),
            _darkBg,
          ],
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: Text(
                        item.pluginName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (item.pluginVersion != null &&
                        item.pluginVersion!.isNotEmpty) ...[
                      const SizedBox(width: 6),
                      Text(
                        'v${item.pluginVersion}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ],
                ),
                if (item.pluginDesc != null && item.pluginDesc!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    item.pluginDesc!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (_labelList.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: _labelList
                        .map(
                          (l) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: themeColor.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              l,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          _buildIcon(themeColor),
        ],
      ),
    );
  }

  List<String> get _labelList {
    final raw = item.pluginLabel;
    if (raw == null || raw.trim().isEmpty) return [];
    return raw.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  }

  Widget _buildLightSection(BuildContext context) {
    final surfaceColor = Theme.of(context).colorScheme.surfaceContainerHighest;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Container(
      color: surfaceColor,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.person_outline,
            size: 16,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              item.pluginAuthor ?? '-',
              style: TextStyle(
                fontSize: 12,
                color: onSurface.withValues(alpha: 0.85),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.download_outlined,
            size: 16,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(width: 4),
          Text(
            _formatInstallCount(item.installCount),
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          if (onMoreTap != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onMoreTap,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.more_vert,
                  size: 20,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatInstallCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    }
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }
    return '$count';
  }

  Widget _buildIcon(Color fallbackColor) {
    if (iconUrl.isEmpty) {
      return Container(
        width: _iconSize,
        height: _iconSize,
        decoration: BoxDecoration(
          color: fallbackColor.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.extension_outlined,
          size: 24,
          color: Colors.white,
        ),
      );
    }
    return Container(
      width: _iconSize,
      height: _iconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: iconUrl,
          width: _iconSize,
          height: _iconSize,
          fit: BoxFit.cover,
          placeholder: (_, __) => Container(
            color: fallbackColor.withValues(alpha: 0.5),
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          errorWidget: (_, __, ___) => Container(
            color: fallbackColor.withValues(alpha: 0.5),
            child: Icon(Icons.extension_outlined, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
