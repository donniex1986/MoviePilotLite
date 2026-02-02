import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/services/realm_service.dart';
import 'package:moviepilot_mobile/modules/login/models/login_profile.dart';

import '../controllers/dashboard_controller.dart';
import '../widgets/dashboard_widgets.dart';
import '../../search/controllers/search_controller.dart';
import '../../search/pages/search_page.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: _buildNavigationBar(context),
      child: SafeArea(
        child: Obx(
          () => CustomScrollView(
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: () async {
                  await controller.refreshData();
                },
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildWidgetGrid(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 获取最新的登录配置文件
  LoginProfile? _getLatestLoginProfile() {
    try {
      final realmService = RealmService();
      final profiles = realmService.realm.all<LoginProfile>();
      if (profiles.isEmpty) {
        return null;
      }
      // 按更新时间排序，返回最新的登录配置
      final sortedProfiles = profiles.toList()
        ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return sortedProfiles.first;
    } catch (e) {
      // 如果获取失败，返回null
      return null;
    }
  }

  /// 解码头像
  List<int> _decodeAvatar(String avatar) {
    try {
      // 检查是否是data URL格式
      if (avatar.startsWith('data:image')) {
        // 提取base64部分
        final commaIndex = avatar.indexOf(',');
        if (commaIndex != -1) {
          final base64String = avatar.substring(commaIndex + 1);
          return base64Decode(base64String);
        }
      }
      // 否则，直接解码
      return base64Decode(avatar);
    } catch (e) {
      // 如果解码失败，返回空列表
      return [];
    }
  }

  /// 构建导航栏
  CupertinoNavigationBar _buildNavigationBar(BuildContext context) {
    // 获取最新的登录配置文件
    final loginProfile = _getLatestLoginProfile();

    return CupertinoNavigationBar(
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => _showShortcuts(context),
        child: const Icon(CupertinoIcons.app_badge),
      ),
      middle: CupertinoButton(
        onPressed: () => _showSearch(context),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        minimumSize: Size(40, 40),
        child: Container(
          width: double.infinity,
          height: 36,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey3,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: const [
              SizedBox(width: 12),
              Icon(
                CupertinoIcons.search,
                size: 16,
                color: CupertinoColors.systemGrey,
              ),
              SizedBox(width: 8),
              Text(
                '搜索电影、电视剧...',
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showNotifications(context),
            child: Stack(
              children: [
                const Icon(CupertinoIcons.bell),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemRed,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showProfile(context),
            child:
                loginProfile != null &&
                    loginProfile.avatar != null &&
                    loginProfile.avatar!.isNotEmpty
                ? () {
                    final avatarBytes = _decodeAvatar(loginProfile.avatar!);
                    if (avatarBytes.isNotEmpty) {
                      return Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: MemoryImage(Uint8List.fromList(avatarBytes)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else {
                      return const Icon(CupertinoIcons.person_circle);
                    }
                  }()
                : const Icon(CupertinoIcons.person_circle),
          ),
        ],
      ),
    );
  }

  /// 构建组件网格
  Widget _buildWidgetGrid(BuildContext context) {
    if (controller.displayedWidgets.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.square_grid_2x2,
              size: 64,
              color: CupertinoColors.systemGrey3,
            ),
            const SizedBox(height: 16),
            Text(
              '暂无组件',
              style: TextStyle(fontSize: 16, color: CupertinoColors.systemGrey),
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              onPressed: () => _showWidgetSelector(context),
              child: const Text('添加组件'),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _showWidgetSelector(context),
              child: const Icon(CupertinoIcons.add_circled),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...controller.displayedWidgets.map(
          (widget) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildWidgetCard(context, widget),
          ),
        ),
      ],
    );
  }

  /// 构建组件卡片
  Widget _buildWidgetCard(BuildContext context, String widgetType) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DashboardWidgets.buildWidget(widgetType),
    );
  }

  /// 显示搜索
  void _showSearch(BuildContext context) {
    Get.to(
      () => const SearchPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SearchController>(() => SearchController());
      }),
    );
  }

  /// 显示捷径
  void _showShortcuts(BuildContext context) {
    Get.snackbar('捷径', '捷径功能开发中');
  }

  /// 显示通知
  void _showNotifications(BuildContext context) {
    Get.snackbar('通知', '通知功能开发中');
  }

  /// 显示个人资料
  void _showProfile(BuildContext context) {
    Get.snackbar('个人资料', '个人资料功能开发中');
  }

  /// 显示组件选择器
  void _showWidgetSelector(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => _WidgetSelectorModal(controller: controller),
    );
  }
}

/// 组件选择器弹窗
class _WidgetSelectorModal extends StatelessWidget {
  const _WidgetSelectorModal({required this.controller});

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      snap: true,
      snapSizes: const [0.5, 0.7, 0.95],
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // 拖拽指示器
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey3,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // 标题栏
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '选择组件',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Get.back(),
                    minimumSize: Size(0, 0),
                    child: const Text('完成'),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: CupertinoColors.separator),
            // 组件列表
            Expanded(
              child: Obx(
                () => ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: DashboardController.availableWidgets.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final widget = DashboardController.availableWidgets[index];
                    final isSelected = controller.displayedWidgets.contains(
                      widget,
                    );
                    return _buildWidgetItem(context, widget, isSelected);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetItem(
    BuildContext context,
    String widget,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          controller.removeWidget(widget);
        } else {
          controller.addWidget(widget);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? context.primaryColor
                : CupertinoColors.systemGrey4,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? context.primaryColor
                      : CupertinoColors.label,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: context.primaryColor,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
