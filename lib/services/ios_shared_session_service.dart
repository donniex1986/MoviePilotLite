import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class IosSharedSessionService {
  static const _channel = MethodChannel(
    'org.moviepilot/ios_shared_session',
  );

  Future<void> syncSession({
    required String server,
    required String accessToken,
  }) async {
    if (!_isSupportedPlatform) return;
    final normalizedServer = server.trim();
    final normalizedToken = accessToken.trim();
    if (normalizedServer.isEmpty || normalizedToken.isEmpty) return;
    try {
      await _channel.invokeMethod<void>('saveSharedSession', {
        'server': normalizedServer,
        'accessToken': normalizedToken,
      });
    } catch (_) {}
  }

  Future<void> clearSession() async {
    if (!_isSupportedPlatform) return;
    try {
      await _channel.invokeMethod<void>('clearSharedSession');
    } catch (_) {}
  }

  bool get _isSupportedPlatform =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
}
