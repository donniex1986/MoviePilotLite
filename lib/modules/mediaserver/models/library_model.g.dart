// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaLibraryImpl _$$MediaLibraryImplFromJson(Map<String, dynamic> json) =>
    _$MediaLibraryImpl(
      server: json['server'] as String? ?? '',
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      path: _stringFromJson(json['path']),
      type: json['type'] as String? ?? '',
      image: json['image'] as String?,
      image_list: _stringListFromJson(json['image_list']),
      link: json['link'] as String?,
      server_type: json['server_type'] as String? ?? '',
      use_cookies: json['use_cookies'] as bool?,
    );

Map<String, dynamic> _$$MediaLibraryImplToJson(_$MediaLibraryImpl instance) =>
    <String, dynamic>{
      'server': instance.server,
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'type': instance.type,
      'image': instance.image,
      'image_list': instance.image_list,
      'link': instance.link,
      'server_type': instance.server_type,
      'use_cookies': instance.use_cookies,
    };

_$MediaLibraryResponseImpl _$$MediaLibraryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MediaLibraryResponseImpl(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => MediaLibrary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$MediaLibraryResponseImplToJson(
  _$MediaLibraryResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
