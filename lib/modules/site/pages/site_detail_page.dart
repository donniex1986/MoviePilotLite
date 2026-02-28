import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_detail_controller.dart';
import 'package:moviepilot_mobile/modules/site/widgets/site_resource_filter_sheet.dart';
import 'package:moviepilot_mobile/modules/site/widgets/site_resource_item_card.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/open_url.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SiteDetailPage extends GetView<SiteDetailController> {
  const SiteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.siteName.isNotEmpty ? controller.siteName : '站点详情',
        ),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.toNamed(
                '/site-resource',
                arguments: {
                  'siteId': controller.siteId,
                  'siteName': controller.siteName,
                },
              );
            },
            child: const Icon(Icons.mediation),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: controller.refreshAll),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildBasicInfoSection(context),
                  const SizedBox(height: 16),
                  Obx(() => _buildChartsSection(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoSection(BuildContext context) {
    final s = controller.site;
    final theme = Theme.of(context);

    return Section(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Obx(
                () => Hero(
                  tag: 'site-icon-${controller.siteId ?? 0}',
                  child: _buildIcon(controller.iconBase64.value),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  s?.name ?? controller.siteName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (s != null) ...[
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 10),
            _buildInfoRow(context, '域名', s.domain),
            _buildInfoRow(
              context,
              '地址',
              s.url,
              withSelectable: true,
              onSelectablePressed: () {
                WebUtil.open(url: s.url);
              },
              selectableIcon: CupertinoIcons.link,
              onSelectableIconPressed: () {
                Get.toNamed(
                  '/web-view',
                  parameters: {'url': s.url, 'cookie': s.cookie ?? ''},
                );
              },
            ),
            _buildInfoRow(context, '优先级', '${s.pri}'),
            _buildInfoRow(context, '状态', s.isActive ? '启用' : '禁用'),
            _buildInfoRow(context, '超时', '${s.timeout} 秒'),
            if (s.note != null && s.note!.isNotEmpty)
              _buildInfoRow(context, '备注', s.note!),
          ],
        ],
      ),
    );
  }

  Widget _buildIcon(String? iconBase64) {
    if (iconBase64 != null && iconBase64.isNotEmpty) {
      try {
        final bytes = base64Decode(iconBase64);
        if (bytes.isNotEmpty) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.memory(
              bytes,
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _placeholderIcon(),
            ),
          );
        }
      } catch (_) {}
    }
    return _placeholderIcon();
  }

  Widget _placeholderIcon() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        CupertinoIcons.globe,
        color: CupertinoColors.systemGrey,
        size: 22,
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value, {
    bool withSelectable = false,
    VoidCallback? onSelectablePressed,
    IconData? selectableIcon,
    VoidCallback? onSelectableIconPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 72,
            child: Text(
              '$label：',
              style: const TextStyle(
                fontSize: 13,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          GestureDetector(
            onTap: withSelectable ? onSelectablePressed : null,
            child: Text(
              value,
              style: TextStyle(
                decoration: withSelectable
                    ? TextDecoration.underline
                    : null, // ⭐ 底部横线
                decorationThickness: withSelectable ? 1.5 : 0,
                color: withSelectable
                    ? Theme.of(context).colorScheme.primary
                    : null,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (selectableIcon != null) ...[
            const SizedBox(width: 15),
            GestureDetector(
              onTap: onSelectableIconPressed,
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(
                  selectableIcon,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildChartsSection(BuildContext context) {
    if (controller.isLoading.value && controller.historyItems.isEmpty) {
      return Section(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }
    if (controller.errorText.value != null && controller.historyItems.isEmpty) {
      return Section(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.errorText.value ?? '',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              CupertinoButton(
                onPressed: controller.loadUserdataHistory,
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      );
    }
    final items = controller.historyItems;
    if (items.isEmpty) {
      return Section(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            '暂无用户数据历史',
            style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
          ),
        ),
      );
    }

    final chartData = items
        .map(
          (e) => _ChartPoint(
            e.updatedDay,
            e.upload,
            e.download,
            e.seeding,
            e.seedingSize,
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildUploadDownloadChart(context, chartData),
        const SizedBox(height: 16),
        _buildSeedingChart(context, chartData),
      ],
    );
  }

  Widget _buildUploadDownloadChart(
    BuildContext context,
    List<_ChartPoint> chartData,
  ) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final secondary = AppTheme.secondaryColor;

    return Section(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '上传 / 下载变化',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelRotation: -45,
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: const TextStyle(fontSize: 10),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(
                  width: 1,
                  color: CupertinoColors.systemGrey5,
                ),
                labelStyle: const TextStyle(fontSize: 10),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: <CartesianSeries<_ChartPoint, String>>[
                LineSeries<_ChartPoint, String>(
                  dataSource: chartData,
                  xValueMapper: (_ChartPoint d, _) => d.date,
                  yValueMapper: (_ChartPoint d, _) =>
                      d.upload / 1024 / 1024 / 1024,
                  name: '上传 (GB)',
                  color: primary,
                  width: 2,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    height: 4,
                    width: 4,
                  ),
                ),
                LineSeries<_ChartPoint, String>(
                  dataSource: chartData,
                  xValueMapper: (_ChartPoint d, _) => d.date,
                  yValueMapper: (_ChartPoint d, _) =>
                      d.download / 1024 / 1024 / 1024,
                  name: '下载 (GB)',
                  color: secondary,
                  width: 2,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    height: 4,
                    width: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeedingChart(BuildContext context, List<_ChartPoint> chartData) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Section(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '做种分布',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelRotation: -45,
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: const TextStyle(fontSize: 10),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(
                  width: 1,
                  color: CupertinoColors.systemGrey5,
                ),
                labelStyle: const TextStyle(fontSize: 10),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_ChartPoint, String>>[
                LineSeries<_ChartPoint, String>(
                  dataSource: chartData,
                  xValueMapper: (_ChartPoint d, _) => d.date,
                  yValueMapper: (_ChartPoint d, _) => d.seeding,
                  name: '做种数',
                  color: primary,
                  width: 2,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    height: 4,
                    width: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const double _resourceHorizontalPadding = 16;
  static const double _resourceCardSpacing = 12;

  Widget _buildResourceSectionHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '站点资源',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CupertinoSearchTextField(
                  placeholder: '搜索资源…',
                  onSubmitted: controller.onResourceSearchSubmitted,
                  backgroundColor: CupertinoDynamicColor.resolve(
                    CupertinoColors.tertiarySystemFill,
                    context,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              _buildResourceFilterButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResourceFilterButton(BuildContext context) {
    return Obx(() {
      final hasFilters = controller.hasActiveResourceFilters;
      final accent = Theme.of(context).colorScheme.primary;
      return CupertinoButton(
        padding: EdgeInsets.zero,
        pressedOpacity: 0.7,
        onPressed: () => _openResourceFilterSheet(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: accent.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.line_horizontal_3_decrease_circle_fill,
                size: 20,
                color: hasFilters ? accent : accent.withOpacity(0.7),
              ),
              const SizedBox(width: 6),
              Text(
                controller.resourceCategoryFilterLabel,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: hasFilters
                      ? accent
                      : CupertinoDynamicColor.resolve(
                          CupertinoColors.secondaryLabel,
                          context,
                        ),
                ),
              ),
              if (hasFilters) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _buildResourceSliverContent(BuildContext context) {
    final loading = controller.resourceLoading.value;
    final error = controller.resourceErrorText.value;
    final items = controller.resourceItems;

    if (error != null) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: SizedBox(
          height: 160,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(error, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  CupertinoButton.filled(
                    onPressed: controller.loadResources,
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Skeletonizer.sliver(
      enabled: items.isEmpty,
      child: SliverList.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: _resourceHorizontalPadding,
              right: _resourceHorizontalPadding,
              bottom: index < items.length - 1 ? _resourceCardSpacing : 0,
            ),
            child: SiteResourceItemCard(item: items[index]),
          );
        },
      ),
    );
  }

  Future<void> _openResourceFilterSheet(BuildContext context) {
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SizedBox(
          height: MediaQuery.of(sheetContext).size.height * 0.4,
          child: Obx(
            () => SiteResourceFilterSheet(
              categories: controller.resourceCategories,
              selectedCategoryId: controller.selectedResourceCategoryId.value,
              onSelectCategory: (id) {
                controller.setResourceCategoryFilter(id);
                Navigator.of(sheetContext).pop();
                controller.loadResources();
              },
              onClear: () {
                controller.clearResourceCategoryFilter();
                Navigator.of(sheetContext).pop();
                controller.loadResources();
              },
            ),
          ),
        );
      },
    );
  }
}

class _ChartPoint {
  _ChartPoint(
    this.date,
    this.upload,
    this.download,
    this.seeding,
    this.seedingSize,
  );
  final String date;
  final double upload;
  final double download;
  final double seeding;
  final double seedingSize;
}
