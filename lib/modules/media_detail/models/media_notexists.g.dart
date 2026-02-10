// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_notexists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaNotExistsImpl _$$MediaNotExistsImplFromJson(Map<String, dynamic> json) =>
    _$MediaNotExistsImpl(
      season: _intFromJson(json['season']),
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      total_episodes: _intFromJson(json['total_episodes']),
      start_episode: _intFromJson(json['start_episode']),
    );

Map<String, dynamic> _$$MediaNotExistsImplToJson(
  _$MediaNotExistsImpl instance,
) => <String, dynamic>{
  'season': instance.season,
  'episodes': instance.episodes,
  'total_episodes': instance.total_episodes,
  'start_episode': instance.start_episode,
};
