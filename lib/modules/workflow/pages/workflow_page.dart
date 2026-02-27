import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/workflow/controllers/workflow_controller.dart';
import 'package:moviepilot_mobile/modules/workflow/models/workflow_models.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';

class WorkflowPage extends GetView<WorkflowController> {
  const WorkflowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('工作流'), centerTitle: false),
      body: Obx(() {
        if (controller.isLoading.value && controller.items.isEmpty) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (controller.errorText.value != null && controller.items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.errorText.value ?? '',
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CupertinoButton(
                  onPressed: controller.load,
                  child: const Text('重试'),
                ),
              ],
            ),
          );
        }
        if (controller.items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.flowchart,
                  size: 48,
                  color: CupertinoColors.systemGrey3,
                ),
                const SizedBox(height: 12),
                Text(
                  '暂无工作流',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          );
        }
        return CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: controller.load),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.separated(
                itemCount: controller.items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return _WorkflowCard(
                    workflow: controller.items[index],
                    onStart: () =>
                        controller.startWorkflow(controller.items[index].id),
                    onPause: () =>
                        controller.pauseWorkflow(controller.items[index].id),
                    onReset: () => _confirmAction(
                      context,
                      '重置工作流',
                      '确定要重置「${controller.items[index].name}」吗？这将清除执行状态和执行次数。',
                      () =>
                          controller.resetWorkflow(controller.items[index].id),
                    ),
                    onDelete: () => _confirmAction(
                      context,
                      '删除工作流',
                      '确定要删除「${controller.items[index].name}」吗？此操作不可撤销。',
                      () =>
                          controller.deleteWorkflow(controller.items[index].id),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  void _confirmAction(
    BuildContext context,
    String title,
    String message,
    Future<bool> Function() action,
  ) {
    showCupertinoDialog<void>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(ctx).pop();
              action();
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }
}

class _WorkflowCard extends StatelessWidget {
  const _WorkflowCard({
    required this.workflow,
    required this.onStart,
    required this.onPause,
    required this.onReset,
    required this.onDelete,
  });

  final WorkflowModel workflow;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onReset;
  final VoidCallback onDelete;

  Color get _stateColor {
    switch (workflow.state) {
      case 'W':
        return AppTheme.infoColor;
      case 'R':
        return AppTheme.successColor;
      case 'P':
        return AppTheme.warningColor;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  List<Color> get _headerGradient {
    switch (workflow.state) {
      case 'W':
        return [const Color(0xFF5BA3F5), const Color(0xFF89C4F4)];
      case 'R':
        return [const Color(0xFF34C759), const Color(0xFF5BD67B)];
      case 'P':
        return [const Color(0xFFFF9500), const Color(0xFFFFB84D)];
      default:
        return [CupertinoColors.systemGrey, CupertinoColors.systemGrey2];
    }
  }

  IconData get _stateIcon {
    switch (workflow.state) {
      case 'W':
        return CupertinoIcons.pause_fill;
      case 'R':
        return CupertinoIcons.play_fill;
      case 'P':
        return CupertinoIcons.play_fill;
      default:
        return CupertinoIcons.question;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _headerGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Icon(_stateIcon, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              workflow.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _buildMenuButton(context),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 32,
      onPressed: () => _showActionSheet(context),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          CupertinoIcons.ellipsis,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (ctx) => CupertinoActionSheet(
        title: Text(workflow.name),
        message: workflow.description.isNotEmpty
            ? Text(workflow.description)
            : null,
        actions: [
          if (workflow.isPaused)
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(ctx).pop();
                onStart();
              },
              child: const Text('启动'),
            ),
          if (workflow.isWaiting || workflow.isRunning)
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(ctx).pop();
                onPause();
              },
              child: const Text('停止'),
            ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(ctx).pop();
              onReset();
            },
            child: const Text('重置'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(ctx).pop();
              onDelete();
            },
            child: const Text('删除'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('取消'),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final valueStyle = theme.textTheme.bodyLarge?.copyWith(fontSize: 14);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  label: '触发方式',
                  child: Row(
                    children: [
                      Icon(
                        workflow.triggerType == 'timer'
                            ? CupertinoIcons.clock
                            : CupertinoIcons.bolt,
                        size: 14,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          workflow.triggerType == 'timer'
                              ? (workflow.timer ?? '-')
                              : (workflow.eventType ?? '-'),
                          style: valueStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _InfoItem(
                  label: '状态',
                  child: Text(
                    workflow.stateText,
                    style: valueStyle?.copyWith(
                      color: _stateColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  label: '动作数',
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: _stateColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${workflow.actions.length}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _stateColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _InfoItem(
                  label: '已执行次数',
                  child: Text(
                    '${workflow.runCount}',
                    style: valueStyle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _InfoItem(
            label: '进度',
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: _calcProgress(),
                      backgroundColor: _stateColor.withOpacity(0.12),
                      color: _stateColor,
                      minHeight: 6,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${(_calcProgress() * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _calcProgress() {
    if (workflow.actions.isEmpty) return 0;
    if (workflow.currentAction == null || workflow.currentAction!.isEmpty) {
      return workflow.result != null ? 1.0 : 0.0;
    }
    final idx = workflow.actions.indexWhere(
      (a) => a.id == workflow.currentAction,
    );
    if (idx < 0) return 0;
    return (idx + 1) / workflow.actions.length;
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppTheme.textSecondaryColor,
          ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}
