import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/rule/controllers/rule_controller.dart';
import 'package:moviepilot_mobile/modules/rule/widgets/custom_rule_detail_sheet.dart';
import 'package:moviepilot_mobile/modules/rule/widgets/rule_card.dart';

/// 自定义规则页
class CustomRulePage extends GetView<RuleController> {
  const CustomRulePage({super.key});

  static const double _gridPadding = 16;
  static const double _gridSpacing = 12;
  static const double _cardAspectRatio = 1.75;

  int _crossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 520 ? 4 : 2;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          child: const Icon(CupertinoIcons.back),
        ),
        middle: const Text(
          '自定义规则',
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
          return Material(
            child: Center(
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
            ),
          );
        }
        if (controller.customRules.isEmpty) {
          return Material(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.doc_text,
                    size: 64,
                    color: CupertinoColors.tertiaryLabel.resolveFrom(context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无自定义规则',
                    style: TextStyle(
                      color: CupertinoColors.secondaryLabel.resolveFrom(
                        context,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return CustomScrollView(
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
                  final item = controller.customRules[index];
                  return GestureDetector(
                    onTap: () => CustomRuleDetailSheet.show(context, item),
                    behavior: HitTestBehavior.opaque,
                    child: RuleCard(
                      icon: CupertinoIcons.checkmark_circle,
                      title: item.name.isNotEmpty ? item.name : item.id,
                      subtitle: item.include.isNotEmpty
                          ? 'include: ${item.include}'
                          : null,
                      trailing: item.exclude.isNotEmpty
                          ? 'exclude: ${item.exclude}'
                          : null,
                    ),
                  );
                }, childCount: controller.customRules.length),
              ),
            ),
          ],
        );
      }),
    );
  }
}
