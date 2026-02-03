import 'package:flutter/cupertino.dart';

import '../theme/app_theme.dart';

/// 自定义按钮组件
/// 支持 icon、text、loading 状态
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.isLoading = false,
    this.isFilled = true,
    this.borderRadius = 12.0,
    this.padding,
    this.color,
    this.disabledColor,
    this.textStyle,
    this.iconSize = 20.0,
    this.minSize = 44.0,
  });

  /// 点击回调
  final VoidCallback? onPressed;

  /// 按钮文本
  final String? text;

  /// 按钮图标
  final IconData? icon;

  /// 是否加载中
  final bool isLoading;

  /// 是否填充样式（filled 或 outlined）
  final bool isFilled;

  /// 圆角大小
  final double borderRadius;

  /// 内边距
  final EdgeInsets? padding;

  /// 按钮颜色（filled 模式）
  final Color? color;

  /// 禁用状态颜色
  final Color? disabledColor;

  /// 文本样式
  final TextStyle? textStyle;

  /// 图标大小
  final double iconSize;

  /// 最小尺寸
  final double minSize;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;
    final buttonColor = color ?? context.primaryColor;
    final effectiveColor = isDisabled
        ? (disabledColor ?? CupertinoColors.systemGrey4)
        : buttonColor;

    if (isFilled) {
      return CupertinoButton.filled(
        onPressed: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        padding: padding,
        color: buttonColor,
        child: _buildContent(context),
      );
    } else {
      return CupertinoButton(
        onPressed: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        padding: padding,
        color: isDisabled ? null : buttonColor,
        child: Container(
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: effectiveColor, width: 1.5),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: _buildContent(context),
        ),
      );
    }
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return const CupertinoActivityIndicator();
    }

    final hasIcon = icon != null;
    final hasText = text != null && text!.isNotEmpty;

    if (!hasIcon && !hasText) {
      return const SizedBox.shrink();
    }

    if (hasIcon && hasText) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: isFilled
                ? CupertinoColors.white
                : (onPressed == null
                      ? CupertinoColors.systemGrey4
                      : context.primaryColor),
          ),
          const SizedBox(width: 8),
          Text(
            text!,
            style:
                textStyle ??
                TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: isFilled
                      ? CupertinoColors.white
                      : (onPressed == null
                            ? CupertinoColors.systemGrey4
                            : context.primaryColor),
                ),
          ),
        ],
      );
    } else if (hasIcon) {
      return Icon(
        icon,
        size: iconSize,
        color: isFilled
            ? CupertinoColors.white
            : (onPressed == null
                  ? CupertinoColors.systemGrey4
                  : CupertinoColors.activeBlue),
      );
    } else {
      return Text(
        text!,
        style:
            textStyle ??
            TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: isFilled
                  ? CupertinoColors.white
                  : (onPressed == null
                        ? CupertinoColors.systemGrey4
                        : CupertinoColors.activeBlue),
            ),
      );
    }
  }
}
