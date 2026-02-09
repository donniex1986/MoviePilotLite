import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

/// 插件图标主题色缓存与预加载
/// 避免重复进行耗时的 Palette 提取，支持批量预加载
class PluginPaletteCache extends GetxController {
  /// 缓存：iconUrl -> 主题色
  final RxMap<String, Color> _cache = <String, Color>{}.obs;

  /// 正在提取中的 URL，避免重复请求
  final Set<String> _pending = {};

  /// 最大并发提取数
  static const int _maxConcurrent = 4;
  int _activeCount = 0;
  final List<Completer<void>> _queue = [];

  /// 默认色（提取失败或空 URL 时使用）
  static const Color defaultColor = Color(0xFF2563EB);

  /// 获取已缓存的主题色，若无则返回 null
  Color? getCached(String iconUrl) {
    if (iconUrl.isEmpty) return null;
    return _cache[iconUrl];
  }

  /// 供 Obx 使用：读取颜色并触发提取，提取完成后触发重建
  Color? watchColor(String iconUrl) {
    if (iconUrl.isEmpty) return null;
    final cached = _cache[iconUrl];
    if (cached != null) return cached;
    _fetchOne(iconUrl);
    return null;
  }

  /// 批量预加载：在后台提取尚未缓存的 URL
  void preload(Iterable<String> urls) {
    for (final url in urls) {
      if (url.isEmpty) continue;
      if (_cache.containsKey(url)) continue;
      if (_pending.contains(url)) continue;
      _fetchOne(url);
    }
  }

  Future<void> _fetchOne(String url) async {
    if (_cache.containsKey(url) || _pending.contains(url)) return;
    _pending.add(url);

    while (_activeCount >= _maxConcurrent && _queue.isNotEmpty) {
      final completer = Completer<void>();
      _queue.add(completer);
      await completer.future;
    }
    _activeCount++;

    try {
      final provider = CachedNetworkImageProvider(url);
      final palette = await PaletteGenerator.fromImageProvider(
        provider,
        maximumColorCount: 5,
      );
      final color = palette.dominantColor?.color ?? defaultColor;
      _cache[url] = color;
    } catch (_) {
      _cache[url] = defaultColor;
    } finally {
      _pending.remove(url);
      _activeCount--;
      if (_queue.isNotEmpty) {
        final next = _queue.removeAt(0);
        if (!next.isCompleted) next.complete();
      }
    }
  }
}
