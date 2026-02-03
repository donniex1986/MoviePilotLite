import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                          final dayIndex = data['day'] as int;
                          const labels = [
                            '周一',
                            '周二',
                            '周三',
                            '周四',
                            '周五',
                            '周六',
                            '周日',
                          ];
                          if (dayIndex >= 0 && dayIndex < labels.length) {
                            return labels[dayIndex];
                          }
                          return '';
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
                // 查看详情按钮
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    onPressed: () {
                      // 查看详情按钮点击事件
                    },
                    child: const Text('查看详情'),
                  ),
                ),
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

  // 构建背景网格线
  Widget _buildGridLines() {
    return Stack(
      children: [
        for (int i = 0; i <= 3; i++)
          Positioned(
            top: i * 50.0,
            left: 0,
            right: 0,
            child: Container(height: 1, color: CupertinoColors.systemGrey5),
          ),
      ],
    );
  }

  // 构建柱状图
  Widget _buildBars(
    List<Map<String, dynamic>> chartData,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: chartData.map((item) {
        final count = item['count'] as int;
        final maxCount = chartData.fold(
          0,
          (max, data) => data['count'] > max ? data['count'] : max,
        );
        final barHeight = maxCount > 0 ? (count / maxCount) * 150.0 : 0.0;

        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 在柱子上方显示数量
              if (count > 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              Container(
                height: barHeight,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
