import 'package:flutter/material.dart';

/// 设定字段类型
enum SettingsFieldType {
  text,
  select,
  number,
  toggle,
  textCopy,
}

/// 设定字段配置（用于基础/智能助手等详情页）
class SettingsFieldConfig {
  const SettingsFieldConfig({
    required this.label,
    required this.envKey,
    required this.type,
    this.hint,
    this.icon,
    this.enumKey,
    this.unit,
    this.step,
    this.conditionKey,
    this.conditionValue,
  });

  final String label;
  final String envKey;
  final SettingsFieldType type;
  final String? hint;
  final IconData? icon;
  /// 枚举配置 key，对应 settingsEnums 的 key
  final String? enumKey;
  /// 数值单位，如 "小时"
  final String? unit;
  /// 数值步进（如 1 表示整数步进）
  final num? step;
  /// 条件展示：当 conditionKey 的 env 值等于 conditionValue 时显示此字段
  final String? conditionKey;
  final String? conditionValue;
}

