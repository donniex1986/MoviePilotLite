import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/rule/models/rule_models.dart';

/// 优先级规则顺序多选 Picker 页面（支持拖拽排序）
class PriorityRuleOrderPickerPage extends StatelessWidget {
  const PriorityRuleOrderPickerPage({
    super.key,
    required this.rules,
    required this.selectedNames,
  });

  final List<UserFilterRuleGroup> rules;
  final List<String> selectedNames;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_PriorityRuleOrderState>(
      init: _PriorityRuleOrderState(
        rules: rules,
        selectedNames: List.from(selectedNames),
      ),
      builder: (state) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.back(),
              child: const Icon(CupertinoIcons.xmark),
            ),
            middle: const Text('优先级规则'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                final result = state.orderedSelectedNames
                    .where((n) => state.enabledNames.contains(n))
                    .toList();
                Get.back(result: result);
              },
              child: const Text('完成'),
            ),
            border: null,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '拖动调整顺序，开关控制是否启用',
                    style: TextStyle(
                      fontSize: 13,
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                  ),
                ),
                Expanded(
                  child: ReorderableListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.orderedSelectedNames.length,
                    onReorder: (oldIndex, newIndex) {
                      state.reorder(oldIndex, newIndex);
                    },
                    itemBuilder: (context, index) {
                      final name = state.orderedSelectedNames[index];
                      final enabled = state.enabledNames.contains(name);
                      return _PriorityRuleItem(
                        key: ValueKey(name),
                        name: name,
                        enabled: enabled,
                        onToggle: () => state.toggle(name),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CupertinoButton.filled(
                    onPressed: () => _showAddRuleSheet(context, state),
                    child: const Text('添加规则'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddRuleSheet(BuildContext context, _PriorityRuleOrderState state) {
    final available = rules
        .map((r) => r.name)
        .where((n) => n.isNotEmpty && !state.orderedSelectedNames.contains(n))
        .toList();
    if (available.isEmpty) {
      Get.snackbar('提示', '没有可添加的规则');
      return;
    }
    showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) => Container(
        height: 300,
        color: CupertinoColors.systemBackground.resolveFrom(ctx),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('选择要添加的规则', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: available.length,
                itemBuilder: (ctx, i) {
                  final name = available[i];
                  return ListTile(
                    title: Text(name),
                    onTap: () {
                      state.add(name);
                      Navigator.pop(ctx);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriorityRuleItem extends StatelessWidget {
  const _PriorityRuleItem({
    super.key,
    required this.name,
    required this.enabled,
    required this.onToggle,
  });

  final String name;
  final bool enabled;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.secondarySystemGroupedBackground.resolveFrom(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          CupertinoIcons.line_horizontal_3,
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: enabled
                ? CupertinoColors.label.resolveFrom(context)
                : CupertinoColors.tertiaryLabel.resolveFrom(context),
          ),
        ),
        trailing: CupertinoSwitch(value: enabled, onChanged: (_) => onToggle()),
      ),
    );
  }
}

class _PriorityRuleOrderState extends GetxController {
  _PriorityRuleOrderState({
    required this.rules,
    required List<String> selectedNames,
  }) {
    orderedSelectedNames.addAll(selectedNames);
    enabledNames.addAll(selectedNames);
  }

  final List<UserFilterRuleGroup> rules;
  final orderedSelectedNames = <String>[].obs;
  final enabledNames = <String>{}.obs;

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final item = orderedSelectedNames.removeAt(oldIndex);
    orderedSelectedNames.insert(newIndex, item);
    update();
  }

  void toggle(String name) {
    if (enabledNames.contains(name)) {
      enabledNames.remove(name);
    } else {
      enabledNames.add(name);
    }
    update();
  }

  void add(String name) {
    if (!orderedSelectedNames.contains(name)) {
      orderedSelectedNames.add(name);
      enabledNames.add(name);
    }
    update();
  }
}
