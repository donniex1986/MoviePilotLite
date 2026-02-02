import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/mediaserver/controllers/mediaserver_controller.dart';
import 'package:moviepilot_mobile/modules/mediaserver/models/library_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';
import '../controllers/dashboard_controller.dart';
import 'schedule_widget.dart';

/// Dashboard 组件工厂
class DashboardWidgets {
  /// 根据类型构建组件
  static Widget buildWidget(String widgetType) {
    switch (widgetType) {
      case '存储空间':
        return const StorageWidget();
      case '媒体统计':
        return const MediaStatsWidget();
      case '最近入库':
        return const RecentAddedWidget();
      case '实时速率':
        return const RealTimeSpeedWidget();
      case '后台任务':
        return const ScheduleWidget();
      case 'CPU':
        return const CpuWidget();
      case '内存':
        return const MemoryWidget();
      case '网络流量':
        return const NetworkTrafficWidget();
      case '我的媒体库':
        return const MyMediaLibraryWidget();
      case '最近添加':
        return const RecentlyAddedWidget();
      default:
        return Container(
          padding: const EdgeInsets.all(16),
          child: Text('未知组件: $widgetType'),
        );
    }
  }
}

/// 存储空间组件
class StorageWidget extends StatelessWidget {
  const StorageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.storage, size: 20),
              const SizedBox(width: 8),
              const Text(
                '存储空间',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final storageData = controller.storageData;
            final totalStorage = storageData['total_storage'] ?? 0.0;
            final usedStorage = storageData['used_storage'] ?? 0.0;
            final progress = totalStorage > 0
                ? usedStorage / totalStorage
                : 0.0;
            final usedPercentage = (progress * 100).toStringAsFixed(1);
            final freeStorage = totalStorage - usedStorage;

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 只显示存储使用信息，移除右侧图标
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _formatStorageSize(usedStorage),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '已使用 $usedPercentage%',
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.rocket_launch,
                            size: 14,
                            color: CupertinoColors.systemOrange,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildProgressBar(context, progress),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '总容量: ${_formatStorageSize(totalStorage)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      Text(
                        '可用: ${_formatStorageSize(freeStorage)}',
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
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context, double progress) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: CupertinoColors.systemGrey5,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
        minHeight: 10,
      ),
    );
  }

  /// 格式化存储大小
  String _formatStorageSize(double bytes) {
    return SizeFormatter.formatSize(bytes, 2);
  }
}

/// 媒体统计组件
class MediaStatsWidget extends StatelessWidget {
  const MediaStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.chart_bar, size: 20),
              const SizedBox(width: 8),
              const Text(
                '媒体统计',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final statisticData = controller.statisticData.value;

            // 构建统计项列表，添加颜色
            final stats = [
              {
                'label': '电影',
                'value': statisticData.movie_count,
                'icon': CupertinoIcons.film,
                'color': CupertinoColors.systemPurple,
              },
              {
                'label': '电视剧',
                'value': statisticData.tv_count,
                'icon': CupertinoIcons.tv,
                'color': CupertinoColors.systemGreen,
              },
              {
                'label': '剧集',
                'value': statisticData.episode_count,
                'icon': CupertinoIcons.collections,
                'color': CupertinoColors.systemOrange,
              },
              {
                'label': '用户',
                'value': statisticData.user_count,
                'icon': CupertinoIcons.person,
                'color': CupertinoColors.systemBlue,
              },
            ];

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: stats.map((stat) {
                  return Expanded(
                    child: _buildStatItem(
                      stat['label'] as String,
                      (stat['value'] as int).toString(),
                      stat['icon'] as IconData,
                      stat['color'] as Color,
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 24, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// 最近入库组件
class RecentAddedWidget extends StatelessWidget {
  const RecentAddedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
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

            return Column(
              children: [
                // 柱状图
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBackground,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withValues(
                          alpha: 0.1,
                        ),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      // 背景网格线
                      _buildGridLines(),
                      // 柱状图
                      _buildBars(chartData, context),
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
            );
          }),
        ],
      ),
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

/// 实时速率组件
class RealTimeSpeedWidget extends StatelessWidget {
  const RealTimeSpeedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.speedometer, size: 20),
              const SizedBox(width: 8),
              const Text(
                '实时速率',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Obx(() {
            final downloaderData = controller.downloaderData;
            final downloadSpeed = downloaderData['download_speed'] ?? 0.0;
            final uploadSpeed = downloaderData['upload_speed'] ?? 0.0;
            final downloadSize = downloaderData['download_size'] ?? 0.0;
            final uploadSize = downloaderData['upload_size'] ?? 0.0;
            final freeSpace = downloaderData['free_space'] ?? 0.0;

            return Column(
              children: [
                // 第一行：上传/下载速度
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _buildDataCard(
                        '下载速度',
                        '$downloadSpeed MB/s',
                        CupertinoIcons.arrow_down,
                        CupertinoColors.activeGreen,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDataCard(
                        '上传速度',
                        '$uploadSpeed MB/s',
                        CupertinoIcons.arrow_up,
                        CupertinoColors.activeBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // 第二行：上传量
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildDataRow(
                        '上传总量',
                        _formatSize(uploadSize),
                        CupertinoIcons.cloud_upload,
                        CupertinoColors.systemIndigo,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // 第三行：下载量
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildDataRow(
                        '下载总量',
                        _formatSize(downloadSize),
                        CupertinoIcons.cloud_download,
                        CupertinoColors.systemPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // 第四行：可用空间量
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildDataRow(
                        '可用空间',
                        _formatSize(freeSpace),
                        CupertinoIcons.folder,
                        CupertinoColors.systemOrange,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, size: 30, color: color),
        const SizedBox(width: 12),
        Text(
          '$label: $value',
          style: const TextStyle(fontSize: 14, color: CupertinoColors.label),
        ),
      ],
    );
  }

  Widget _buildDataCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: color),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _formatSize(double bytes) {
    if (bytes == 0) return '0 B';
    const k = 1024;
    const sizes = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (log(bytes) / log(k)).floor();
    return '${(bytes / pow(k, i)).toStringAsFixed(2)} ${sizes[i]}';
  }
}

/// 后台任务组件
class BackgroundTasksWidget extends StatelessWidget {
  const BackgroundTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.list_bullet, size: 20),
              const SizedBox(width: 8),
              const Text(
                '后台任务',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTaskItem('任务 1', '进行中'),
          const SizedBox(height: 8),
          _buildTaskItem('任务 2', '等待中'),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String name, String status) {
    return Row(
      children: [
        const CupertinoActivityIndicator(radius: 8),
        const SizedBox(width: 12),
        Expanded(child: Text(name, style: const TextStyle(fontSize: 15))),
        Text(
          status,
          style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
        ),
      ],
    );
  }
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

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
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

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
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
      ),
    );
  }
}

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

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
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

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
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
      ),
    );
  }
}

/// 网络流量组件
class NetworkTrafficWidget extends StatelessWidget {
  const NetworkTrafficWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.wifi, size: 20),
              const SizedBox(width: 8),
              const Text(
                '网络流量',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final traffic = controller.networkTraffic;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTrafficItem(
                  '上行',
                  '${SizeFormatter.formatSize(traffic.first)}ps',
                  CupertinoIcons.arrow_up,
                ),
                _buildTrafficItem(
                  '下行',
                  '${SizeFormatter.formatSize(traffic.last)}ps',
                  CupertinoIcons.arrow_down,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTrafficItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 32, color: CupertinoColors.activeGreen),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
        ),
      ],
    );
  }
}

/// 我的媒体库组件
class MyMediaLibraryWidget extends StatelessWidget {
  const MyMediaLibraryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaServerController = Get.find<MediaServerController>();

    // 加载媒体库数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mediaServerController.loadMediaLibraries();
    });

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.collections, size: 20),
              const SizedBox(width: 8),
              const Text(
                '我的媒体库',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Obx(() {
            final libraries = mediaServerController.mediaLibraries.value;
            final isLoading = mediaServerController.isLoading.value;

            if (isLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (libraries.isEmpty) {
              return const Center(child: Text('暂无媒体库数据'));
            }

            return SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: libraries.length,
                itemBuilder: (context, index) {
                  final library = libraries[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SizedBox(
                      width: 240,
                      child: _buildLibraryCard(library),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildLibraryCard(MediaLibrary library) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 封面图作为背景
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: library.image != null && library.image!.isNotEmpty
                ? CachedImage(imageUrl: library.image!, fit: BoxFit.cover)
                : Container(
                    color: CupertinoColors.systemGrey6,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.collections,
                        size: 48,
                        color: CupertinoColors.systemGrey4,
                      ),
                    ),
                  ),
          ),
          // 渐变遮罩，确保文字清晰可见
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
                stops: const [0.4, 1.0],
              ),
            ),
          ),
          // 文本信息显示在图片上方
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  library.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 2,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      library.type,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      library.server_type,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white60,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 最近添加组件
class RecentlyAddedWidget extends StatelessWidget {
  const RecentlyAddedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaServerController = Get.find<MediaServerController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.add_circled, size: 20),
              const SizedBox(width: 8),
              const Text(
                '最近添加',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Obx(() {
            final latestMediaList = mediaServerController.latestMediaList;
            final isLoading = mediaServerController.isLoading;

            if (isLoading.value) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: CupertinoActivityIndicator(radius: 20),
                ),
              );
            }

            if (latestMediaList.value.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Icon(
                        CupertinoIcons.film,
                        size: 48,
                        color: CupertinoColors.systemGrey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        '暂无最近添加的媒体',
                        style: TextStyle(color: CupertinoColors.systemGrey),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: latestMediaList.value.length,
                itemBuilder: (context, index) {
                  final media = latestMediaList.value[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 媒体封面卡片
                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoColors.systemGrey.withAlpha(20),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: media.image.isNotEmpty
                                ? Stack(
                                    children: [
                                      // 封面图
                                      CachedImage(
                                        imageUrl: media.image.isNotEmpty
                                            ? ImageUtil.convertInternalImageUrl(
                                                media.image,
                                              )
                                            : '',
                                        width: 110,
                                        height: 150,
                                        fit: BoxFit.cover,
                                        placeholder: Container(
                                          color: CupertinoColors.systemGrey5,
                                          child: const Center(
                                            child: CupertinoActivityIndicator(
                                              radius: 15,
                                            ),
                                          ),
                                        ),
                                        errorWidget: Container(
                                          color: CupertinoColors.systemGrey5,
                                          child: const Center(
                                            child: Icon(
                                              CupertinoIcons.film,
                                              size: 40,
                                              color: CupertinoColors.systemGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // 媒体类型标签
                                      if (media.type.isNotEmpty)
                                        Positioned(
                                          top: 8,
                                          left: 8,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: CupertinoColors.systemBlue
                                                  .withAlpha(180),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              media.type,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: CupertinoColors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                : Container(
                                    color: CupertinoColors.systemGrey5,
                                    child: const Center(
                                      child: Icon(
                                        CupertinoIcons.film,
                                        size: 40,
                                        color: CupertinoColors.systemGrey,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // 媒体信息
                        SizedBox(
                          width: 110,
                          height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 媒体标题
                              Text(
                                media.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              // 媒体库名称
                              if (media.libraryName.isNotEmpty)
                                Text(
                                  media.libraryName,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              const SizedBox(height: 2),
                              // 媒体年份
                              Text(
                                media.subtitle,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: CupertinoColors.systemGrey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
