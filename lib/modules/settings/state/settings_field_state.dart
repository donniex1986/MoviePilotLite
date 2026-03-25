import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';

abstract class SettingsFieldState {
  SettingsFieldState({
    required this.envKey,
    required this.type,
  });

  final String envKey;
  final SettingsFieldType type;

  bool get dirty;
  dynamic get effectiveValue;

  void hydrate(dynamic value);
  void clearDirty();
  Map<String, dynamic> toPatch();
  void dispose();
}

class SettingsTextFieldState extends SettingsFieldState {
  SettingsTextFieldState({
    required super.envKey,
    required super.type,
    String? initial,
    this.keyboardType,
    this.maxLines,
    this.obscureText = false,
  })  : _initial = initial ?? '',
        controller = TextEditingController(text: initial ?? '') {
    controller.addListener(_recomputeDirty);
  }

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool obscureText;

  String _initial;
  bool _dirty = false;

  @override
  bool get dirty => _dirty;

  @override
  String get effectiveValue => controller.text;

  @override
  void hydrate(dynamic value) {
    final next = value?.toString() ?? '';
    _initial = next;
    if (!_dirty && controller.text != next) {
      controller.text = next;
    } else {
      _recomputeDirty();
    }
  }

  void _recomputeDirty() {
    final next = controller.text != _initial;
    if (_dirty != next) _dirty = next;
  }

  @override
  void clearDirty() {
    _initial = controller.text;
    _dirty = false;
  }

  @override
  Map<String, dynamic> toPatch() {
    if (!_dirty) return const {};
    return {envKey: controller.text};
  }

  @override
  void dispose() {
    controller.removeListener(_recomputeDirty);
    controller.dispose();
  }
}

class SettingsNumberFieldState extends SettingsFieldState {
  SettingsNumberFieldState({
    required super.envKey,
    num? initial,
    this.step,
  })  : _initial = initial,
        super(type: SettingsFieldType.number) {
    controller = TextEditingController(text: initial?.toString() ?? '');
    controller.addListener(_recomputeDirty);
  }

  late final TextEditingController controller;
  final num? step;

  num? _initial;
  bool _dirty = false;

  @override
  bool get dirty => _dirty;

  @override
  dynamic get effectiveValue => _parse();

  num? _parse() {
    final s = controller.text.trim();
    if (s.isEmpty) return null;
    return num.tryParse(s);
  }

  @override
  void hydrate(dynamic value) {
    final n = value is num ? value : num.tryParse(value?.toString() ?? '');
    _initial = n;
    if (!_dirty) {
      final nextText = n?.toString() ?? '';
      if (controller.text != nextText) controller.text = nextText;
    } else {
      _recomputeDirty();
    }
  }

  void setNumber(num n) {
    controller.text = n.toString();
    _recomputeDirty();
  }

  void _recomputeDirty() {
    final now = _parse();
    final next = now != _initial;
    if (_dirty != next) _dirty = next;
  }

  @override
  void clearDirty() {
    _initial = _parse();
    _dirty = false;
  }

  @override
  Map<String, dynamic> toPatch() {
    if (!_dirty) return const {};
    final n = _parse();
    if (n == null) return {envKey: ''};
    final asInt = step != null && step == 1;
    return {envKey: asInt ? n.toInt() : n};
  }

  @override
  void dispose() {
    controller.removeListener(_recomputeDirty);
    controller.dispose();
  }
}

class SettingsToggleFieldState extends SettingsFieldState {
  SettingsToggleFieldState({
    required super.envKey,
    bool initial = false,
  })  : _initial = initial,
        value = initial.obs,
        super(type: SettingsFieldType.toggle) {
    ever<bool>(value, (_) => _recomputeDirty());
  }

  final RxBool value;
  bool _initial;
  bool _dirty = false;

  @override
  bool get dirty => _dirty;

  @override
  bool get effectiveValue => value.value;

  @override
  void hydrate(dynamic v) {
    final next = switch (v) {
      null => false,
      bool b => b,
      String s => s.toLowerCase() == 'true' || s == '1',
      int i => i != 0,
      _ => false,
    };
    _initial = next;
    if (!_dirty && value.value != next) {
      value.value = next;
    } else {
      _recomputeDirty();
    }
  }

  void _recomputeDirty() {
    final next = value.value != _initial;
    if (_dirty != next) _dirty = next;
  }

  @override
  void clearDirty() {
    _initial = value.value;
    _dirty = false;
  }

  @override
  Map<String, dynamic> toPatch() {
    if (!_dirty) return const {};
    return {envKey: value.value};
  }

  @override
  void dispose() {}
}

class SettingsSelectFieldState extends SettingsFieldState {
  SettingsSelectFieldState({
    required super.envKey,
    String? initial,
  })  : _initial = initial,
        value = (initial ?? '').obs,
        super(type: SettingsFieldType.select) {
    ever<String>(value, (_) => _recomputeDirty());
  }

  final RxString value;
  String? _initial;
  bool _dirty = false;

  @override
  bool get dirty => _dirty;

  @override
  String get effectiveValue => value.value;

  @override
  void hydrate(dynamic v) {
    final next = v?.toString() ?? '';
    _initial = next;
    if (!_dirty && value.value != next) {
      value.value = next;
    } else {
      _recomputeDirty();
    }
  }

  void _recomputeDirty() {
    final next = value.value != (_initial ?? '');
    if (_dirty != next) _dirty = next;
  }

  @override
  void clearDirty() {
    _initial = value.value;
    _dirty = false;
  }

  @override
  Map<String, dynamic> toPatch() {
    if (!_dirty) return const {};
    return {envKey: value.value};
  }

  @override
  void dispose() {}
}

