import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';

/// 多选选择器弹窗
class _MultiSelectPickerSheet extends StatefulWidget {
  const _MultiSelectPickerSheet({
    required this.label,
    required this.items,
    required this.initialValues,
    required this.onConfirm,
  });

  final String label;
  final List<SelectOption> items;
  final Set<dynamic> initialValues;
  final ValueChanged<Set<dynamic>> onConfirm;

  @override
  State<_MultiSelectPickerSheet> createState() =>
      _MultiSelectPickerSheetState();
}

class _MultiSelectPickerSheetState extends State<_MultiSelectPickerSheet> {
  late Set<dynamic> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = Set.from(widget.initialValues);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.systemGroupedBackground,
            context,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoDynamicColor.resolve(
                        CupertinoColors.separator,
                        context,
                      ),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('取消'),
                    ),
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: CupertinoDynamicColor.resolve(
                          CupertinoColors.label,
                          context,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => widget.onConfirm(_selectedValues),
                      child: const Text('确定'),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    final isSelected = _selectedValues.contains(item.value);
                    return CupertinoListTile(
                      title: Text(item.title),
                      trailing: isSelected
                          ? Icon(
                              CupertinoIcons.check_mark,
                              color: CupertinoColors.activeBlue,
                            )
                          : null,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedValues.remove(item.value);
                          } else {
                            _selectedValues.add(item.value);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 下拉选择表单项：标签 + 选择器（单选或多选）
class SelectFieldWidget extends StatelessWidget {
  const SelectFieldWidget({
    super.key,
    required this.block,
    this.value,
    this.onChanged,
  });

  final SelectFieldBlock block;
  final dynamic value;
  final ValueChanged<dynamic>? onChanged;

  String _getDisplayText() {
    if (value == null) return '请选择';
    if (block.multiple) {
      if (value is! List) return '请选择';
      final selected = (value as List).toSet();
      final titles = block.items
          .where((item) => selected.contains(item.value))
          .map((item) => item.title)
          .toList();
      return titles.isEmpty ? '请选择' : titles.join(', ');
    } else {
      final item = block.items.firstWhere(
        (item) => item.value == value,
        orElse: () => block.items.first,
      );
      return item.title;
    }
  }

  void _showPicker(BuildContext context) {
    if (block.multiple) {
      _showMultiSelectPicker(context);
    } else {
      _showSingleSelectPicker(context);
    }
  }

  void _showSingleSelectPicker(BuildContext context) {
    final currentIndex = block.items.indexWhere((item) => item.value == value);
    int selectedIndex = currentIndex >= 0 ? currentIndex : 0;

    showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: CupertinoDynamicColor.resolve(
              CupertinoColors.systemGroupedBackground,
              context,
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoDynamicColor.resolve(
                        CupertinoColors.separator,
                        context,
                      ),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('取消'),
                    ),
                    Text(
                      block.label,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: CupertinoDynamicColor.resolve(
                          CupertinoColors.label,
                          context,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (onChanged != null &&
                            selectedIndex < block.items.length) {
                          onChanged!(block.items[selectedIndex].value);
                        }
                      },
                      child: const Text('确定'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedIndex,
                  ),
                  itemExtent: 44,
                  onSelectedItemChanged: (index) {
                    selectedIndex = index;
                  },
                  children: block.items
                      .map(
                        (item) => Center(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 17,
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
        ),
      ),
    );
  }

  void _showMultiSelectPicker(BuildContext context) {
    final initialValues =
        (value is List ? (value as List).toSet() : <dynamic>{}).toSet();

    showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (context) => _MultiSelectPickerSheet(
        label: block.label,
        items: block.items,
        initialValues: initialValues,
        onConfirm: (selected) {
          Navigator.of(context).pop();
          if (onChanged != null) {
            onChanged!(selected.toList());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            block.label,
            style: TextStyle(
              fontSize: 14,
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.secondaryLabel,
                context,
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => _showPicker(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.tertiarySystemFill,
                  context,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _getDisplayText(),
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoDynamicColor.resolve(
                          CupertinoColors.label,
                          context,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 16,
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.secondaryLabel,
                      context,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
