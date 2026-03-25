import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTextInputRow extends StatelessWidget {
  const SettingsTextInputRow({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconColor,
    required this.editable,
    this.textController,
    this.obscureText = false,
    this.onTextChanged,
    this.onTextSubmitted,
    this.maxLines,
    this.keyboardType,
    this.countableLength,
    this.enabled = true,
    this.suffix,
  });

  final String title;
  final String? description;
  final IconData? icon;
  final Color? iconColor;

  final bool editable;
  final TextEditingController? textController;
  final bool obscureText;
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onTextSubmitted;
  final int? maxLines;
  final TextInputType? keyboardType;
  final int? countableLength;
  final bool enabled;

  final Widget? suffix;
  String? get _helperText {
    final s = description?.trim();
    if (s == null || s.isEmpty) return null;
    return description;
  }

  InputDecoration _decoration(
    BuildContext context, {
    bool alignEnd = false,
    String? hintText,
  }) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.5),
      ),
    );
    final fucusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: CupertinoColors.systemGrey.withValues(alpha: 0.5),
      ),
    );
    return InputDecoration(
      labelText: title,
      helperText: _helperText,
      helperMaxLines: 2,
      hintText: hintText,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      enabledBorder: fucusBorder,
      focusedBorder: border,
      border: border,
      filled: true,
      fillColor: Colors.transparent,
      alignLabelWithHint: alignEnd,
      counterText: countableLength != null
          ? '${textController?.text.length ?? 0}/$countableLength'
          : null,
      suffixIcon: _buildSuffixIcon(context),
      prefixIcon: _buildPrefixIcon(context),
    );
  }

  Widget? _buildPrefixIcon(BuildContext context) {
    return icon != null ? Icon(icon, color: iconColor, size: 15) : null;
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (suffix != null) return suffix;
    return null;
  }

  Widget _buildSingleLineInput(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          readOnly: !editable,
          enabled: true,
          maxLines: maxLines,
          keyboardType: keyboardType,
          controller: textController,
          obscureText: obscureText,
          onChanged: onTextChanged,
          onSubmitted: onTextSubmitted,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),
          decoration: _decoration(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSingleLineInput(context);
  }
}
