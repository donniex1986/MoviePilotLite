import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_row_builder.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_edit_controller.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SiteEditPage extends GetView<SiteEditController> {
  const SiteEditPage({super.key});

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
    final confirmed = await showCupertinoDialog<bool>(
      context: Get.context!,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('保存'),
        content: const Text('确定保存站点修改？'),
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
        Future.delayed(const Duration(seconds: 1)).then((_) {
          ToastUtil.success('已保存');
        });
        Get.back(result: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final rowBuilder = SettingsFormRowBuilder(
      form: controller.form,
      optionsOf: controller.optionsFor,
      onCopied: (_) => ToastUtil.success('已复制'),
    );

    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          child: const Icon(CupertinoIcons.back),
        ),
        title: Obx(
          () => Text(
            controller.siteDetail.value?.name.isNotEmpty == true
                ? controller.siteDetail.value!.name
                : (controller.siteName.isNotEmpty
                      ? controller.siteName
                      : '编辑站点'),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          Obx(
            () => TextButton(
              onPressed: controller.isSaving.value ? null : _confirmSave,
              child: controller.isSaving.value
                  ? const CupertinoActivityIndicator()
                  : const Text('保存'),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.errorText.value != null &&
            controller.siteDetail.value == null) {
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
                    onPressed: controller.loadDetail,
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
          );
        }

        final skeletonEnabled =
            controller.isLoading.value && controller.siteDetail.value == null;

        return Stack(
          children: [
            Skeletonizer(
              enabled: skeletonEnabled,
              child: RefreshIndicator(
                onRefresh: controller.loadDetail,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    _buildSection(
                      context,
                      header: '基础信息',
                      fields: _skeletonFieldsOf(
                        _fieldsByKeys([
                          'name',
                          'domain',
                          'url',
                          'pri',
                          'rss',
                          'downloader',
                          'is_active',
                        ]),
                        skeletonEnabled,
                      ),
                      rowBuilder: rowBuilder,
                    ),
                    _buildSection(
                      context,
                      header: '认证与访问',
                      fields: _skeletonFieldsOf(
                        _authAccessFields(),
                        skeletonEnabled,
                      ),
                      rowBuilder: rowBuilder,
                    ),
                    _buildSection(
                      context,
                      header: '请求限制',
                      fields: _skeletonFieldsOf(
                        _fieldsByKeys([
                          'timeout',
                          'enable_rate_limit',
                          'limit_interval',
                          'limit_count',
                          'limit_seconds',
                        ]).where(controller.shouldShowField).toList(),
                        skeletonEnabled,
                      ),
                      rowBuilder: rowBuilder,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            if (controller.isSaving.value)
              Container(
                color: CupertinoColors.black.withValues(alpha: 0.12),
                child: const Center(child: CupertinoActivityIndicator()),
              ),
          ],
        );
      }),
    );
  }

  List<SettingsFieldConfig> _fieldsByKeys(List<String> keys) {
    return SiteEditController.formFields
        .where((field) => keys.contains(field.envKey))
        .toList();
  }

  List<SettingsFieldConfig> _authAccessFields() {
    return SiteEditController.formFields.where((field) {
      switch (field.envKey) {
        case 'cookie':
        case 'apikey':
        case 'token':
        case 'ua':
        case 'proxy':
        case 'render':
        case 'public':
        case 'filter':
        case 'note':
          return controller.shouldShowAuthField(field);
        default:
          return false;
      }
    }).toList();
  }

  Widget _buildSection(
    BuildContext context, {
    required String header,
    required List<SettingsFieldConfig> fields,
    required SettingsFormRowBuilder rowBuilder,
  }) {
    if (fields.isEmpty) return const SizedBox.shrink();
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
        if (header == '认证与访问') ...[_buildSensitiveFieldToggles(context)],
        for (final field in fields)
          rowBuilder.buildRow(
            context,
            field,
            editMode: controller.isEditing.value,
            readValue: controller.valueFor,
          ),
      ],
    );
  }

  Widget _buildSensitiveFieldToggles(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final groupedBg = CupertinoDynamicColor.resolve(
      CupertinoColors.secondarySystemGroupedBackground,
      context,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
      child: Obx(
        () => CupertinoSlidingSegmentedControl<SiteAuthMode>(
          groupValue: controller.authMode.value,
          thumbColor: primary,
          backgroundColor: groupedBg,
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          children: const {
            SiteAuthMode.cookie: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text('Cookie'),
            ),
            SiteAuthMode.api: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text('ApiKey / Token'),
            ),
          },
          onValueChanged: (value) {
            if (value != null) {
              controller.authMode.value = value;
            }
          },
        ),
      ),
    );
  }
}
