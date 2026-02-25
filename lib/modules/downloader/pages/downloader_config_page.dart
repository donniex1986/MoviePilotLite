import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/downloader/controllers/downloader_config_controller.dart';
import 'package:moviepilot_mobile/modules/downloader/models/downloader_config_model.dart';
import 'package:moviepilot_mobile/modules/downloader/widgets/reactive_text_field.dart';

/// 下载器配置页面：支持新增和编辑
class DownloaderConfigPage extends StatefulWidget {
  const DownloaderConfigPage({super.key});

  @override
  State<DownloaderConfigPage> createState() => _DownloaderConfigPageState();
}

class _DownloaderConfigPageState extends State<DownloaderConfigPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<DownloaderConfigController>().ensureFormData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DownloaderConfigController>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            Icon(Icons.download_for_offline_outlined, color: theme.colorScheme.primary, size: 22),
            const SizedBox(width: 8),
            const Text('配置'),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.configs.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!controller.isCreateMode)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    controller.editName.value.isEmpty ? Get.parameters['name'] ?? '' : controller.editName.value,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              _buildTwoColumnSection(context, [
                _ToggleRow(label: '启用', value: controller.editEnabled, onChanged: (v) => controller.editEnabled.value = v),
                _ToggleRow(label: '默认', value: controller.editIsDefault, onChanged: (v) => controller.editIsDefault.value = v),
              ]),
              const SizedBox(height: 16),
              _buildTwoColumnSection(context, [
                ReactiveTextField(label: '名称', value: controller.editName, icon: Icons.folder_outlined, onChanged: (v) => controller.editName.value = v),
                ReactiveTextField(label: '地址', value: controller.editHost, icon: Icons.dns_outlined, onChanged: (v) => controller.editHost.value = v),
              ]),
              const SizedBox(height: 16),
              _buildTwoColumnSection(context, [
                ReactiveTextField(label: '用户名', value: controller.editUsername, icon: Icons.person_outline, onChanged: (v) => controller.editUsername.value = v),
                ReactiveTextField(label: '密码', value: controller.editPassword, icon: Icons.lock_outline, obscureText: true, onChanged: (v) => controller.editPassword.value = v),
              ]),
              const SizedBox(height: 16),
              _buildTwoColumnSection(context, [
                _ToggleRow(label: '自动分类管理', value: controller.editAutoCategory, onChanged: (v) => controller.editAutoCategory.value = v),
                _ToggleRow(label: '顺序下载', value: controller.editSequential, onChanged: (v) => controller.editSequential.value = v),
              ]),
              const SizedBox(height: 16),
              _buildTwoColumnSection(context, [
                _ToggleRow(label: '强制继续', value: controller.editForceResume, onChanged: (v) => controller.editForceResume.value = v),
                _ToggleRow(label: '优先首尾文件', value: controller.editFirstLastPriority, onChanged: (v) => controller.editFirstLastPriority.value = v),
              ]),
              const SizedBox(height: 24),
              _buildPathMappingSection(context, controller),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  onPressed: controller.isSaving.value ? null : () async {
                    final ok = await controller.save();
                    if (ok) Get.back();
                  },
                  icon: const Icon(Icons.save, size: 18),
                  label: const Text('保存'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTwoColumnSection(BuildContext context, List<Widget> children) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 400;
        if (isWide) {
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (int i = 0; i < children.length; i += 2)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: (constraints.maxWidth - 32) / 2 - 8, child: children[i]),
                    if (i + 1 < children.length)
                      SizedBox(width: (constraints.maxWidth - 32) / 2 - 8, child: children[i + 1]),
                  ],
                ),
            ],
          );
        }
        return Column(children: children);
      },
    );
  }

  Widget _buildPathMappingSection(BuildContext context, DownloaderConfigController controller) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              '路径映射',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(() => Column(
            children: [
              for (int i = 0; i < controller.editPathMappings.length; i++)
                _PathMappingRow(
                  index: i,
                  mapping: controller.editPathMappings[i],
                  onFromChanged: (v) => controller.updatePathMapping(i, fromPath: v),
                  onToChanged: (v) => controller.updatePathMapping(i, toPath: v),
                  onStorageChanged: (v) => controller.updatePathMapping(i, storage: v),
                  onRemove: () => controller.removePathMapping(i),
                ),
            ],
          )),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: controller.addPathMapping,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('添加 路径映射'),
          ),
        ],
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final RxBool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium),
        Switch(
          value: value.value,
          onChanged: onChanged,
        ),
      ],
    ));
  }
}

class _PathMappingRow extends StatefulWidget {
  const _PathMappingRow({
    required this.index,
    required this.mapping,
    required this.onFromChanged,
    required this.onToChanged,
    required this.onStorageChanged,
    required this.onRemove,
  });

  final int index;
  final PathMapping mapping;
  final ValueChanged<String> onFromChanged;
  final ValueChanged<String> onToChanged;
  final ValueChanged<String> onStorageChanged;
  final VoidCallback onRemove;

  @override
  State<_PathMappingRow> createState() => _PathMappingRowState();
}

class _PathMappingRowState extends State<_PathMappingRow> {
  late TextEditingController _fromController;
  late TextEditingController _toController;

  @override
  void initState() {
    super.initState();
    _fromController = TextEditingController(text: widget.mapping.fromPath);
    _toController = TextEditingController(text: widget.mapping.toPath);
  }

  @override
  void didUpdateWidget(_PathMappingRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_fromController.text != widget.mapping.fromPath) {
      _fromController.text = widget.mapping.fromPath;
    }
    if (_toController.text != widget.mapping.toPath) {
      _toController.text = widget.mapping.toPath;
    }
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const storageOptions = ['local', 'aliyun', '115', 'rclone', 'openlist', 'smb'];
    final storageValue = widget.mapping.storage.isEmpty || !storageOptions.contains(widget.mapping.storage)
        ? 'local'
        : widget.mapping.storage;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('存储路径', style: theme.textTheme.bodySmall),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                            value: storageValue,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            ),
                            items: [
                              const DropdownMenuItem(value: 'local', child: Text('本地')),
                              const DropdownMenuItem(value: 'aliyun', child: Text('阿里云盘')),
                              const DropdownMenuItem(value: '115', child: Text('115网盘')),
                              const DropdownMenuItem(value: 'rclone', child: Text('RClone')),
                              const DropdownMenuItem(value: 'openlist', child: Text('OpenList')),
                              const DropdownMenuItem(value: 'smb', child: Text('SMB网络共享')),
                            ],
                            onChanged: (v) => widget.onStorageChanged(v ?? 'local'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: TextField(
                            controller: _fromController,
                            onChanged: widget.onFromChanged,
                            decoration: InputDecoration(
                              hintText: '/path/to/storage',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Icon(Icons.arrow_downward, size: 16),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('下载路径', style: theme.textTheme.bodySmall),
                    const SizedBox(height: 4),
                    TextField(
                      controller: _toController,
                      onChanged: widget.onToChanged,
                      decoration: InputDecoration(
                        hintText: '/path/to/download',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
                onPressed: widget.onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
