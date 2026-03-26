import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/discover/controllers/discover_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/controllers/subscribe_controller.dart';
import 'package:moviepilot_mobile/modules/subscribe/models/subscribe_models.dart';
import 'package:moviepilot_mobile/modules/subscribe/widgets/subscribe_filter_sheet.dart';
import 'package:moviepilot_mobile/modules/subscribe/widgets/subscribe_item_card.dart';
import 'package:moviepilot_mobile/utils/http_path_builder_util.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class SubscribePage extends GetView<SubscribeController> {
  const SubscribePage({super.key, this.scrollController});

  final ScrollController? scrollController;

  static const double _horizontalPadding = 16;
  static const double _cardSpacing = 12;
  static const double _floatingBarHeight = 52;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingBar(context),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          _buildSliverContent(context),
          const SliverToBoxAdapter(
            child: SizedBox(height: _floatingBarHeight + 32),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return AppBar(
      title: Text(controller.subscribeType.displayName),
      centerTitle: false,
      actions: [
        if (controller.isTv) ...[
          _buildAppBarAction(
            context,
            icon: CupertinoIcons.paperplane_fill,
            tooltip: '订阅分享',
            backgroundColor: const Color(0xFF0A84FF).withValues(alpha: 0.18),
            iconColor: const Color(0xFF0A84FF),
            onPressed: () => Get.toNamed(
              '/subscribe-share',
              arguments: controller.subscribeType,
            ),
          ),
          const SizedBox(width: 8),
        ],
        _buildAppBarAction(
          context,
          icon: CupertinoIcons.flame_fill,
          tooltip: '热门订阅',
          backgroundColor: const Color(0xFFFF9F0A).withValues(alpha: 0.2),
          iconColor: const Color(0xFFFF9F0A),
          onPressed: () => Get.toNamed(
            '/subscribe-popular',
            arguments: controller.subscribeType,
          ),
        ),
        const SizedBox(width: 8),
        _buildAppBarAction(
          context,
          icon: CupertinoIcons.slider_horizontal_3,
          tooltip: '默认规则',
          backgroundColor: primary.withValues(alpha: 0.15),
          iconColor: primary,
          onPressed: controller.openDefaultRules,
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildAppBarAction(
    BuildContext context, {
    required IconData icon,
    required String tooltip,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onPressed,
  }) {
    return Tooltip(
      message: tooltip,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Icon(icon, size: 22, color: iconColor),
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
          : CupertinoDynamicColor.resolve(
              CupertinoColors.secondaryLabel,
              context,
            );
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
                      ? '搜索订阅名称…'
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
              placeholder: '搜索订阅名称…',
              onSubmitted: (v) => Navigator.of(ctx).pop(v),
            ),
          ),
        );
      },
    );
    controllerText.dispose();
    if (submitted == null) return;
    controller.updateKeyword(submitted);
  }

  Widget _buildSliverContent(BuildContext context) {
    return Obx(() {
      final loading = controller.userLoading.value;
      final error = controller.errorText.value;
      final items = controller.visibleUserItems;
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
                    onPressed: controller.loadUserSubscribes,
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
              '暂无订阅',
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
      return SliverPadding(
        padding: const EdgeInsets.fromLTRB(
          _horizontalPadding,
          0,
          _horizontalPadding,
          0,
        ),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < items.length - 1 ? _cardSpacing : 0,
              ),
              child: SubscribeItemCard(
                item: item,
                isTv: controller.isTv,
                onTap: () => _openEditSheet(context, item),
                onMoreTap: (type) {
                  switch (type) {
                    case SubscribeItemCardType.edit:
                      _openEditSheet(context, item);
                      break;
                    case SubscribeItemCardType.detail:
                      _mediaDetail(context, item);
                      break;
                    case SubscribeItemCardType.pause:
                      _pauseSubscribe(context, item);
                      break;
                    case SubscribeItemCardType.resume:
                      _resumeSubscribe(context, item);
                      break;
                    case SubscribeItemCardType.reset:
                      _resetSubscribeState(context, item);
                      break;
                    case SubscribeItemCardType.shared:
                      _shareSubscribe(context, item);
                      break;
                    case SubscribeItemCardType.delete:
                      _deleteSubscribe(context, item);
                      break;
                    case SubscribeItemCardType.search:
                      _searchSubscribe(context, item);
                      break;
                  }
                },
              ),
            );
          }, childCount: items.length),
        ),
      );
    });
  }

  void _openEditSheet(BuildContext context, SubscribeItem item) {
    Get.toNamed('/subscribe-edit', arguments: item);
  }

  _pauseSubscribe(BuildContext context, SubscribeItem item) {
    ToastUtil.warning(
      '确定暂停该订阅吗？',
      onConfirm: () async {
        try {
          final result = await controller.pauseSubscribe(item.id.toString());
          if (context.mounted && result) {
            ToastUtil.success('暂停成功');
            controller.loadUserSubscribes();
          }
        } catch (e) {
          ToastUtil.error('暂停失败: $e');
        }
      },
    );
  }

  _resumeSubscribe(BuildContext context, SubscribeItem item) {
    ToastUtil.warning(
      '确定继续该订阅吗？',
      onConfirm: () async {
        final result = await controller.resumeSubscribe(item.id.toString());
        if (context.mounted && result) {
          ToastUtil.success('继续成功');
          controller.loadUserSubscribes();
        }
      },
    );
  }

  _resetSubscribeState(BuildContext context, SubscribeItem item) {
    ToastUtil.warning(
      '确定重置该订阅状态吗？',
      onConfirm: () async {
        final result = await controller.resetSubscribeState(item.id.toString());
        if (context.mounted && result) {
          ToastUtil.success('重置成功');
          controller.loadUserSubscribes();
        }
      },
    );
  }

  _mediaDetail(BuildContext context, SubscribeItem item) {
    final path = HttpPathBuilderUtil.buildHttpPath(
      DiscoverSource.tmdb,
      item.tmdbid.toString(),
    );
    if (path.isEmpty) {
      ToastUtil.info('暂无可用详情信息');
      return;
    }
    final title = item.name;
    final params = <String, String>{
      'path': path,
      if (title != null && title.isNotEmpty) 'title': title,
      if (item.year != null && item.year!.isNotEmpty) 'year': item.year!,
      if (item.type != null && item.type!.isNotEmpty) 'type_name': item.type!,
    };
    Get.toNamed('/media-detail', parameters: params);
  }

  _shareSubscribe(BuildContext context, SubscribeItem item) {
    final path = HttpPathBuilderUtil.buildHttpPath(
      DiscoverSource.tmdb,
      item.tmdbid.toString(),
    );
    if (path.isEmpty) {
      ToastUtil.info('暂无可用详情信息');
      return;
    }
    final title = item.name;
    final params = <String, String>{
      'path': path,
      if (title != null && title.isNotEmpty) 'title': title,
      if (item.year != null && item.year!.isNotEmpty) 'year': item.year!,
      if (item.type != null && item.type!.isNotEmpty) 'type_name': item.type!,
    };
    Get.toNamed('/media-detail', parameters: params);
  }

  _deleteSubscribe(BuildContext context, SubscribeItem item) {
    ToastUtil.warning(
      '确定删除该订阅吗？',
      onConfirm: () async {
        final result = await controller.deleteSubscribes(item.id.toString());
        if (context.mounted && result) {
          ToastUtil.success('删除成功');
          controller.loadUserSubscribes();
        }
      },
    );
  }

  _searchSubscribe(BuildContext context, SubscribeItem item) async {
    final result = await controller.searchSubscribe(item.id.toString());
    if (context.mounted && result) {
      ToastUtil.success('搜索任务已创建');
    }
  }

  Future<void> _openFilterSheet(BuildContext context) {
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SizedBox(
          height: MediaQuery.of(sheetContext).size.height * 0.4,
          child: Obx(
            () => SubscribeFilterSheet(
              states: controller.availableStates,
              selected: controller.selectedStates.toSet(),
              onToggle: controller.toggleStateFilter,
              onClear: controller.clearStateFilters,
            ),
          ),
        );
      },
    );
  }
}
