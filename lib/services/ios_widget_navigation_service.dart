import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class IosWidgetNavigationService extends GetxService {
  static const _channel = MethodChannel('org.moviepilot/widget_navigation');

  String? _pendingRoute;

  Future<IosWidgetNavigationService> init() async {
    if (!_isSupportedPlatform) return this;
    _channel.setMethodCallHandler(_handleMethodCall);
    try {
      final route = await _channel.invokeMethod<String>('getPendingWidgetRoute');
      _storePendingRoute(route);
    } catch (_) {}
    return this;
  }

  Future<void> _handleMethodCall(MethodCall call) async {
    if (call.method != 'openWidgetRoute') return;
    final route = _normalizeRoute(call.arguments);
    if (route == null) return;
    _pendingRoute = route;
    _tryNavigateImmediately();
  }

  void _storePendingRoute(String? route) {
    final normalized = _normalizeRoute(route);
    if (normalized == null) return;
    _pendingRoute = normalized;
  }

  String? _normalizeRoute(dynamic raw) {
    final value = raw is String ? raw.trim() : '';
    if (value.isEmpty) return null;
    final uri = Uri.tryParse(value);
    if (uri == null) return null;
    if (uri.host == 'subscribe-calendar') {
      return '/subscribe-calendar';
    }
    if (uri.path == '/subscribe-calendar') {
      return '/subscribe-calendar';
    }
    return null;
  }

  void _tryNavigateImmediately() {
    final currentRoute = Get.currentRoute;
    if (currentRoute == '/login' || currentRoute.isEmpty) return;
    navigateToPendingRoute();
  }

  void navigateToPendingRoute() {
    if (!_isSupportedPlatform) return;
    final route = _pendingRoute;
    if (route == null || route.isEmpty) return;
    _pendingRoute = null;
    Future.microtask(() {
      if (Get.currentRoute == route) return;
      Get.toNamed(route);
    });
  }

  bool get _isSupportedPlatform =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
}
