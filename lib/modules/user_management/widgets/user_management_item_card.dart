import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/profile/models/user_info.dart';
import 'package:moviepilot_mobile/modules/user_management/controllers/user_management_controller.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/theme/section.dart';

class UserManagementItemCard extends StatelessWidget {
  const UserManagementItemCard({
    super.key,
    required this.user,
    required this.stats,
    this.onEdit,
    this.onDelete,
  });

  final UserInfo user;
  final UserSubscribeStats? stats;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Section(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildAvatar(user.avatar),
                  if (user.isSuperuser)
                    Positioned(
                      top: -4,
                      left: -4,
                      child: Icon(
                        CupertinoIcons.star_fill,
                        size: 18,
                        color: const Color(0xFFFFD700),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            user.nicknameOrSetting ?? user.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFF9500),
                            ),
                          ),
                        ),
                        if (onEdit != null)
                          GestureDetector(
                            onTap: onEdit,
                            child: Icon(
                              CupertinoIcons.pencil,
                              size: 18,
                              color: const Color(0xFFFF9500),
                            ),
                          ),
                        if (onDelete != null && !user.isSuperuser)
                          GestureDetector(
                            onTap: onDelete,
                            child: Icon(
                              CupertinoIcons.delete_solid,
                              size: 18,
                              color: CupertinoColors.systemRed,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        if (user.isSuperuser)
                          _buildChip('管理员', AppTheme.errorColor)
                        else
                          _buildChip('普通用户', CupertinoColors.systemGrey),
                        if (user.isActive)
                          _buildChip('激活', AppTheme.successColor)
                        else
                          _buildChip('已停用', CupertinoColors.systemGrey),
                      ],
                    ),
                    if (stats != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(CupertinoIcons.film, size: 16, color: primary),
                          const SizedBox(width: 4),
                          Text(
                            '${stats!.movieCount}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(CupertinoIcons.tv, size: 16, color: primary),
                          const SizedBox(width: 4),
                          Text(
                            '${stats!.tvCount}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (user.email.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(CupertinoIcons.envelope, size: 16, color: primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    user.email,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: CupertinoColors.systemGrey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar(String? avatar) {
    if (avatar == null || avatar.isEmpty) {
      return const CircleAvatar(radius: 28, child: Icon(CupertinoIcons.person));
    }
    try {
      String base64String = avatar;
      if (base64String.startsWith('data:image')) {
        final commaIndex = base64String.indexOf(',');
        if (commaIndex != -1) {
          base64String = base64String.substring(commaIndex + 1);
        }
      }
      final bytes = base64Decode(base64String);
      if (bytes.isEmpty) {
        return const CircleAvatar(
          radius: 28,
          child: Icon(CupertinoIcons.person),
        );
      }
      return CircleAvatar(
        radius: 28,
        backgroundImage: MemoryImage(Uint8List.fromList(bytes)),
      );
    } catch (_) {
      return const CircleAvatar(radius: 28, child: Icon(CupertinoIcons.person));
    }
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
