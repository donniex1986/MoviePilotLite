import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class IosWidgetNavigationService extends GetxService {
  static const _channel = MethodChannel('org.moviepilot/widget_navigation');

  _WidgetRouteTarget? _pendingRoute;

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
    final route = _parseRoute(call.arguments);
    if (route == null) return;
    _pendingRoute = route;
    _tryNavigateImmediately();
  }

  void _storePendingRoute(String? route) {
    final normalized = _parseRoute(route);
    if (normalized == null) return;
    _pendingRoute = normalized;
  }

  _WidgetRouteTarget? _parseRoute(dynamic raw) {
    final value = raw is String ? raw.trim() : '';
    if (value.isEmpty) return null;
    final uri = Uri.tryParse(value);
    if (uri == null) return null;
    if (uri.host == 'subscribe-calendar') {
      return const _WidgetRouteTarget(route: '/subscribe-calendar');
    }
    if (uri.path == '/subscribe-calendar') {
      return const _WidgetRouteTarget(route: '/subscribe-calendar');
    }
    if (uri.host == 'media-detail' || uri.path == '/media-detail') {
      final path = (uri.queryParameters['path'] ?? '').trim();
      if (path.isEmpty) return null;
      final title = (uri.queryParameters['title'] ?? '').trim();
      final year = (uri.queryParameters['year'] ?? '').trim();
      final typeName = (uri.queryParameters['type_name'] ?? '').trim();
      final params = <String, String>{'path': path};
      if (title.isNotEmpty) params['title'] = title;
      if (year.isNotEmpty) params['year'] = year;
      if (typeName.isNotEmpty) params['type_name'] = typeName;
      return _WidgetRouteTarget(route: '/media-detail', parameters: params);
    }
    if (uri.host == 'recommend-widget' || uri.path == '/recommend-widget') {
      final key = (uri.queryParameters['key'] ?? 'tmdb_trending').trim();
      final title = (uri.queryParameters['title'] ?? '流行趋势').trim();
      return _WidgetRouteTarget(
        route: '/recommend-category-list',
        parameters: {
          'key': key.isEmpty ? 'tmdb_trending' : key,
          'title': title.isEmpty ? '流行趋势' : title,
        },
      );
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
    final target = _pendingRoute;
    if (target == null || target.route.isEmpty) return;
    _pendingRoute = null;
    Future.microtask(() {
      if (Get.currentRoute == target.route) return;
      Get.toNamed(
        target.route,
        parameters: target.parameters.isEmpty ? null : target.parameters,
      );
    });
  }

  bool get _isSupportedPlatform =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
}

class _WidgetRouteTarget {
  const _WidgetRouteTarget({required this.route, this.parameters = const {}});

  final String route;
  final Map<String, String> parameters;
}
