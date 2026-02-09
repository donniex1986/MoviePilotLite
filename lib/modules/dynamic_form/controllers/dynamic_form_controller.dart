import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/dynamic_form_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/services/form_block_converter.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 动态表单控制器：拉取接口、解析、转换为 FormBlock 列表；配置表单支持保存
class DynamicFormController extends GetxController {
  final _apiClient = Get.find<ApiClient>();
  final _appService = Get.find<AppService>();
  final _log = Get.find<AppLog>();

  /// 接口路径（GET 拉取），如 /api/v1/plugin/ZvideoHelper
  late final String apiPath;

  /// 接口路径（PUT 保存），如 /api/v1/plugin/ZvideoHelper
  late final String apiSavePath;

  /// 页面标题，可选，用于 AppBar
  String? pageTitle;

  final blocks = <FormBlock>[].obs;
  final isLoading = false.obs;
  final errorText = RxnString();
  final saveSuccess = false.obs;

  /// 配置表单当前数据（key 为 props.model），保存时 PUT 此 Map
  final formModel = Rx<Map<String, dynamic>>({});

  String? _getToken() =>
      _appService.loginResponse?.accessToken ??
      _appService.latestLoginProfileAccessToken ??
      _apiClient.token;

  /// 初始化：接口路径必填，标题可选
  void init(String path, {String? title}) {
    apiPath = path;
    pageTitle = title;
  }

  @override
  void onReady() {
    super.onReady();
    load();
  }

  /// 根据字段名取当前值（配置表单用）
  dynamic getValue(String? name) {
    if (name == null || name.isEmpty) return null;
    return formModel.value[name];
  }

  static bool _boolFromDynamic(dynamic v) {
    if (v == null) return false;
    if (v is bool) return v;
    if (v is String) return v.toLowerCase() == 'true' || v == '1';
    if (v is num) return v != 0;
    return false;
  }

  /// 根据字段名取 bool（用于 Switch）
  bool getBoolValue(String? name) => _boolFromDynamic(getValue(name));

  /// 更新字段值（配置表单用）
  void updateField(String? name, dynamic value) {
    if (name == null || name.isEmpty) return;
    formModel.value = Map<String, dynamic>.from(formModel.value)
      ..[name] = value;
  }

  /// 是否显示保存按钮（有 formModel 且有 key 时）
  bool get hasFormModel => formModel.value.isNotEmpty;

  Future<void> load() async {
    isLoading.value = true;
    errorText.value = null;
    saveSuccess.value = false;
    try {
      final token = _getToken();
      if (token == null || token.isEmpty) {
        errorText.value = '请先登录';
        blocks.clear();
        formModel.value = {};
        return;
      }
      final response = await _apiClient.get<dynamic>(apiPath, token: token);
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '请求失败 (HTTP $status)';
        blocks.clear();
        formModel.value = {};
        return;
      }
      final data = response.data;
      final map = _extractMap(data);
      if (map == null) {
        errorText.value = '数据格式错误';
        blocks.clear();
        formModel.value = {};
        return;
      }
      final parsed = DynamicFormResponse.fromJson(
        Map<String, dynamic>.from(map),
      );
      if (parsed.model != null && parsed.model!.isNotEmpty) {
        formModel.value = Map<String, dynamic>.from(parsed.model!);
      } else {
        formModel.value = {};
      }
      blocks.assignAll(FormBlockConverter.convert(parsed));
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '获取动态表单失败');
      errorText.value = '请求失败，请稍后重试';
      blocks.clear();
      formModel.value = {};
    } finally {
      isLoading.value = false;
    }
  }

  /// 保存配置（PUT 当前 formModel）
  Future<bool> save() async {
    if (formModel.value.isEmpty) return false;
    final token = _getToken();
    if (token == null || token.isEmpty) {
      errorText.value = '请先登录';
      return false;
    }
    isLoading.value = true;
    errorText.value = null;
    saveSuccess.value = false;
    try {
      _log.info('保存配置: $apiPath ${formModel.value}');
      final response = await _apiClient.put(
        apiSavePath,
        formModel.value,
        token: token,
      );
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '保存失败 (HTTP $status)';
        return false;
      }

      saveSuccess.value = true;
      return true;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '保存配置失败');
      errorText.value = '保存失败，请稍后重试';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, dynamic>? _extractMap(dynamic raw) {
    if (raw is Map<String, dynamic>) return raw;
    if (raw is Map) return Map<String, dynamic>.from(raw);
    if (raw is String) {
      try {
        final decoded = jsonDecode(raw);
        return decoded is Map ? Map<String, dynamic>.from(decoded) : null;
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}
