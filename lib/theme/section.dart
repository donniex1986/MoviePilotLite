import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppTheme.defaultBorderRadius),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(AppTheme.defaultBorderRadius),
    ),
  });
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).cardColor;
    return Container(
      padding: padding,
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: child,
    );
  }
}
