import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';

/// 搜索&下载 - 基础设置 配置字段
List<SettingsFieldConfig> get searchDownloadConfigFields => [
  SettingsFieldConfig(
    label: '媒体搜索数据源',
    envKey: 'SEARCH_SOURCE',
    type: SettingsFieldType.text,
    hint: '搜索媒体信息时使用的数据源以及排序',
    icon: Icons.search_outlined,
  ),
  SettingsFieldConfig(
    label: '下载任务标签',
    envKey: 'TORRENT_TAG',
    type: SettingsFieldType.text,
    hint: '支持增加多个标签，英文逗号分隔',
    icon: Icons.label_outline,
  ),
  SettingsFieldConfig(
    label: '远程搜索自动下载用户',
    envKey: 'AUTO_DOWNLOAD_USER',
    type: SettingsFieldType.text,
    hint: '使用Telegram、微信等搜索时是否自动下载，使用逗号分割，设置为 all 代表所有用户自动择优下载',
    icon: Icons.person_outline,
  ),
  SettingsFieldConfig(
    label: '多名称资源搜索',
    envKey: 'SEARCH_MULTIPLE_NAME',
    type: SettingsFieldType.toggle,
    hint: '使用多个名称(中文、英文等)搜索站点资源并合并搜索结果，会增加站点访问频率',
    icon: Icons.manage_search_outlined,
  ),
  SettingsFieldConfig(
    label: '下载站点字幕',
    envKey: 'DOWNLOAD_SUBTITLE',
    type: SettingsFieldType.toggle,
    hint: '检查站点资源是否有单独的字幕文件并自动下载',
    icon: Icons.subtitles_outlined,
  ),
];
