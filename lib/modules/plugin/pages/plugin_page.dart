import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/plugin/controllers/plugin_controller.dart';
import 'package:moviepilot_mobile/modules/plugin/models/plugin_models.dart';
import 'package:moviepilot_mobile/modules/plugin/widgets/plugin_item_card.dart';
import 'package:moviepilot_mobile/utils/image_util.dart';

class PluginPage extends GetView<PluginController> {
  const PluginPage({super.key});

  static const double _wideBreakpoint = 500;
  static const double _itemWidth = 250;
  static const double _horizontalPadding = 16;
  static const double _gridSpacing = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('插件'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.store_outlined),
            tooltip: '插件列表',
            onPressed: () => Get.toNamed('/plugin-list'),
          ),
          Obx(() {
            if (!controller.isLoading.value) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(right: 8),
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
        onRefresh: controller.load,
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
        placeholder: '搜索插件名称、描述、作者…',
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
      final loading = controller.isLoading.value;
      final error = controller.errorText.value;
      final items = controller.visibleItems;

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
                    onPressed: controller.load,
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
              controller.keyword.value.trim().isEmpty ? '暂无已安装插件' : '未找到匹配的插件',
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

      if (useGrid) {
        final availableWidth = width - _horizontalPadding * 2;
        final crossAxisCount = (availableWidth / (_itemWidth + _gridSpacing))
            .floor()
            .clamp(1, 10);

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            _horizontalPadding,
            16,
            _horizontalPadding,
            80,
          ),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
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
        );
      }

      return SliverPadding(
        padding: const EdgeInsets.fromLTRB(
          _horizontalPadding,
          16,
          _horizontalPadding,
          80,
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
      );
    });
  }

  Widget _buildCard(BuildContext context, PluginItem item) {
    final iconUrl = item.pluginIcon != null && item.pluginIcon!.isNotEmpty
        ? ImageUtil.convertPluginIconUrl(item.pluginIcon!)
        : '';
    return GestureDetector(
      onTap: () {
        if (item.hasPage) {
          Get.toNamed(
            '/plugin/dynamic-form/page',
            arguments: {'id': item.id, 'title': item.pluginName},
          );
        } else {
          Get.toNamed(
            '/plugin/dynamic-form/form',
            arguments: {'id': item.id, 'title': item.pluginName},
          );
        }
      },
      child: PluginItemCard(
        item: item,
        iconUrl: iconUrl,
        installCount: item.installCount,
      ),
    );
  }
}
