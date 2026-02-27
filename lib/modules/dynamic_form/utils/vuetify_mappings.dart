import 'package:flutter/material.dart';

/// Vuetify / 动态表单 中使用的颜色与图标映射，用于统一美化表格、芯片等 UI。
class VuetifyMappings {
  VuetifyMappings._();

  /// 解析十六进制颜色（#RRGGBB 或 #AARRGGBB）
  static Color? colorFromHex(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    var s = hex.trim();
    if (s.startsWith('#')) s = s.substring(1);
    if (s.length == 6) {
      final r = int.tryParse(s.substring(0, 2), radix: 16);
      final g = int.tryParse(s.substring(2, 4), radix: 16);
      final b = int.tryParse(s.substring(4, 6), radix: 16);
      if (r != null && g != null && b != null) {
        return Color.fromRGBO(r, g, b, 1);
      }
    }
    return null;
  }

  /// Vuetify 颜色名或十六进制 -> Flutter Color
  static Color? colorFromVuetify(String? name) {
    if (name == null || name.isEmpty) return null;
    final hex = colorFromHex(name);
    if (hex != null) return hex;
    return _colorMap[name.toLowerCase()];
  }

  static const Map<String, Color> _colorMap = {
    'success': Color(0xFF4CAF50),
    'error': Color(0xFFF44336),
    'warning': Color(0xFFFF9800),
    'info': Color(0xFF2196F3),
    'primary': Color(0xFF2196F3),
    'secondary': Color(0xFF757575),
    'accent': Color(0xFFFF5722),
  };

  /// MDI 图标名（如 mdi-sync、mdi-crown）-> IconData
  /// VIcon 的图标名通常在 text 字段
  static IconData? iconFromMdi(String? name) {
    if (name == null || name.isEmpty) return null;
    final key = name.toLowerCase().trim();
    return _iconMap[key];
  }

  /// 常用 MDI 名称 -> Material Icons
  static const Map<String, IconData> _iconMap = {
    'mdi-sync': Icons.sync,
    'mdi-check': Icons.check,
    'mdi-close': Icons.close,
    'mdi-check-circle': Icons.check_circle,
    'mdi-close-circle': Icons.cancel,
    'mdi-alert': Icons.warning,
    'mdi-alert-circle': Icons.error,
    'mdi-information': Icons.info,
    'mdi-information-outline': Icons.info_outline,
    'mdi-refresh': Icons.refresh,
    'mdi-refresh-circle': Icons.refresh,
    'mdi-plus': Icons.add,
    'mdi-minus': Icons.remove,
    'mdi-pencil': Icons.edit,
    'mdi-delete': Icons.delete,
    'mdi-download': Icons.download,
    'mdi-upload': Icons.upload,
    'mdi-play': Icons.play_arrow,
    'mdi-pause': Icons.pause,
    'mdi-stop': Icons.stop,
    'mdi-calendar': Icons.calendar_today,
    'mdi-clock': Icons.schedule,
    'mdi-account': Icons.person,
    'mdi-cog': Icons.settings,
    'mdi-home': Icons.home,
    'mdi-arrow-right': Icons.arrow_forward,
    'mdi-arrow-left': Icons.arrow_back,
    'mdi-chevron-down': Icons.expand_more,
    'mdi-chevron-up': Icons.expand_less,
    'mdi-dots-vertical': Icons.more_vert,
    'mdi-dots-horizontal': Icons.more_horiz,
    'mdi-eye': Icons.visibility,
    'mdi-eye-off': Icons.visibility_off,
    'mdi-lock': Icons.lock,
    'mdi-lock-open': Icons.lock_open,
    'mdi-link': Icons.link,
    'mdi-open-in-new': Icons.open_in_new,
    'mdi-content-copy': Icons.copy,
    'mdi-content-save': Icons.save,
    // 勋章墙等统计卡片
    'mdi-office-building': Icons.business,
    'mdi-medal': Icons.emoji_events,
    'mdi-cart-check': Icons.shopping_cart_checkout,
    'mdi-badge-account': Icons.badge,
    'mdi-cancel': Icons.cancel,
    'mdi-help-circle-outline': Icons.help_outline,
    'mdi-crown': Icons.diamond,
    'mdi-star': Icons.star,
    'mdi-star-half': Icons.star_half,
    'mdi-ticket-confirmation': Icons.confirmation_number,
    'mdi-ticket': Icons.confirmation_number,
    'mdi-account-group': Icons.group,
    // 后宫总览 dashboard-stats
    'mdi-domain': Icons.business,
    'mdi-human-queue': Icons.groups,
    'mdi-account-cancel': Icons.person_off,
    'mdi-database-off': Icons.storage_outlined,
    'mdi-store': Icons.store,
    'mdi-diamond': Icons.diamond,
    // TrashClean 插件
    'mdi-power': Icons.power_settings_new,
    'mdi-code-braces': Icons.data_object,
    'mdi-clock-outline': Icons.schedule,
    'mdi-folder-search': Icons.folder_open,
    'mdi-folder-remove': Icons.folder_delete,
    'mdi-folder-off': Icons.folder_off,
    'mdi-package-variant': Icons.inventory_2,
    'mdi-chart-line-variant': Icons.show_chart,
    'mdi-broom': Icons.cleaning_services,
    'mdi-filter': Icons.filter_alt,
    'mdi-history': Icons.history,
    'mdi-progress-clock': Icons.pending,
    'mdi-download-off': Icons.download_done,
    'mdi-flag': Icons.flag,
  };

  /// dashboard-stats 标签 -> MDI 图标名（后端 JSON 无 icon，Web 端按 label 映射）
  static const Map<String, String> _dashboardStatsCaptionToIcon = {
    '站点数量': 'mdi-domain',
    '后宫成员': 'mdi-human-queue',
    '永久邀请数': 'mdi-ticket-confirmation',
    '永久邀请': 'mdi-ticket-confirmation',
    '临时邀请数': 'mdi-ticket',
    '临时邀请': 'mdi-ticket',
    '低分享率': 'mdi-alert-circle',
    '已禁用': 'mdi-account-cancel',
    '无数据': 'mdi-database-off',
  };

  /// 根据 dashboard-stats 标签解析 MDI 图标名
  static String? iconFromDashboardStatsCaption(String? caption) {
    if (caption == null || caption.isEmpty) return null;
    return _dashboardStatsCaptionToIcon[caption.trim()];
  }
}
