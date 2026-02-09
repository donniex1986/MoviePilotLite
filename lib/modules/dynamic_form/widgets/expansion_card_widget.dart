import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';

/// 折叠卡片：卡片标题 + 可展开项
class ExpansionCardWidget extends StatelessWidget {
  const ExpansionCardWidget({super.key, required this.block});

  final ExpansionCardBlock block;

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
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
              if (block.cardSubtitle != null && block.cardSubtitle!.isNotEmpty)
                Text(
                  block.cardSubtitle!,
                  style: TextStyle(
                    fontSize: 13,
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.secondaryLabel,
                      context,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          ...block.items.map((item) => _ExpansionTile(
                title: item.title,
                subtitle: item.subtitle,
                bodyLines: item.bodyLines,
              )),
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
  });

  final String title;
  final String? subtitle;
  final List<String> bodyLines;

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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: CupertinoDynamicColor.resolve(
                              CupertinoColors.label,
                              context,
                            ),
                          ),
                        ),
                        if (widget.subtitle != null &&
                            widget.subtitle!.isNotEmpty) ...[
                          const SizedBox(height: 2),
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
          if (_expanded && widget.bodyLines.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.bodyLines
                    .map(
                      (line) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          line,
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoDynamicColor.resolve(
                              CupertinoColors.label,
                              context,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
