import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moviepilot_mobile/theme/section.dart';

import '../controllers/server_log_controller.dart';

class ServerLogPage extends GetView<ServerLogController> {
  const ServerLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.title}日志'),
        actions: [Obx(() => _buildStreamIndicator(controller))],
      ),
      body: SafeArea(
        child: Obx(() => _buildScrollableBody(context, controller)),
      ),
    );
  }

  Widget _buildStreamIndicator(ServerLogController controller) {
    final isConnecting =
        controller.isLoading.value && !controller.isStreaming.value;
    final isIdle = controller.isIdle.value;
    final isStreaming = controller.isStreaming.value;

    if (isConnecting) {
      return const Padding(
        padding: EdgeInsets.only(right: 16),
        child: CupertinoActivityIndicator(radius: 8),
      );
    }

    Color color;
    String label;
    if (isStreaming && isIdle) {
      color = CupertinoColors.systemOrange;
      label = '等待';
    } else if (isStreaming) {
      color = CupertinoColors.activeGreen;
      label = '在线';
    } else {
      color = CupertinoColors.systemGrey;
      label = '断开';
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: (!isStreaming && !isConnecting)
            ? () => controller.reconnect()
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              if (!isStreaming && !isConnecting) ...[
                const SizedBox(width: 4),
                const Icon(
                  CupertinoIcons.refresh,
                  size: 14,
                  color: CupertinoColors.systemGrey,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context, ServerLogController controller) {
    const segments = <String, Widget>{
      'ALL': Text('全部'),
      'INFO': Text('INFO'),
      'WARN': Text('WARN'),
      'ERROR': Text('ERROR'),
      'DEBUG': Text('DEBUG'),
    };

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          CupertinoSearchTextField(
            placeholder: '搜索日志/模块/关键字',
            onChanged: (value) => controller.keyword.value = value,
          ),
          const SizedBox(height: 10),
          Obx(
            () => CupertinoSlidingSegmentedControl<String>(
              groupValue: controller.filterLevel.value,
              children: segments,
              onValueChanged: (value) {
                if (value == null) return;
                controller.filterLevel.value = value;
              },
              // thumbColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableBody(
    BuildContext context,
    ServerLogController controller,
  ) {
    final logs = controller.filteredLogs;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildFilterBar(context, controller)),
        if (logs.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: controller.isLoading.value
                  ? const CupertinoActivityIndicator()
                  : const Text(
                      '暂无日志数据',
                      style: TextStyle(color: CupertinoColors.systemGrey),
                    ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildLogItem(logs[index]),
                childCount: logs.length,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildLogItem(LogEntry entry) {
    final levelColor = _levelColor(entry.level);
    final timeLabel = DateFormat('MM-dd HH:mm:ss').format(entry.timestamp);

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Section(
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              height: 44,
              decoration: BoxDecoration(
                color: levelColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildLevelChip(entry.level, levelColor),
                      const SizedBox(width: 6),
                      _buildModuleChip(entry.module),
                      const Spacer(),
                      Text(
                        timeLabel,
                        style: const TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.systemBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    entry.message,
                    style: const TextStyle(fontSize: 14, height: 1.3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelChip(String level, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        level,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildModuleChip(String module) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey4.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        module,
        style: const TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
      ),
    );
  }

  Color _levelColor(String level) {
    switch (level.toUpperCase()) {
      case 'ERROR':
        return CupertinoColors.systemRed;
      case 'WARN':
      case 'WARNING':
        return CupertinoColors.systemOrange;
      case 'DEBUG':
        return CupertinoColors.systemPurple;
      case 'INFO':
      default:
        return CupertinoColors.activeGreen;
    }
  }
}
