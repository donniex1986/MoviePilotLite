// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonDetailImpl _$$PersonDetailImplFromJson(Map<String, dynamic> json) =>
    _$PersonDetailImpl(
      source: json['source'] as String?,
      id: _intFromJson(json['id']),
      type: _intFromJson(json['type']),
      name: json['name'] as String?,
      profilePath: json['profile_path'] as String?,
      gender: _intFromJson(json['gender']),
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      biography: json['biography'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$PersonDetailImplToJson(_$PersonDetailImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'gender': instance.gender,
      'also_known_as': instance.alsoKnownAs,
      'biography': instance.biography,
      'avatar': instance.avatar,
    };
