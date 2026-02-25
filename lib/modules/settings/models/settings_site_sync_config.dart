import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';

/// 站点同步 配置区块字段
List<SettingsFieldConfig> get siteSyncConfigFields => [
  SettingsFieldConfig(
    label: '启用本地CookieCloud服务器',
    envKey: 'COOKIECLOUD_ENABLE_LOCAL',
    type: SettingsFieldType.toggle,
    hint: '使用内建CookieCloud服务同步站点数据, 服务地址为: http://localhost:3000/cookiecloud',
    icon: Icons.cloud_outlined,
  ),
  SettingsFieldConfig(
    label: '服务地址',
    envKey: 'COOKIECLOUD_HOST',
    type: SettingsFieldType.text,
    hint: '远端CookieCloud服务地址, 格式: https://movie-pilot.org/cookiecloud',
    icon: Icons.link,
  ),
  SettingsFieldConfig(
    label: '端对端加密密码',
    envKey: 'COOKIECLOUD_PASSWORD',
    type: SettingsFieldType.text,
    hint: 'CookieCloud浏览器插件生成的端对端加密密码',
    icon: Icons.lock_outline,
    obscureText: true,
  ),
  SettingsFieldConfig(
    label: '同步域名黑名单',
    envKey: 'COOKIECLOUD_BLACKLIST',
    type: SettingsFieldType.text,
    hint: 'CookieCloud同步域名黑名单, 多个域名, 分割',
    icon: Icons.block,
  ),
  SettingsFieldConfig(
    label: '用户KEY',
    envKey: 'COOKIECLOUD_KEY',
    type: SettingsFieldType.text,
    hint: 'CookieCloud浏览器插件生成的的用户KEY',
    icon: Icons.vpn_key_outlined,
  ),
  SettingsFieldConfig(
    label: '自动同步间隔',
    envKey: 'COOKIECLOUD_INTERVAL',
    type: SettingsFieldType.select,
    hint: 'CookieCloud自动同步间隔',
    icon: Icons.schedule,
    enumKey: 'COOKIECLOUD_INTERVAL',
  ),
];
