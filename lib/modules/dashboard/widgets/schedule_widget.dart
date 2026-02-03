import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/widgets/custom_button.dart';

/// 后台任务列表组件
class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Column(
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

          return Section(
            child: Column(
              children: [
                ...displayList.map((schedule) {
                  return _buildScheduleItem(schedule);
                }),

                // 如果任务数量超过5个，添加查看全部按钮
                const SizedBox(height: 16),
                _buildViewAllButton(),
              ],
            ),
          );
        }),
      ],
    );
  }

  /// 构建任务项
  Widget _buildScheduleItem(dynamic schedule) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  schedule.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Expanded(
                child: Text(
                  schedule.status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: _getStatusColor(schedule.status),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Expanded(
                child: Text(
                  schedule.next_run,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        Divider(color: CupertinoColors.systemGrey, height: 1),
      ],
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
    // 查看详情按钮
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton.filled(
        onPressed: () {
          // 使用modal样式导航到后台任务列表页面
          Get.toNamed('/background-task-list', arguments: {'modal': true});
        },
        child: const Text('查看全部'),
      ),
    );
  }
}
