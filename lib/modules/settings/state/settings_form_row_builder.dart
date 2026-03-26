import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_option_visuals.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_field_state.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_manager.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_field_row.dart';

class SettingsFormRowBuilder {
  const SettingsFormRowBuilder({
    required this.form,
    this.optionsOf,
    this.onCopied,
    this.optionLeadingOf,
  });

  final SettingsFormManager form;
  final List<SettingsEnumOption> Function(String enumKey)? optionsOf;
  final void Function(String text)? onCopied;
  final Widget? Function(
    BuildContext context,
    String enumKey,
    String value,
  )? optionLeadingOf;

  Widget buildRow(
    BuildContext context,
    SettingsFieldConfig field, {
    required bool editMode,
    required dynamic Function(String envKey) readValue,
  }) {
    final s = form.stateFor(field);
    final controlType = _toControlType(field.type);

    final notCopy = field.type != SettingsFieldType.textCopy;
    final rowEditable = editMode && notCopy;
    final value = s.effectiveValue;

    String? enumLabel;
    List<SettingsEnumOption>? selectOptions;
    if (field.type == SettingsFieldType.select && field.enumKey != null) {
      selectOptions = optionsOf?.call(field.enumKey!) ?? const [];
      final valStr = value?.toString();
      if (valStr != null) {
        for (final opt in selectOptions) {
          final optStr = opt.value.toString();
          if (optStr.toLowerCase() == valStr.toLowerCase()) {
            enumLabel = opt.label;
            break;
          }
        }
      }
      enumLabel ??= enumValueToLabel(field.enumKey!, value);
    }

    return SettingsFieldRow(
      title: field.label,
      description: field.hint,
      icon: field.icon,
      iconColor: CupertinoColors.inactiveGray,
      controlType: controlType,
      controlValue: value,
      unit: field.unit,
      enumLabel: enumLabel,
      enableCopy: field.type == SettingsFieldType.textCopy,
      onCopyTap: field.type == SettingsFieldType.textCopy
          ? () {
              final text = value?.toString() ?? '';
              if (text.isEmpty) return;
              Clipboard.setData(ClipboardData(text: text));
              onCopied?.call(text);
            }
          : null,
      editable: rowEditable,
      textController: notCopy && s is SettingsTextFieldState
          ? s.controller
          : notCopy && s is SettingsNumberFieldState
              ? s.controller
              : null,
      obscureText: field.obscureText,
      onTextChanged: null,
      onTextSubmitted: null,
      switchValue: s is SettingsToggleFieldState ? s.value.value : false,
      onSwitchChanged: rowEditable && s is SettingsToggleFieldState
          ? (v) => s.value.value = v
          : null,
      step: field.step,
      onNumberChanged: rowEditable && s is SettingsNumberFieldState
          ? (n) => s.setNumber(n)
          : null,
      selectOptions: selectOptions,
      onSelectChanged:
          rowEditable && s is SettingsSelectFieldState && selectOptions != null
              ? (v) => s.value.value = v
              : null,
      selectOptionLeadingBuilder:
          field.enumKey != null
              ? (opt) =>
                  (optionLeadingOf ?? buildSettingsOptionLeading)(
                    context,
                    field.enumKey!,
                    opt.value,
                  )
              : null,
      selectAllowInput: field.envKey == 'LLM_MODEL',
      isEditing: editMode,
    );
  }

  SettingsControlType _toControlType(SettingsFieldType t) {
    switch (t) {
      case SettingsFieldType.text:
        return SettingsControlType.text;
      case SettingsFieldType.textCopy:
        return SettingsControlType.textCopy;
      case SettingsFieldType.number:
        return SettingsControlType.number;
      case SettingsFieldType.select:
        return SettingsControlType.select;
      case SettingsFieldType.toggle:
        return SettingsControlType.toggle;
    }
  }
}

