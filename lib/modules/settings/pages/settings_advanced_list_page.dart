import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/controllers/settings_advanced_list_controller.dart';

/// 高级设置列表页：展示 系统、媒体、网络、日志、实验室
class SettingsAdvancedListPage extends GetView<SettingsAdvancedListController> {
  const SettingsAdvancedListPage({super.key});

  static Color _iconColorForId(String id) {
    switch (id) {
      case 'system':
        return CupertinoColors.systemIndigo;
      case 'media':
        return CupertinoColors.systemPink;
      case 'network':
        return CupertinoColors.systemBlue;
      case 'log':
        return CupertinoColors.systemOrange;
      case 'lab':
        return CupertinoColors.systemPurple;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = controller.items;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          child: const Icon(CupertinoIcons.back),
        ),
        middle: const Text('高级设置', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        border: null,
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 8),
              sliver: SliverToBoxAdapter(
                child: CupertinoListSection.insetGrouped(
                  children: [
                    for (final item in items)
                      CupertinoListTile.notched(
                        leading: Container(
                          width: 29,
                          height: 29,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _iconColorForId(item.id).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            item.icon ?? Icons.settings_outlined,
                            size: 18,
                            color: _iconColorForId(item.id),
                          ),
                        ),
                        title: Text(item.title),
                        trailing: const CupertinoListTileChevron(),
                        onTap: () => controller.onItemTap(item),
                      ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}
