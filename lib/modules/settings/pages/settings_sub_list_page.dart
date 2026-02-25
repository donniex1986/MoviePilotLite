import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/controllers/settings_sub_list_controller.dart';

class SettingsSubListPage extends GetView<SettingsSubListController> {
  const SettingsSubListPage({super.key});

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
        middle: Text(
          controller.pageTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor:
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
        border: null,
      ),
      child: SafeArea(
        child: items.isEmpty
            ? Center(
                child: Text(
                  '暂无子项',
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    fontSize: 16,
                  ),
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 8, bottom: 24),
                    sliver: SliverToBoxAdapter(
                      child: CupertinoListSection.insetGrouped(
                        backgroundColor: CupertinoColors.systemGroupedBackground
                            .resolveFrom(context),
                        children: [
                          for (final item in items)
                            CupertinoListTile.notched(
                              title: Text(
                                item.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: item.subtitle != null
                                  ? Text(
                                      item.subtitle!,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: CupertinoColors.secondaryLabel
                                            .resolveFrom(context),
                                      ),
                                    )
                                  : null,
                              trailing:
                                  const CupertinoListTileChevron(),
                              onTap: () => controller.onSubItemTap(item),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
