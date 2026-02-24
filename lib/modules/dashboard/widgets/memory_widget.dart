import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import '../controllers/dashboard_controller.dart';

/// 内存组件（纯 UI，数据由 DashboardController 提供）
class MemoryWidget extends StatelessWidget {
  const MemoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.memory, size: 20),
            const SizedBox(width: 8),
            const Text(
              '内存',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Obx(() {
          final memoryData = controller.memoryData;
          final memoryUsed = memoryData[0];
          final memoryUsage = memoryData[1];
          final chartData = controller.memoryChartData;

          // 假设总内存为16GB（实际应该从API获取）
          const totalMemory = 16 * 1024 * 1024 * 1024; // 16GB in bytes
          final freeMemory = totalMemory - memoryUsed;

          return Section(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SizeFormatter.formatSize(memoryUsed, 2),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '已使用 ${memoryUsage.toStringAsFixed(1)}%',
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withAlpha(100),
                              borderColor: Theme.of(context).colorScheme.primary,
                              borderWidth: 3,
                              animationDuration: 300,
                            ),
                          ],
                          tooltipBehavior: TooltipBehavior(enable: true),
                        ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '总内存: ${SizeFormatter.formatSize(totalMemory)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    Text(
                      '可用: ${SizeFormatter.formatSize(freeMemory)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
