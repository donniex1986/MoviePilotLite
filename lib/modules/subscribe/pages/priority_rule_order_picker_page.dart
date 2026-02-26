import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/rule/models/rule_models.dart';

/// 优先级规则组多选：以 Sheet 展示，Chips 选择/反选，全选/全不选
class PriorityRulePickerSheet extends StatefulWidget {
  const PriorityRulePickerSheet({
    super.key,
    required this.rules,
    required this.initialSelectedNames,
  });

  final List<UserFilterRuleGroup> rules;
  final List<String> initialSelectedNames;

  /// 以 Sheet 形式打开，返回用户确认的已选规则名称列表（按 [rules] 顺序；取消返回 null）
  static Future<List<String>?> show(
    BuildContext context, {
    required List<UserFilterRuleGroup> rules,
    required List<String> initialSelectedNames,
  }) {
    return showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => PriorityRulePickerSheet(
        rules: rules,
        initialSelectedNames: initialSelectedNames,
      ),
    );
  }

  @override
  State<PriorityRulePickerSheet> createState() =>
      _PriorityRulePickerSheetState();
}

class _PriorityRulePickerSheetState extends State<PriorityRulePickerSheet> {
  /// 已选名称列表，顺序即选择顺序
  late List<String> _selectedNames;

  List<String> get _ruleNames =>
      widget.rules.map((r) => r.name).where((n) => n.isNotEmpty).toList();

  void _toggle(String name) {
    setState(() {
      if (_selectedNames.contains(name)) {
        _selectedNames.remove(name);
      } else {
        _selectedNames.add(name);
      }
    });
  }

  void _selectAll() {
    setState(() => _selectedNames = List.from(_ruleNames));
  }

  void _deselectAll() {
    setState(() => _selectedNames.clear());
  }

  /// 返回已选名称，按选择顺序
  List<String> get _orderedResult => List.from(_selectedNames);

  @override
  void initState() {
    super.initState();
    _selectedNames = List.from(widget.initialSelectedNames);
  }

  @override
  Widget build(BuildContext context) {
    final bgColor =
        CupertinoColors.systemGroupedBackground.resolveFrom(context);
    final names = _ruleNames;
    if (names.isEmpty) {
      return Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.4,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHandle(context),
              _buildHeader(context),
              const Padding(
                padding: EdgeInsets.all(24),
                child: Text('暂无可用规则'),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.72,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(context),
            _buildHeader(context),
            _buildSelectAllBar(context),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: names
                      .map((name) => _buildRuleChip(context, name))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: Container(
        width: 36,
        height: 4,
        decoration: BoxDecoration(
          color: CupertinoColors.tertiaryLabel
              .resolveFrom(context)
              .withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              '取消',
              style: TextStyle(
                fontSize: 16,
                color: CupertinoColors.activeBlue.resolveFrom(context),
              ),
            ),
          ),
          const Text(
            '优先级规则组',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            onPressed: () => Navigator.of(context).pop(_orderedResult),
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
    );
  }

  Widget _buildSelectAllBar(BuildContext context) {
    final blue = CupertinoColors.activeBlue.resolveFrom(context);
    final secondary = CupertinoColors.secondaryLabel.resolveFrom(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            minSize: 0,
            onPressed: _selectAll,
            child: Text('全选', style: TextStyle(fontSize: 15, color: blue)),
          ),
          Container(
            width: 0.5,
            height: 18,
            color: CupertinoColors.separator.resolveFrom(context),
          ),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            minSize: 0,
            onPressed: _deselectAll,
            child: Text(
              '全不选',
              style: TextStyle(fontSize: 15, color: secondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleChip(BuildContext context, String name) {
    final isSelected = _selectedNames.contains(name);
    final index = isSelected ? _selectedNames.indexOf(name) + 1 : null;
    final blue = CupertinoColors.activeBlue.resolveFrom(context);
    final labelColor = CupertinoColors.label.resolveFrom(context);

    final separatorColor =
        CupertinoColors.separator.resolveFrom(context).withValues(alpha: 0.6);
    final indexColor = CupertinoColors.secondaryLabel.resolveFrom(context);

    return GestureDetector(
      onTap: () => _toggle(name),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? blue.withValues(alpha: 0.12)
              : CupertinoColors.tertiarySystemFill.resolveFrom(context),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? blue.withValues(alpha: 0.5) : separatorColor,
            width: 0.5,
          ),
        ),
        child: isSelected && index != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: Center(
                      child: Text(
                        '$index',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: indexColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blue,
                    ),
                  ),
                ],
              )
            : Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: labelColor,
                ),
              ),
      ),
    );
  }
}
