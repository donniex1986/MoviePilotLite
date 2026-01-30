import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../controllers/login_controller.dart';
import '../models/login_profile.dart';

class AccountPickerPage extends GetView<LoginController> {
  const AccountPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.1,
      maxChildSize: 0.95,
      snap: true,
      snapSizes: const [0.1, 0.6, 0.95],
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // 拖拽指示器
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey3,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // 标题栏
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '选择账号',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: () => Get.back(),
                    child: const Text('完成'),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: CupertinoColors.separator),
            // 账号列表
            Expanded(
              child: Obx(
                () {
                  final profiles = controller.profiles;
                  if (profiles.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.person_circle,
                            size: 64,
                            color: CupertinoColors.systemGrey3,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '暂无已保存账号',
                            style: TextStyle(
                              fontSize: 16,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: profiles.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final profile = profiles[index];
                      final isSelected =
                          controller.selectedProfile.value?.id == profile.id;
                      return _buildAccountCard(context, profile, isSelected);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard(
    BuildContext context,
    LoginProfile profile,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        controller.fillFromProfile(profile);
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? context.primaryColor
                : CupertinoColors.systemGrey4,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? context.primaryColor.withOpacity(0.1)
                  : const Color(0x0A000000),
              blurRadius: isSelected ? 12 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // 头像/图标
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: isSelected
                      ? [
                          context.primaryColor,
                          context.primaryColor.withOpacity(0.8),
                        ]
                      : [
                          CupertinoColors.systemGrey3,
                          CupertinoColors.systemGrey4,
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(
                CupertinoIcons.person_fill,
                color: CupertinoColors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // 账号信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          profile.username,
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: context.primaryColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '当前',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: context.primaryColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profile.server,
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (profile.userName.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      '昵称: ${profile.userName}',
                      style: TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.systemGrey2,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // 选中指示器
            if (isSelected)
              Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: context.primaryColor,
                size: 24,
              )
            else
              const Icon(
                CupertinoIcons.chevron_right,
                color: CupertinoColors.systemGrey3,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
