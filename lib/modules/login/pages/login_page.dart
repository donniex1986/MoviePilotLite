import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/theme/section.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/custom_button.dart';
import '../controllers/login_controller.dart';
import '../models/login_profile.dart';
import 'account_picker_page.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    _buildHeader(context),
                    const SizedBox(height: 32),
                    _buildFormSection(context),
                    const SizedBox(height: 16),
                    _buildProfilePicker(context),
                    const SizedBox(height: 24),
                    Obx(
                      () => CustomButton(
                        text: '登录并保存',
                        icon: CupertinoIcons.check_mark,
                        isLoading: controller.isLoading.value,
                        onPressed: () => controller.submitLogin(),
                        borderRadius: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String placeholder, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefix,
    bool autocorrect = true,
    bool enableSuggestions = true,
  }) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      prefix: prefix != null
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconTheme(
                data: const IconThemeData(
                  size: 18,
                  color: CupertinoColors.systemGrey,
                ),
                child: prefix,
              ),
            )
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CupertinoColors.systemGrey4),
      ),
      clearButtonMode: OverlayVisibilityMode.editing,
    );
  }

  Widget _buildPasswordField() {
    return Obx(
      () => CupertinoTextField(
        controller: controller.passwordController,
        placeholder: '密码',
        obscureText: !controller.isPasswordVisible.value,
        keyboardType: TextInputType.text,
        prefix: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconTheme(
            data: IconThemeData(size: 18, color: CupertinoColors.systemGrey),
            child: Icon(CupertinoIcons.lock),
          ),
        ),
        suffix: CupertinoButton(
          padding: const EdgeInsets.only(right: 8),
          minSize: 0,
          onPressed: () {
            controller.isPasswordVisible.value =
                !controller.isPasswordVisible.value;
          },
          child: Icon(
            controller.isPasswordVisible.value
                ? CupertinoIcons.eye_slash
                : CupertinoIcons.eye,
            size: 20,
            color: CupertinoColors.systemGrey,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CupertinoColors.systemGrey4),
        ),
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CupertinoColors.systemGrey5,
          ),
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            'assets/logo.svg',
            width: 32,
            height: 32,
            colorFilter: ColorFilter.mode(
              context.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '使用你的账户登录以访问 MoviePilot 服务',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
        ),
      ],
    );
  }

  Widget _buildFormSection(BuildContext context) {
    return Section(
      child: Column(
        children: [
          _buildTextField(
            controller.serverController,
            '服务器地址（含协议，如 https://example.com）',
            keyboardType: TextInputType.url,
            prefix: const Icon(CupertinoIcons.link),
            autocorrect: false,
            enableSuggestions: false,
          ),
          const SizedBox(height: 10),
          _buildTextField(
            controller.usernameController,
            '用户名',
            keyboardType: TextInputType.text,
            prefix: const Icon(CupertinoIcons.person),
            autocorrect: false,
            enableSuggestions: false,
          ),
          const SizedBox(height: 10),
          _buildPasswordField(),
          const SizedBox(height: 10),
          _buildTextField(
            controller.otpController,
            '二步验证码（如未启用可留空）',
            keyboardType: TextInputType.number,
            prefix: const Icon(CupertinoIcons.number),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicker(BuildContext context) {
    final selected = controller.selectedProfile.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '历史账号',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: controller.profiles.isEmpty
                      ? null
                      : () => _showPicker(context, controller.profiles),
                  child: const Text('更多'),
                ),
              ],
            ),
          ],
        ),
        if (controller.profiles.isEmpty)
          const Text(
            '暂无已保存账号',
            style: TextStyle(color: CupertinoColors.systemGrey),
          )
        else ...[
          Builder(
            builder: (context) =>
                _buildProfileChips(context, controller.profiles, selected),
          ),
          if (selected != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                '${selected.username} @ ${selected.server}',
                style: const TextStyle(color: CupertinoColors.activeGreen),
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildProfileChips(
    BuildContext context,
    List<LoginProfile> profiles,
    LoginProfile? selected,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: profiles
          .map(
            (p) => GestureDetector(
              onTap: () => controller.fillFromProfile(p),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: selected?.id == p.id
                      ? context.primaryColor.withOpacity(0.15)
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: selected?.id == p.id
                        ? context.primaryColor
                        : CupertinoColors.systemGrey4,
                  ),
                ),
                child: Text(
                  p.username,
                  style: TextStyle(
                    color: selected?.id == p.id
                        ? context.primaryColor
                        : CupertinoColors.label,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  void _showPicker(BuildContext context, List<LoginProfile> profiles) {
    showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (_) => const AccountPickerPage(),
    );
  }
}
