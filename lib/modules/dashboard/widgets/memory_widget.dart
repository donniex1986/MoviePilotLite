import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import '../controllers/dashboard_controller.dart';

/// 图表数据模型
class ChartData {
  final int index;
  final double value;

  ChartData(this.index, this.value);
}

/// 内存组件
class MemoryWidget extends StatefulWidget {
  const MemoryWidget({super.key});

  @override
  State<MemoryWidget> createState() => _MemoryWidgetState();
}

class _MemoryWidgetState extends State<MemoryWidget> {
  final List<ChartData> _memoryData = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据 - 20个数据点
    _initData();
  }

  // 初始化数据 - 20个数据点
  void _initData() {
    for (int i = 0; i < 20; i++) {
      _memoryData.add(ChartData(i, 50 + Random().nextDouble() * 30));
    }
  }

  // 更新数据
  void _updateData(double memoryUsage) {
    setState(() {
      // 移除第一个数据点
      _memoryData.removeAt(0);
      // 添加新数据点，重新分配索引以保持0-19的范围
      for (int i = 0; i < _memoryData.length; i++) {
        _memoryData[i] = ChartData(i, _memoryData[i].value);
      }
      _memoryData.add(ChartData(_memoryData.length, memoryUsage));
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
          // 只在数据真正变化时更新，避免频繁更新导致曲线拉平
          if (_memoryData.isNotEmpty &&
              (_memoryData.last.value != memoryUsage.toDouble())) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _updateData(memoryUsage.toDouble());
            });
          }

          // 假设总内存为16GB（实际应该从API获取）
          const totalMemory = 16 * 1024 * 1024 * 1024; // 16GB in bytes
          final freeMemory = totalMemory - memoryUsed;

          return Section(
            child: Column(
              children: [
                // 只显示内存使用信息，移除右侧图标
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
                        dataSource: _memoryData,
                        xValueMapper: (ChartData data, _) => data.index,
                        yValueMapper: (ChartData data, _) => data.value,
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(100),
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
