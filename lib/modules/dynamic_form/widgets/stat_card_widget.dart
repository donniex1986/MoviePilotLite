import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/utils/vuetify_mappings.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 统计卡片：参考勋章墙 UI，支持图标 + 数值 + 标签（网格布局时垂直排列）
class StatCardWidget extends StatelessWidget {
  const StatCardWidget({super.key, required this.block, this.compact = false});

  final StatCardBlock block;

  /// 网格模式：图标在上、数值居中、标签在下（紧凑布局）
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return _buildCompactCard(context);
    }
    return _buildRowCard(context);
  }

  Widget _buildCompactCard(BuildContext context) {
    final iconColor = _resolveIconColor(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(context, size: 32, iconColor: iconColor),
          const SizedBox(height: 8),
          Text(
            block.value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.label,
                context,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            block.caption,
            style: TextStyle(
              fontSize: 12,
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.secondaryLabel,
                context,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildIcon(context),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  block.caption,
                  style: TextStyle(
                    fontSize: 13,
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.secondaryLabel,
                      context,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  block.value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _resolveIconColor(context) ??
                        Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color? _resolveIconColor(BuildContext context) {
    final hex = block.iconColor;
    if (hex != null && hex.isNotEmpty) {
      return VuetifyMappings.colorFromHex(hex);
    }
    return Theme.of(context).colorScheme.primary;
  }

  Widget _buildIcon(BuildContext context, {double size = 40, Color? iconColor}) {
    final color = iconColor ?? _resolveIconColor(context);
    final mdiIcon = block.iconName;
    if (mdiIcon != null && mdiIcon.isNotEmpty) {
      final iconData = VuetifyMappings.iconFromMdi(mdiIcon);
      if (iconData != null) {
        return Container(
          width: size + 8,
          height: size + 8,
          decoration: BoxDecoration(
            color: (color ?? Theme.of(context).colorScheme.primary)
                .withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            iconData,
            size: size,
            color: color ?? Theme.of(context).colorScheme.primary,
          ),
        );
      }
    }
    final iconSrc = block.iconSrc;
    if (iconSrc != null && iconSrc.isNotEmpty) {
      final url = ImageUtil.convertPluginIconUrl(iconSrc);
      if (url.isNotEmpty) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: size + 8,
            height: size + 8,
            child: CachedImage(
              imageUrl: url,
              fit: BoxFit.contain,
            ),
          ),
        );
      }
    }
    return Container(
      width: size + 8,
      height: size + 8,
      decoration: BoxDecoration(
        color: (color ?? Theme.of(context).colorScheme.primary)
            .withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        CupertinoIcons.chart_bar_fill,
        size: size,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
