import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dashboard/controllers/dashboard_controller.dart';

/// 后台任务列表组件
class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

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
              const Icon(CupertinoIcons.calendar, size: 20),
              const SizedBox(width: 8),
              const Text(
                '后台任务',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final scheduleList = controller.scheduleData.value;

            if (scheduleList.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    '暂无后台任务数据',
                    style: TextStyle(color: CupertinoColors.systemGrey),
                  ),
                ),
              );
            }

            // 限制显示数量为5个
            const maxDisplayCount = 5;
            final displayList = scheduleList.length > maxDisplayCount
                ? scheduleList.sublist(0, maxDisplayCount)
                : scheduleList;

            return Container(
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
                  ...displayList.map((schedule) {
                    return _buildScheduleItem(schedule);
                  }),
                  // 如果任务数量超过5个，添加查看全部按钮
                  if (scheduleList.length > maxDisplayCount)
                    _buildViewAllButton(),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  /// 构建任务项
  Widget _buildScheduleItem(dynamic schedule) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey5)),
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

  /// 构建查看全部按钮
  Widget _buildViewAllButton() {
    return GestureDetector(
      onTap: () {
        // 使用modal样式导航到后台任务列表页面
        Get.toNamed('/background-task-list', arguments: {'modal': true});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: CupertinoColors.systemGrey5),
          ),
        ),
        child: const Center(
          child: Text(
            '查看全部',
            style: TextStyle(
              fontSize: 14,
              color: CupertinoColors.activeBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
