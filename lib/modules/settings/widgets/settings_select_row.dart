import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_textinput_row.dart';

class SettingsSelectRow extends StatefulWidget {
  const SettingsSelectRow({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.compact = false,
    this.editMode = false,
    required this.display,
    required this.editable,
    required this.selectOptions,
    this.onSelectChanged,
    this.optionLeadingBuilder,
    this.allowInput = false,
  });

  final String title;
  final String? description;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final bool compact;
  final bool editMode;

  final String display;
  final bool editable;
  final List<SettingsEnumOption> selectOptions;
  final ValueChanged<String>? onSelectChanged;
  final Widget? Function(SettingsEnumOption opt)? optionLeadingBuilder;
  final bool allowInput;

  @override
  State<SettingsSelectRow> createState() => _SettingsSelectRowState();
}

class _SettingsSelectRowState extends State<SettingsSelectRow> {
  late final TextEditingController _displayController;

  @override
  void initState() {
    super.initState();
    _displayController = TextEditingController(text: widget.display);
  }

  @override
  void didUpdateWidget(SettingsSelectRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.display != widget.display &&
        _displayController.text != widget.display) {
      _displayController.text = widget.display;
    }
  }

  @override
  void dispose() {
    _displayController.dispose();
    super.dispose();
  }

  void _updateSelectDisplay({required String value, required String label}) {
    _displayController.text = widget.allowInput ? value : label;
    widget.onSelectChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final canPick =
        widget.editable &&
        widget.selectOptions.isNotEmpty &&
        widget.onSelectChanged != null;
    final readOnlySelectHint =
        !canPick && widget.selectOptions.isNotEmpty && !widget.allowInput;

    Widget? suffix;
    if (canPick) {
      suffix = PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(25),
        tooltip: '选择',
        onSelected: (value) {
          for (final opt in widget.selectOptions) {
            if (opt.value == value) {
              _updateSelectDisplay(value: opt.value, label: opt.label);
              return;
            }
          }
        },
        itemBuilder: (context) => widget.selectOptions
            .map(
              (opt) => PopupMenuItem<String>(
                value: opt.value,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.optionLeadingBuilder != null)
                      ...(() {
                        final w = widget.optionLeadingBuilder!(opt);
                        if (w == null) return const <Widget>[];
                        return <Widget>[w, const SizedBox(width: 8)];
                      })(),
                    Text(
                      opt.label,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        child: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    } else if (readOnlySelectHint) {
      suffix = Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).disabledColor,
      );
    }

    return SettingsTextInputRow(
      title: widget.title,
      description: widget.description,
      icon: widget.icon,
      iconColor: widget.iconColor,
      editable: widget.editable && widget.allowInput,
      onTextChanged: widget.editable && widget.allowInput
          ? widget.onSelectChanged
          : null,
      onTextSubmitted: widget.editable && widget.allowInput
          ? widget.onSelectChanged
          : null,
      textController: _displayController,
      enabled: true,
      suffix: suffix,
    );
  }
}
