import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/multifunction/controllers/multifunction_controller.dart';
import 'package:moviepilot_mobile/modules/multifunction/models/multifunction_models.dart';
import 'package:moviepilot_mobile/services/app_service.dart';

/// 多功能页（More）：iOS 设置风格分组列表。
class MultifunctionPage extends GetView<MultifunctionController> {
  const MultifunctionPage({super.key, this.scrollController});

  final ScrollController? scrollController;

  static const double _horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();
    return Obx(() {
      final hasPageBackground =
          appService.backgroundImageEnabled.value &&
          appService.backgroundImageBytes.value != null;
      final topInset = hasPageBackground
          ? MediaQuery.paddingOf(context).top + kToolbarHeight
          : 0.0;
      return Scaffold(
        extendBodyBehindAppBar: hasPageBackground,
        appBar: _buildNavigationBar(context, transparent: hasPageBackground),
        body: Stack(
          fit: StackFit.expand,
          children: [
            if (hasPageBackground)
              Positioned.fill(child: _buildBackgroundImage(appService)),
            Padding(
              padding: EdgeInsets.only(top: topInset),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  for (final section in controller.sections)
                    SliverToBoxAdapter(
                      child: _buildSection(
                        context,
                        section,
                        translucentSurface: hasPageBackground,
                      ),
                    ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: _bottomSpacer(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  double _bottomSpacer(BuildContext context) => 100;

  AppBar _buildNavigationBar(BuildContext context, {bool transparent = false}) {
    return AppBar(
      backgroundColor: transparent ? Colors.transparent : null,
      elevation: transparent ? 0 : null,
      scrolledUnderElevation: transparent ? 0 : null,
      surfaceTintColor: transparent ? Colors.transparent : null,
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: const Icon(Icons.grid_view_outlined),
      ),
      title: const Text(
        'More',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.toNamed('/settings'),
          child: const Icon(Icons.settings_outlined),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage(AppService appService) {
    final bytes = appService.backgroundImageBytes.value;
    if (bytes == null) return const SizedBox.shrink();
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: appService.backgroundImageOpacity.value,
            child: Image.memory(
              bytes,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    appService.backgroundImageGradientTop.value,
                    appService.backgroundImageGradientBottom.value,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    MultifunctionSection section, {
    bool translucentSurface = false,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final dividerColor = colorScheme.outlineVariant.withValues(
      alpha: theme.brightness == Brightness.dark ? 0.3 : 0.4,
    );
    final sectionSurfaceColor = translucentSurface
        ? colorScheme.surface.withValues(
            alpha: theme.brightness == Brightness.dark ? 0.72 : 0.86,
          )
        : colorScheme.surface;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        _horizontalPadding,
        8,
        _horizontalPadding,
        12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 8),
            child: Text(
              section.title,
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: sectionSurfaceColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: theme.brightness == Brightness.dark ? 0.12 : 0.04,
                  ),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                children: [
                  for (
                    int index = 0;
                    index < section.items.length;
                    index++
                  ) ...[
                    _buildSettingRow(context, section.items[index]),
                    if (index != section.items.length - 1)
                      Divider(
                        height: 1,
                        indent: 56,
                        endIndent: 14,
                        color: dividerColor,
                      ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingRow(BuildContext context, MultifunctionItem item) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accent = _itemAccent(context, item);
    final subtitle = item.subtitle;
    final hasSubtitle = subtitle != null && subtitle.isNotEmpty;

    return InkWell(
      onTap: () => controller.handleTap(item),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          12,
          hasSubtitle ? 10 : 12,
          10,
          hasSubtitle ? 10 : 12,
        ),
        child: Row(
          children: [
            _buildIconBubble(context, accent, item.icon, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (hasSubtitle) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: _secondaryTextStyle(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            if (item.meta != null) ...[
              const SizedBox(width: 8),
              Text(
                item.meta!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            const SizedBox(width: 6),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
            ),
          ],
        ),
      ),
    );
  }

  Color _itemAccent(BuildContext context, MultifunctionItem item) {
    final colorScheme = Theme.of(context).colorScheme;
    if (item.style == MultifunctionCardStyle.hero) {
      return colorScheme.primary;
    }
    final palette = <Color>[
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
    ];
    final seed = item.title.codeUnits.fold<int>(
      item.icon.codePoint,
      (sum, unit) => sum + unit,
    );
    return palette[seed % palette.length];
  }

  TextStyle _secondaryTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final base = theme.textTheme.bodySmall;
    final color = theme.colorScheme.onSurfaceVariant;
    return base?.copyWith(color: color) ??
        TextStyle(color: color, fontSize: 12);
  }

  Widget _buildIconBubble(
    BuildContext context,
    Color accent,
    IconData icon, {
    double size = 40,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final background = Color.alphaBlend(
      accent.withValues(alpha: 0.14),
      colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
    );
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(size * 0.35),
      ),
      child: Icon(icon, color: accent, size: size * 0.55),
    );
  }
}
