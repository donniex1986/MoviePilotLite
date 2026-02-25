// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloader_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PathMappingImpl _$$PathMappingImplFromJson(Map<String, dynamic> json) =>
    _$PathMappingImpl(
      fromPath: json['from'] == null ? '' : _stringFromJson(json['from']),
      toPath: json['to'] == null ? '' : _stringFromJson(json['to']),
      storage: json['storage'] == null
          ? 'local'
          : _stringFromJson(json['storage']),
    );

Map<String, dynamic> _$$PathMappingImplToJson(_$PathMappingImpl instance) =>
    <String, dynamic>{
      'from': instance.fromPath,
      'to': instance.toPath,
      'storage': instance.storage,
    };

_$DownloaderConfigImpl _$$DownloaderConfigImplFromJson(
  Map<String, dynamic> json,
) => _$DownloaderConfigImpl(
  name: json['name'] == null ? '' : _stringFromJson(json['name']),
  type: json['type'] == null ? '' : _stringFromJson(json['type']),
  enabled: json['enabled'] == null ? true : _boolFromJson(json['enabled']),
  isDefault: json['default'] == null ? false : _boolFromJson(json['default']),
  host: json['host'] == null ? '' : _stringFromJson(json['host']),
  username: json['username'] == null ? '' : _stringFromJson(json['username']),
  password: json['password'] == null ? '' : _stringFromJson(json['password']),
  autoCategory: json['auto_category'] == null
      ? false
      : _boolFromJson(json['auto_category']),
  sequential: json['sequential'] == null
      ? false
      : _boolFromJson(json['sequential']),
  forceResume: json['force_resume'] == null
      ? false
      : _boolFromJson(json['force_resume']),
  firstLastPriority: json['first_last_priority'] == null
      ? false
      : _boolFromJson(json['first_last_priority']),
  pathMappings: json['path_mappings'] == null
      ? const []
      : _pathMappingsFromJson(json['path_mappings']),
);

Map<String, dynamic> _$$DownloaderConfigImplToJson(
  _$DownloaderConfigImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'enabled': instance.enabled,
  'default': instance.isDefault,
  'host': instance.host,
  'username': instance.username,
  'password': instance.password,
  'auto_category': instance.autoCategory,
  'sequential': instance.sequential,
  'force_resume': instance.forceResume,
  'first_last_priority': instance.firstLastPriority,
  'path_mappings': instance.pathMappings,
};

_$DownloaderConfigResponseImpl _$$DownloaderConfigResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DownloaderConfigResponseImpl(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DownloaderConfigData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DownloaderConfigResponseImplToJson(
  _$DownloaderConfigResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$DownloaderConfigDataImpl _$$DownloaderConfigDataImplFromJson(
  Map<String, dynamic> json,
) => _$DownloaderConfigDataImpl(
  value: json['value'] == null ? const [] : _configListFromJson(json['value']),
);

Map<String, dynamic> _$$DownloaderConfigDataImplToJson(
  _$DownloaderConfigDataImpl instance,
) => <String, dynamic>{'value': instance.value};
