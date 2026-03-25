import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_textinput_row.dart';

class SettingsSelectRow extends StatelessWidget {
  SettingsSelectRow({
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
  }) : displayController = TextEditingController(text: display);

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
  final TextEditingController displayController;
  final Widget? Function(SettingsEnumOption opt)? optionLeadingBuilder;
  final bool allowInput;

  @override
  Widget build(BuildContext context) {
    final canPick =
        editable && selectOptions.isNotEmpty && onSelectChanged != null;
    return SettingsTextInputRow(
      title: title,
      description: description,
      icon: icon,
      iconColor: iconColor,
      editable: editable && allowInput,
      onTextChanged: editable && allowInput ? onSelectChanged : null,
      onTextSubmitted: editable && allowInput ? onSelectChanged : null,
      textController: displayController,
      enabled: true,
      suffix: canPick
          ? PopupMenuButton(
              borderRadius: BorderRadius.circular(25),
              offset: Offset(0, 40),
              itemBuilder: (context) => selectOptions
                  .map(
                    (opt) => PopupMenuItem(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (optionLeadingBuilder != null)
                            ...(() {
                              final w = optionLeadingBuilder!(opt);
                              if (w == null) return const <Widget>[];
                              return <Widget>[w, const SizedBox(width: 8)];
                            })(),
                          Text(
                            opt.label,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      onTap: () => updateSelectDisplay(
                        value: opt.value,
                        label: opt.label,
                      ),
                    ),
                  )
                  .toList(),
              child: Icon(
                Icons.more_vert_outlined,
                color: Theme.of(context).primaryColor,
              ),
            )
          : null,
    );
  }

  void updateSelectDisplay({required String value, required String label}) {
    displayController.text = allowInput ? value : label;
    onSelectChanged?.call(value);
  }
}
