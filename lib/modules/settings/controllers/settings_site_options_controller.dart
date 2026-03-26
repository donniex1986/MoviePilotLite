import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_site_options_config.dart';
import 'package:moviepilot_mobile/modules/settings/models/system_env_model.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_manager.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

class SettingsSiteOptionsController extends GetxController {
  final _apiClient = Get.find<ApiClient>();

  bool _forceNextFormHydrate = false;

  final envData = Rxn<SystemEnvData>();
  final isLoading = false.obs;
  final errorText = RxnString();
  final isUpdating = false.obs;
  final isEditing = true.obs;

  late final SettingsFormManager form = SettingsFormManager(
    fields: siteOptionsConfigFields,
  );

  List<SettingsFieldConfig> get fields => siteOptionsConfigFields;

  bool get hasPendingChanges => form.hasPendingChanges;

  void cancelEdit() {
    form.hydrateAll((k) => envData.value?.valueFor(k));
    form.clearDirty();
  }

  Future<bool> saveEdit() async {
    if (!form.hasPendingChanges) return true;
    final ok = await updateEnv(form.toPatch());
    if (ok) form.clearDirty();
    return ok;
  }

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
    final data = Map<String, dynamic>.from(changes);
    final interval = data['SITEDATA_REFRESH_INTERVAL'];
    if (interval != null) {
      data['SITEDATA_REFRESH_INTERVAL'] = interval is int
          ? interval
          : int.tryParse(interval.toString()) ?? 0;
    }
    isUpdating.value = true;
    errorText.value = null;
    try {
      final resp = await _apiClient.post<Map<String, dynamic>>(
        '/api/v1/system/env',
        data: data,
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
            final syncForm = _forceNextFormHydrate ||
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
