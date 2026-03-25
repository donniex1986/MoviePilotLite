import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/controllers/settings_basic_controller.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_row_builder.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SettingsBasicPage extends GetView<SettingsBasicController> {
  const SettingsBasicPage({super.key});

  Future<void> _confirmSave() async {
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

  @override
  Widget build(BuildContext context) {
    final rowBuilder = SettingsFormRowBuilder(
      form: controller.form,
      optionsOf: (k) => k == 'LLM_MODEL'
          ? controller.llmModelOptions
          : (settingsEnums[k] ?? const []),
      onCopied: (_) => ToastUtil.success('已复制'),
    );
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          child: const Icon(CupertinoIcons.back),
        ),
        title: const Text(
          '基础设置',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [TextButton(onPressed: _confirmSave, child: const Text('保存'))],
      ),
      body: Obx(() {
        if (controller.errorText.value != null) {
          return Column(
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
          );
        }
        return Stack(
          children: [
            Skeletonizer(
              enabled:
                  controller.isLoading.value &&
                  controller.envData.value == null,
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  _buildSection(
                    context,
                    header: '基础配置',
                    fields: controller.visibleBasicFields(),
                    rowBuilder: rowBuilder,
                  ),
                  if (controller.aiSectionVisible)
                    _buildSection(
                      context,
                      header: '全局智能助手',
                      fields: controller.visibleAiFields(),
                      rowBuilder: rowBuilder,
                    ),
                ],
              ),
            ),
            if (controller.isUpdating.value)
              Container(
                color: CupertinoColors.black.withValues(alpha: 0.2),
                child: const Center(child: CupertinoActivityIndicator()),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String header,
    required List<SettingsFieldConfig> fields,
    required SettingsFormRowBuilder rowBuilder,
  }) {
    return Section(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      header: SectionHeader(
        title: header,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      children: [
        for (final field in fields) ...[
          rowBuilder.buildRow(
            context,
            field,
            editMode: controller.isEditing.value,
            readValue: (k) => controller.envData.value?.valueFor(k),
          ),
          if (field.envKey == 'LLM_API_KEY')
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 0,
                bottom: 8,
              ),
              child: CupertinoButton.filled(
                sizeStyle: CupertinoButtonSize.large,
                padding: EdgeInsets.zero,
                child: const Text('获取可用模型列表'),
                onPressed: () async {
                  final err = await controller.fetchLlmModels();
                  if (err != null && err.isNotEmpty) {
                    ToastUtil.error(err);
                  } else {
                    ToastUtil.success('已获取模型列表');
                  }
                },
              ),
            ),
        ],
      ],
    );
  }
}
