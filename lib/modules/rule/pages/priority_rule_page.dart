import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/rule/controllers/rule_controller.dart';
import 'package:moviepilot_mobile/modules/rule/widgets/rule_card.dart';

/// 优先级规则页
class PriorityRulePage extends GetView<RuleController> {
  const PriorityRulePage({super.key});

  static const double _gridPadding = 16;
  static const double _gridSpacing = 12;
  static const double _cardAspectRatio = 1.5;

  int _crossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 520 ? 4 : 2;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: Theme.of(context).brightness,
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground
            .resolveFrom(context),
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            child: const Icon(CupertinoIcons.back),
          ),
          middle: const Text(
            '优先级规则',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: controller.exportToClipboard,
            child: const Icon(CupertinoIcons.square_arrow_up),
          ),
          backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(
            context,
          ),
          border: null,
        ),
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
                      onPressed: controller.load,
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
            );
          }
          if (controller.priorityRules.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.list_bullet,
                    size: 64,
                    color: CupertinoColors.tertiaryLabel.resolveFrom(context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无优先级规则',
                    style: TextStyle(
                      color: CupertinoColors.secondaryLabel.resolveFrom(
                        context,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                CupertinoSliverRefreshControl(onRefresh: controller.load),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    _gridPadding,
                    16,
                    _gridPadding,
                    24,
                  ),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount(context),
                      crossAxisSpacing: _gridSpacing,
                      mainAxisSpacing: _gridSpacing,
                      childAspectRatio: _cardAspectRatio,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = controller.priorityRules[index];
                      return RuleCard(
                        icon: CupertinoIcons.list_number,
                        title: item.name,
                        subtitle: item.ruleString.isNotEmpty
                            ? item.ruleString
                            : null,
                        trailing:
                            (item.mediaType.isNotEmpty ||
                                item.category.isNotEmpty)
                            ? '${item.mediaType} ${item.category}'.trim()
                            : null,
                      );
                    }, childCount: controller.priorityRules.length),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
