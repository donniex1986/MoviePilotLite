import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/dashboard_controller.dart';

/// 图表数据模型
class ChartData {
  final int index;
  final double value;

  ChartData(this.index, this.value);
}

/// CPU 组件
class CpuWidget extends StatefulWidget {
  const CpuWidget({super.key});

  @override
  State<CpuWidget> createState() => _CpuWidgetState();
}

class _CpuWidgetState extends State<CpuWidget> {
  final List<ChartData> _cpuData = [];
  @override
  void initState() {
    super.initState();
    // 初始化数据 - 20个数据点
    _initData();
  }

  // 初始化数据 - 20个数据点
  void _initData() {
    for (int i = 0; i < 20; i++) {
      _cpuData.add(ChartData(i, 10 + Random().nextDouble() * 20));
    }
  }

  // 更新数据
  void _updateData(double cpuUsage) {
    setState(() {
      // 移除第一个数据点
      _cpuData.removeAt(0);
      // 添加新数据点，重新分配索引以保持0-19的范围
      for (int i = 0; i < _cpuData.length; i++) {
        _cpuData[i] = ChartData(i, _cpuData[i].value);
      }
      _cpuData.add(ChartData(_cpuData.length, cpuUsage));
    });
  }

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

          // 只在数据真正变化时更新，避免频繁更新导致曲线拉平
          if (_cpuData.isNotEmpty && (_cpuData.last.value != cpuUsage)) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _updateData(cpuUsage);
            });
          }

          return Section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 使用Syncfusion Charts构建波浪图
                SizedBox(
                  height: 150,
                  child: SfCartesianChart(
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
                    series: <CartesianSeries<ChartData, int>>[
                      AreaSeries<ChartData, int>(
                        dataSource: _cpuData,
                        xValueMapper: (ChartData data, _) => data.index,
                        yValueMapper: (ChartData data, _) => data.value,
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
                // 当前CPU使用率
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
