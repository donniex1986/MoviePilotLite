import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_detail_controller.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SiteDetailPage extends GetView<SiteDetailController> {
  const SiteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.siteName.isNotEmpty ? controller.siteName : '站点详情'),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: controller.loadUserdataHistory,
            child: const Icon(CupertinoIcons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: controller.loadUserdataHistory),
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
              Obx(() => _buildIcon(controller.iconBase64.value)),
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
            _buildInfoRow('域名', s.domain),
            _buildInfoRow('地址', s.url),
            _buildInfoRow('优先级', '${s.pri}'),
            _buildInfoRow('状态', s.isActive ? '启用' : '禁用'),
            _buildInfoRow('超时', '${s.timeout} 秒'),
            if (s.note != null && s.note!.isNotEmpty) _buildInfoRow('备注', s.note!),
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: SelectableText(
              value,
              style: const TextStyle(fontSize: 13),
            ),
          ),
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
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    final chartData = items
        .map((e) => _ChartPoint(
              e.updatedDay,
              e.upload,
              e.download,
              e.seeding,
              e.seedingSize,
            ))
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
                  yValueMapper: (_ChartPoint d, _) => d.upload,
                  name: '上传',
                  color: primary,
                  width: 2,
                  markerSettings: const MarkerSettings(isVisible: true, height: 4, width: 4),
                ),
                LineSeries<_ChartPoint, String>(
                  dataSource: chartData,
                  xValueMapper: (_ChartPoint d, _) => d.date,
                  yValueMapper: (_ChartPoint d, _) => d.download,
                  name: '下载',
                  color: secondary,
                  width: 2,
                  markerSettings: const MarkerSettings(isVisible: true, height: 4, width: 4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeedingChart(
    BuildContext context,
    List<_ChartPoint> chartData,
  ) {
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
                  markerSettings: const MarkerSettings(isVisible: true, height: 4, width: 4),
                ),
              ],
            ),
          ),
        ],
      ),
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
