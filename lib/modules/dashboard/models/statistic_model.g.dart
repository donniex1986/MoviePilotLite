// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticModelImpl _$$StatisticModelImplFromJson(Map<String, dynamic> json) =>
    _$StatisticModelImpl(
      movie_count: (json['movie_count'] as num?)?.toInt() ?? 0,
      tv_count: (json['tv_count'] as num?)?.toInt() ?? 0,
      episode_count: (json['episode_count'] as num?)?.toInt() ?? 0,
      user_count: (json['user_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StatisticModelImplToJson(
  _$StatisticModelImpl instance,
) => <String, dynamic>{
  'movie_count': instance.movie_count,
  'tv_count': instance.tv_count,
  'episode_count': instance.episode_count,
  'user_count': instance.user_count,
};
