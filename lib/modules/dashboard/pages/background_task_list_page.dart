import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dashboard/controllers/dashboard_controller.dart';

/// 后台任务列表页面
class BackgroundTaskListPage extends StatefulWidget {
  const BackgroundTaskListPage({super.key});

  @override
  State<BackgroundTaskListPage> createState() => _BackgroundTaskListPageState();
}

class _BackgroundTaskListPageState extends State<BackgroundTaskListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      appBar: AppBar(title: const Text('后台任务列表'), centerTitle: false),
      body: SafeArea(
        child: Obx(() {
          final scheduleList = controller.scheduleData.value;

          // 过滤任务列表
          final filteredList = scheduleList.where((schedule) {
            return schedule.name.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ) ||
                schedule.provider.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ) ||
                schedule.status.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                );
          }).toList();

          return ListView.builder(
            itemCount: filteredList.isEmpty
                ? 2
                : filteredList.length + 1, // +1 为搜索栏，+1 为空数据提示
            itemBuilder: (context, index) {
              if (index == 0) {
                // 搜索栏
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: CupertinoSearchTextField(
                    controller: _searchController,
                    placeholder: '搜索任务...',
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                );
              }

              if (filteredList.isEmpty) {
                // 空数据提示
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      _searchQuery.isEmpty ? '暂无后台任务数据' : '未找到匹配的任务',
                      style: TextStyle(color: CupertinoColors.systemGrey),
                    ),
                  ),
                );
              }

              // 任务列表项
              final schedule = filteredList[index - 1];
              return _buildScheduleItem(
                schedule,
                index - 1,
                filteredList.length,
                controller,
              );
            },
          );
        }),
      ),
    );
  }

  /// 构建任务项
  Widget _buildScheduleItem(
    dynamic schedule,
    int index,
    int totalCount,
    DashboardController controller,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: index < totalCount - 1
            ? Border(bottom: BorderSide(color: CupertinoColors.systemGrey5))
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${schedule.provider}',
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.systemGrey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  schedule.status,
                  style: TextStyle(
                    fontSize: 14,
                    color: _getStatusColor(schedule.status),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(schedule.next_run, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                // 执行按钮
                CupertinoButton.filled(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  minSize: 24,
                  onPressed: () async {
                    // 执行任务
                    await controller.runScheduler(schedule.id);
                  },
                  child: const Text('执行', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 根据状态获取颜色
  Color _getStatusColor(String status) {
    switch (status) {
      case '运行中':
        return CupertinoColors.activeBlue;
      case '等待':
        return CupertinoColors.systemYellow;
      case '完成':
        return CupertinoColors.activeGreen;
      case '失败':
        return CupertinoColors.systemRed;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
