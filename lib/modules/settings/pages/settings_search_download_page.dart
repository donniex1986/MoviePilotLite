import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/controllers/settings_search_download_controller.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/search_source_multi_select.dart';
import 'package:moviepilot_mobile/modules/settings/widgets/settings_field_row.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class SettingsSearchDownloadPage extends GetView<SettingsSearchDownloadController> {
  const SettingsSearchDownloadPage({super.key});

  void _onFieldChanged(SettingsFieldConfig field, dynamic newValue) {
    controller.addPendingChange(field.envKey, newValue);
  }

  Future<void> _confirmSave() async {
    if (!controller.hasPendingChanges) {
      controller.exitEditMode();
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

  Future<void> _confirmCancel() async {
    if (!controller.hasPendingChanges) {
      controller.cancelEdit();
      return;
    }
    final confirmed = await showCupertinoDialog<bool>(
      context: Get.context!,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('取消编辑'),
        content: const Text('放弃未保存的修改？'),
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
    if (confirmed == true) controller.cancelEdit();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final editing = controller.isEditing.value;
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            child: const Icon(CupertinoIcons.back),
          ),
          middle: const Text(
            '搜索&下载 - 基础设置',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: editing
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: _confirmCancel,
                      child: const Text('取消'),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: _confirmSave,
                      child: const Text('保存'),
                    ),
                  ],
                )
              : CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: controller.enterEditMode,
                  child: const Text('编辑'),
                ),
          backgroundColor:
              CupertinoColors.systemGroupedBackground.resolveFrom(context),
          border: null,
        ),
        child: Obx(() {
          if (controller.isLoading.value && controller.envData.value == null) {
            return const Center(child: CupertinoActivityIndicator());
          }
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
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
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
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                      child: Text(
                        '设定数据源、规则组等基础信息',
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.secondaryLabel
                              .resolveFrom(context),
                        ),
                      ),
                    ),
                  ),
                  _buildSection(
                    context,
                    header: '搜索&下载配置',
                    fields: controller.visibleFields(),
                  ),
                ],
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
    });
  }

  Widget _buildSection(
    BuildContext context, {
    required String header,
    required List<SettingsFieldConfig> fields,
  }) {
    if (fields.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: CupertinoListSection.insetGrouped(
        backgroundColor:
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
        header: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 4, top: 2),
          child: Text(
            header,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
          ),
        ),
        children: [
          for (final field in fields) _buildFieldRow(context, field)
        ],
      ),
    );
  }

  Widget _buildFieldRow(BuildContext context, SettingsFieldConfig field) {
    final value = controller.isEditing.value
        ? controller.effectiveValueFor(field)
        : controller.valueFor(field);
    final editable =
        controller.isEditing.value && field.type != SettingsFieldType.textCopy;
    final isSearchSource = field.envKey == 'SEARCH_SOURCE';

    if (isSearchSource) {
      return SettingsFieldRow(
        title: field.label,
        description: field.hint,
        icon: field.icon,
        editMode: controller.isEditing.value,
        control: SearchSourceMultiSelect(
          value: value?.toString(),
          editable: editable,
          onChanged: editable
              ? (v) => _onFieldChanged(field, v)
              : null,
        ),
      );
    }

    final controlType = _toControlType(field.type);
    String? enumLabel;
    if (field.type == SettingsFieldType.select && field.enumKey != null) {
      enumLabel = enumValueToLabel(field.enumKey!, value);
    }

    final isToggle = field.type == SettingsFieldType.toggle;
    final isSelect = field.type == SettingsFieldType.select;
    final isNumber = field.type == SettingsFieldType.number;
    final isText = field.type == SettingsFieldType.text;

    List<SettingsEnumOption>? selectOpts;
    if (isSelect && field.enumKey != null) {
      selectOpts = settingsEnums[field.enumKey] ?? [];
    }

    return SettingsFieldRow(
      title: field.label,
      description: field.hint,
      icon: field.icon,
      editMode: controller.isEditing.value,
      controlType: controlType,
      controlValue: value,
      unit: field.unit,
      enumLabel: enumLabel,
      enableCopy: field.type == SettingsFieldType.textCopy,
      onCopyTap: field.type == SettingsFieldType.textCopy
          ? () {
              final text = value?.toString() ?? '';
              if (text.isNotEmpty) {
                Clipboard.setData(ClipboardData(text: text));
                ToastUtil.success('已复制');
              }
            }
          : null,
      editable: editable,
      textController:
          (editable && (isText || isNumber))
              ? controller.textControllerFor(field)
              : null,
      onTextChanged:
          (editable && isText) ? (s) => _onFieldChanged(field, s) : null,
      onTextSubmitted:
          (editable && isText) ? (s) => _onFieldChanged(field, s) : null,
      switchValue: _parseBool(value),
      onSwitchChanged:
          (editable && isToggle)
              ? (v) => _onFieldChanged(field, v)
              : null,
      step: field.step,
      onNumberChanged:
          (editable && isNumber)
              ? (n) {
                  controller.textControllerFor(field).text = n.toString();
                  _onFieldChanged(field, n is int ? n : n.toInt());
                }
              : null,
      selectOptions: selectOpts,
      onSelectChanged:
          (editable && isSelect &&
              selectOpts != null &&
              selectOpts.isNotEmpty)
              ? (v) => _onFieldChanged(field, v)
              : null,
    );
  }

  SettingsControlType _toControlType(SettingsFieldType t) {
    switch (t) {
      case SettingsFieldType.text:
        return SettingsControlType.text;
      case SettingsFieldType.textCopy:
        return SettingsControlType.textCopy;
      case SettingsFieldType.number:
        return SettingsControlType.number;
      case SettingsFieldType.select:
        return SettingsControlType.select;
      case SettingsFieldType.toggle:
        return SettingsControlType.toggle;
    }
  }

  bool _parseBool(dynamic v) {
    if (v == null) return false;
    if (v is bool) return v;
    final s = v.toString().toLowerCase();
    return s == 'true' || s == '1';
  }
}
