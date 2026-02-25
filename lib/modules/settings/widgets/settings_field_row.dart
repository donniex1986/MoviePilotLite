import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';

/// 控件类型：用于根据类型渲染对应的 iOS 风格控件
enum SettingsControlType {
  /// 纯文本展示
  text,
  /// 文本 + 复制按钮
  textCopy,
  /// 数值 + 单位
  number,
  /// 下拉选择（展示当前值 + 右箭头）
  select,
  /// 开关，支持编辑时动态读取
  toggle,
}

/// 设定项行：标题 + 控件（+ 可选描述）
///
/// [compact] 为 true 时不显示图标与描述，单行展示，更简洁。
/// 支持 [editable] 模式，此时 TextField 与 Switch 的新值可通过 [onTextChanged] / [onSwitchChanged] 动态获取。
class SettingsFieldRow extends StatelessWidget {
  const SettingsFieldRow({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    // 以下二选一：使用 control 或使用 controlType + value 自动构建
    this.control,
    this.controlType,
    this.controlValue,
    this.unit,
    this.enumLabel,
    this.enableCopy = false,
    this.onCopyTap,
    // editable 模式：TextField/Switch 新值通过 onTextChanged/onSwitchChanged 动态获取
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

  /// 自定义右侧控件，与 controlType 互斥
  final Widget? control;

  /// 控件类型（与 control 二选一）
  final SettingsControlType? controlType;
  /// 控件当前值（用于 text/number/select/toggle 展示）
  final dynamic controlValue;
  /// 数值单位，如 "小时"
  final String? unit;
  /// 枚举展示文案（select 时优先使用）
  final String? enumLabel;
  /// 是否显示复制按钮（textCopy 或 text + enableCopy）
  final bool enableCopy;
  final VoidCallback? onCopyTap;

  /// 是否可编辑
  final bool editable;
  /// 文本编辑时使用（editable + text）
  final TextEditingController? textController;
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onTextSubmitted;
  /// 开关值（editable + toggle）
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  /// 数值步进（editable + number）
  final num? step;
  final ValueChanged<num>? onNumberChanged;

  /// 选择项（editable + select）
  final List<SettingsEnumOption>? selectOptions;
  final ValueChanged<String>? onSelectChanged;

  /// 紧凑模式：无图标、无描述，单行展示
  final bool compact;

  /// 编辑模式：可编辑控件样式
  final bool editMode;

  /// 密码输入框，文本是否遮挡
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final fg = iconColor ?? CupertinoColors.activeBlue;
    final bg = iconBackgroundColor ?? fg.withValues(alpha: 0.15);
    Widget controlWidget = control ?? _buildControlFromType(context);

    final showIcon = !compact && icon != null && !editMode;
    final showDesc = !compact && description != null && description!.isNotEmpty && !editMode;

    final leadingWidget = showIcon
        ? Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 14, color: fg),
          )
        : null;

    final titleWidget = showDesc
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: _titleStyle(context), maxLines: 1, overflow: TextOverflow.ellipsis),
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
          )
        : Text(
            title,
            style: _titleStyle(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );

    // text 编辑态使用上下布局：标题在上、多行输入框在下
    final isTextEditVertical =
        editMode &&
        editable &&
        (controlType == SettingsControlType.text || controlType == SettingsControlType.textCopy) &&
        textController != null;

    if (isTextEditVertical) {
      return CupertinoListTile.notched(
        leading: leadingWidget,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            titleWidget,
            const SizedBox(height: 8),
            CupertinoTextField(
              controller: textController!,
              obscureText: false, // 多行输入框不支持 obscureText
              onChanged: onTextChanged,
              onSubmitted: onTextSubmitted,
              minLines: 3,
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
              decoration: BoxDecoration(
                color: CupertinoColors.tertiarySystemFill.resolveFrom(context),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: CupertinoColors.separator.resolveFrom(context),
                  width: 0.5,
                ),
              ),
            ),
          ],
        ),
        additionalInfo: const SizedBox.shrink(),
        leadingToTitle: showIcon ? 8 : 0,
        padding: const EdgeInsetsDirectional.only(start: 12, end: 16, top: 10, bottom: 10),
      );
    }

    return CupertinoListTile.notched(
      leading: leadingWidget,
      title: titleWidget,
      additionalInfo: controlWidget,
      leadingToTitle: showIcon ? 8 : 0,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 16, top: 10, bottom: 10),
    );
  }

  Widget _buildControlFromType(BuildContext context) {
    if (controlType == null) return const SizedBox.shrink();

    switch (controlType!) {
      case SettingsControlType.toggle:
        if (editable && onSwitchChanged != null) {
          return CupertinoSwitch(
            value: switchValue,
            onChanged: onSwitchChanged,
          );
        }
        return CupertinoSwitch(
          value: _parseBool(controlValue),
          onChanged: null,
        );

      case SettingsControlType.text:
      case SettingsControlType.textCopy:
        final display = _displayValue;
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
              decoration: BoxDecoration(
                color: CupertinoColors.tertiarySystemFill.resolveFrom(context),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: CupertinoColors.separator.resolveFrom(context),
                  width: 0.5,
                ),
              ),
            ),
          );
        }
        if (enableCopy || controlType == SettingsControlType.textCopy) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
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
              ),
              if (display.isNotEmpty)
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

      case SettingsControlType.number:
        final display = _displayValue;
        if (editable && textController != null && onNumberChanged != null && step != null) {
          final stepVal = step!.toDouble();
          double currentFromController() {
            final s = textController!.text.trim();
            final n = double.tryParse(s);
            return n ?? _parseNumber(controlValue);
          }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: const EdgeInsets.all(4),
                minimumSize: Size.zero,
                onPressed: () {
                  final current = currentFromController();
                  final next = (current - stepVal).clamp(0, double.infinity);
                  textController!.text = next.toInt() == next ? next.toInt().toString() : next.toString();
                  onNumberChanged!(next);
                },
                child: Icon(CupertinoIcons.minus_circle_fill, size: 20, color: CupertinoColors.activeBlue),
              ),
              const SizedBox(width: 4),
              SizedBox(
                width: 48,
                child: CupertinoTextField(
                  controller: textController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (s) {
                    final n = num.tryParse(s);
                    if (n != null) onNumberChanged!(n);
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: CupertinoColors.label.resolveFrom(context)),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: CupertinoColors.tertiarySystemFill.resolveFrom(context),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              CupertinoButton(
                padding: const EdgeInsets.all(4),
                minimumSize: Size.zero,
                onPressed: () {
                  final current = currentFromController();
                  final next = current + stepVal;
                  textController!.text = next.toInt() == next ? next.toInt().toString() : next.toString();
                  onNumberChanged!(next);
                },
                child: Icon(CupertinoIcons.plus_circle_fill, size: 20, color: CupertinoColors.activeBlue),
              ),
            ],
          );
        }
        if (editable && textController != null) {
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
              style: TextStyle(fontSize: 15, color: CupertinoColors.label.resolveFrom(context)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: CupertinoColors.tertiarySystemFill.resolveFrom(context),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          );
        }
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

      case SettingsControlType.select:
        final display = enumLabel ?? controlValue?.toString() ?? '';
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
        if (editable && selectOptions != null && selectOptions!.isNotEmpty && onSelectChanged != null) {
          return GestureDetector(
            onTap: () => _showSelectSheet(context),
            child: row,
          );
        }
        return row;
    }
  }

  void _showSelectSheet(BuildContext context) {
    if (selectOptions == null || selectOptions!.isEmpty || onSelectChanged == null) return;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) => CupertinoActionSheet(
        actions: [
          for (final opt in selectOptions!)
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

  double _parseNumber(dynamic v) {
    if (v == null) return 0;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0;
  }

  String get _displayValue {
    if (controlType == SettingsControlType.number) {
      final s = controlValue?.toString() ?? '';
      return unit != null ? '$s $unit' : s;
    }
    return controlValue?.toString() ?? '';
  }

  TextStyle _titleStyle(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: CupertinoColors.secondaryLabel.resolveFrom(context),
      );

  bool _parseBool(dynamic v) {
    if (v == null) return false;
    if (v is bool) return v;
    final s = v.toString().toLowerCase();
    return s == 'true' || s == '1';
  }
}
