import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/workflow/controllers/workflow_controller.dart';
import 'package:moviepilot_mobile/modules/workflow/models/workflow_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class SharedWorkflowForkSheet extends StatefulWidget {
  const SharedWorkflowForkSheet({super.key, required this.workflow});
  final SharedWorkflow workflow;
  @override
  State<SharedWorkflowForkSheet> createState() =>
      _SharedWorkflowForkSheetState();
}

enum SharedWorkflowForkSheetState { normal, forking, forked }

class _SharedWorkflowForkSheetState extends State<SharedWorkflowForkSheet> {
  final controller = Get.find<WorkflowController>();
  final forkState = SharedWorkflowForkSheetState.normal.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 顶部拖拽指示器
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.workflow.shareTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.workflow.shareComment ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Section(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person),
                            const SizedBox(width: 8),
                            Text('分享者: ${widget.workflow.shareUser}'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            const SizedBox(width: 8),
                            Text('分享时间: ${widget.workflow.date}'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.repeat),
                            const SizedBox(width: 8),
                            Text('复刻次数: ${widget.workflow.count}'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            const SizedBox(width: 8),
                            Text('触发时间: ${widget.workflow.timer ?? '无'}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => ElevatedButton.icon(
                      onPressed: () async {
                        if (forkState.value ==
                                SharedWorkflowForkSheetState.forking ||
                            forkState.value ==
                                SharedWorkflowForkSheetState.forked) {
                          return;
                        }

                        forkState.value = SharedWorkflowForkSheetState.forking;
                        final success = await controller.forkWorkflow(
                          widget.workflow,
                        );
                        if (mounted && success) {
                          ToastUtil.success('复刻成功');
                          forkState.value = SharedWorkflowForkSheetState.forked;
                          // 延迟关闭，让用户看到成功状态
                          Future.delayed(const Duration(seconds: 1), () {
                            Get.back();
                          });
                        } else {
                          ToastUtil.error('复刻失败，请稍后重试');
                          forkState.value = SharedWorkflowForkSheetState.normal;
                        }
                      },
                      icon: Icon(Icons.copy, size: 18),
                      label:
                          forkState.value ==
                              SharedWorkflowForkSheetState.forking
                          ? const CupertinoActivityIndicator()
                          : Text(_buildForkButtonLabel(forkState.value)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            forkState.value ==
                                SharedWorkflowForkSheetState.forking
                            ? Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.5)
                            : Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _buildForkButtonLabel(SharedWorkflowForkSheetState state) {
    switch (state) {
      case SharedWorkflowForkSheetState.normal:
        return '复刻';
      case SharedWorkflowForkSheetState.forking:
        return '复刻中...';
      case SharedWorkflowForkSheetState.forked:
        return '已复刻';
    }
  }
}
