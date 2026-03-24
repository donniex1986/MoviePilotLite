import 'package:altman_totp/page/totp_scan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp/otp.dart';
import 'dart:async';

class TotpEditResult {
  TotpEditResult({
    this.id,
    required this.username,
    required this.secret,
    this.server = '',
  });

  final String? id;
  final String username;
  final String secret;
  final String server;
}

class TotpEditSheet extends StatefulWidget {
  const TotpEditSheet({
    super.key,
    this.id,
    this.username,
    this.secret,
    this.editing = false,
  });

  final String? id;
  final String? username;
  final String? secret;
  final bool editing;

  @override
  State<TotpEditSheet> createState() => _TotpEditSheetState();
}

class _TotpEditSheetState extends State<TotpEditSheet> {
  late final TextEditingController _quickInputController;
  late final TextEditingController _usernameController;
  late final TextEditingController _secretController;
  String? _previewCode;
  String? _confirmedSecret;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _quickInputController = TextEditingController();
    _usernameController = TextEditingController(text: widget.username ?? '');
    _secretController = TextEditingController(text: widget.secret ?? '');
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _quickInputController.dispose();
    _usernameController.dispose();
    _secretController.dispose();
    super.dispose();
  }

  Map<String, String> _parseOtpAuthUri(String raw) {
    final uri = Uri.tryParse(raw);
    if (uri == null || uri.scheme != 'otpauth' || uri.host != 'totp') {
      return {};
    }
    final label = uri.pathSegments.isNotEmpty
        ? Uri.decodeComponent(uri.pathSegments.join('/'))
        : '';
    final secret = uri.queryParameters['secret']?.trim() ?? '';
    final issuer = uri.queryParameters['issuer']?.trim() ?? '';
    String username = '';
    if (label.contains(':')) {
      username = label.split(':').last.trim();
    } else {
      username = label.trim();
    }
    return {'secret': secret, 'username': username, 'issuer': issuer};
  }

  bool _looksLikeBase32Secret(String text) {
    final value = text.trim().replaceAll(' ', '').toUpperCase();
    if (value.length < 16) return false;
    return RegExp(r'^[A-Z2-7]+=*$').hasMatch(value);
  }

  void _applyInputString(String raw) {
    final value = raw.trim();
    if (value.isEmpty) return;
    if (value.startsWith('otpauth://')) {
      final parsed = _parseOtpAuthUri(value);
      if (parsed.isEmpty) return;
      _secretController.text = parsed['secret'] ?? _secretController.text;
      _usernameController.text = parsed['username'] ?? _usernameController.text;
      return;
    }
    if (_looksLikeBase32Secret(value)) {
      _secretController.text = value.replaceAll(' ', '');
    }
  }

  Future<void> _scan() async {
    final raw = await Get.to<String>(() => const TotpScanPage());
    if (raw == null || raw.isEmpty) return;
    _applyInputString(raw);
    if (mounted) setState(() {});
  }

  void _confirmQuickInput() {
    final input = _quickInputController.text.trim();
    _applyInputString(input);
    final secret = _secretController.text.trim().replaceAll(' ', '');
    if (!_looksLikeBase32Secret(secret)) {
      setState(() {
        _previewCode = null;
        _confirmedSecret = null;
      });
      return;
    }
    try {
      final code = OTP.generateTOTPCodeString(
        secret,
        DateTime.now().millisecondsSinceEpoch,
        interval: 30,
        length: 6,
        algorithm: Algorithm.SHA1,
        isGoogle: true,
      );
      setState(() {
        _previewCode = code;
        _confirmedSecret = secret;
      });
    } catch (_) {
      setState(() {
        _previewCode = null;
        _confirmedSecret = null;
      });
    }
  }

  int _secondsUntilNext() {
    final nowSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final remainder = nowSeconds % 30;
    if (remainder == 0) return 30;
    return 30 - remainder;
  }

  double _reverseProgress() {
    return _secondsUntilNext() / 30;
  }

  String? _livePreviewCode() {
    final secret = _confirmedSecret;
    if (secret == null || secret.isEmpty) return null;
    try {
      return OTP.generateTOTPCodeString(
        secret,
        DateTime.now().millisecondsSinceEpoch,
        interval: 30,
        length: 6,
        algorithm: Algorithm.SHA1,
        isGoogle: true,
      );
    } catch (_) {
      return null;
    }
  }

  void _submit() {
    final username = _usernameController.text.trim();
    final secret = _secretController.text.trim().replaceAll(' ', '');
    if (username.isEmpty || secret.isEmpty) return;
    Navigator.of(
      context,
    ).pop(TotpEditResult(id: widget.id, username: username, secret: secret));
  }

  Widget _buildGroup({
    required BuildContext context,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).barBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildFormRow({
    required BuildContext context,
    required String title,
    required Widget field,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
                  width: 0.5,
                ),
              ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 92,
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: field),
        ],
      ),
    );
  }

  Widget _buildInlineField({
    required TextEditingController controller,
    String? hintText,
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
  }) {
    return CupertinoTextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      placeholder: hintText,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      textAlign: TextAlign.right,
      decoration: const BoxDecoration(color: Colors.transparent),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final background = CupertinoDynamicColor.resolve(
      CupertinoColors.systemGroupedBackground,
      context,
    );
    return SafeArea(
      top: false,
      child: Container(
        color: background,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, bottom + 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      widget.editing ? '编辑' : '新增',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    const Spacer(),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(28, 28),
                      onPressed: _scan,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.qrcode_viewfinder, size: 18),
                          SizedBox(width: 4),
                          Text('扫码'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '支持直接输入密钥或 otpauth 字符串',
                  style: TextStyle(
                    fontSize: 13,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
                const SizedBox(height: 10),
                _buildGroup(
                  context: context,
                  children: [
                    _buildFormRow(
                      context: context,
                      title: '快捷输入',
                      isLast: true,
                      field: Row(
                        children: [
                          Expanded(
                            child: _buildInlineField(
                              controller: _quickInputController,
                              hintText: 'xxx',
                            ),
                          ),
                          const SizedBox(width: 8),
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            minimumSize: const Size(28, 28),
                            onPressed: _confirmQuickInput,
                            child: const Text('确认'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (_previewCode != null) ...[
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '当前验证码: ${_livePreviewCode() ?? _previewCode}',
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.secondaryLabel.resolveFrom(
                              context,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '下次更新: ${_secondsUntilNext()}s',
                          style: TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.tertiaryLabel.resolveFrom(
                              context,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          minHeight: 3,
                          value: _reverseProgress(),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                _buildGroup(
                  context: context,
                  children: [
                    _buildFormRow(
                      context: context,
                      title: 'Username',
                      field: _buildInlineField(
                        controller: _usernameController,
                        hintText: '用户名',
                      ),
                    ),
                    _buildFormRow(
                      context: context,
                      title: 'Secret',
                      field: _buildInlineField(
                        controller: _secretController,
                        hintText: 'Base32',
                      ),
                    ),
                    _buildFormRow(
                      context: context,
                      title: '类型',
                      isLast: true,
                      field: const Align(
                        alignment: Alignment.centerRight,
                        child: Text('TOTP / 6位 / 30秒'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    onPressed: _submit,
                    child: const Text('保存'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('取消'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
