import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/controllers/settings_sub_list_controller.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_config.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';

class SettingsSubListPage extends GetView<SettingsSubListController> {
  const SettingsSubListPage({super.key});

  static const double _horizontalPadding = 16;
  static const double _borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final items = controller.items;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Get.back(),
        ),
        title: Text(
          controller.pageTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: items.isEmpty
            ? Center(
                child: Text(
                  '暂无子项',
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                ),
              )
            : ListView(
                padding: const EdgeInsets.fromLTRB(_horizontalPadding, 12, _horizontalPadding, 24),
                children: [
                  _buildGroupedCard(context, primary),
                ],
              ),
      ),
    );
  }

  Widget _buildGroupedCard(BuildContext context, Color accent) {
    final theme = Theme.of(context);
    final items = controller.items;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          border: Border.all(color: AppTheme.borderColor.withValues(alpha: 0.4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            for (int i = 0; i < items.length; i++) ...[
              _buildSubItemRow(
                context,
                items[i],
                accent,
                isFirst: i == 0,
                isLast: i == items.length - 1,
              ),
              if (i < items.length - 1)
                Divider(height: 1, color: theme.dividerColor.withValues(alpha: 0.4)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSubItemRow(
    BuildContext context,
    SettingsSubItem item,
    Color accent, {
    required bool isFirst,
    required bool isLast,
  }) {
    final radius = BorderRadius.vertical(
      top: isFirst ? const Radius.circular(_borderRadius) : Radius.zero,
      bottom: isLast ? const Radius.circular(_borderRadius) : Radius.zero,
    );

    return InkWell(
      onTap: () => controller.onSubItemTap(item),
      borderRadius: radius,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: accent),
          ],
        ),
      ),
    );
  }
}
