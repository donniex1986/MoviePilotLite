import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/download/controllers/download_controller.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';
import 'package:moviepilot_mobile/modules/settings/state/settings_form_manager.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_controller.dart';
import 'package:moviepilot_mobile/modules/site/models/site_models.dart';
import 'package:moviepilot_mobile/services/api_client.dart';

enum SiteAuthMode { cookie, api }

class SiteEditController extends GetxController {
  final _api = Get.find<ApiClient>();
  final _log = Get.find<AppLog>();

  final siteDetail = Rxn<SiteModel>();
  final isLoading = false.obs;
  final isSaving = false.obs;
  final errorText = RxnString();
  final isEditing = true.obs;
  final authMode = SiteAuthMode.cookie.obs;

  int? siteId;
  String siteName = '';

  static final List<SettingsFieldConfig> formFields = [
    const SettingsFieldConfig(
      label: '站点名称',
      envKey: 'name',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: '域名',
      envKey: 'domain',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: '站点地址',
      envKey: 'url',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: '优先级',
      envKey: 'pri',
      type: SettingsFieldType.number,
      step: 1,
    ),
    const SettingsFieldConfig(
      label: 'RSS 地址',
      envKey: 'rss',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: '下载器',
      envKey: 'downloader',
      type: SettingsFieldType.select,
      enumKey: 'SITE_DOWNLOADER',
    ),
    const SettingsFieldConfig(
      label: '启用站点',
      envKey: 'is_active',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: 'Cookie',
      envKey: 'cookie',
      type: SettingsFieldType.text,
    ),

    const SettingsFieldConfig(
      label: 'ApiKey',
      envKey: 'apikey',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: 'Token',
      envKey: 'token',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: 'User-Agent',
      envKey: 'ua',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: '代理访问',
      envKey: 'proxy',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '渲染页面',
      envKey: 'render',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '公开站点',
      envKey: 'public',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '过滤规则',
      envKey: 'filter',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: '备注',
      envKey: 'note',
      type: SettingsFieldType.text,
    ),
    const SettingsFieldConfig(
      label: '请求超时',
      envKey: 'timeout',
      type: SettingsFieldType.number,
      step: 1,
      unit: '秒',
    ),
    const SettingsFieldConfig(
      label: '限制站点访问频率',
      envKey: 'enable_rate_limit',
      type: SettingsFieldType.toggle,
    ),
    const SettingsFieldConfig(
      label: '访问间隔',
      envKey: 'limit_interval',
      type: SettingsFieldType.number,
      step: 1,
      conditionKey: 'enable_rate_limit',
      conditionValue: 'true',
    ),
    const SettingsFieldConfig(
      label: '限制次数',
      envKey: 'limit_count',
      type: SettingsFieldType.number,
      step: 1,
      conditionKey: 'enable_rate_limit',
      conditionValue: 'true',
    ),
    const SettingsFieldConfig(
      label: '限制周期',
      envKey: 'limit_seconds',
      type: SettingsFieldType.number,
      step: 1,
      unit: '秒',
      conditionKey: 'enable_rate_limit',
      conditionValue: 'true',
    ),
  ];

  late final SettingsFormManager form = SettingsFormManager(fields: formFields);

  DownloadController get _downloadController {
    if (!Get.isRegistered<DownloadController>()) {
      Get.put(DownloadController(), permanent: true);
    }
    return Get.find<DownloadController>();
  }

  List<String> get downloaderNames =>
      _downloadController.downloaders.map((e) => e.name).toList();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      final id = args['siteId'];
      siteId = id is int ? id : (id is String ? int.tryParse(id) : null);
      siteName = args['siteName']?.toString() ?? '';
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadDetail();
  }

  @override
  void onClose() {
    form.dispose();
    super.onClose();
  }

  List<SettingsEnumOption> optionsFor(String enumKey) {
    switch (enumKey) {
      case 'SITE_DOWNLOADER':
        return [
          const SettingsEnumOption(value: '', label: '默认'),
          ...downloaderNames.map((name) {
            return SettingsEnumOption(value: name, label: name);
          }),
        ];
      default:
        return settingsEnums[enumKey] ?? const [];
    }
  }

  dynamic valueFor(String envKey) {
    final site = siteDetail.value;
    if (site == null) return null;
    switch (envKey) {
      case 'name':
        return site.name;
      case 'domain':
        return site.domain;
      case 'url':
        return site.url;
      case 'pri':
        return site.pri;
      case 'rss':
        return site.rss ?? '';
      case 'cookie':
        return site.cookie ?? '';
      case 'ua':
        return site.ua ?? '';
      case 'apikey':
        return site.apikey ?? '';
      case 'token':
        return site.token ?? '';
      case 'proxy':
        return site.proxy != 0;
      case 'filter':
        return site.filter ?? '';
      case 'render':
        return site.render != 0;
      case 'public':
        return site.public != 0;
      case 'note':
        return site.note ?? '';
      case 'timeout':
        return site.timeout;
      case 'limit_interval':
        return site.limitInterval;
      case 'limit_count':
        return site.limitCount;
      case 'limit_seconds':
        return site.limitSeconds;
      case 'is_active':
        return site.isActive;
      case 'downloader':
        return site.downloader;
      case 'enable_rate_limit':
        return site.limitInterval > 0 ||
            site.limitCount > 0 ||
            site.limitSeconds > 0;
      default:
        return null;
    }
  }

  bool shouldShowField(SettingsFieldConfig field) {
    return form.shouldShow(field, valueFor);
  }

  bool shouldShowAuthField(SettingsFieldConfig field) {
    switch (field.envKey) {
      case 'cookie':
        return authMode.value == SiteAuthMode.cookie;
      case 'apikey':
      case 'token':
        return authMode.value == SiteAuthMode.api;
      default:
        return true;
    }
  }

  Future<void> loadDetail() async {
    final id = siteId;
    if (id == null) {
      errorText.value = '缺少站点 ID';
      return;
    }
    isLoading.value = true;
    errorText.value = null;
    try {
      if (_downloadController.downloaders.isEmpty) {
        await _downloadController.refreshDownloaders();
      }
      final response = await _api.get<dynamic>('/api/v1/site/$id');
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '获取站点详情失败 (HTTP $status)';
        return;
      }
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        errorText.value = '站点详情数据格式错误';
        return;
      }
      final detail = SiteModel.fromJson(data);
      siteDetail.value = detail;
      siteName = detail.name;
      authMode.value = _resolveInitialAuthMode(detail);
      form.hydrateAll(valueFor);
      form.clearDirty();
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '加载站点详情失败');
      errorText.value = '加载失败，请稍后重试';
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> saveEdit() async {
    final detail = siteDetail.value;
    final id = siteId ?? detail?.id;
    if (detail == null || id == null) {
      errorText.value = '缺少站点详情';
      return false;
    }
    isSaving.value = true;
    errorText.value = null;
    try {
      final rateLimitEnabled = form.effectiveValue('enable_rate_limit') == true;
      final payload = <String, dynamic>{
        'id': id,
        'name': _requiredText('name'),
        'domain': _requiredText('domain'),
        'url': _requiredText('url'),
        'pri': _intValue('pri'),
        'rss': _nullableText('rss'),
        'cookie': _nullableText('cookie'),
        'ua': _nullableText('ua'),
        'apikey': _nullableText('apikey'),
        'token': _nullableText('token'),
        'proxy': form.effectiveValue('proxy') == true,
        'filter': _nullableText('filter'),
        'render': form.effectiveValue('render') == true,
        'public': form.effectiveValue('public') == true ? 1 : 0,
        'note': _nullableText('note'),
        'timeout': _intValue('timeout', fallback: 15),
        'limit_interval': rateLimitEnabled ? _intValue('limit_interval') : 0,
        'limit_count': rateLimitEnabled ? _intValue('limit_count') : 0,
        'limit_seconds': rateLimitEnabled ? _intValue('limit_seconds') : 0,
        'is_active': form.effectiveValue('is_active') == true,
        'downloader': _nullableText('downloader'),
      };

      final response = await _api.put('/api/v1/site/', payload);
      final status = response.statusCode ?? 0;
      if (status >= 400) {
        errorText.value = '保存站点失败 (HTTP $status)';
        return false;
      }

      final updated = detail.copyWith(
        name: payload['name'] as String,
        domain: payload['domain'] as String,
        url: payload['url'] as String,
        pri: payload['pri'] as int,
        rss: payload['rss'] as String?,
        cookie: payload['cookie'] as String?,
        ua: payload['ua'] as String?,
        apikey: payload['apikey'] as String?,
        token: payload['token'] as String?,
        proxy: (payload['proxy'] as bool) ? 1 : 0,
        filter: payload['filter'] as String?,
        render: (payload['render'] as bool) ? 1 : 0,
        public: payload['public'] as int,
        note: payload['note'] as String?,
        timeout: payload['timeout'] as int,
        limitInterval: payload['limit_interval'] as int,
        limitCount: payload['limit_count'] as int,
        limitSeconds: payload['limit_seconds'] as int,
        isActive: payload['is_active'] as bool,
        downloader: (payload['downloader'] as String?) ?? '',
      );
      siteDetail.value = updated;
      siteName = updated.name;
      form.hydrateAll(valueFor);
      form.clearDirty();

      if (Get.isRegistered<SiteController>()) {
        try {
          await Get.find<SiteController>().load();
        } catch (_) {}
      }
      return true;
    } catch (e, st) {
      _log.handle(e, stackTrace: st, message: '保存站点失败');
      errorText.value = '保存失败，请稍后重试';
      return false;
    } finally {
      isSaving.value = false;
    }
  }

  String _requiredText(String key) {
    return (form.effectiveValue(key)?.toString() ?? '').trim();
  }

  String? _nullableText(String key) {
    final value = (form.effectiveValue(key)?.toString() ?? '').trim();
    return value.isEmpty ? null : value;
  }

  int _intValue(String key, {int fallback = 0}) {
    final value = form.effectiveValue(key);
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? fallback;
  }

  SiteAuthMode _resolveInitialAuthMode(SiteModel site) {
    final hasApiKey = (site.apikey ?? '').trim().isNotEmpty;
    final hasToken = (site.token ?? '').trim().isNotEmpty;
    final hasCookie = (site.cookie ?? '').trim().isNotEmpty;
    if ((hasApiKey || hasToken) && !hasCookie) {
      return SiteAuthMode.api;
    }
    return SiteAuthMode.cookie;
  }
}
