import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';

/// 站点选项 配置区块字段
List<SettingsFieldConfig> get siteOptionsConfigFields => [
  SettingsFieldConfig(
    label: '站点数据刷新间隔',
    envKey: 'SITEDATA_REFRESH_INTERVAL',
    type: SettingsFieldType.select,
    hint: '刷新站点用户上传下载等数据的时间间隔',
    icon: Icons.refresh,
    enumKey: 'SITEDATA_REFRESH_INTERVAL',
  ),
  SettingsFieldConfig(
    label: '阅读站点消息',
    envKey: 'SITE_MESSAGE',
    type: SettingsFieldType.toggle,
    hint: '刷新数据时读取站点消息并发送通知',
    icon: Icons.message_outlined,
  ),
  SettingsFieldConfig(
    label: '浏览器仿真',
    envKey: 'BROWSER_EMULATION',
    type: SettingsFieldType.select,
    hint: '站点访问时使用的浏览器仿真方式',
    icon: Icons.language,
    enumKey: 'BROWSER_EMULATION',
  ),
];
