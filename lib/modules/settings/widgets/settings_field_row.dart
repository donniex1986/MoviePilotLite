import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_custom_row.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_number_row.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_select_row.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_switch_row.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_textinput_row.dart';

/// 控件类型
enum SettingsControlType { text, textCopy, number, select, toggle }

/// 工厂分发：根据 [controlType] 返回对应的完整行组件。
class SettingsFieldRow extends StatelessWidget {
  const SettingsFieldRow({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.control,
    this.controlType,
    this.controlValue,
    this.unit,
    this.enumLabel,
    this.enableCopy = false,
    this.onCopyTap,
    this.editable = false,
    this.textController,
    this.onTextChanged,
    this.onTextSubmitted,
    this.switchValue = false,
    this.onSwitchChanged,
    this.step,
    this.onNumberChanged,
    this.selectOptions,
    this.onSelectChanged,
    this.selectOptionLeadingBuilder,
    this.selectAllowInput = false,
    this.obscureText = false,
    this.isEditing = false,
  });

  final String title;
  final String? description;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Widget? control;
  final SettingsControlType? controlType;
  final dynamic controlValue;
  final String? unit;
  final String? enumLabel;
  final bool enableCopy;
  final VoidCallback? onCopyTap;
  final bool editable;
  final TextEditingController? textController;
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onTextSubmitted;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final num? step;
  final ValueChanged<num>? onNumberChanged;
  final List<SettingsEnumOption>? selectOptions;
  final ValueChanged<String>? onSelectChanged;
  final Widget? Function(SettingsEnumOption opt)? selectOptionLeadingBuilder;
  final bool selectAllowInput;
  final bool obscureText;
  final bool isEditing;
  @override
  Widget build(BuildContext context) {
    if (control != null) {
      return SettingsCustomRow(
        title: title,
        description: description,
        icon: icon,
        iconColor: iconColor,
        iconBackgroundColor: iconBackgroundColor,
        control: control!,
      );
    }

    switch (controlType) {
      case SettingsControlType.toggle:
        return SettingsSwitchRow(
          title: title,
          description: description,
          icon: icon,
          iconColor: iconColor,
          iconBackgroundColor: iconBackgroundColor,
          value: editable ? switchValue : _parseBool(controlValue),
          onChanged: editable ? onSwitchChanged : null,
        );
      case SettingsControlType.text:
        return SettingsTextInputRow(
          title: title,
          description: description,
          icon: icon,
          iconColor: iconColor,
          editable: editable,
          textController: textController,
          obscureText: obscureText,
          onTextChanged: onTextChanged,
          onTextSubmitted: onTextSubmitted,
          enabled: true,
        );
      case SettingsControlType.textCopy:
        return SettingsTextInputRow(
          title: title,
          description: description,
          icon: icon,
          iconColor: iconColor,
          editable: editable,
          textController:
              textController ??
              TextEditingController(text: controlValue?.toString() ?? ''),
          obscureText: obscureText,
          onTextChanged: onTextChanged,
          onTextSubmitted: onTextSubmitted,
          enabled: false,
          suffix: enableCopy
              ? IconButton(
                  onPressed: onCopyTap,
                  icon: Icon(Icons.copy, color: Theme.of(context).primaryColor),
                )
              : null,
        );
      case SettingsControlType.number:
        return SettingsNumberRow(
          title: title,
          description: description,
          icon: icon,
          iconColor: iconColor,
          iconBackgroundColor: iconBackgroundColor,
          display: _displayValue,
          editable: editable,
          textController: textController,
          step: step,
          onNumberChanged: onNumberChanged,
        );
      case SettingsControlType.select:
        final hasOptions = selectOptions != null && selectOptions!.isNotEmpty;
        final canInput = editable && selectAllowInput;
        final canPick = editable && hasOptions && onSelectChanged != null;
        return SettingsSelectRow(
          title: title,
          description: description,
          icon: icon,
          iconColor: iconColor,
          iconBackgroundColor: iconBackgroundColor,
          display: enumLabel ?? controlValue?.toString() ?? '',
          editable: canInput || canPick,
          selectOptions: selectOptions ?? const [],
          onSelectChanged: onSelectChanged,
          optionLeadingBuilder: selectOptionLeadingBuilder,
          allowInput: canInput,
        );
      case null:
        return SettingsCustomRow(
          title: title,
          description: description,
          icon: icon,
          iconColor: iconColor,
          iconBackgroundColor: iconBackgroundColor,
          control: const SizedBox.shrink(),
        );
    }
  }

  String get _displayValue {
    if (controlType == SettingsControlType.number) {
      final s = controlValue?.toString() ?? '';
      return unit != null ? '$s $unit' : s;
    }
    return controlValue?.toString() ?? '';
  }

  static bool _parseBool(dynamic v) {
    if (v == null) return false;
    if (v is bool) return v;
    return v.toString().toLowerCase() == 'true' || v.toString() == '1';
  }
}
