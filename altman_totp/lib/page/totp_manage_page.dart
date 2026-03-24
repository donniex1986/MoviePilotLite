import 'dart:async';
import 'package:altman_totp/services/totp_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:altman_totp/widget/totp_edit_sheet.dart';

class TotpManagePage extends StatefulWidget {
  const TotpManagePage({
    super.key,
    this.selectMode,
    this.targetServer,
    this.targetUsername,
  });

  final bool? selectMode;
  final String? targetServer;
  final String? targetUsername;

  @override
  State<TotpManagePage> createState() => _TotpManagePageState();
}

class _TotpManagePageState extends State<TotpManagePage> {
  late final TotpService controller;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    controller = Get.find<TotpService>();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  String _normalizeServer(String value) {
    final trimmed = value.trim().toLowerCase();
    if (trimmed.endsWith('/')) return trimmed.substring(0, trimmed.length - 1);
    return trimmed;
  }

  PopupMenuItem<String> _buildMenuItem({
    required String value,
    required IconData icon,
    required String text,
    Color? color,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: color, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  String _buildOtpauthString({required String name, required String key}) {
    final safeName = Uri.encodeComponent(name);
    final safeKey = Uri.encodeQueryComponent(key);
    return 'otpauth://totp/$safeName?secret=$safeKey&issuer=MoviePilotLite';
  }

  Future<void> _showExportSheet(
    BuildContext context, {
    required String name,
    required String key,
  }) async {
    final payload = _buildOtpauthString(name: name, key: key);
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(ctx).dividerColor,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '导出 TOTP',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: QrImageView(
                      data: payload,
                      size: 180,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SelectableText('name: $name'),
                const SizedBox(height: 4),
                SelectableText('key: $key'),
                const SizedBox(height: 8),
                SelectableText(payload),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.surface,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onSurface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            ClipboardData(text: 'name: $name\nkey: $key'),
                          );
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('name/key 已复制到剪贴板')),
                          );
                        },
                        child: const Text('复制name/key'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton(
                        onPressed: () async {
                          Clipboard.setData(ClipboardData(text: payload));
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('二维码字符串已复制到剪贴板')),
                          );
                        },
                        child: const Text('复制二维码字符串'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showEditorSheet(
    BuildContext context, {
    String? id,
    String? username,
    String? secret,
  }) async {
    final result = await showModalBottomSheet<TotpEditResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => TotpEditSheet(
        id: id,
        username: username,
        secret: secret,
        editing: id != null,
      ),
    );
    if (result == null) return;
    await controller.upsert(
      id: result.id,
      username: result.username,
      secret: result.secret,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final selectMode =
        widget.selectMode ??
        (args is Map &&
            (args['selectMode'] == true || args['selectMode'] == 1));
    final targetServer =
        widget.targetServer ??
        (args is Map ? (args['server']?.toString() ?? '') : '');
    final targetUsername =
        widget.targetUsername ??
        (args is Map ? (args['username']?.toString() ?? '') : '');

    return Scaffold(
      appBar: AppBar(
        title: Text(selectMode ? 'Authenticator' : 'Authenticator'),
        actions: selectMode
            ? null
            : [
                IconButton(
                  onPressed: () => _showEditorSheet(context),
                  icon: const Icon(Icons.add),
                ),
              ],
      ),
      body: Obx(() {
        controller.refreshTick.value;
        final list = controller.profiles;
        if (list.isEmpty) {
          return const Center(child: Text('暂无 TOTP 配置'));
        }
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = list[index];
            final code = controller.generateCurrentCode(
              item.server,
              item.username,
            );
            final bool isRecommended =
                targetServer.isNotEmpty &&
                targetUsername.isNotEmpty &&
                item.server == _normalizeServer(targetServer) &&
                item.username.trim().toLowerCase() ==
                    targetUsername.trim().toLowerCase();
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.08),
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: !selectMode
                    ? null
                    : () {
                        if (code == null || code.isEmpty) return;
                        Get.back(result: code);
                      },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    item.username,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (isRecommended) ...[
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Text(
                                      '推荐',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),

                            const SizedBox(height: 8),
                            Text(
                              code ?? '------',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${controller.secondsUntilNextRefresh(periodSeconds: item.period)}s 后刷新',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 6),
                            LinearProgressIndicator(
                              minHeight: 4,
                              value: controller.reverseProgress(
                                periodSeconds: item.period,
                              ),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ],
                        ),
                      ),
                      if (!selectMode)
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.more_horiz),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          onSelected: (value) async {
                            if (value == 'edit') {
                              await _showEditorSheet(
                                context,
                                id: item.id,
                                username: item.username,
                                secret: item.secret,
                              );
                              return;
                            }
                            if (value == 'delete') {
                              await controller.remove(item.id);
                            }
                            if (value == 'share') {
                              if (!mounted) return;
                              await _showExportSheet(
                                this.context,
                                name: item.username,
                                key: item.secret,
                              );
                            }
                          },
                          itemBuilder: (context) => [
                            _buildMenuItem(
                              value: 'edit',
                              icon: Icons.edit_outlined,
                              text: '编辑',
                            ),
                            _buildMenuItem(
                              value: 'delete',
                              icon: Icons.delete_outline,
                              text: '删除',
                              color: Theme.of(context).colorScheme.error,
                            ),
                            _buildMenuItem(
                              value: 'share',
                              icon: Icons.share,
                              text: '导出',
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
