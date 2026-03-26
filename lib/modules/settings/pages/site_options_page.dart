import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/controllers/settings_site_options_controller.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_option_visuals.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_row_builder.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 站点选项设置页
class SiteOptionsPage extends GetView<SettingsSiteOptionsController> {
  const SiteOptionsPage({super.key});

  List<SettingsFieldConfig> _skeletonFieldsOf(
    List<SettingsFieldConfig> fields,
    bool skeletonEnabled,
  ) {
    if (!skeletonEnabled) return fields;
    if (fields.isEmpty) return fields;
    const count = 5;
    final out = <SettingsFieldConfig>[];
    for (var i = 0; i < count; i++) {
      out.add(fields[i % fields.length]);
    }
    return out;
  }

  Future<void> _confirmSave() async {
    if (!controller.hasPendingChanges) {
      return;
    }
    final confirmed = await showCupertinoDialog<bool>(
      context: Get.context!,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('保存'),
        content: const Text('确定保存修改？'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('取消'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('保存'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      final ok = await controller.saveEdit();
      if (ok && Get.context != null) {
        ToastUtil.success('已保存');
      }
    }
  }

  Future<void> _onLeadingTap() async {
    if (controller.hasPendingChanges) {
      final discard = await showCupertinoDialog<bool>(
        context: Get.context!,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('返回'),
          content: const Text('有未保存修改，是否放弃？'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('继续编辑'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('放弃'),
            ),
          ],
        ),
      );
      if (discard == true) {
        controller.cancelEdit();
        Get.back();
      }
      return;
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final rowBuilder = SettingsFormRowBuilder(
      form: controller.form,
      optionsOf: (k) => settingsEnums[k] ?? const [],
      onCopied: (_) => ToastUtil.success('已复制'),
      optionLeadingOf: buildSettingsOptionLeading,
    );
    return Obx(() {
      final skeletonEnabled =
          controller.isLoading.value && controller.envData.value == null;

      Widget body;
      if (controller.errorText.value != null && controller.envData.value == null) {
        body = Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.errorText.value ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
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
      } else {
        final siteDataFields = controller.fields
            .where(
              (f) =>
                  f.envKey == 'SITEDATA_REFRESH_INTERVAL' ||
                  f.envKey == 'SITE_MESSAGE',
            )
            .toList();
        final browserFields = controller.fields
            .where((f) => f.envKey == 'BROWSER_EMULATION')
            .toList();

        body = Stack(
          children: [
            Skeletonizer(
              enabled: skeletonEnabled,
              child: RefreshIndicator(
                onRefresh: controller.load,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                      child: Text(
                        '站点数据刷新与浏览器仿真相关配置',
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.secondaryLabel.resolveFrom(
                            context,
                          ),
                        ),
                      ),
                    ),
                    _buildSection(
                      context,
                      header: '站点数据',
                      fields: _skeletonFieldsOf(siteDataFields, skeletonEnabled),
                      rowBuilder: rowBuilder,
                    ),
                    _buildSection(
                      context,
                      header: '浏览器仿真',
                      fields: _skeletonFieldsOf(browserFields, skeletonEnabled),
                      rowBuilder: rowBuilder,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            if (controller.isUpdating.value)
              Container(
                color: CupertinoColors.black.withValues(alpha: 0.2),
                child: const Center(child: CupertinoActivityIndicator()),
              ),
          ],
        );
      }
      return Scaffold(
        appBar: AppBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _onLeadingTap,
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text(
            '站点选项',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            TextButton(onPressed: _confirmSave, child: const Text('保存')),
          ],
        ),
        body: body,
      );
    });
  }

  Widget _buildSection(
    BuildContext context, {
    required String header,
    required List<SettingsFieldConfig> fields,
    required SettingsFormRowBuilder rowBuilder,
  }) {
    if (fields.isEmpty) {
      return const SizedBox.shrink();
    }
    return Section(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      header: SectionHeader(
        title: header,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      children: [
        for (final field in fields)
          rowBuilder.buildRow(
            context,
            field,
            editMode: controller.isEditing.value,
            readValue: (k) => controller.envData.value?.valueFor(k),
          ),
      ],
    );
  }
}
