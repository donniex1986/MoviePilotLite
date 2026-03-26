import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_textinput_row.dart';

class SettingsNumberRow extends StatelessWidget {
  const SettingsNumberRow({
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
    this.textController,
    this.step,
    this.onNumberChanged,
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
  final TextEditingController? textController;
  final num? step;
  final ValueChanged<num>? onNumberChanged;

  @override
  Widget build(BuildContext context) {
    return SettingsTextInputRow(
      title: title,
      description: description,
      icon: icon,
      iconColor: iconColor,
      editable: editable,
      textController: textController,
      keyboardType: TextInputType.number,
      onTextChanged: (s) {
        final n = int.tryParse(s);
        if (n != null && onNumberChanged != null) onNumberChanged!(n);
      },
      onTextSubmitted: (s) {
        final n = int.tryParse(s);
        if (n != null && onNumberChanged != null) onNumberChanged!(n);
      },
      enabled: true,
      suffix: step != null && onNumberChanged != null
          ? IconButton(
              onPressed: () => _applyStep(
                textController!,
                onNumberChanged!,
                step!.toDouble(),
              ),
              icon: Icon(
                CupertinoIcons.plus_circle_fill,
                size: 22,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          : null,
    );
  }

  static void _applyStep(
    TextEditingController c,
    ValueChanged<num> onNumberChanged,
    double delta,
  ) {
    final s = c.text.trim();
    final current = int.tryParse(s) ?? 0;
    final next = (current + delta).clamp(0, double.infinity);
    c.text = next.toInt().toString();
    onNumberChanged(next.toInt());
  }
}
