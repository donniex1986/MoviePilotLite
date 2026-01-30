// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LatestMediaImpl _$$LatestMediaImplFromJson(Map<String, dynamic> json) =>
    _$LatestMediaImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      poster: json['poster'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      release_date: json['release_date'] as String? ?? '',
      vote_average: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      added_date: json['added_date'] as String? ?? '',
    );

Map<String, dynamic> _$$LatestMediaImplToJson(_$LatestMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'poster': instance.poster,
      'overview': instance.overview,
      'release_date': instance.release_date,
      'vote_average': instance.vote_average,
      'added_date': instance.added_date,
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
