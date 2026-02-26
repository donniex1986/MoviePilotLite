import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/utils/vuetify_mappings.dart';
import 'package:moviepilot_mobile/utils/open_url.dart';

/// 站点信息卡片：标题 + 图标 + 横向统计项 + 可选错误提示（后宫管理系统等）
class SiteInfoCardWidget extends StatelessWidget {
  const SiteInfoCardWidget({super.key, required this.block});

  final SiteInfoCardBlock block;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(
              children: [
                _buildTitleIcon(context),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    block.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CupertinoDynamicColor.resolve(
                        CupertinoColors.label,
                        context,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = block.statItems.isNotEmpty
                    ? (constraints.maxWidth -
                              _statItemSpacing * (block.statItems.length - 1)) /
                          block.statItems.length
                    : 0.0;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: block.statItems
                      .map(
                        (item) => SizedBox(
                          width: itemWidth,
                          child: _StatItemTile(item: item),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          if (block.alertText != null && block.alertText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: _buildAlert(context),
            ),
          if (block.extraStatItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth =
                      (constraints.maxWidth -
                          _statItemSpacing *
                              (block.extraStatItems.length - 1)) /
                      block.extraStatItems.length;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: block.extraStatItems
                        .map(
                          (item) => SizedBox(
                            width: itemWidth,
                            child: _StatItemTile(item: item),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),

          if (block.infoAlertText != null && block.infoAlertText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: _buildInfoAlert(context),
            )
          else
            const SizedBox(height: 12),
        ],
      ),
    );
  }

  static const double _statItemSpacing = 8;

  Widget _buildTitleIcon(BuildContext context) {
    final color =
        _resolveColor(context, block.iconColor) ??
        Theme.of(context).colorScheme.primary;
    final iconData = block.iconName != null
        ? VuetifyMappings.iconFromMdi(block.iconName)
        : null;
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(iconData ?? Icons.diamond, size: 20, color: color),
    );
  }

  Widget _buildAlert(BuildContext context) {
    final isError = (block.alertType ?? 'error').toLowerCase() == 'error';
    final iconColor = isError
        ? CupertinoColors.destructiveRed
        : CupertinoColors.activeBlue;
    final mdiIcon = block.alertIconName != null
        ? VuetifyMappings.iconFromMdi(block.alertIconName)
        : null;
    final iconData =
        mdiIcon ??
        (isError
            ? CupertinoIcons.exclamationmark_circle_fill
            : CupertinoIcons.info_circle_fill);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: iconColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, size: 18, color: iconColor),
          const SizedBox(width: 8),
          Expanded(
            child: _buildAlertTextWithMdiIcons(context, isError: isError),
          ),
        ],
      ),
    );
  }

  /// 解析 alert 文本中的 mdi-xxx 并以内联图标显示
  Widget _buildAlertTextWithMdiIcons(
    BuildContext context, {
    bool isError = false,
  }) {
    final text = block.alertText ?? '';
    if (text.isEmpty) return const SizedBox.shrink();
    final style = TextStyle(
      fontSize: 13,
      color: CupertinoDynamicColor.resolve(CupertinoColors.label, context),
    );
    final regex = RegExp(r'mdi-[a-z0-9-]+');
    final matches = regex.allMatches(text);
    if (matches.isEmpty) {
      return Text(text, style: style);
    }
    final spans = <InlineSpan>[];
    var lastEnd = 0;
    for (final m in matches) {
      if (m.start > lastEnd) {
        spans.add(
          TextSpan(text: text.substring(lastEnd, m.start), style: style),
        );
      }
      final iconName = m.group(0) ?? '';
      final iconData = VuetifyMappings.iconFromMdi(iconName);
      if (iconData != null) {
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                iconData,
                size: 14,
                color: isError
                    ? CupertinoColors.destructiveRed
                    : CupertinoColors.activeBlue,
              ),
            ),
          ),
        );
      } else {
        spans.add(TextSpan(text: iconName, style: style));
      }
      lastEnd = m.end;
    }
    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd), style: style));
    }
    return RichText(
      text: TextSpan(style: style, children: spans),
    );
  }

  Widget _buildInfoAlert(BuildContext context) {
    final iconColor = CupertinoColors.activeBlue;
    final iconData =
        VuetifyMappings.iconFromMdi('mdi-information') ??
        CupertinoIcons.info_circle_fill;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: iconColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, size: 18, color: iconColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              block.infoAlertText ?? '',
              style: TextStyle(
                fontSize: 13,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.label,
                  context,
                ),
              ),
            ),
          ),
          if (block.alertButtonLabel != null &&
              block.alertButtonHref != null &&
              block.alertButtonLabel!.isNotEmpty &&
              block.alertButtonHref!.isNotEmpty)
            CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              minimumSize: Size.zero,
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(8),
              onPressed: () {
                WebUtil.open(url: block.alertButtonHref);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    VuetifyMappings.iconFromMdi('mdi-store') ??
                        CupertinoIcons.cart,
                    size: 16,
                    color: CupertinoColors.white,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    block.alertButtonLabel!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Color? _resolveColor(BuildContext context, String? colorKey) {
    if (colorKey == null || colorKey.isEmpty) return null;
    final hex = VuetifyMappings.colorFromHex(colorKey);
    if (hex != null) return hex;
    switch (colorKey.toLowerCase()) {
      case 'primary':
        return Theme.of(context).colorScheme.primary;
      case 'error':
        return CupertinoColors.destructiveRed;
      case 'success':
        return const Color(0xFF4CAF50);
      default:
        return VuetifyMappings.colorFromHex(colorKey);
    }
  }
}

class _StatItemTile extends StatelessWidget {
  const _StatItemTile({required this.item});

  final StatItemData item;

  @override
  Widget build(BuildContext context) {
    final color =
        _resolveColor(context, item.iconColor) ??
        Theme.of(context).colorScheme.primary;
    final iconData = item.iconName != null
        ? VuetifyMappings.iconFromMdi(item.iconName)
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (iconData != null)
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Icon(iconData, size: 18, color: color),
          ),
        Text(
          item.value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: CupertinoDynamicColor.resolve(
              CupertinoColors.label,
              context,
            ),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        if (item.label.isNotEmpty)
          Text(
            item.label,
            style: TextStyle(
              fontSize: 11,
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.secondaryLabel,
                context,
              ),
            ),
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }

  Color? _resolveColor(BuildContext context, String? colorKey) {
    if (colorKey == null || colorKey.isEmpty) return null;
    final hex = VuetifyMappings.colorFromHex(colorKey);
    if (hex != null) return hex;
    switch (colorKey.toLowerCase()) {
      case 'primary':
        return Theme.of(context).colorScheme.primary;
      case 'error':
        return CupertinoColors.destructiveRed;
      case 'success':
        return const Color(0xFF4CAF50);
      default:
        return VuetifyMappings.colorFromHex(colorKey);
    }
  }
}
