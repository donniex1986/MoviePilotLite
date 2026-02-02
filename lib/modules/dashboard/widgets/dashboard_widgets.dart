import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import '../controllers/dashboard_controller.dart';
import 'schedule_widget.dart';
import 'latest_media_widget.dart';

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
      case '继续观看':
        return const ContinueWatchingWidget();
      case '最近添加':
        return const RecentlyAddedWidget();
      case '最新入库':
        return const LatestMediaWidget();
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
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemOrange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.storage,
                          size: 32,
                          color: CupertinoColors.white,
                        ),
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
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
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
            color: color.withOpacity(0.1),
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
          const SizedBox(height: 12),
          _buildRecentItem('电影名称 1', '2小时前'),
          const SizedBox(height: 8),
          _buildRecentItem('电影名称 2', '5小时前'),
          const SizedBox(height: 8),
          _buildRecentItem('电影名称 3', '1天前'),
        ],
      ),
    );
  }

  Widget _buildRecentItem(String title, String time) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey5,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(CupertinoIcons.film, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 15)),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
        ),
      ],
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
                        '${downloadSpeed} MB/s',
                        CupertinoIcons.arrow_down,
                        CupertinoColors.activeGreen,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDataCard(
                        '上传速度',
                        '${uploadSpeed} MB/s',
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
            color: CupertinoColors.systemGrey.withOpacity(0.1),
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

class _CpuWidgetState extends State<CpuWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _targetProgress = 0.0;

  @override
  void initState() {
    super.initState();

    // 初始化动画控制器
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // 初始化动画
    _animation = Tween<double>(begin: 0.0, end: _targetProgress).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
          const SizedBox(height: 12),
          Obx(() {
            final cpuUsage = controller.cpuUsage.value;
            final progress = cpuUsage / 100;

            // 更新目标值并启动动画
            if (_targetProgress != progress) {
              _targetProgress = progress;
              _animation =
                  Tween<double>(
                    begin: _animation.value,
                    end: _targetProgress,
                  ).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOut,
                    ),
                  );
              _animationController.forward(from: 0);
            }

            return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return _buildProgressBar(
                  _animation.value,
                  '${cpuUsage.toStringAsFixed(1)}%',
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double progress, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: CupertinoColors.systemGrey5,
            valueColor: AlwaysStoppedAnimation<Color>(
              CupertinoColors.systemOrange,
            ),
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
        ),
      ],
    );
  }
}

/// 内存组件
class MemoryWidget extends StatelessWidget {
  const MemoryWidget({super.key});

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
            final memoryUsed = memoryData[0] ?? 0;
            final memoryUsage = memoryData[1] ?? 0;
            final progress = memoryUsage / 100;

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
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                '已使用 $memoryUsage%',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.memory,
                          size: 32,
                          color: CupertinoColors.white,
                        ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLibraryItem('电影', '1,234'),
              _buildLibraryItem('剧集', '567'),
              _buildLibraryItem('音乐', '89'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLibraryItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
        ),
      ],
    );
  }
}

/// 继续观看组件
class ContinueWatchingWidget extends StatelessWidget {
  const ContinueWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.play_circle, size: 20),
              const SizedBox(width: 8),
              const Text(
                '继续观看',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildContinueItem('电影 1'),
                const SizedBox(width: 12),
                _buildContinueItem('电影 2'),
                const SizedBox(width: 12),
                _buildContinueItem('电影 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueItem(String title) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.play_circle_fill, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentItem('新电影 1'),
                const SizedBox(width: 12),
                _buildRecentItem('新电影 2'),
                const SizedBox(width: 12),
                _buildRecentItem('新电影 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentItem(String title) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.film, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
