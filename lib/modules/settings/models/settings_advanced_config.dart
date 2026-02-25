import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';

/// 高级设置 - 系统 区块字段
List<SettingsFieldConfig> get advancedSystemFields => [
  SettingsFieldConfig(
    label: '用户辅助认证',
    envKey: 'AUXILIARY_AUTH_ENABLE',
    type: SettingsFieldType.toggle,
    hint: '允许外部服务进行登录认证以及自动创建用户',
    icon: Icons.verified_user_outlined,
  ),
  SettingsFieldConfig(
    label: '分享订阅数据',
    envKey: 'SUBSCRIBE_STATISTIC_SHARE',
    type: SettingsFieldType.toggle,
    hint: '分享订阅统计数据到热门订阅，供其他MPer参考',
    icon: Icons.share_outlined,
  ),
  SettingsFieldConfig(
    label: '分享工作流数据',
    envKey: 'WORKFLOW_STATISTIC_SHARE',
    type: SettingsFieldType.toggle,
    hint: '分享工作流统计数据到热门工作流，供其他MPer参考',
    icon: Icons.account_tree_outlined,
  ),
  SettingsFieldConfig(
    label: '数据库WAL模式',
    envKey: 'DB_WAL_ENABLE',
    type: SettingsFieldType.toggle,
    hint: '可提升读写并发性能，但可能在异常情况下增加数据丢失风险，更改后需重启生效',
    icon: Icons.storage_outlined,
  ),
  SettingsFieldConfig(
    label: '自动更新站点资源',
    envKey: 'AUTO_UPDATE_RESOURCE',
    type: SettingsFieldType.toggle,
    hint: '重启时自动检测和更新站点资源包',
    icon: Icons.update_outlined,
  ),
  SettingsFieldConfig(
    label: '全局图片缓存',
    envKey: 'GLOBAL_IMAGE_CACHE',
    type: SettingsFieldType.toggle,
    hint: '将媒体图片缓存到本地，提升图片加载速度',
    icon: Icons.image_outlined,
  ),
  SettingsFieldConfig(
    label: '上报插件安装数据',
    envKey: 'PLUGIN_STATISTIC_SHARE',
    type: SettingsFieldType.toggle,
    hint: '上报插件安装数据给服务器，用于统计展示插件安装情况',
    icon: Icons.analytics_outlined,
  ),
  SettingsFieldConfig(
    label: '大内存模式',
    envKey: 'BIG_MEMORY_MODE',
    type: SettingsFieldType.toggle,
    hint: '使用更大的内存缓存数据，提升系统性能',
    icon: Icons.memory_outlined,
  ),
  SettingsFieldConfig(
    label: '自动更新MoviePilot',
    envKey: 'MOVIEPILOT_AUTO_UPDATE',
    type: SettingsFieldType.toggle,
    hint: '重启时自动更新MoviePilot到最新发行版本',
    icon: Icons.system_update_outlined,
  ),
];

/// 高级设置 - 媒体 区块字段
List<SettingsFieldConfig> get advancedMediaFields => [
  SettingsFieldConfig(
    label: 'TMDB API服务地址',
    envKey: 'TMDB_API_DOMAIN',
    type: SettingsFieldType.text,
    hint: '自定义themoviedb API域名或代理地址',
    icon: Icons.api_outlined,
  ),
  SettingsFieldConfig(
    label: 'TMDB 元数据语言',
    envKey: 'TMDB_LOCALE',
    type: SettingsFieldType.text,
    hint: '自定义themoviedb元数据语言',
    icon: Icons.translate_outlined,
  ),
  SettingsFieldConfig(
    label: 'TMDB 图片服务地址',
    envKey: 'TMDB_IMAGE_DOMAIN',
    type: SettingsFieldType.text,
    hint: '自定义themoviedb图片服务域名或代理地址',
    icon: Icons.image_outlined,
  ),
  SettingsFieldConfig(
    label: '媒体元数据缓存过期时间',
    envKey: 'META_CACHE_EXPIRE',
    type: SettingsFieldType.number,
    hint: '识别元数据本地缓存时间,为0时使用内置默认值',
    icon: Icons.schedule_outlined,
    unit: '小时',
    step: 1,
  ),
  SettingsFieldConfig(
    label: '跟随TMDB识别整理',
    envKey: 'SCRAP_FOLLOW_TMDB',
    type: SettingsFieldType.toggle,
    hint: '关闭时以整理历史记录为准(如有),避免TMDB数据在订阅中途修改',
    icon: Icons.sync_outlined,
  ),
  SettingsFieldConfig(
    label: 'Fanart图片数据源',
    envKey: 'FANART_ENABLE',
    type: SettingsFieldType.toggle,
    hint: '使用 fanart.tv 的图片数据',
    icon: Icons.photo_library_outlined,
  ),
  SettingsFieldConfig(
    label: 'TMDB 刮削原语种图片',
    envKey: 'TMDB_SCRAP_ORIGINAL_IMAGE',
    type: SettingsFieldType.toggle,
    hint: '刮削原语种图片,否则刮削元数据语种图片',
    icon: Icons.image_search_outlined,
  ),
  SettingsFieldConfig(
    label: 'Fanart语言',
    envKey: 'FANART_LANG',
    type: SettingsFieldType.text,
    hint: '设置Fanart图片的语言偏好,多选时按优先级顺序排列',
    icon: Icons.language_outlined,
  ),
];

/// 高级设置 - 网络 区块字段
List<SettingsFieldConfig> get advancedNetworkFields => [
  SettingsFieldConfig(
    label: '代理服务器',
    envKey: 'PROXY_HOST',
    type: SettingsFieldType.text,
    hint: '设置代理服务器地址,支持:http(s)、socks5、socks5h等协议',
    icon: Icons.dns_outlined,
  ),
  SettingsFieldConfig(
    label: 'Github加速代理',
    envKey: 'GITHUB_PROXY',
    type: SettingsFieldType.text,
    hint: '使用代理加速Github访问速度',
    icon: Icons.code_outlined,
  ),
  SettingsFieldConfig(
    label: 'PIP加速代理',
    envKey: 'PIP_PROXY',
    type: SettingsFieldType.text,
    hint: '使用代理加速插件等pip库安装速度',
    icon: Icons.folder_outlined,
  ),
  SettingsFieldConfig(
    label: 'DNS Over HTTPS',
    envKey: 'DOH_ENABLE',
    type: SettingsFieldType.toggle,
    hint: '使用DOH对特定域名进行解析,以防止DNS污染',
    icon: Icons.security_outlined,
  ),
  SettingsFieldConfig(
    label: '安全图片域名',
    envKey: 'SECURITY_IMAGE_DOMAINS',
    type: SettingsFieldType.text,
    hint: '设置允许加载图片的安全域名列表',
    icon: Icons.verified_outlined,
  ),
];

/// 高级设置 - 日志 区块字段
List<SettingsFieldConfig> get advancedLogFields => [
  SettingsFieldConfig(
    label: '调试模式',
    envKey: 'DEBUG',
    type: SettingsFieldType.toggle,
    hint: '启用调试模式后，日志将以DEBUG级别记录，以便排查问题',
    icon: Icons.bug_report_outlined,
  ),
  SettingsFieldConfig(
    label: '日志文件最大容量(MB)',
    envKey: 'LOG_MAX_FILE_SIZE',
    type: SettingsFieldType.number,
    hint: '限制单个日志文件的最大容量，超出后将自动分割日志',
    icon: Icons.description_outlined,
    unit: 'MB',
    step: 1,
  ),
  SettingsFieldConfig(
    label: '日志文件最大备份数量',
    envKey: 'LOG_BACKUP_COUNT',
    type: SettingsFieldType.number,
    hint: '设置每个模块日志文件的最大备份数量，超过后将覆盖旧日志',
    icon: Icons.backup_outlined,
    step: 1,
  ),
  SettingsFieldConfig(
    label: '日志等级',
    envKey: 'LOG_LEVEL',
    type: SettingsFieldType.select,
    hint: '设置日志记录的级别，用于控制日志输出量',
    icon: Icons.filter_list_outlined,
    enumKey: 'LOG_LEVEL',
  ),
  SettingsFieldConfig(
    label: '日志文件格式',
    envKey: 'LOG_FILE_FORMAT',
    type: SettingsFieldType.text,
    hint: '设置日志文件的输出格式，用于自定义日志的显示内容',
    icon: Icons.format_align_left_outlined,
  ),
];

/// 高级设置 - 实验室 区块字段
List<SettingsFieldConfig> get advancedLabFields => [
  SettingsFieldConfig(
    label: '插件热加载',
    envKey: 'PLUGIN_AUTO_RELOAD',
    type: SettingsFieldType.toggle,
    hint: '修改插件文件后自动重新加载，开发插件时使用',
    icon: Icons.extension_outlined,
  ),
  SettingsFieldConfig(
    label: '编码探测性能模式',
    envKey: 'ENCODING_DETECTION_PERFORMANCE_MODE',
    type: SettingsFieldType.toggle,
    hint: '优先提升探测效率，但可能降低编码探测的准确性',
    icon: Icons.speed_outlined,
  ),
  SettingsFieldConfig(
    label: '文件整理线程数',
    envKey: 'TRANSFER_THREADS',
    type: SettingsFieldType.number,
    hint: '多线程整理文件可以提高速度，但可能增加系统资源占用',
    icon: Icons.vertical_split_outlined,
    step: 1,
  ),
];
