import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
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
