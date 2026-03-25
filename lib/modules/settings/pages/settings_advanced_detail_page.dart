import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/controllers/settings_advanced_detail_controller.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_row_builder.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';

/// 高级设置详情页：按基础设置风格，区块展示 系统、媒体、网络、日志、实验室
class SettingsAdvancedDetailPage
    extends GetView<SettingsAdvancedDetailController> {
  const SettingsAdvancedDetailPage({super.key});

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
        title: const Text('高级设置'),
        actions: [TextButton(onPressed: _confirmSave, child: const Text('保存'))],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.envData.value == null) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (controller.errorText.value != null) {
          return Center(
            child: SingleChildScrollView(
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
        return CustomScrollView(
          slivers: [
            for (final section in controller.sections)
              _buildSection(
                context,
                header: section.$1,
                fields: section.$2,
                rowBuilder: rowBuilder,
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
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
    if (fields.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverToBoxAdapter(
      child: Section(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                  left: 12,
                  right: 12,
                  top: 0,
                  bottom: 8,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    onPressed: () async {
                      final err = await controller.fetchLlmModels();
                      if (err != null && err.isNotEmpty) {
                        ToastUtil.error(err);
                      } else {
                        ToastUtil.success('已获取模型列表');
                      }
                    },
                    child: const Text('获取可用模型列表'),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
