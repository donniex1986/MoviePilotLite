import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/dashboard/widgets/dashboard_widget_header.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({
    super.key,
    required this.child,
    required this.title,
    required this.icon,
    this.onTapMore,
    this.children,
  });
  final Widget child;
  final String title;
  final IconData icon;
  final VoidCallback? onTapMore;
  final List<Widget>? children;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).cardColor;
    return CupertinoListSection.insetGrouped(
      backgroundColor: color.withValues(alpha: 0.1),
      margin: EdgeInsets.zero,
      header: DashboardWidgetHeader(
        title: title,
        icon: icon,
        onTapMore: onTapMore,
      ),
      children:
          children ??
          [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: child,
            ),
          ],
    );
  }
}
