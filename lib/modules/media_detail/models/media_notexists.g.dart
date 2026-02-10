// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_notexists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaNotExistsImpl _$$MediaNotExistsImplFromJson(Map<String, dynamic> json) =>
    _$MediaNotExistsImpl(
      season: _intFromJson(json['season']),
      episodes: _stringListFromJson(json['episodes']),
      total_episode: _intFromJson(json['total_episode']),
      start_episode: _intFromJson(json['start_episode']),
    );

Map<String, dynamic> _$$MediaNotExistsImplToJson(
  _$MediaNotExistsImpl instance,
) => <String, dynamic>{
  'season': instance.season,
  'episodes': instance.episodes,
  'total_episode': instance.total_episode,
  'start_episode': instance.start_episode,
};
