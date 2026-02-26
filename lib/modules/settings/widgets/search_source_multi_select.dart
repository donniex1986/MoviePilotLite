import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';

/// 媒体搜索数据源多选组件
/// 展示已选芯片，点击可打开多选弹窗
class SearchSourceMultiSelect extends StatelessWidget {
  const SearchSourceMultiSelect({
    super.key,
    required this.value,
    required this.onChanged,
    required this.editable,
  });

  /// 当前值：逗号分隔的字符串，如 "themoviedb,douban,bangumi"
  final String? value;
  final ValueChanged<String>? onChanged;
  final bool editable;

  static List<SettingsEnumOption> get _options =>
      settingsEnums['SEARCH_SOURCE'] ?? [];

  List<String> _parseSelected(String? raw) {
    if (raw == null || raw.trim().isEmpty) return [];
    return raw
        .split(',')
        .map((s) => s.trim().toLowerCase())
        .where((s) => s.isNotEmpty)
        .toList();
  }

  String _serialize(List<String> selected) => selected.join(',');

  void _showMultiSelectSheet(BuildContext context) {
    final selected = _parseSelected(value).toSet();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) => _SearchSourceMultiSelectSheet(
        options: _options,
        initialSelected: selected,
        onConfirm: (newSelected) {
          Navigator.of(ctx).pop();
          onChanged?.call(_serialize(newSelected.toList()));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selected = _parseSelected(value);
    final optionValues = _options.map((o) => o.value.toLowerCase()).toList();
    final orderedSelected = selected
        .where((v) => optionValues.contains(v))
        .toList()
      ..sort((a, b) => optionValues.indexOf(a).compareTo(optionValues.indexOf(b)));
    final labels = orderedSelected
        .map((v) => _options.firstWhere(
              (o) => o.value.toLowerCase() == v,
              orElse: () => SettingsEnumOption(value: v, label: v),
            ).label)
        .toList();

    return GestureDetector(
      onTap: editable ? () => _showMultiSelectSheet(context) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: CupertinoColors.tertiarySystemFill.resolveFrom(context),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: CupertinoColors.separator.resolveFrom(context),
            width: 0.5,
          ),
        ),
        child: labels.isEmpty
            ? Row(
                children: [
                  Icon(
                    CupertinoIcons.search,
                    size: 18,
                    color: CupertinoColors.tertiaryLabel.resolveFrom(context),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '请选择数据源',
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          CupertinoColors.tertiaryLabel.resolveFrom(context),
                    ),
                  ),
                  if (editable) ...[
                    const Spacer(),
                    Icon(
                      CupertinoIcons.chevron_up,
                      size: 14,
                      color:
                          CupertinoColors.tertiaryLabel.resolveFrom(context),
                    ),
                  ],
                ],
              )
            : Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...labels.map(
                    (label) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeBlue.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: CupertinoColors.activeBlue.withValues(alpha: 0.35),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            label,
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  CupertinoColors.label.resolveFrom(context),
                            ),
                          ),
                          if (editable) ...[
                            const SizedBox(width: 4),
                            Icon(
                              CupertinoIcons.checkmark_circle_fill,
                              size: 14,
                              color: CupertinoColors.activeBlue,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  if (editable)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.tertiarySystemFill
                            .resolveFrom(context),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: CupertinoColors.separator.resolveFrom(context),
                          width: 0.5,
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.chevron_up,
                        size: 14,
                        color:
                            CupertinoColors.tertiaryLabel.resolveFrom(context),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

class _SearchSourceMultiSelectSheet extends StatefulWidget {
  const _SearchSourceMultiSelectSheet({
    required this.options,
    required this.initialSelected,
    required this.onConfirm,
  });

  final List<SettingsEnumOption> options;
  final Set<String> initialSelected;
  final ValueChanged<Set<String>> onConfirm;

  @override
  State<_SearchSourceMultiSelectSheet> createState() =>
      _SearchSourceMultiSelectSheetState();
}

class _SearchSourceMultiSelectSheetState
    extends State<_SearchSourceMultiSelectSheet> {
  late Set<String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = Set.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('取消'),
                  ),
                  const Text(
                    '媒体搜索数据源',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => widget.onConfirm(_selected),
                    child: const Text('确定'),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: CupertinoColors.separator.resolveFrom(context),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  final opt = widget.options[index];
                  final val = opt.value.toLowerCase();
                  final isSelected = _selected.contains(val);
                  return CupertinoListTile(
                    title: Text(opt.label),
                    trailing: isSelected
                        ? Icon(
                            CupertinoIcons.checkmark_circle_fill,
                            color: CupertinoColors.activeBlue,
                          )
                        : null,
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selected.remove(val);
                        } else {
                          _selected.add(val);
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
    );
  }
}
