import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 统计卡片：图标 + 标题 + 数值，App 风格
class StatCardWidget extends StatelessWidget {
  const StatCardWidget({super.key, required this.block});

  final StatCardBlock block;

  @override
  Widget build(BuildContext context) {
    return Section(
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
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final iconSrc = block.iconSrc;
    if (iconSrc == null || iconSrc.isEmpty) {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer.withValues(
                alpha: 0.5,
              ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          CupertinoIcons.chart_bar_fill,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    final url = ImageUtil.convertPluginIconUrl(iconSrc);
    if (url.isEmpty) {
      return _buildPlaceholderIcon(context);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 40,
        height: 40,
        child: CachedImage(
          imageUrl: url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(
              alpha: 0.5,
            ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        CupertinoIcons.chart_bar_fill,
        size: 20,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
