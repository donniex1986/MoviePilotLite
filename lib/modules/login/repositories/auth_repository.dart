import 'dart:convert';

import 'package:realm/realm.dart';
import 'package:talker/talker.dart';

import '../models/login_profile.dart';
import '../models/login_response.dart';
import '../../../services/api_client.dart';
import '../../../services/realm_service.dart';

class AuthRepository {
  AuthRepository(this._realmService, this._talker);

  final RealmService _realmService;
  final Talker _talker;

  Realm get _realm => _realmService.realm;

  Future<LoginResponse> login({
    required String server,
    required String username,
    required String password,
    String otpPassword = '',
  }) async {
    final api = ApiClient(_normalizeServer(server), _talker);
    _talker.info('开始登录: $username @ ${_normalizeServer(server)}');
    final response = await api.postForm<Map<String, dynamic>>(
      '/api/v1/login/access-token',
      {'username': username, 'password': password, 'otp_password': otpPassword},
    );
    final login = LoginResponse.fromJson(response.data!);
    _talker.info('登录成功: $username');

    // 登录完成后调用API接口获取配置信息和cookie
    try {
      final configResponse = await api.get<Map<String, dynamic>>(
        '/api/v1/system/config',
      );
      _talker.info('获取配置信息成功');
      // 这里可以获取并缓存cookie
      // 注意：实际获取cookie的方式取决于ApiClient的实现
    } catch (e) {
      _talker.warning('获取配置信息失败: $e');
    }

    _saveProfile(_normalizeServer(server), username, password, login);
    return login;
  }

  /// 获取用户信息
  Future<bool> getUserInfo({
    required String server,
    required String accessToken,
  }) async {
    try {
      final api = ApiClient(
        _normalizeServer(server),
        _talker,
        token: accessToken,
      );
      _talker.info('开始获取用户信息: ${_normalizeServer(server)}');
      final response = await api.get<Map<String, dynamic>>('/api/v1/user');
      _talker.info('获取用户信息成功');
      return true;
    } catch (e) {
      _talker.warning('获取用户信息失败: $e');
      return false;
    }
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
