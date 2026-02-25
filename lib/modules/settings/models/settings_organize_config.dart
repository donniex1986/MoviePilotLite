import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_field_config.dart';

/// 整理&刮削 配置区块字段
List<SettingsFieldConfig> get organizeScrapeConfigFields => [
  SettingsFieldConfig(
    label: '刮削数据源',
    envKey: 'SCRAP_SOURCE',
    type: SettingsFieldType.select,
    hint: '刮削时的元数据来源',
    icon: Icons.source_outlined,
    enumKey: 'SCRAP_SOURCE',
  ),
  SettingsFieldConfig(
    label: '电影重命名格式',
    envKey: 'MOVIE_RENAME_FORMAT',
    type: SettingsFieldType.text,
    hint: '使用Jinja2语法,格式参考: https://jinja.palletsprojects.com/en/3.0.x/templates',
    icon: Icons.movie_outlined,
  ),
  SettingsFieldConfig(
    label: '电视剧重命名格式',
    envKey: 'TV_RENAME_FORMAT',
    type: SettingsFieldType.text,
    hint: '使用Jinja2语法,格式参考: https://jinja.palletsprojects.com/en/3.0.x/templates',
    icon: Icons.tv_outlined,
  ),
];
