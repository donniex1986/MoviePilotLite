import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// 设定子项详情占位页（第一阶段仅展示，详情待 v2 或后续按模块接入）
class SettingsDetailPlaceholderPage extends StatelessWidget {
  const SettingsDetailPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final title = args?['title'] as String? ?? '设定';

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          child: const Icon(CupertinoIcons.back),
        ),
        middle: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor:
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
        border: null,
      ),
      child: Center(
        child: Text(
          '$title 详情页待接入',
          style: TextStyle(
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
