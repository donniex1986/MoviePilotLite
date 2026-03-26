import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_field_row.dart';

class SettingsMultiSelectRow extends StatelessWidget {
  const SettingsMultiSelectRow({
    super.key,
    required this.title,
    this.description,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
    this.selectableValues,
    this.sheetTitle,
    this.emptyDisplay = '未选择',
    this.maxDisplayItems = 3,
  });

  final String title;
  final String? description;
  final List<SettingsEnumOption> options;
  final List<String> selectedValues;
  final ValueChanged<List<String>> onChanged;
  final Set<String>? selectableValues;
  final String? sheetTitle;
  final String emptyDisplay;
  final int maxDisplayItems;

  String _labelOf(String value) {
    for (final o in options) {
      if (o.value == value) return o.label;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final labels = selectedValues.map(_labelOf).where((s) => s.isNotEmpty).toList();
    final display = labels.isEmpty
        ? emptyDisplay
        : (labels.length <= maxDisplayItems
            ? labels.join('、')
            : '${labels.take(maxDisplayItems).join('、')}…');

    return SettingsFieldRow(
      title: title,
      description: description,
      control: GestureDetector(
        onTap: () async {
          final result = await SettingsMultiSelectPickerSheet.show(
            context,
            title: sheetTitle ?? title,
            options: options,
            initialSelectedValues: selectedValues,
            selectableValues: selectableValues,
          );
          if (result != null) onChanged(result);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(
                display,
                style: TextStyle(
                  fontSize: 15,
                  color: CupertinoColors.activeBlue.resolveFrom(context),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 2),
            Icon(
              CupertinoIcons.chevron_forward,
              size: 12,
              color: CupertinoColors.tertiaryLabel.resolveFrom(context),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsMultiSelectPickerSheet extends StatefulWidget {
  const SettingsMultiSelectPickerSheet({
    super.key,
    required this.title,
    required this.options,
    required this.initialSelectedValues,
    this.selectableValues,
  });

  final String title;
  final List<SettingsEnumOption> options;
  final List<String> initialSelectedValues;
  final Set<String>? selectableValues;

  static Future<List<String>?> show(
    BuildContext context, {
    required String title,
    required List<SettingsEnumOption> options,
    required List<String> initialSelectedValues,
    Set<String>? selectableValues,
  }) {
    return showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SettingsMultiSelectPickerSheet(
        title: title,
        options: options,
        initialSelectedValues: initialSelectedValues,
        selectableValues: selectableValues,
      ),
    );
  }

  @override
  State<SettingsMultiSelectPickerSheet> createState() =>
      _SettingsMultiSelectPickerSheetState();
}

class _SettingsMultiSelectPickerSheetState
    extends State<SettingsMultiSelectPickerSheet> {
  late Set<String> _selected;

  bool _isSelectable(String value) {
    final s = widget.selectableValues;
    if (s == null) return true;
    return s.contains(value);
  }

  void _toggle(String value) {
    if (!_isSelectable(value)) return;
    setState(() {
      if (_selected.contains(value)) {
        _selected.remove(value);
      } else {
        _selected.add(value);
      }
    });
  }

  void _selectAll() {
    setState(() {
      for (final o in widget.options) {
        if (_isSelectable(o.value)) _selected.add(o.value);
      }
    });
  }

  void _deselectAll() {
    setState(() {
      for (final o in widget.options) {
        if (_isSelectable(o.value)) _selected.remove(o.value);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _selected = Set.from(widget.initialSelectedValues);
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = CupertinoColors.systemBackground.resolveFrom(context);
    final selectableCount =
        widget.options.where((o) => _isSelectable(o.value)).length;
    final selectedCount = _selected.length;
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.72,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 6),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: CupertinoColors.tertiaryLabel
                      .resolveFrom(context)
                      .withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      '取消',
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.activeBlue.resolveFrom(context),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '已选 $selectedCount',
                          style: TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.secondaryLabel.resolveFrom(
                              context,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    onPressed: () =>
                        Navigator.of(context).pop(List<String>.from(_selected)),
                    child: Text(
                      '完成',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.activeBlue.resolveFrom(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 0.6,
              color: CupertinoColors.separator
                  .resolveFrom(context)
                  .withValues(alpha: 0.4),
            ),
            if (selectableCount > 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
                child: Row(
                  children: [
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      minimumSize: Size.zero,
                      onPressed: _selectAll,
                      child: Text(
                        '全选',
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.activeBlue.resolveFrom(context),
                        ),
                      ),
                    ),
                    Container(
                      width: 0.5,
                      height: 18,
                      color: CupertinoColors.separator.resolveFrom(context),
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      minimumSize: Size.zero,
                      onPressed: _deselectAll,
                      child: Text(
                        '全不选',
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.secondaryLabel.resolveFrom(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: widget.options.map((opt) {
                    final selected = _selected.contains(opt.value);
                    final selectable = _isSelectable(opt.value);
                    final color = selected
                        ? CupertinoColors.activeBlue.resolveFrom(context)
                        : CupertinoColors.secondaryLabel.resolveFrom(context);
                    final bg = selected
                        ? CupertinoColors.activeBlue
                            .resolveFrom(context)
                            .withValues(alpha: 0.12)
                        : CupertinoColors.systemGrey6.resolveFrom(context);
                    return GestureDetector(
                      onTap: selectable ? () => _toggle(opt.value) : null,
                      child: Opacity(
                        opacity: selectable ? 1 : 0.45,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: CupertinoColors.separator
                                  .resolveFrom(context)
                                  .withValues(alpha: 0.22),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (selected)
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Icon(
                                    Icons.check,
                                    size: 16,
                                    color: CupertinoColors.activeBlue
                                        .resolveFrom(context),
                                  ),
                                ),
                              Text(
                                opt.label,
                                style: TextStyle(fontSize: 14, color: color),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

