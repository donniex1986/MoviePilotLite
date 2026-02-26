import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/dashboard_controller.dart';

/// 最近入库组件
class RecentAddedWidget extends StatelessWidget {
  const RecentAddedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(CupertinoIcons.clock, size: 20),
            const SizedBox(width: 8),
            const Text(
              '最近入库',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.toNamed('/media-organize');
              },
              child: Row(
                children: [
                  Text(
                    '查看',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Obx(() {
          final transferData = controller.transferData;
          // 计算总入库量
          final totalCount = transferData.fold(0, (sum, item) => sum + item);

          // 准备图表数据
          final chartData = _prepareChartData(transferData);

          return Section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 柱状图（使用 Syncfusion Flutter Charts）
                SizedBox(
                  height: 180,
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      axisLine: const AxisLine(width: 0),
                      labelStyle: const TextStyle(fontSize: 10),
                    ),
                    primaryYAxis: NumericAxis(
                      isVisible: false,
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    plotAreaBorderWidth: 0,
                    series: <ColumnSeries<Map<String, dynamic>, String>>[
                      ColumnSeries<Map<String, dynamic>, String>(
                        dataSource: chartData,
                        xValueMapper: (data, index) {
                          final maxDay = 7;
                          final now = DateTime.now();
                          final startDate = now.subtract(
                            Duration(days: maxDay),
                          );

                          final dateCache = List.generate(
                            maxDay + 1,
                            (i) => DateFormat(
                              'MM/dd',
                            ).format(startDate.add(Duration(days: i))),
                          );
                          return dateCache[index];
                        },
                        yValueMapper: (data, _) => data['count'] as int,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: Theme.of(context).colorScheme.primary,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // 总入库量
                Row(
                  children: [
                    Text(
                      totalCount.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '最近一周入库了 $totalCount 部影片 😊',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        }),
      ],
    );
  }

  // 准备图表数据
  List<Map<String, dynamic>> _prepareChartData(List<int> transferData) {
    // 确保数据长度为7（一周）
    final data = List<int>.from(transferData);
    while (data.length < 7) {
      data.add(0);
    }

    // 准备图表数据
    return data.asMap().entries.map((entry) {
      return {'day': entry.key, 'count': entry.value};
    }).toList();
  }
}
