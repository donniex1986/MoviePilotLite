import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/toast_util.dart';
import '../models/login_profile.dart';
import '../repositories/auth_repository.dart';

class LoginController extends GetxController {
  LoginController(this._repository);

  final AuthRepository _repository;

  final serverController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();

  final profiles = <LoginProfile>[].obs;
  final selectedProfile = Rxn<LoginProfile>();
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  @override
  void onInit() {
    _loadProfiles();
    super.onInit();
  }

  void _loadProfiles() {
    profiles.assignAll(_repository.getProfiles());
    if (profiles.isEmpty) return;

    // 尽量保持上次选中的账号；否则默认选择最新的一个。
    final currentId = selectedProfile.value?.id;
    LoginProfile? match;
    if (currentId != null) {
      for (final p in profiles) {
        if (p.id == currentId) {
          match = p;
          break;
        }
      }
    }
    fillFromProfile(match ?? profiles.first);
  }

  void fillFromProfile(LoginProfile profile) {
    selectedProfile.value = profile;
    serverController.text = profile.server;
    usernameController.text = profile.username;
    passwordController.text = profile.password;
  }

  Future<void> submitLogin() async {
    final server = serverController.text.trim();
    final username = usernameController.text.trim();
    final password = passwordController.text;
    final otpPassword = otpController.text;

    if (server.isEmpty || username.isEmpty || password.isEmpty) {
      ToastUtil.info('服务器地址、用户名和密码不能为空');
      return;
    }

    isLoading.value = true;
    try {
      await _repository.login(
        server: server,
        username: username,
        password: password,
        otpPassword: otpPassword,
      );
      _loadProfiles();
      ToastUtil.success('已保存账号信息', title: '登录成功');
      // 跳转到 Dashboard
      Get.offAllNamed('/dashboard');
    } catch (e) {
      ToastUtil.error(e.toString(), title: '登录失败');
    } finally {
      isLoading.value = false;
    }
  }
}

