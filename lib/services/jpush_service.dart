import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:jpush_flutter/jpush_interface.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';

class JPushService extends GetxService {
  static const String _appKey = 'e462379fa18ab59e31fd7ac2';
  static const String _channel = 'developer-default';

  final AppLog _talker = Get.find<AppLog>();

  JPushFlutterInterface? _jpush;
  bool _initialized = false;

  bool get _isSupportedPlatform =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  Future<JPushService> init() async {
    await register();
    return this;
  }

  Future<void> register() async {
    if (!_isSupportedPlatform) return;
    if (_initialized) {
      _requestPermissions();
      return;
    }

    try {
      final jpush = JPush.newJPush();
      _bindEventHandlers(jpush);
      jpush.setup(
        appKey: _appKey,
        channel: _channel,
        production: kReleaseMode,
        debug: !kReleaseMode,
      );
      _jpush = jpush;
      _initialized = true;

      _talker.info('JPush 注册完成');
      Future<void>.delayed(
        const Duration(milliseconds: 300),
        _requestPermissions,
      );
      unawaited(
        Future<void>.delayed(const Duration(seconds: 1), _logRegistrationId),
      );
    } catch (e, stackTrace) {
      _talker.handle(e, stackTrace: stackTrace, message: 'JPush 初始化失败: $e');
    }
  }

  void _bindEventHandlers(JPushFlutterInterface jpush) {
    jpush.addEventHandler(
      onReceiveNotification: (event) async {
        _talker.info('JPush 收到通知: $event');
      },
      onOpenNotification: (event) async {
        _talker.info('JPush 打开通知: $event');
      },
      onReceiveMessage: (event) async {
        _talker.info('JPush 收到透传消息: $event');
      },
      onReceiveNotificationAuthorization: (event) async {
        _talker.info('JPush 通知授权状态变化: $event');
      },
      onConnected: (event) async {
        _talker.info('JPush 连接状态变化: $event');
      },
      onCommandResult: (event) async {
        _talker.info('JPush 命令回调: $event');
      },
      onReceiveDeviceToken: (event) async {
        _talker.info('JPush 收到设备凭证: $event');
      },
    );
  }

  void _requestPermissions() {
    final jpush = _jpush;
    if (jpush == null) return;

    if (Platform.isAndroid) {
      jpush.requestRequiredPermission();
      return;
    }

    if (Platform.isIOS) {
      jpush.applyPushAuthority(
        const NotificationSettingsIOS(alert: true, badge: true, sound: true),
      );
    }
  }

  Future<void> _logRegistrationId() async {
    final registrationId = await getRegistrationId();
    if (registrationId != null && registrationId.isNotEmpty) {
      _talker.info('JPush Registration ID: $registrationId');
    }
  }

  Future<String?> getRegistrationId({
    int maxAttempts = 3,
    Duration retryDelay = const Duration(seconds: 2),
  }) async {
    await register();
    final jpush = _jpush;
    if (jpush == null) return null;

    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      try {
        final registrationId = await jpush.getRegistrationID();
        if (registrationId.isNotEmpty) {
          return registrationId;
        }
      } catch (e, stackTrace) {
        _talker.handle(
          e,
          stackTrace: stackTrace,
          message: '获取 JPush Registration ID 失败: $e',
        );
        return null;
      }

      if (attempt < maxAttempts - 1) {
        await Future<void>.delayed(retryDelay);
      }
    }

    return null;
  }

  Future<bool> setAlias(String alias) async {
    final normalizedAlias = alias.trim();
    if (normalizedAlias.isEmpty) return false;

    await register();
    final jpush = _jpush;
    if (jpush == null) return false;

    try {
      final result = await jpush.setAlias(normalizedAlias);
      final errorCode = result['errorCode'];
      if (errorCode is num && errorCode != 0) {
        _talker.warning('设置 JPush Alias 失败: $result');
        return false;
      }
      final appliedAlias = await getAlias();
      if (appliedAlias != normalizedAlias) {
        _talker.warning(
          '设置 JPush Alias 后校验不一致，期望: $normalizedAlias，实际: ${appliedAlias ?? 'null'}',
        );
        return false;
      }
      _talker.info('设置 JPush Alias 成功: $normalizedAlias');
      return true;
    } catch (e, stackTrace) {
      _talker.handle(
        e,
        stackTrace: stackTrace,
        message: '设置 JPush Alias 失败: $e',
      );
      return false;
    }
  }

  Future<String?> getAlias({
    int maxAttempts = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    await register();
    final jpush = _jpush;
    if (jpush == null) return null;

    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      try {
        final result = await jpush.getAlias();
        final alias = result['alias']?.toString().trim();
        if (alias != null && alias.isNotEmpty) {
          return alias;
        }
      } catch (e, stackTrace) {
        _talker.handle(
          e,
          stackTrace: stackTrace,
          message: '获取 JPush Alias 失败: $e',
        );
        return null;
      }

      if (attempt < maxAttempts - 1) {
        await Future<void>.delayed(retryDelay);
      }
    }

    return null;
  }
}
