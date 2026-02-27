import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/workflow/controllers/workflow_controller.dart';
import 'package:moviepilot_mobile/modules/workflow/models/workflow_models.dart';
import 'package:moviepilot_mobile/modules/workflow/pages/shared_workflow_fork_sheet.dart';
import 'package:moviepilot_mobile/modules/workflow/widgets/shared_workflow_card.dart';

class SharedWorkflowPage extends GetView<WorkflowController> {
  const SharedWorkflowPage({super.key});

  static const double _wideBreakpoint = 500;
  static const double _itemWidth = 250;
  static const double _horizontalPadding = 16;
  static const double _gridSpacing = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分享工作流'),
        centerTitle: false,
        actions: [
          Obx(() {
            if (!controller.isLoadingShared.value)
              return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.loadSharedWorkflows,
        child: CustomScrollView(
          cacheExtent: 400,
          slivers: [
            SliverToBoxAdapter(child: _buildSearchBar(context)),
            _buildSliverContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        _horizontalPadding,
        12,
        _horizontalPadding,
        8,
      ),
      child: CupertinoSearchTextField(
        onSubmitted: controller.updateKeyword,
        placeholder: '搜索工作流名称、描述、作者…',
        backgroundColor: CupertinoDynamicColor.resolve(
          CupertinoColors.tertiarySystemFill,
          context,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildSliverContent(BuildContext context) {
    return Obx(() {
      final loading = controller.isLoadingShared.value;
      final error = controller.errorTextShared.value;
      final items = controller.sharedWorkflows;

      if (loading && items.isEmpty) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      }
      if (error != null && items.isEmpty) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(error, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  CupertinoButton.filled(
                    onPressed: controller.loadSharedWorkflows,
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      if (items.isEmpty) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text(
              controller.keyword.value.trim().isEmpty ? '暂无分享工作流' : '未找到匹配的工作流',
              style: TextStyle(
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel,
                  context,
                ),
              ),
            ),
          ),
        );
      }

      final width = MediaQuery.sizeOf(context).width;
      final useGrid = width > _wideBreakpoint;

      return SliverMainAxisGroup(
        slivers: [
          if (useGrid)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                _horizontalPadding,
                16,
                _horizontalPadding,
                0,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ((width - _horizontalPadding * 2) /
                              (_itemWidth + _gridSpacing))
                          .floor()
                          .clamp(1, 10)
                          .toInt(),
                  mainAxisSpacing: _gridSpacing,
                  crossAxisSpacing: _gridSpacing,
                  mainAxisExtent: 140,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildCard(context, items[index]),
                  childCount: items.length,
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                _horizontalPadding,
                16,
                _horizontalPadding,
                0,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: _gridSpacing),
                    child: _buildCard(context, items[index]),
                  ),
                  childCount: items.length,
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                ),
              ),
            ),
          SliverToBoxAdapter(child: _buildLoadMoreFooter(context)),
        ],
      );
    });
  }

  Widget _buildCard(BuildContext context, SharedWorkflow workflow) {
    return SharedWorkflowCard(
      workflow: workflow,
      onFork: () =>
          Get.bottomSheet(SharedWorkflowForkSheet(workflow: workflow)),
    );
  }

  Widget _buildLoadMoreFooter(BuildContext context) {
    return Obx(() {
      if (controller.sharedWorkflows.isEmpty) return const SizedBox.shrink();
      if (!controller.hasMore.value) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 80),
          child: Center(
            child: Text(
              '没有更多了',
              style: TextStyle(
                fontSize: 13,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel,
                  context,
                ),
              ),
            ),
          ),
        );
      }
      final loading = controller.isLoadingMore.value;
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 80),
        child: Center(
          child: loading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : CupertinoButton(
                  onPressed: controller.loadMoreSharedWorkflows,
                  child: Text(
                    '加载更多',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
