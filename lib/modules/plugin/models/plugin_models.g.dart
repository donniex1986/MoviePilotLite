// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PluginItemImpl _$$PluginItemImplFromJson(Map<String, dynamic> json) =>
    _$PluginItemImpl(
      id: json['id'] as String,
      pluginName: json['plugin_name'] as String,
      pluginDesc: json['plugin_desc'] as String?,
      pluginIcon: json['plugin_icon'] as String?,
      pluginVersion: json['plugin_version'] as String?,
      pluginLabel: json['plugin_label'] as String?,
      pluginAuthor: json['plugin_author'] as String?,
      authorUrl: json['author_url'] as String?,
      pluginConfigPrefix: json['plugin_config_prefix'] as String?,
      pluginOrder: json['plugin_order'] == null
          ? 0
          : _intFromJson(json['plugin_order']),
      authLevel: json['auth_level'] == null
          ? 1
          : _intFromJson(json['auth_level']),
      installed: json['installed'] as bool? ?? true,
      state: json['state'] as bool? ?? false,
      hasPage: json['has_page'] as bool? ?? false,
      hasUpdate: json['has_update'] as bool? ?? false,
      isLocal: json['is_local'] as bool? ?? false,
      repoUrl: json['repo_url'] as String?,
      installCount: json['install_count'] == null
          ? 0
          : _intFromJson(json['install_count']),
      history: json['history'] as Map<String, dynamic>? ?? const {},
      addTime: json['add_time'] == null ? 0 : _intFromJson(json['add_time']),
      pluginPublicKey: json['plugin_public_key'] as String?,
    );

Map<String, dynamic> _$$PluginItemImplToJson(_$PluginItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plugin_name': instance.pluginName,
      'plugin_desc': instance.pluginDesc,
      'plugin_icon': instance.pluginIcon,
      'plugin_version': instance.pluginVersion,
      'plugin_label': instance.pluginLabel,
      'plugin_author': instance.pluginAuthor,
      'author_url': instance.authorUrl,
      'plugin_config_prefix': instance.pluginConfigPrefix,
      'plugin_order': instance.pluginOrder,
      'auth_level': instance.authLevel,
      'installed': instance.installed,
      'state': instance.state,
      'has_page': instance.hasPage,
      'has_update': instance.hasUpdate,
      'is_local': instance.isLocal,
      'repo_url': instance.repoUrl,
      'install_count': instance.installCount,
      'history': instance.history,
      'add_time': instance.addTime,
      'plugin_public_key': instance.pluginPublicKey,
    };
