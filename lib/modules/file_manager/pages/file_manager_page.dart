import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/file_manager_controller.dart';
import '../widgets/file_item_widget.dart';

/// 文件管理器页面
/// 支持普通浏览模式和 picker 模式
///
/// 使用示例：
/// 1. 普通模式：Get.toNamed('/file-manager')
/// 2. Picker模式：
///    final result = await Get.toNamed('/file-manager', arguments: {
///      'isPickerMode': true,
///      'allowMultipleSelection': false,
///      'allowFileSelection': true,
///      'allowDirSelection': true,
///      'initialStorage': 'local',
///      'initialPath': '/downloads',
///    });
class FileManagerPage extends GetView<FileManagerController> {
  const FileManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          // 面包屑导航
          _buildBreadcrumb(context),
          // 文件列表（包含搜索栏作为 header）
          Expanded(child: _buildFileList(context)),
          // Picker 模式底部确认栏
          if (controller.isPickerMode) _buildPickerBottomBar(context),
        ],
      ),
    );
  }

  /// 构建 AppBar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading: Obx(() {
        final canGoBack = controller.pathStack.length > 1;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (canGoBack)
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: controller.goBack,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.chevron_back, size: 20),
                    Text('返回'),
                  ],
                ),
              ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.back(),
              child: const Text('关闭'),
            ),
          ],
        );
      }),
      centerTitle: true,
      title: Obx(() {
        return TextButton.icon(
          onPressed: () {
            _showStoragePicker(context);
          },
          icon: const Icon(CupertinoIcons.folder),
          label: Text(
            controller.selectedStorage.value?.name ?? '选择存储',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.systemGrey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }),
      actions: [
        // 按名称排序
        Obx(
          () => CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            onPressed: () => controller.toggleSort('name'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '名称',
                  style: TextStyle(
                    fontSize: 14,
                    color: controller.sortBy.value == 'name'
                        ? CupertinoColors.systemBlue
                        : CupertinoColors.systemGrey,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(
                  controller.getSortIcon('name'),
                  size: 12,
                  color: controller.sortBy.value == 'name'
                      ? CupertinoColors.systemBlue
                      : CupertinoColors.systemGrey,
                ),
              ],
            ),
          ),
        ),
        // 按时间排序
        Obx(
          () => CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            onPressed: () => controller.toggleSort('time'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '时间',
                  style: TextStyle(
                    fontSize: 14,
                    color: controller.sortBy.value == 'time'
                        ? CupertinoColors.systemBlue
                        : CupertinoColors.systemGrey,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(
                  controller.getSortIcon('time'),
                  size: 12,
                  color: controller.sortBy.value == 'time'
                      ? CupertinoColors.systemBlue
                      : CupertinoColors.systemGrey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 显示存储选择器
  void _showStoragePicker(BuildContext context) {
    if (controller.storages.isEmpty) return;

    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('选择存储'),
        actions: controller.storages.map((storage) {
          return CupertinoActionSheetAction(
            onPressed: () {
              controller.selectStorage(storage);
              Navigator.pop(context);
            },
            child: Text(storage.name),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('取消'),
        ),
      ),
    );
  }

  /// 构建面包屑导航
  Widget _buildBreadcrumb(BuildContext context) {
    return Obx(() {
      if (controller.pathStack.length <= 1) {
        return const SizedBox.shrink();
      }
      return Container(
        height: 36,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.pathStack.length,
          separatorBuilder: (_, __) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              CupertinoIcons.chevron_right,
              size: 12,
              color: CupertinoColors.systemGrey,
            ),
          ),
          itemBuilder: (context, index) {
            final isLast = index == controller.pathStack.length - 1;
            return GestureDetector(
              onTap: isLast ? null : () => controller.jumpToPath(index),
              child: Center(
                child: Text(
                  controller.getBreadcrumbName(index),
                  style: TextStyle(
                    fontSize: 13,
                    color: isLast
                        ? CupertinoColors.label
                        : CupertinoColors.systemBlue,
                    fontWeight: isLast ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  /// 构建搜索栏（作为列表 header）
  Widget _buildSearchBar(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: CupertinoSearchTextField(
          controller: controller.searchController,
          placeholder: '搜索文件...',
          onSubmitted: controller.onSearch,
          onSuffixTap: controller.clearSearch,
        ),
      ),
    );
  }

  /// 构建文件列表
  Widget _buildFileList(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value && controller.files.isEmpty) {
        return _buildSkeletonList();
      }

      if (controller.errorText.value != null) {
        return _buildErrorView(context);
      }

      if (controller.files.isEmpty && controller.searchKeyword.value.isEmpty) {
        return _buildEmptyView(context);
      }

      return CustomScrollView(
        slivers: [
          // 搜索栏跟随列表滑动
          _buildSearchBar(context),
          // 文件列表 - Plain 样式
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final file = controller.files[index];
              return FileItemWidget(file: file, controller: controller);
            }, childCount: controller.files.length),
          ),
          // 底部留白
          SliverToBoxAdapter(
            child: SizedBox(height: controller.isPickerMode ? 0 : 20),
          ),
        ],
      );
    });
  }

  /// 构建骨架屏列表 - Plain 样式
  Widget _buildSkeletonList() {
    return Skeletonizer(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: CupertinoColors.systemGrey5,
                  width: 0.5,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Row(
              children: [
                Bone.icon(size: 26),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bone.text(words: 2),
                      SizedBox(height: 2),
                      Bone.text(words: 1),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// 构建错误视图
  Widget _buildErrorView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle,
            size: 48,
            color: CupertinoColors.systemGrey,
          ),
          const SizedBox(height: 16),
          Text(
            controller.errorText.value ?? '加载失败',
            style: const TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
          const SizedBox(height: 16),
          CupertinoButton(
            onPressed: controller.loadFiles,
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  /// 构建空视图
  Widget _buildEmptyView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.folder,
            size: 48,
            color: CupertinoColors.systemGrey,
          ),
          const SizedBox(height: 16),
          Text(
            controller.searchKeyword.value.isNotEmpty ? '未找到匹配的文件' : '文件夹为空',
            style: const TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建 Picker 模式底部确认栏
  Widget _buildPickerBottomBar(BuildContext context) {
    return Obx(() {
      final count = controller.selectedFiles.length;
      return Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: 12 + MediaQuery.of(context).padding.bottom,
        ),
        decoration: BoxDecoration(
          color: CupertinoColors.secondarySystemGroupedBackground,
          border: Border(
            top: BorderSide(color: CupertinoColors.systemGrey5, width: 0.5),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  count > 0 ? '已选择 $count 项' : '请选择文件',
                  style: TextStyle(
                    fontSize: 15,
                    color: count > 0
                        ? CupertinoColors.label
                        : CupertinoColors.systemGrey,
                  ),
                ),
              ),
              CupertinoButton.filled(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                onPressed: count > 0 ? controller.confirmSelection : null,
                child: const Text('确认', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
