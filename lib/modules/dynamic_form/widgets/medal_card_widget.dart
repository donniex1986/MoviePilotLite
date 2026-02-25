import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/utils/vuetify_mappings.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';

/// 勋章卡片：完整展示标题、描述、图片、详情、价格与操作按钮
class MedalCardWidget extends StatelessWidget {
  const MedalCardWidget({super.key, required this.data});

  final MedalCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.label,
                context,
              ),
            ),
          ),
          if (data.description.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              data.description,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.tertiaryLabel,
                  context,
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          _buildImage(context),
          if (data.detailLines.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...data.detailLines
                .map(
                  (line) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        line,
                        style: TextStyle(
                          fontSize: 12,
                          color: CupertinoDynamicColor.resolve(
                            CupertinoColors.secondaryLabel,
                            context,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
          const SizedBox(height: 8),
          if (data.price != null && data.price!.isNotEmpty)
            Text(
              data.price!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color:
                    VuetifyMappings.colorFromHex('#43c04b') ??
                    const Color(0xFF43C04B),
              ),
            ),
          if (data.actionLabel != null && data.actionLabel!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _resolveActionColor(context),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                data.actionLabel!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _resolveActionColor(BuildContext context) {
    final hex = data.actionColor;
    if (hex != null && hex.isNotEmpty) {
      return VuetifyMappings.colorFromHex(hex) ??
          Theme.of(context).colorScheme.primary;
    }
    return Theme.of(context).colorScheme.primary;
  }

  Widget _buildImage(BuildContext context) {
    final url = data.imageUrl;
    if (url == null || url.isEmpty) {
      return Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.tertiarySystemFill,
            context,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(
          CupertinoIcons.photo,
          size: 36,
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.tertiaryLabel,
            context,
          ),
        ),
      );
    }
    return ClipOval(
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.tertiarySystemFill,
            context,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: CachedImage(imageUrl: url, fit: BoxFit.cover),
      ),
    );
  }
}
