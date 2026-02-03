import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/profile/models/user_info.dart';
import 'package:moviepilot_mobile/modules/profile/models/user_global_config.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import '../../../services/api_client.dart';
import '../../../services/realm_service.dart';
import '../models/login_profile.dart';
import '../models/login_response.dart';

class AuthRepository extends GetxService {
  final _talker = Get.find<AppLog>();
  final _realm = Get.find<RealmService>().realm;
  final _api = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  Future<LoginResponse> login({
    required String server,
    required String username,
    required String password,
    String otpPassword = '',
  }) async {
    final normalizedServer = _normalizeServer(server);

    // 每次登录前根据用户输入的服务器地址配置 API 客户端
    _api.setBaseUrl(normalizedServer);
    _talker.info('开始登录: $username @ $normalizedServer');

    final response = await _api.postForm<Map<String, dynamic>>(
      '/api/v1/login/access-token',
      {'username': username, 'password': password, 'otp_password': otpPassword},
    );
    final login = LoginResponse.fromJson(response.data!);
    _talker.info('登录成功: $username');
    // 登录成功后，后续请求统一携带 Token
    _api.setToken(login.accessToken);

    // 保存当前账号配置，包含 server、token 以及用户信息
    _saveProfile(normalizedServer, username, password, login);

    // 登录完成后调用API接口获取配置信息和cookie
    await getUserGlobalConfig(
      server: normalizedServer,
      accessToken: login.accessToken,
    );
    return login;
  }

  /// 更新用户信息
  Future<UserInfo?> updateUserInfo(UserInfo userInfo) async {
    try {
      final server = _appService.baseUrl;
      if (server == null || server.isEmpty) {
        _talker.warning('更新用户信息失败: baseUrl 为空');
        return null;
      }

      final normalizedServer = _normalizeServer(server);
      _api.setBaseUrl(normalizedServer);

      final token = _appService.loginResponse?.accessToken;
      if (token == null || token.isEmpty) {
        _talker.warning('更新用户信息失败: accessToken 为空');
        return null;
      }
      _api.setToken(token);

      // 构建请求体，确保 settings.nickname 与顶层 nickname 一致
      final payload = Map<String, dynamic>.from(userInfo.toJson());
      final nickname = userInfo.nickname;
      if (nickname != null && nickname.isNotEmpty) {
        final settings = Map<String, dynamic>.from(
          (payload['settings'] as Map<String, dynamic>? ?? <String, dynamic>{}),
        );
        settings['nickname'] = nickname;
        payload['settings'] = settings;
        payload['nickname'] = nickname;
      }

      final response = await _api.put<Map<String, dynamic>>(
        '/api/v1/user/',
        payload,
      );
      final data = response.data;
      if (data == null) {
        _talker.warning('更新用户信息失败: 返回数据为空');
        return null;
      }

      final updated = UserInfo.fromJson(data);
      _appService.saveUserInfo(updated);
      _talker.info('更新用户信息成功');
      return updated;
    } catch (e) {
      _talker.warning('更新用户信息失败: $e');
      return null;
    }
  }

  /// 获取用户全局配置（/api/v1/system/global/user）
  Future<UserGlobalConfig?> getUserGlobalConfig({
    required String server,
    required String accessToken,
  }) async {
    try {
      final normalizedServer = _normalizeServer(server);
      _api.setBaseUrl(normalizedServer);
      _api.setToken(accessToken);

      _talker.info('开始获取用户全局配置: $normalizedServer');
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/system/global/user',
      );
      final data = response.data;
      if (data == null) {
        _talker.warning('获取用户全局配置失败: 返回数据为空');
        return null;
      }

      // 捕获并缓存该接口返回的 Cookie（例如全局用户配置相关会话）
      final setCookie = response.headers['set-cookie'];
      if (setCookie != null && setCookie.isNotEmpty) {
        final cookieHeader = setCookie.join('; ');
        _appService.setCookie(cookieHeader);
        _talker.info('从用户全局配置接口缓存 Cookie');
      }

      final configResponse = UserGlobalConfigResponse.fromJson(data);
      if (!configResponse.success) {
        _talker.warning(
          '获取用户全局配置失败: ${configResponse.message ?? 'unknown error'}',
        );
        return null;
      }
      _talker.info('获取用户全局配置成功');
      return configResponse.data;
    } catch (e) {
      _talker.warning('获取用户全局配置失败: $e');
      return null;
    }
  }

  Future<UserInfo?> getUserInfoByRole({required String role}) async {
    final response = await _api.get<Map<String, dynamic>>('/api/v1/user/$role');
    final data = response.data;
    if (data == null) {
      _talker.warning('获取用户信息失败: 返回数据为空');
      return null;
    }
    final userInfo = UserInfo.fromJson(data);
    _appService.saveUserInfo(userInfo);
    _talker.info('获取用户信息成功');
    return userInfo;
  }

  List<LoginProfile> getProfiles() {
    final list = _realm.all<LoginProfile>().toList();
    list.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return list;
  }

  String _normalizeServer(String server) {
    final s = server.trim();
    if (s.endsWith('/')) return s.substring(0, s.length - 1);
    return s;
  }

  void _saveProfile(
    String server,
    String username,
    String password,
    LoginResponse login,
  ) {
    _appService.saveProfile(server, login);
    final id = '${server.trim()}|${username.trim()}';
    final permissionsJson = jsonEncode(login.permissions);

    _realm.write(() {
      _realm.add(
        LoginProfile(
          id,
          server,
          username,
          password,
          login.accessToken,
          login.tokenType,
          login.superUser,
          login.userId,
          login.userName,
          login.level,
          permissionsJson,
          login.wizard,
          DateTime.now(),
          avatar: login.avatar ?? '',
        ),
        update: true,
      );
    });
  }
}
