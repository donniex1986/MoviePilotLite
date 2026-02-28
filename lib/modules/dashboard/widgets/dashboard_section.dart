import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/dashboard/widgets/dashboard_widget_header.dart';
import 'package:moviepilot_mobile/theme/section.dart';

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardWidgetHeader(
            title: title,
            icon: icon,
            onTapMore: onTapMore,
          ),
        ),
        Section(child: child),
        SizedBox(height: 16),
      ],
    );
  }
}
