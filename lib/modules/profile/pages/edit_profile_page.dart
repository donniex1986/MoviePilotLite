import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/login/repositories/auth_repository.dart';
import 'package:moviepilot_mobile/modules/profile/controllers/profile_controller.dart';
import 'package:moviepilot_mobile/modules/profile/models/user_info.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _nicknameController;
  final _isSaving = false.obs;

  final ProfileController _profileController = Get.find<ProfileController>();
  final AuthRepository _authRepository = Get.find<AuthRepository>();

  @override
  void initState() {
    super.initState();
    final userInfo = _profileController.currentUserInfo.value;

    _nameController = TextEditingController(text: userInfo?.name ?? '');
    _emailController = TextEditingController(text: userInfo?.email ?? '');
    _nicknameController = TextEditingController(
      text: userInfo?.nickname ??
          (userInfo?.settings['nickname'] as String? ?? ''),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑个人信息'),
        actions: [
          Obx(
            () => _isSaving.value
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CupertinoActivityIndicator(),
                  )
                : IconButton(
                    icon: const Icon(CupertinoIcons.check_mark),
                    onPressed: _saveChanges,
                  ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '姓名',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: '邮箱',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nicknameController,
              decoration: const InputDecoration(
                labelText: '昵称',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveChanges() async {
    final current = _profileController.currentUserInfo.value;
    if (current == null) {
      Get.snackbar('提示', '暂未获取到用户信息，请稍后重试');
      return;
    }

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final nickname = _nicknameController.text.trim();

    if (name.isEmpty) {
      Get.snackbar('提示', '姓名不能为空');
      return;
    }
    if (email.isEmpty) {
      Get.snackbar('提示', '邮箱不能为空');
      return;
    }

    _isSaving.value = true;
    try {
      UserInfo updated = current.copyWith(
        name: name,
        email: email,
        nickname: nickname.isNotEmpty ? nickname : null,
      );

      final result = await _authRepository.updateUserInfo(updated);
      if (result == null) {
        Get.snackbar('保存失败', '更新用户信息失败，请稍后重试');
        return;
      }

      _profileController.currentUserInfo.value = result;
      Get.back();
      Get.snackbar('成功', '个人信息已更新');
    } catch (e) {
      Get.snackbar('保存失败', '更新用户信息失败: $e');
    } finally {
      _isSaving.value = false;
    }
  }
}

