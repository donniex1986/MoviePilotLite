import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/utils/vuetify_mappings.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/medal_card_widget.dart';

/// 折叠卡片：参考勋章墙 UI，支持皇冠图标、数量摘要芯片、可展开详情
class ExpansionCardWidget extends StatelessWidget {
  const ExpansionCardWidget({super.key, required this.block});

  final ExpansionCardBlock block;

  static const _crownColor = Color(0xFFA259E6);

  Widget _buildChip(BuildContext context, ChipItemData item) {
    final bgColor = item.backgroundColor != null
        ? VuetifyMappings.colorFromHex(item.backgroundColor)
        : null;
    final iconColor = item.iconColor != null
        ? VuetifyMappings.colorFromHex(item.iconColor)
        : null;
    final iconData = item.iconName != null
        ? VuetifyMappings.iconFromMdi(item.iconName)
        : null;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor ??
            CupertinoDynamicColor.resolve(
              CupertinoColors.tertiarySystemFill,
              context,
            ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconData != null) ...[
            Icon(
              iconData,
              size: 18,
              color: iconColor ??
                  CupertinoDynamicColor.resolve(
                    CupertinoColors.secondaryLabel,
                    context,
                  ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            item.text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
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

  Widget _buildChipFromText(BuildContext context, String line) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.tertiarySystemFill,
          context,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        line,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.secondaryLabel,
            context,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasCrown = block.iconName != null && block.iconName!.isNotEmpty;
    final hasChips = block.chipItems.isNotEmpty || block.chipLines.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.tertiarySystemFill,
                context,
              ).withValues(alpha: 0.5),
              border: Border(
                bottom: BorderSide(
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.separator,
                    context,
                  ).withValues(alpha: 0.3),
                ),
              ),
            ),
            child: Row(
              children: [
                if (hasCrown) ...[
                  Icon(
                    VuetifyMappings.iconFromMdi(block.iconName) ??
                        Icons.diamond,
                    size: 22,
                    color: _crownColor,
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    block.cardTitle,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: CupertinoDynamicColor.resolve(
                        CupertinoColors.label,
                        context,
                      ),
                    ),
                  ),
                ),
                if (block.cardSubtitle != null &&
                    block.cardSubtitle!.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: CupertinoDynamicColor.resolve(
                        CupertinoColors.tertiarySystemFill,
                        context,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      block.cardSubtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: CupertinoDynamicColor.resolve(
                          CupertinoColors.secondaryLabel,
                          context,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (hasChips)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...block.chipItems.map(
                    (item) => _buildChip(context, item),
                  ),
                  ...block.chipLines.map(
                    (line) => _buildChipFromText(context, line),
                  ),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, hasChips ? 0 : 8, 12, 12),
            child: Column(
              children: block.items
                  .map((item) => _ExpansionTile(
                        title: item.title,
                        subtitle: item.subtitle,
                        bodyLines: item.bodyLines,
                        medalCards: item.medalCards,
                        iconText: item.title.runes.isNotEmpty
                            ? String.fromCharCode(item.title.runes.first)
                            : '',
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpansionTile extends StatefulWidget {
  const _ExpansionTile({
    required this.title,
    this.subtitle,
    required this.bodyLines,
    this.medalCards = const [],
    this.iconText = '',
  });

  final String title;
  final String? subtitle;
  final List<String> bodyLines;
  final List<MedalCardData> medalCards;
  final String iconText;

  @override
  State<_ExpansionTile> createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<_ExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.tertiarySystemFill,
          context,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.separator,
            context,
          ).withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Row(
                children: [
                  if (widget.iconText.isNotEmpty)
                    Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF80CBC4), Color(0xFF81D4FA)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.iconText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: CupertinoDynamicColor.resolve(
                              CupertinoColors.label,
                              context,
                            ),
                          ),
                        ),
                        if (widget.subtitle != null &&
                            widget.subtitle!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.subtitle!,
                            style: TextStyle(
                              fontSize: 13,
                              color: CupertinoDynamicColor.resolve(
                                CupertinoColors.secondaryLabel,
                                context,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    _expanded
                        ? CupertinoIcons.chevron_up
                        : CupertinoIcons.chevron_down,
                    size: 18,
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.secondaryLabel,
                      context,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_expanded &&
              (widget.bodyLines.isNotEmpty || widget.medalCards.isNotEmpty))
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.bodyLines.isNotEmpty)
                    ...widget.bodyLines
                        .map(
                          (line) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              line,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: CupertinoDynamicColor.resolve(
                                  CupertinoColors.label,
                                  context,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  if (widget.medalCards.isNotEmpty) ...[
                    if (widget.bodyLines.isNotEmpty) const SizedBox(height: 12),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        const spacing = 12.0;
                        const crossCount = 2;
                        final childWidth = (constraints.maxWidth - spacing) / 2;
                        return Wrap(
                          spacing: spacing,
                          runSpacing: spacing,
                          children: widget.medalCards
                              .map(
                                (data) => SizedBox(
                                  width: childWidth,
                                  child: MedalCardWidget(data: data),
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}
