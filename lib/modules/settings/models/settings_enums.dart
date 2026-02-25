/// 枚举选项
class SettingsEnumOption {
  const SettingsEnumOption({required this.value, required this.label});

  final String value;
  final String label;
}

/// 设定枚举配置（value → 展示文案）
const Map<String, List<SettingsEnumOption>> settingsEnums = {
  'WALLPAPER': [
    SettingsEnumOption(value: 'tmdb', label: 'TMDB电影海报'),
    SettingsEnumOption(value: 'bing', label: 'Bing每日壁纸'),
    SettingsEnumOption(value: 'mediaserver', label: '媒体服务器'),
    SettingsEnumOption(value: 'custom', label: '自定义'),
    SettingsEnumOption(value: 'none', label: '无壁纸'),
  ],
  'RECOGNIZE_SOURCE': [
    SettingsEnumOption(value: 'themoviedb', label: 'TheMovieDb'),
    SettingsEnumOption(value: 'douban', label: '豆瓣'),
  ],
  'SCRAP_SOURCE': [
    SettingsEnumOption(value: 'themoviedb', label: 'TheMovieDb'),
    SettingsEnumOption(value: 'douban', label: '豆瓣'),
  ],
  'LLM_PROVIDER': [
    SettingsEnumOption(value: 'deepseek', label: 'DeepSeek'),
    SettingsEnumOption(value: 'openai', label: 'OpenAI'),
    SettingsEnumOption(value: 'google', label: 'Google'),
  ],
  'LLM_MODEL': [], // 待用户提供后填充
  'SITEDATA_REFRESH_INTERVAL': [
    SettingsEnumOption(value: '60', label: '每小时'),
    SettingsEnumOption(value: '360', label: '每6小时'),
    SettingsEnumOption(value: '720', label: '每12小时'),
    SettingsEnumOption(value: '1440', label: '每天'),
    SettingsEnumOption(value: '10080', label: '每周'),
    SettingsEnumOption(value: '43200', label: '每月'),
    SettingsEnumOption(value: '0', label: '永不'),
  ],
  'BROWSER_EMULATION': [
    SettingsEnumOption(value: 'playwright', label: 'playwright'),
    SettingsEnumOption(value: 'flaresolverr', label: 'flaresolverr'),
  ],
  'COOKIECLOUD_INTERVAL': [
    SettingsEnumOption(value: '60', label: '每小时'),
    SettingsEnumOption(value: '360', label: '每6小时'),
    SettingsEnumOption(value: '720', label: '每12小时'),
    SettingsEnumOption(value: '1440', label: '每天'),
    SettingsEnumOption(value: '10080', label: '每周'),
    SettingsEnumOption(value: '43200', label: '每月'),
    SettingsEnumOption(value: '0', label: '永不'),
  ],
  'LOG_LEVEL': [
    SettingsEnumOption(value: 'DEBUG', label: 'DEBUG - 调试'),
    SettingsEnumOption(value: 'INFO', label: 'INFO - 信息'),
    SettingsEnumOption(value: 'WARNING', label: 'WARNING - 警告'),
    SettingsEnumOption(value: 'ERROR', label: 'ERROR - 错误'),
    SettingsEnumOption(value: 'CRITICAL', label: 'CRITICAL - 严重'),
  ],
};

String enumValueToLabel(String enumKey, dynamic value) {
  final list = settingsEnums[enumKey];
  if (list == null) return value?.toString() ?? '';
  final str = value?.toString().toLowerCase() ?? '';
  for (final opt in list) {
    if (opt.value.toLowerCase() == str) return opt.label;
  }
  return value?.toString() ?? '';
}
