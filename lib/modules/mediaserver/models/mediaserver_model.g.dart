// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediaserver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaServerConfigImpl _$$MediaServerConfigImplFromJson(
  Map<String, dynamic> json,
) => _$MediaServerConfigImpl(
  host: json['host'] as String? ?? '',
  play_host: json['play_host'] as String? ?? '',
  username: json['username'] as String? ?? '',
  apikey: json['apikey'] as String? ?? '',
);

Map<String, dynamic> _$$MediaServerConfigImplToJson(
  _$MediaServerConfigImpl instance,
) => <String, dynamic>{
  'host': instance.host,
  'play_host': instance.play_host,
  'username': instance.username,
  'apikey': instance.apikey,
};

_$MediaServerImpl _$$MediaServerImplFromJson(Map<String, dynamic> json) =>
    _$MediaServerImpl(
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      config: json['config'] == null
          ? const MediaServerConfig()
          : MediaServerConfig.fromJson(json['config'] as Map<String, dynamic>),
      sync_libraries:
          (json['sync_libraries'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MediaServerImplToJson(_$MediaServerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'enabled': instance.enabled,
      'config': instance.config,
      'sync_libraries': instance.sync_libraries,
    };

_$MediaServerResponseImpl _$$MediaServerResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MediaServerResponseImpl(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  data: json['data'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$$MediaServerResponseImplToJson(
  _$MediaServerResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
