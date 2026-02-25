import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/rule/controllers/rule_controller.dart';
import 'package:moviepilot_mobile/modules/rule/widgets/download_rule_item.dart';

/// 下载规则页
/// 支持拖拽排序、开关、编辑/保存
class DownloadRulePage extends GetView<RuleController> {
  const DownloadRulePage({super.key});

  Future<void> _confirmSave() async {
    await controller.saveDownloadRules();
  }

  Future<void> _confirmCancel() async {
    if (controller.editingDownloadItems.isEmpty) {
      controller.cancelDownloadEdit();
      return;
    }
    final confirmed = await showCupertinoDialog<bool>(
      context: Get.context!,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('取消编辑'),
        content: const Text('确定放弃本次修改？'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('继续编辑'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('放弃'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      controller.cancelDownloadEdit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: Theme.of(context).brightness,
        scaffoldBackgroundColor:
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            child: const Icon(CupertinoIcons.back),
          ),
          middle: const Text(
            '下载规则',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Obx(() {
            if (controller.isEditing.value) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: controller.isSaving.value ? null : _confirmCancel,
                    child: const Text('取消'),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: controller.isSaving.value ? null : _confirmSave,
                    child: controller.isSaving.value
                        ? const CupertinoActivityIndicator()
                        : const Text('保存'),
                  ),
                ],
              );
            }
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: controller.enterDownloadEditMode,
              child: const Text('编辑'),
            );
          }),
          backgroundColor:
              CupertinoColors.systemGroupedBackground.resolveFrom(context),
          border: null,
        ),
        child: Obx(() {
          if (controller.isLoading.value &&
              controller.downloadRules.isEmpty &&
              controller.editingDownloadItems.isEmpty) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (controller.errorText.value != null && !controller.isEditing.value) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.errorText.value ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CupertinoButton.filled(
                      onPressed: controller.load,
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
            );
          }
          if (!controller.isEditing.value &&
              controller.downloadRules.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.arrow_down_circle,
                    size: 64,
                    color:
                        CupertinoColors.tertiaryLabel.resolveFrom(context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无下载规则',
                    style: TextStyle(
                      color: CupertinoColors.secondaryLabel
                          .resolveFrom(context),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '点击「编辑」添加并排序规则',
                    style: TextStyle(
                      fontSize: 13,
                      color: CupertinoColors.tertiaryLabel
                          .resolveFrom(context),
                    ),
                  ),
                ],
              ),
            );
          }
          if (controller.isEditing.value) {
            return _buildEditList(context);
          }
          return _buildViewList(context);
        }),
      ),
    );
  }

  Widget _buildEditList(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                '拖拽排序，开关控制是否纳入优先级',
                style: TextStyle(
                  fontSize: 13,
                  color:
                      CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: Obx(() {
              final items = controller.editingDownloadItems;
              return SliverReorderableList(
                itemCount: items.length,
                onReorder: controller.reorderDownloadItem,
                proxyDecorator: (child, index, animation) {
                  return Material(
                    color: Colors.transparent,
                    child: child,
                  );
                },
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ReorderableDragStartListener(
                    index: index,
                    key: ValueKey(item.key),
                    child: DownloadRuleEditItem(
                      order: index + 1,
                      icon: controller.torrentsPriorityIcon(item.key),
                      keyValue: item.key,
                      label: controller.torrentsPriorityLabel(item.key),
                      isEditMode: true,
                      enabled: item.enabled,
                      onChanged: (_) => controller.toggleDownloadItem(index),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildViewList(BuildContext context) {
    return SafeArea(
      child: CupertinoListSection.insetGrouped(
        backgroundColor:
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
        header: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 4, top: 16),
          child: Text(
            '同时命中多个资源时择优下载',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
          ),
        ),
        footer: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 4, top: 5),
          child: Text(
            '排在前面的优先级越高，未选择的项不纳入排序',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
          ),
        ),
        children: [
          for (var i = 0; i < controller.downloadRules.length; i++)
            DownloadRuleEditItem(
              order: i + 1,
              icon: controller.torrentsPriorityIcon(
                controller.downloadRules[i],
              ),
              keyValue: controller.downloadRules[i],
              label: controller.torrentsPriorityLabel(
                controller.downloadRules[i],
              ),
              isEditMode: false,
            ),
        ],
      ),
    );
  }
}
