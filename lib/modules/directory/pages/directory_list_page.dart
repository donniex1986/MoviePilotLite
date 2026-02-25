import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/directory/controllers/directory_display_utils.dart';
import 'package:moviepilot_mobile/modules/directory/controllers/directory_list_controller.dart';
import 'package:moviepilot_mobile/modules/setting/models/setting_models.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_field_row.dart';

/// 目录列表页
/// 列表项默认只显示别名，支持展开/收起查看完整配置
/// UI 风格参考 settings basic page
class DirectoryListPage extends GetView<DirectoryListController> {
  const DirectoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          child: const Icon(CupertinoIcons.back),
        ),
        middle: const Text('目录', style: TextStyle(fontWeight: FontWeight.w600)),
        trailing: Obx(() {
          if (!controller.isLoading.value) return const SizedBox.shrink();
          return const Padding(
            padding: EdgeInsets.only(right: 8),
            child: CupertinoActivityIndicator(),
          );
        }),
        backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(
          context,
        ),
        border: null,
      ),
      child: SafeArea(
        child: Obx(() {
          if (controller.errorText.value != null) {
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
                        color: CupertinoColors.secondaryLabel.resolveFrom(
                          context,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CupertinoButton.filled(
                      onPressed: controller.loadDirectories,
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
            );
          }
          if (controller.directories.isEmpty && !controller.isLoading.value) {
            return Center(
              child: Text(
                '暂无目录配置',
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            );
          }
          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: controller.loadDirectories,
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final dir = controller.directories[index];
                    return _DirectoryExpandableItem(
                      key: ValueKey(dir.name),
                      index: index + 1,
                      directory: dir,
                    );
                  }, childCount: controller.directories.length),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

/// 索引标签样式：如 #1、1. 等
enum _IndexLabelStyle {
  hashtag, // #1, #2
  dot, // 1., 2.
}

class _DirectoryExpandableItem extends StatefulWidget {
  const _DirectoryExpandableItem({
    super.key,
    required this.index,
    required this.directory,
  });

  final int index;
  final DirectorySetting directory;

  static String _formatIndex(int i, _IndexLabelStyle style) {
    return switch (style) {
      _IndexLabelStyle.hashtag => '#$i',
      _IndexLabelStyle.dot => '$i.',
    };
  }

  @override
  State<_DirectoryExpandableItem> createState() =>
      _DirectoryExpandableItemState();
}

class _DirectoryExpandableItemState extends State<_DirectoryExpandableItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final dir = widget.directory;
    final displayName = dir.name.isEmpty ? '(未命名)' : dir.name;
    final indexLabel = _DirectoryExpandableItem._formatIndex(
      widget.index,
      _IndexLabelStyle.hashtag,
    );

    return CupertinoListSection.insetGrouped(
      backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(
        context,
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => setState(() => _expanded = !_expanded),
          child: CupertinoListTile.notched(
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: CupertinoColors.activeBlue.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Material(
                color: Colors.transparent,
                child: Text(
                  indexLabel,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.activeBlue.resolveFrom(context),
                  ),
                ),
              ),
            ),
            title: Text(
              displayName,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            additionalInfo: AnimatedRotation(
              turns: _expanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                CupertinoIcons.chevron_down,
                size: 18,
                color: CupertinoColors.tertiaryLabel.resolveFrom(context),
              ),
            ),
            leadingToTitle: 10,
            padding: const EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 10,
              bottom: 10,
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: _buildExpandedContent(context, dir),
          crossFadeState: _expanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }

  Widget _buildExpandedContent(BuildContext context, DirectorySetting dir) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFieldRow(
          context,
          '目录别名',
          value: dir.name.isEmpty ? '-' : dir.name,
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '媒体类型',
          value: dir.mediaType.isEmpty ? '全部' : dir.mediaType,
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '媒体类别',
          value: dir.mediaCategory.isEmpty ? '全部' : dir.mediaCategory,
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '资源存储',
          value: DirectoryDisplayUtils.formatStorageName(dir),
        ),
        const Divider(indent: 16),
        _buildFieldRow(context, '资源目录', value: dir.downloadPath),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '按类型分类',
          isToggle: true,
          toggleValue: dir.downloadTypeFolder,
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '按类别分类',
          isToggle: true,
          toggleValue: dir.downloadCategoryFolder,
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '目录监控',
          value: DirectoryDisplayUtils.formatMonitorType(dir),
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '媒体库存储',
          value: DirectoryDisplayUtils.formatStorageName(dir),
        ),
        _buildFieldRow(context, '媒体库目录', value: dir.libraryPath),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '整理方式',
          value: DirectoryDisplayUtils.formatTransferType(dir),
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '覆盖模式',
          value: DirectoryDisplayUtils.formatOverwriteMode(dir),
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '智能重命名',
          isToggle: true,
          toggleValue: dir.renaming,
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '刮削元数据',
          isToggle: true,
          toggleValue: dir.scraping,
        ),
        const Divider(indent: 16),
        _buildFieldRow(
          context,
          '发送通知',
          isToggle: true,
          toggleValue: dir.notify,
        ),
      ],
    );
  }

  Widget _buildFieldRow(
    BuildContext context,
    String title, {
    String? value,
    bool isToggle = false,
    bool toggleValue = false,
  }) {
    if (isToggle) {
      return SettingsFieldRow(
        title: title,
        compact: true,
        editMode: false,
        controlType: SettingsControlType.toggle,
        controlValue: toggleValue,
        switchValue: toggleValue,
        editable: false,
        onSwitchChanged: null,
      );
    }
    return SettingsFieldRow(
      title: title,
      compact: true,
      editMode: false,
      controlType: SettingsControlType.text,
      controlValue: value ?? '-',
      editable: false,
    );
  }
}
