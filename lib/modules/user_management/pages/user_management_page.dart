import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/profile/models/user_info.dart';
import 'package:moviepilot_mobile/modules/user_management/controllers/user_management_controller.dart';
import 'package:moviepilot_mobile/modules/user_management/widgets/user_management_item_card.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class UserManagementPage extends GetView<UserManagementController> {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户管理'),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (!controller.isSuperuser) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.errorText.value ?? '仅超级管理员可访问',
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        if (controller.isLoading.value && controller.items.isEmpty) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (controller.errorText.value != null) {
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
        return CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: controller.load),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: CupertinoSearchTextField(
                  placeholder: '搜索用户',
                  onSubmitted: (value) {
                    controller.search(value);
                  },
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                final filtered = controller.filteredItems;
                if (index >= filtered.length) return const SizedBox.shrink();
                final user = filtered[index];
                final stats = controller.getStatsForUser(user.id);
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                    right: 16,
                    left: 16,
                  ),
                  child: UserManagementItemCard(
                    user: user,
                    stats: stats,
                    // onEdit: () => _onEditUser(user),
                    onDelete: () => _onDeleteUser(user),
                  ),
                );
              },
              itemCount: controller.filteredItems.length,
            ),
          ],
        );
      }),
    );
  }

  void _onEditUser(UserInfo user) {
    ToastUtil.info('编辑用户 ${user.name} 功能待实现');
  }

  void _onDeleteUser(UserInfo user) {
    ToastUtil.warning(
      '删除用户 ${user.name}?',
      onConfirm: () {
        controller.deleteUser(user.id);
      },
    );
  }
}
