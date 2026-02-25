import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_organize_config.dart';
import 'package:moviepilot_mobile/modules/settings/models/system_env_model.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class SettingsOrganizeScrapeController extends GetxController {
  final _apiClient = Get.find<ApiClient>();

  final envData = Rxn<SystemEnvData>();
  final isLoading = false.obs;
  final errorText = RxnString();
  final isUpdating = false.obs;
  final isEditing = false.obs;
  final pendingChanges = <String, dynamic>{}.obs;

  final Map<String, TextEditingController> _textControllers = {};

  List<SettingsFieldConfig> get fields => organizeScrapeConfigFields;

  bool get hasPendingChanges => pendingChanges.isNotEmpty;

  void enterEditMode() {
    pendingChanges.clear();
    _syncAllTextControllers();
    isEditing.value = true;
  }

  void cancelEdit() {
    _revertTextControllers();
    pendingChanges.clear();
    isEditing.value = false;
  }

  void exitEditMode() {
    pendingChanges.clear();
    isEditing.value = false;
  }

  Future<bool> saveEdit() async {
    if (pendingChanges.isEmpty) {
      isEditing.value = false;
      return true;
    }
    final ok = await updateEnv(Map.from(pendingChanges));
    if (ok) {
      pendingChanges.clear();
      _syncAllTextControllers();
      isEditing.value = false;
    }
    return ok;
  }

  void addPendingChange(String key, dynamic value) {
    pendingChanges[key] = value;
  }

  void _syncAllTextControllers() {
    for (final f in fields) {
      if (f.type == SettingsFieldType.text ||
          f.type == SettingsFieldType.number) {
        final c = _textControllers[f.envKey];
        if (c != null) {
          final v = valueFor(f);
          c.text = v?.toString() ?? '';
        }
      }
    }
  }

  void _revertTextControllers() {
    for (final f in fields) {
      if (f.type == SettingsFieldType.text ||
          f.type == SettingsFieldType.number) {
        final c = _textControllers[f.envKey];
        if (c != null) {
          final v = valueFor(f);
          c.text = v?.toString() ?? '';
        }
      }
    }
  }

  TextEditingController textControllerFor(SettingsFieldConfig field) {
    final c = _textControllers.putIfAbsent(field.envKey, () {
      final controller = TextEditingController();
      final v = valueFor(field);
      controller.text = v?.toString() ?? '';
      return controller;
    });
    if (!isEditing.value) {
      final v = valueFor(field);
      final s = v?.toString() ?? '';
      if (c.text != s) c.text = s;
    } else if (!pendingChanges.containsKey(field.envKey)) {
      final v = valueFor(field);
      final s = v?.toString() ?? '';
      if (c.text != s) c.text = s;
    }
    return c;
  }

  @override
  void onReady() {
    super.onReady();
    load();
  }

  @override
  void onClose() {
    for (final c in _textControllers.values) {
      c.dispose();
    }
    _textControllers.clear();
    super.onClose();
  }

  Future<bool> updateEnv(Map<String, dynamic> changes) async {
    if (changes.isEmpty) return true;
    isUpdating.value = true;
    errorText.value = null;
    try {
      final resp = await _apiClient.post<Map<String, dynamic>>(
        '/api/v1/system/env',
        data: changes,
      );
      if (resp.statusCode != null &&
          resp.statusCode! >= 200 &&
          resp.statusCode! < 300) {
        final body = resp.data;
        if (body != null) {
          final parsed = SystemEnvResponse.fromJson(body);
          if (parsed.success) {
            await load();
            return true;
          }
        }
      }
      errorText.value = '更新失败';
      return false;
    } catch (e) {
      errorText.value = e.toString();
      return false;
    } finally {
      isUpdating.value = false;
    }
  }

  Future<void> load() async {
    isLoading.value = true;
    errorText.value = null;

    try {
      final resp =
          await _apiClient.get<Map<String, dynamic>>('/api/v1/system/env');
      if (resp.statusCode != null &&
          resp.statusCode! >= 200 &&
          resp.statusCode! < 300) {
        final body = resp.data;
        if (body != null) {
          final parsed = SystemEnvResponse.fromJson(body);
          if (parsed.success && parsed.data != null) {
            envData.value = parsed.data;
            return;
          }
        }
      }
      errorText.value = '加载失败';
    } catch (e) {
      errorText.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  dynamic valueFor(SettingsFieldConfig field) =>
      envData.value?.valueFor(field.envKey);

  dynamic effectiveValueFor(SettingsFieldConfig field) {
    if (pendingChanges.containsKey(field.envKey)) {
      return pendingChanges[field.envKey];
    }
    return valueFor(field);
  }
}
