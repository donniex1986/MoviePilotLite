import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';

/// 控件类型
enum SettingsControlType { text, textCopy, number, select, toggle }

/// 设定项行：标题 + 控件（+ 可选描述、图标）
///
/// 通过 [controlType] + 对应参数 或 直接传入 [control] 自定义右侧控件。
/// [compact] 为 true 时无图标、无描述。
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
    this.compact = false,
    this.editMode = false,
    this.obscureText = false,
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
  final bool compact;
  final bool editMode;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final ctrl = control ?? _buildControl(context);
    final leading = _buildLeading(context);
    final titleWidget = _buildTitle(context);

    final isTextEditVertical =
        editMode &&
        editable &&
        (controlType == SettingsControlType.text ||
            controlType == SettingsControlType.textCopy) &&
        textController != null;

    if (isTextEditVertical) {
      return CupertinoListTile.notched(
        leading: leading,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            titleWidget,
            const SizedBox(height: 8),
            _buildMultilineInput(context),
          ],
        ),
        additionalInfo: const SizedBox.shrink(),
        leadingToTitle: leading != null ? 8 : 0,
        padding: const EdgeInsetsDirectional.only(
          start: 12,
          end: 16,
          top: 10,
          bottom: 10,
        ),
      );
    }

    return CupertinoListTile.notched(
      leading: leading,
      title: titleWidget,
      additionalInfo: ctrl,
      leadingToTitle: leading != null ? 8 : 0,
      padding: const EdgeInsetsDirectional.only(
        start: 12,
        end: 16,
        top: 10,
        bottom: 10,
      ),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (compact || icon == null || editMode) return null;
    final fg = iconColor ?? CupertinoColors.activeBlue;
    final bg = iconBackgroundColor ?? fg.withValues(alpha: 0.15);
    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 14, color: fg),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final showDesc =
        !compact && description != null && description!.isNotEmpty && !editMode;
    final style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: CupertinoColors.secondaryLabel.resolveFrom(context),
    );
    if (showDesc) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 1),
          Text(
            description!,
            style: TextStyle(
              fontSize: 12,
              color: CupertinoColors.tertiaryLabel.resolveFrom(context),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    }
    return Text(
      title,
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// 输入框：透明背景 + 淡色外边框
  BoxDecoration _inputDecoration(BuildContext context) => BoxDecoration(
    color: const Color(0x00000000),
    border: Border.all(
      color: CupertinoColors.separator
          .resolveFrom(context)
          .withValues(alpha: 0.4),
      width: 1,
    ),
    borderRadius: BorderRadius.circular(6),
  );

  Widget _buildMultilineInput(BuildContext context) => CupertinoTextField(
    controller: textController!,
    onChanged: onTextChanged,
    onSubmitted: onTextSubmitted,
    minLines: 1,
    maxLines: 8,
    placeholder: '输入',
    placeholderStyle: TextStyle(
      fontSize: 15,
      color: CupertinoColors.tertiaryLabel.resolveFrom(context),
    ),
    style: TextStyle(
      fontSize: 15,
      color: CupertinoColors.label.resolveFrom(context),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: _inputDecoration(context),
  );

  Widget _buildControl(BuildContext context) {
    if (controlType == null) return const SizedBox.shrink();
    switch (controlType!) {
      case SettingsControlType.toggle:
        return _SwitchControl(
          value: editable ? switchValue : _parseBool(controlValue),
          onChanged: editable ? onSwitchChanged : null,
        );
      case SettingsControlType.text:
      case SettingsControlType.textCopy:
        return _TextControl(
          display: _displayValue,
          editable: editable,
          textController: textController,
          obscureText: obscureText,
          enableCopy: enableCopy || controlType == SettingsControlType.textCopy,
          onCopyTap: onCopyTap,
          onTextChanged: onTextChanged,
          onTextSubmitted: onTextSubmitted,
          decoration: _inputDecoration(context),
        );
      case SettingsControlType.number:
        return _NumberControl(
          display: _displayValue,
          editable: editable,
          textController: textController,
          step: step,
          onNumberChanged: onNumberChanged,
          decoration: _inputDecoration(context),
        );
      case SettingsControlType.select:
        return _SelectControl(
          display: enumLabel ?? controlValue?.toString() ?? '',
          editable:
              editable &&
              selectOptions != null &&
              selectOptions!.isNotEmpty &&
              onSelectChanged != null,
          selectOptions: selectOptions ?? [],
          onSelectChanged: onSelectChanged,
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

class _SwitchControl extends StatelessWidget {
  const _SwitchControl({required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) =>
      CupertinoSwitch(value: value, onChanged: onChanged);
}

class _TextControl extends StatelessWidget {
  const _TextControl({
    required this.display,
    required this.editable,
    this.textController,
    this.obscureText = false,
    this.enableCopy = false,
    this.onCopyTap,
    this.onTextChanged,
    this.onTextSubmitted,
    required this.decoration,
  });

  final String display;
  final bool editable;
  final TextEditingController? textController;
  final bool obscureText;
  final bool enableCopy;
  final VoidCallback? onCopyTap;
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onTextSubmitted;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    if (editable && textController != null) {
      return SizedBox(
        width: 130,
        child: CupertinoTextField(
          controller: textController,
          obscureText: obscureText,
          onChanged: onTextChanged,
          onSubmitted: onTextSubmitted,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 15,
            color: CupertinoColors.label.resolveFrom(context),
          ),
          placeholder: '输入',
          placeholderStyle: TextStyle(
            fontSize: 15,
            color: CupertinoColors.tertiaryLabel.resolveFrom(context),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: decoration,
        ),
      );
    }
    final text = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 165),
      child: Text(
        display,
        style: TextStyle(
          fontSize: 15,
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
      ),
    );
    if (enableCopy && display.isNotEmpty && onCopyTap != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          text,
          CupertinoButton(
            padding: const EdgeInsets.only(left: 4),
            minimumSize: Size.zero,
            onPressed: onCopyTap,
            child: Icon(
              CupertinoIcons.doc_on_doc,
              size: 17,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ],
      );
    }
    return text;
  }
}

class _NumberControl extends StatelessWidget {
  const _NumberControl({
    required this.display,
    required this.editable,
    this.textController,
    this.step,
    this.onNumberChanged,
    required this.decoration,
  });

  final String display;
  final bool editable;
  final TextEditingController? textController;
  final num? step;
  final ValueChanged<num>? onNumberChanged;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    if (!editable || textController == null) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 165),
        child: Text(
          display,
          style: TextStyle(
            fontSize: 15,
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.end,
        ),
      );
    }
    if (step != null && onNumberChanged != null) {
      final stepVal = step!.toDouble();
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(4),
            minimumSize: Size.zero,
            onPressed: () => _step(-stepVal),
            child: Icon(
              CupertinoIcons.minus_circle_fill,
              size: 20,
              color: CupertinoColors.activeBlue,
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: 48,
            child: CupertinoTextField(
              controller: textController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (s) {
                final n = num.tryParse(s);
                if (n != null) onNumberChanged!(n);
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: CupertinoColors.label.resolveFrom(context),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: decoration,
            ),
          ),
          const SizedBox(width: 4),
          CupertinoButton(
            padding: const EdgeInsets.all(4),
            minimumSize: Size.zero,
            onPressed: () => _step(stepVal),
            child: Icon(
              CupertinoIcons.plus_circle_fill,
              size: 20,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ],
      );
    }
    return SizedBox(
      width: 70,
      child: CupertinoTextField(
        controller: textController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onSubmitted: (s) {
          final n = num.tryParse(s);
          if (n != null && onNumberChanged != null) onNumberChanged!(n);
        },
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 15,
          color: CupertinoColors.label.resolveFrom(context),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: decoration,
      ),
    );
  }

  void _step(double delta) {
    final s = textController!.text.trim();
    final current = double.tryParse(s) ?? 0;
    final next = (current + delta).clamp(0, double.infinity);
    textController!.text = next == next.roundToDouble()
        ? next.toInt().toString()
        : next.toString();
    onNumberChanged?.call(next);
  }
}

class _SelectControl extends StatelessWidget {
  const _SelectControl({
    required this.display,
    required this.editable,
    required this.selectOptions,
    this.onSelectChanged,
  });

  final String display;
  final bool editable;
  final List<SettingsEnumOption> selectOptions;
  final ValueChanged<String>? onSelectChanged;

  @override
  Widget build(BuildContext context) {
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 140),
          child: Text(
            display,
            style: TextStyle(
              fontSize: 15,
              color: editable
                  ? CupertinoColors.activeBlue
                  : CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: 2),
        Icon(
          CupertinoIcons.chevron_forward,
          size: 12,
          color: CupertinoColors.tertiaryLabel.resolveFrom(context),
        ),
      ],
    );
    if (editable && selectOptions.isNotEmpty && onSelectChanged != null) {
      return GestureDetector(onTap: () => _showSheet(context), child: row);
    }
    return row;
  }

  void _showSheet(BuildContext context) {
    if (selectOptions.isEmpty || onSelectChanged == null) return;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) => CupertinoActionSheet(
        actions: [
          for (final opt in selectOptions)
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(ctx).pop();
                onSelectChanged!(opt.value);
              },
              child: Text(opt.label),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('取消'),
        ),
      ),
    );
  }
}
