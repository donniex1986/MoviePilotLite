import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/search/controllers/app_setting_controller.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';

/// 预设主题色
const _presetColors = [
  (Color(0xFF007AFF), 'iOS 蓝'),
  (Color(0xFF34C759), '绿色'),
  (Color(0xFFAF52DE), '紫色'),
  (Color(0xFFFF9500), '橙色'),
  (Color(0xFFFF3B30), '红色'),
  (Color(0xFF00BCD4), '青色'),
  (Color(0xFFE91E63), '粉色'),
  (Color(0xFF3F51B5), '靛蓝'),
];

class AppThemeSettingPage extends GetView<AppSettingController> {
  const AppThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('主题设置'), centerTitle: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(
              header: SectionHeader(title: '主题模式'),
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              separatorBuilder: (context) => Divider(
                height: 0.1,
                color: Theme.of(context).dividerColor,
                endIndent: 16,
                indent: 16,
              ),
              children: [ThemeMode.system, ThemeMode.light, ThemeMode.dark]
                  .map(
                    (mode) => _buildThemeMode(context, mode, () {
                      controller.updateThemeMode(mode);
                    }),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            Section(
              header: SectionHeader(title: '主题色'),
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              separatorBuilder: (context) => Divider(
                height: 0.1,
                color: Theme.of(context).dividerColor,
                endIndent: 16,
                indent: 16,
              ),
              child: Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: _presetColors.map((e) {
                        final (color, label) = e;
                        final isSelected = _colorEquals(
                          color,
                          controller.primaryColor.value,
                        );
                        return GestureDetector(
                          onTap: () => controller.updatePrimaryColor(color),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: isSelected
                                      ? Border.all(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                          width: 3,
                                        )
                                      : null,
                                  boxShadow: [
                                    BoxShadow(
                                      color: color.withValues(alpha: 0.4),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 24,
                                      )
                                    : null,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                label,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _colorEquals(Color a, Color b) =>
      (a.r * 255).round() == (b.r * 255).round() &&
      (a.g * 255).round() == (b.g * 255).round() &&
      (a.b * 255).round() == (b.b * 255).round();

  String _themeModeName(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return '跟随系统';
      case ThemeMode.light:
        return '浅色模式';
      case ThemeMode.dark:
        return '深色模式';
    }
  }

  Widget _buildThemeMode(
    BuildContext context,
    ThemeMode themeMode,
    VoidCallback onTap,
  ) {
    final color = Theme.of(context).primaryColor;
    return ListTile(
      // leading: Icon(_themeModeIcon(themeMode), size: 24),
      title: Text(
        _themeModeName(themeMode),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      trailing: themeMode == controller.themeMode.value
          ? Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.check, color: Colors.white, size: 15),
            )
          : null,
      onTap: onTap,
    );
  }
}
