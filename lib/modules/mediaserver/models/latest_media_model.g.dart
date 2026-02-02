// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LatestMediaImpl _$$LatestMediaImplFromJson(Map<String, dynamic> json) =>
    _$LatestMediaImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      image: json['image'] as String? ?? '',
      link: json['link'] as String? ?? '',
      percent: (json['percent'] as num?)?.toDouble(),
      backdropImageTags:
          (json['BackdropImageTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      serverType: json['server_type'] as String? ?? '',
      useCookies: json['use_cookies'] as bool?,
      libraryName: json['libraryName'] as String? ?? '',
    );

Map<String, dynamic> _$$LatestMediaImplToJson(_$LatestMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': instance.type,
      'image': instance.image,
      'link': instance.link,
      'percent': instance.percent,
      'BackdropImageTags': instance.backdropImageTags,
      'server_type': instance.serverType,
      'use_cookies': instance.useCookies,
      'libraryName': instance.libraryName,
    };

_$LatestMediaResponseImpl _$$LatestMediaResponseImplFromJson(
  Map<String, dynamic> json,
) => _$LatestMediaResponseImpl(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => LatestMedia.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$LatestMediaResponseImplToJson(
  _$LatestMediaResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
