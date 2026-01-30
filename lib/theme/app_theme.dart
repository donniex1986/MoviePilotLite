import 'package:flutter/cupertino.dart';

/// 应用主题配置
class AppTheme {
  AppTheme._();

  /// 主题色 - 主色调
  static const Color primaryColor = CupertinoColors.activeBlue;

  /// 主题色 - 次要色
  static const Color secondaryColor = CupertinoColors.systemBlue;

  /// 成功色
  static const Color successColor = CupertinoColors.systemGreen;

  /// 错误色
  static const Color errorColor = CupertinoColors.systemRed;

  /// 警告色
  static const Color warningColor = CupertinoColors.systemOrange;

  /// 信息色
  static const Color infoColor = CupertinoColors.systemBlue;

  /// 背景色
  static const Color backgroundColor = CupertinoColors.systemGroupedBackground;

  /// 卡片背景色
  static const Color cardBackgroundColor = CupertinoColors.white;

  /// 文本主色
  static const Color textPrimaryColor = CupertinoColors.label;

  /// 文本次要色
  static const Color textSecondaryColor = CupertinoColors.systemGrey;

  /// 边框色
  static const Color borderColor = CupertinoColors.systemGrey4;

  /// 分隔线颜色
  static const Color dividerColor = CupertinoColors.separator;

  /// 获取 Cupertino 主题
  static CupertinoThemeData get cupertinoTheme {
    return CupertinoThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundColor,
      barBackgroundColor: cardBackgroundColor,
      textTheme: const CupertinoTextThemeData(
        primaryColor: textPrimaryColor,
        textStyle: TextStyle(
          color: textPrimaryColor,
          fontSize: 17,
        ),
      ),
    );
  }

  /// 获取深色主题（可选，用于未来扩展）
  static CupertinoThemeData get darkTheme {
    return CupertinoThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: CupertinoColors.black,
      barBackgroundColor: CupertinoColors.systemGrey6,
      textTheme: const CupertinoTextThemeData(
        primaryColor: CupertinoColors.white,
        textStyle: TextStyle(
          color: CupertinoColors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}

/// 主题扩展方法，方便获取主题色
extension ThemeExtension on BuildContext {
  /// 获取主题主色
  Color get primaryColor => CupertinoTheme.of(this).primaryColor;

  /// 获取背景色
  Color get backgroundColor =>
      CupertinoTheme.of(this).scaffoldBackgroundColor;

  /// 获取文本主色
  Color get textPrimaryColor =>
      CupertinoTheme.of(this).textTheme.textStyle.color ??
      AppTheme.textPrimaryColor;

  /// 获取文本次要色
  Color get textSecondaryColor => AppTheme.textSecondaryColor;
}
