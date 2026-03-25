import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_field_state.dart';

class SettingsFormManager {
  SettingsFormManager({
    required List<SettingsFieldConfig> fields,
  }) : _fields = List.unmodifiable(fields);

  final List<SettingsFieldConfig> _fields;
  final Map<String, SettingsFieldState> _states = {};

  List<SettingsFieldConfig> get fields => _fields;

  SettingsFieldState stateFor(SettingsFieldConfig field) =>
      _states.putIfAbsent(field.envKey, () => _createState(field));

  T state<T extends SettingsFieldState>(String envKey) {
    final s = _states[envKey];
    if (s is T) return s;
    throw StateError('State not found or type mismatch: $envKey');
  }

  dynamic effectiveValue(String envKey) {
    final s = _states[envKey];
    return s?.effectiveValue;
  }

  void hydrateValue(String envKey, dynamic value) {
    final s = _states[envKey];
    if (s != null) {
      s.hydrate(value);
      return;
    }
    final field = _fields.firstWhere(
      (f) => f.envKey == envKey,
      orElse: () => SettingsFieldConfig(
        label: envKey,
        envKey: envKey,
        type: SettingsFieldType.text,
      ),
    );
    final created = _createState(field);
    created.hydrate(value);
    _states[envKey] = created;
  }

  void hydrateAll(dynamic Function(String envKey) readValue) {
    for (final f in _fields) {
      stateFor(f).hydrate(readValue(f.envKey));
    }
  }

  Map<String, dynamic> toPatch() {
    final out = <String, dynamic>{};
    for (final s in _states.values) {
      out.addAll(s.toPatch());
    }
    return out;
  }

  bool get hasPendingChanges {
    for (final s in _states.values) {
      if (s.dirty) return true;
    }
    return false;
  }

  void clearDirty() {
    for (final s in _states.values) {
      s.clearDirty();
    }
  }

  void dispose() {
    for (final s in _states.values) {
      s.dispose();
    }
    _states.clear();
  }

  bool shouldShow(SettingsFieldConfig field, dynamic Function(String envKey) readValue) {
    final ck = field.conditionKey;
    final cv = field.conditionValue;
    if (ck == null || cv == null) return true;
    final s = _states[ck];
    final v = s != null ? s.effectiveValue : readValue(ck);
    return (v?.toString().toLowerCase() ?? '') == cv.toLowerCase();
  }

  SettingsFieldState _createState(SettingsFieldConfig field) {
    switch (field.type) {
      case SettingsFieldType.text:
      case SettingsFieldType.textCopy:
        return SettingsTextFieldState(
          envKey: field.envKey,
          type: field.type,
          keyboardType: null,
          maxLines: 1,
          obscureText: field.obscureText,
        );
      case SettingsFieldType.number:
        return SettingsNumberFieldState(
          envKey: field.envKey,
          step: field.step,
        );
      case SettingsFieldType.toggle:
        return SettingsToggleFieldState(envKey: field.envKey);
      case SettingsFieldType.select:
        return SettingsSelectFieldState(envKey: field.envKey);
    }
  }
}

