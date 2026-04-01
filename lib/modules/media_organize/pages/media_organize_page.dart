import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/media_organize/controllers/media_organize_controller.dart';
import 'package:moviepilot_mobile/modules/media_organize/models/media_organize_models.dart';
import 'package:moviepilot_mobile/modules/media_organize/widgets/media_organize_item_card.dart';
import 'package:moviepilot_mobile/modules/search_result/widgets/sort_pull_down_widget.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/bottom_sheet.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';

class MediaOrganizePage extends GetView<MediaOrganizeController> {
  const MediaOrganizePage({super.key});

  static const double _horizontalPadding = 16;
  static const double _cardSpacing = 0;
  static const double _floatingBarHeight = 52;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('媒体整理'),
        centerTitle: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingBar(context),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([controller.loadStorages(), controller.load()]);
        },
        child: Obx(() => _buildBody(context)),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final loading = controller.isLoading.value;
    final error = controller.errorText.value;
    final items = controller.filteredItems;
    final hasQuery = controller.keyword.value.isNotEmpty;
    final hasFilter = controller.hasActiveFilters;

    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverToBoxAdapter(child: _buildSummaryHeader(context, items.length)),
        SliverToBoxAdapter(child: _buildQuickTitlePicker(context)),
        if (loading && controller.items.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        else if (error != null && controller.items.isEmpty)
          SliverFillRemaining(
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
                      onPressed: controller.load,
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
            ),
          )
        else if (items.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                hasQuery || hasFilter ? '没有匹配的整理记录' : '暂无整理记录',
                style: TextStyle(
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.secondaryLabel,
                    context,
                  ),
                ),
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              _horizontalPadding,
              8,
              _horizontalPadding,
              0,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: _cardSpacing),
                  child: MediaOrganizeItemCard(
                    item: item,
                    srcStorageName: controller.getStorageName(item.src_storage),
                    destStorageName: controller.getStorageName(
                      item.dest_storage,
                    ),
                    onDeleteTransferRecordOnly: () => _deleteTransferRecord(
                      item,
                      deletesrc: true,
                      deletedest: false,
                    ),
                    onDeleteTransferRecordAndSourceFile: () =>
                        _deleteTransferRecord(
                          item,
                          deletesrc: true,
                          deletedest: true,
                        ),
                    onDeleteTransferRecordAndMediaLibraryFile: () =>
                        _deleteTransferRecord(
                          item,
                          deletesrc: false,
                          deletedest: true,
                        ),
                    onDeleteTransferRecordAndSourceFileAndMediaLibraryFile:
                        () => _deleteTransferRecord(
                          item,
                          deletesrc: true,
                          deletedest: true,
                        ),
                  ),
                );
              }, childCount: items.length),
            ),
          ),
        SliverToBoxAdapter(child: _buildLoadMore(context, items.isNotEmpty)),
        const SliverToBoxAdapter(
          child: SizedBox(height: _floatingBarHeight + 32),
        ),
      ],
    );
  }

  Widget _buildQuickTitlePicker(BuildContext context) {
    final titles = controller.titleOptions;
    if (titles.isEmpty) {
      return const SizedBox.shrink();
    }

    final activeTitle = controller.keyword.value.trim();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: titles.length + 1,
          separatorBuilder: (_, _) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            if (index == 0) {
              final active = activeTitle.isEmpty;
              return _buildQuickTitleChip(
                context,
                label: '全部',
                active: active,
                onTap: () => controller.updateKeyword(''),
              );
            }

            final title = titles[index - 1];
            final active = activeTitle == title;
            return _buildQuickTitleChip(
              context,
              label: title,
              active: active,
              onTap: () => controller.updateKeyword(active ? '' : title),
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuickTitleChip(
    BuildContext context, {
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? primary : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: active
                ? primary
                : theme.colorScheme.outline.withValues(alpha: 0.08),
          ),
        ),
        child: Center(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: active ? Colors.white : theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryHeader(BuildContext context, int filteredCount) {
    final theme = Theme.of(context);
    final total = controller.items.length;
    final loading = controller.isLoading.value;
    final labelColor = theme.colorScheme.onSurfaceVariant;
    final statusText = _statusFilterLabel(controller.statusFilter.value);
    final summaryText = controller.keyword.value.isEmpty
        ? '全部记录'
        : '关键词: ${controller.keyword.value}';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.08),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: loading
                  ? const Center(
                      child: CupertinoActivityIndicator(radius: 10),
                    )
                  : Icon(
                      CupertinoIcons.collections,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    summaryText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '状态: $statusText · 共 $total 条 · 当前 $filteredCount 条',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: labelColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadMore(BuildContext context, bool hasItems) {
    if (!hasItems) return const SizedBox.shrink();
    if (!controller.hasMore.value) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
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
    final loading = controller.isLoading.value;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Center(
        child: CupertinoButton(
          onPressed: loading ? null : controller.loadMore,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: loading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : Text(
                  '加载更多',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildFloatingBar(BuildContext context) {
    final theme = Theme.of(context);
    final child = Row(
      children: [
        _buildFloatingFilterButton(context),
        const SizedBox(width: 8),
        Expanded(child: _buildFakeSearchBar(context)),
        const SizedBox(width: 8),
        _buildFloatingSortButton(context),
      ],
    );
    final pill = Container(
      height: _floatingBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(999)),
      child: child,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: theme.colorScheme.surface.withValues(alpha: 0.2),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.1),
            width: 0.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
            child: pill,
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingFilterButton(BuildContext context) {
    return Obx(() {
      final hasFilters = controller.hasActiveFilters;
      final color = hasFilters
          ? CupertinoDynamicColor.resolve(CupertinoColors.activeBlue, context)
          : Theme.of(context).colorScheme.onSurfaceVariant;
      return CupertinoButton(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        onPressed: () => _openFilterSheet(context),
        child: Icon(CupertinoIcons.slider_horizontal_3, size: 20, color: color),
      );
    });
  }

  Widget _buildFakeSearchBar(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => _openKeywordSheet(context),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(999)),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.search,
              size: 18,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Obx(
                () => Text(
                  controller.keyword.value.isEmpty
                      ? '搜索标题、路径、错误信息…'
                      : controller.keyword.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingSortButton(BuildContext context) {
    return Obx(
      () => SortPullDownWidget<MediaOrganizeSortKey>(
        isAscending: controller.isSortAscending.value,
        currentValue: controller.sortKey.value,
        options: MediaOrganizeSortKey.values,
        labelBuilder: _sortLabel,
        onDirectionChanged: controller.updateSortDirection,
        onValueChanged: controller.updateSortKey,
      ),
    );
  }

  Future<void> _openKeywordSheet(BuildContext context) async {
    final controllerText = TextEditingController(
      text: controller.keyword.value,
    );
    final submitted = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final insets = MediaQuery.of(ctx).viewInsets;
        return Padding(
          padding: EdgeInsets.only(bottom: insets.bottom),
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.systemBackground,
                ctx,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: CupertinoSearchTextField(
              controller: controllerText,
              autofocus: true,
              placeholder: '搜索标题、路径、错误信息…',
              onSubmitted: (value) => Navigator.of(ctx).pop(value),
            ),
          ),
        );
      },
    );
    controllerText.dispose();
    if (submitted == null) return;
    controller.updateKeyword(submitted);
  }

  Future<void> _openFilterSheet(BuildContext context) {
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (ctx) => Obx(
        () => _MediaOrganizeFilterSheet(
          selected: controller.statusFilter.value,
          onSelected: (value) {
            controller.updateStatusFilter(value);
            Navigator.of(ctx).pop();
          },
          onClear: () {
            controller.updateStatusFilter(MediaOrganizeStatusFilter.all);
            Navigator.of(ctx).pop();
          },
        ),
      ),
    );
  }

  static String _sortLabel(MediaOrganizeSortKey key) {
    switch (key) {
      case MediaOrganizeSortKey.date:
        return '时间';
      case MediaOrganizeSortKey.title:
        return '标题';
      case MediaOrganizeSortKey.size:
        return '大小';
    }
  }

  static String _statusFilterLabel(MediaOrganizeStatusFilter filter) {
    switch (filter) {
      case MediaOrganizeStatusFilter.all:
        return '全部';
      case MediaOrganizeStatusFilter.success:
        return '成功';
      case MediaOrganizeStatusFilter.failed:
        return '失败';
    }
  }

  Future<void> _deleteTransferRecord(
    MediaOrganizeTransferItem item, {
    required bool deletesrc,
    required bool deletedest,
  }) async {
    try {
      final success = await controller.deleteTransferRecord(
        item,
        deletesrc: deletesrc,
        deletedest: deletedest,
      );
      if (success) {
        ToastUtil.success('删除整理历史成功');
      } else {
        ToastUtil.error('删除整理历史失败');
      }
    } catch (e) {
      ToastUtil.error('删除整理历史失败: $e');
    }
  }
}

class _MediaOrganizeFilterSheet extends StatelessWidget {
  const _MediaOrganizeFilterSheet({
    required this.selected,
    required this.onSelected,
    required this.onClear,
  });

  final MediaOrganizeStatusFilter selected;
  final ValueChanged<MediaOrganizeStatusFilter> onSelected;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Material(
      child: BottomSheetWidget(
        header: SectionHeader(
          title: '筛选',
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onClear,
            child: const Text('重置'),
          ),
        ),
        builder: (context, scrollController) => ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            Text(
              '按整理结果筛选',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: MediaOrganizeStatusFilter.values.map((filter) {
                final isActive = filter == selected;
                return GestureDetector(
                  onTap: () => onSelected(filter),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? primary
                          : primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isActive
                            ? primary
                            : primary.withValues(alpha: 0.22),
                      ),
                    ),
                    child: Text(
                      MediaOrganizePage._statusFilterLabel(filter),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : primary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
