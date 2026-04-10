import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/adapters/plugin_form_adapter_registry.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/controllers/dynamic_form_controller.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/switch_field_widget.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/text_field_widget.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';

void registerAppLitePushRenderer() {
  Widget builder(
    BuildContext context,
    List<FormBlock> _,
    DynamicFormController controller,
    bool formMode,
    Widget Function(BuildContext context, FormBlock block) __,
  ) {
    return AppLitePushRenderer(controller: controller, formMode: formMode);
  }

  PluginFormAdapterRegistry.registerRenderer('applitepush', builder);
  PluginFormAdapterRegistry.registerRenderer('apppushmsg', builder);
  PluginFormAdapterRegistry.registerRenderer('AppPushMsg', builder);
  PluginFormAdapterRegistry.registerRenderer('APPLitePush', builder);
}

class AppLitePushRenderer extends StatelessWidget {
  const AppLitePushRenderer({
    super.key,
    required this.controller,
    required this.formMode,
  });

  final DynamicFormController controller;
  final bool formMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tint = theme.colorScheme.primary;

    return Obx(() {
      final testing = controller.isTestingAppLitePush.value;
      return ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
        children: [
          SectionHeader(
            title: 'App Lite Push',
            subtitle: formMode ? '保存后生效' : '支持保存、测试与应用',
          ),
          SwitchFieldWidget(
            block: const SwitchFieldBlock(label: '启用插件', name: 'enabled'),
            value: controller.getBoolValue('enabled'),
            onChanged: (value) => controller.updateField('enabled', value),
          ),
          const SizedBox(height: 8),
          TextFieldBlockWidget(
            block: const TextFieldBlock(
              label: 'Push Key',
              name: 'apikey',
              hint: '请输入 Push Key',
            ),
            value: controller.getValue('apikey')?.toString(),
            onChanged: (value) => controller.updateField('apikey', value),
          ),
          const SizedBox(height: 8),
          TextFieldBlockWidget(
            block: const TextFieldBlock(
              label: 'App Push Token',
              name: 'token',
              hint: '请输入 App Push Token',
            ),
            value: controller.getValue('token')?.toString(),
            onChanged: (value) => controller.updateField('token', value),
          ),
          const SizedBox(height: 8),
          Section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '调试操作',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.label,
                      context,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '请先保存 Push Key 和 App Push Token，再发送测试消息。右上角“应用”会把当前 App Push Token 同步为 JPush Alias。',
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.45,
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.secondaryLabel,
                      context,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    color: tint.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                    onPressed: testing ? null : () => _onSendTest(),
                    child: testing
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoActivityIndicator(color: tint),
                              const SizedBox(width: 8),
                              Text(
                                '发送中...',
                                style: TextStyle(
                                  color: tint,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            '发送测试消息',
                            style: TextStyle(
                              color: tint,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '最近一次测试结果',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.label,
                      context,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.tertiarySystemFill,
                      context,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SelectableText(
                    controller.appLitePushResultText,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: CupertinoDynamicColor.resolve(
                        CupertinoColors.label,
                        context,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Future<void> _onSendTest() async {
    final success = await controller.runAppLitePushTest();
    if (success) {
      ToastUtil.success('测试消息已发送');
    } else {
      ToastUtil.error('测试消息发送失败');
    }
  }
}
