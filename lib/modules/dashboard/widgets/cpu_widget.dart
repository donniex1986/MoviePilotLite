import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/dashboard_controller.dart';

/// CPU 组件（纯 UI，数据由 DashboardController 提供）
class CpuWidget extends StatelessWidget {
  const CpuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.device_thermostat, size: 20),
            const SizedBox(width: 8),
            const Text(
              'CPU',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Obx(() {
          final cpuUsage = controller.cpuUsage.value;
          final chartData = controller.cpuChartData;

          return Section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 150,
                  child: chartData.isEmpty
                      ? const Center(child: CupertinoActivityIndicator())
                      : SfCartesianChart(
                          primaryXAxis: NumericAxis(
                            isVisible: false,
                            majorGridLines: const MajorGridLines(width: 0),
                          ),
                          primaryYAxis: NumericAxis(
                            minimum: 0,
                            maximum: 100,
                            interval: 20,
                            majorGridLines: const MajorGridLines(
                              width: 1,
                              color: CupertinoColors.systemGrey5,
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 10,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          series: <CartesianSeries<ChartDataPoint, int>>[
                            AreaSeries<ChartDataPoint, int>(
                              dataSource: chartData,
                              xValueMapper: (ChartDataPoint data, _) =>
                                  data.index,
                              yValueMapper: (ChartDataPoint data, _) =>
                                  data.value,
                              color: CupertinoColors.systemPurple.withAlpha(100),
                              borderColor: CupertinoColors.systemPurple,
                              borderWidth: 3,
                              animationDuration: 300,
                            ),
                          ],
                          tooltipBehavior: TooltipBehavior(enable: true),
                        ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '当前: ${cpuUsage.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
