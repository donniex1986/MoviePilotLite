import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_organize_config.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/models/system_env_model.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_manager.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class SettingsOrganizeScrapeController extends GetxController {
  final _apiClient = Get.find<ApiClient>();

  bool _forceNextFormHydrate = false;

  final envData = Rxn<SystemEnvData>();
  final isLoading = false.obs;
  final errorText = RxnString();
  final isUpdating = false.obs;
  final isEditing = true.obs;

  late final SettingsFormManager form = SettingsFormManager(
    fields: organizeScrapeConfigFields,
  );

  List<SettingsFieldConfig> get fields => organizeScrapeConfigFields;

  bool get hasPendingChanges => form.hasPendingChanges;

  void enterEditMode() {
    form.hydrateAll((k) => envData.value?.valueFor(k));
    form.clearDirty();
    isEditing.value = true;
  }

  void cancelEdit() {
    form.hydrateAll((k) => envData.value?.valueFor(k));
    form.clearDirty();
    isEditing.value = false;
  }

  void exitEditMode() {
    form.clearDirty();
    isEditing.value = false;
  }

  Future<bool> saveEdit() async {
    if (!form.hasPendingChanges) {
      isEditing.value = false;
      return true;
    }
    final ok = await updateEnv(form.toPatch());
    if (ok) {
      form.clearDirty();
      isEditing.value = false;
    }
    return ok;
  }

  dynamic valueFor(SettingsFieldConfig field) =>
      envData.value?.valueFor(field.envKey);

  @override
  void onReady() {
    super.onReady();
    load();
  }

  @override
  void onClose() {
    form.dispose();
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
            _forceNextFormHydrate = true;
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
      final resp = await _apiClient.get<Map<String, dynamic>>(
        '/api/v1/system/env',
      );
      if (resp.statusCode != null &&
          resp.statusCode! >= 200 &&
          resp.statusCode! < 300) {
        final body = resp.data;
        if (body != null) {
          final parsed = SystemEnvResponse.fromJson(body);
          if (parsed.success && parsed.data != null) {
            envData.value = parsed.data;
            final syncForm =
                _forceNextFormHydrate ||
                !isEditing.value ||
                !form.hasPendingChanges;
            _forceNextFormHydrate = false;
            if (syncForm) {
              form.hydrateAll((k) => envData.value?.valueFor(k));
              if (!isEditing.value) form.clearDirty();
            }
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
}
