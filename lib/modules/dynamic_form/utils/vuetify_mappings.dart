import 'package:flutter/material.dart';

/// Vuetify / 动态表单 中使用的颜色与图标映射，用于统一美化表格、芯片等 UI。
class VuetifyMappings {
  VuetifyMappings._();

  /// Vuetify 颜色名 -> Flutter Color（用于 VIcon、VChip 等 props.color）
  static Color? colorFromVuetify(String? name) {
    if (name == null || name.isEmpty) return null;
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

  /// MDI 图标名（如 mdi-sync）-> IconData，用于 VIcon 的 text 字段
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
  };
}
