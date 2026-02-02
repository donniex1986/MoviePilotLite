import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:talker/talker.dart';

import '../../../utils/toast_util.dart';
import '../models/login_profile.dart';
import '../repositories/auth_repository.dart';

class LoginController extends GetxController {
  LoginController(this._repository, this._talker);

  final AuthRepository _repository;
  final Talker _talker;

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
    _autoLogin();
    super.onInit();
  }

  /// 自动登录
  Future<void> _autoLogin() async {
    // 如果没有保存的登录配置文件，则不进行自动登录
    if (profiles.isEmpty) return;
    
    // 获取最新的登录配置文件
    final latestProfile = profiles.first;
    
    // 尝试使用保存的accessToken获取用户信息
    isLoading.value = true;
    try {
      final success = await _repository.getUserInfo(
        server: latestProfile.server,
        accessToken: latestProfile.accessToken,
      );
      
      if (success) {
        // 获取用户信息成功，直接跳转到dashboard页面
        _talker.info('自动登录成功');
        ToastUtil.success('自动登录成功');
        Get.offAllNamed('/dashboard');
      } else {
        // 获取用户信息失败，需要用户手动登录
        _talker.warning('自动登录失败，需要用户手动登录');
      }
    } catch (e) {
      // 获取用户信息失败，需要用户手动登录
      _talker.warning('自动登录失败，需要用户手动登录: $e');
    } finally {
      isLoading.value = false;
    }
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

