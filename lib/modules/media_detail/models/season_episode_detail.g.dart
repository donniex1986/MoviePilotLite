// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_episode_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeasonEpisodeDetailImpl _$$SeasonEpisodeDetailImplFromJson(
  Map<String, dynamic> json,
) => _$SeasonEpisodeDetailImpl(
  air_date: json['air_date'] as String?,
  episode_number: _intFromJson(json['episode_number']),
  episode_type: json['episode_type'] as String?,
  name: json['name'] as String?,
  overview: json['overview'] as String?,
  runtime: _intFromJson(json['runtime']),
  season_number: _intFromJson(json['season_number']),
  still_path: json['still_path'] as String?,
  vote_average: _doubleFromJson(json['vote_average']),
  crew: (json['crew'] as List<dynamic>?)
      ?.map((e) => SeasonCrewMember.fromJson(e as Map<String, dynamic>))
      .toList(),
  guest_stars: (json['guest_stars'] as List<dynamic>?)
      ?.map((e) => SeasonGuestStar.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$SeasonEpisodeDetailImplToJson(
  _$SeasonEpisodeDetailImpl instance,
) => <String, dynamic>{
  'air_date': instance.air_date,
  'episode_number': instance.episode_number,
  'episode_type': instance.episode_type,
  'name': instance.name,
  'overview': instance.overview,
  'runtime': instance.runtime,
  'season_number': instance.season_number,
  'still_path': instance.still_path,
  'vote_average': instance.vote_average,
  'crew': instance.crew,
  'guest_stars': instance.guest_stars,
};

_$SeasonCrewMemberImpl _$$SeasonCrewMemberImplFromJson(
  Map<String, dynamic> json,
) => _$SeasonCrewMemberImpl(
  job: json['job'] as String?,
  department: json['department'] as String?,
  name: json['name'] as String?,
  original_name: json['original_name'] as String?,
  profile_path: json['profile_path'] as String?,
);

Map<String, dynamic> _$$SeasonCrewMemberImplToJson(
  _$SeasonCrewMemberImpl instance,
) => <String, dynamic>{
  'job': instance.job,
  'department': instance.department,
  'name': instance.name,
  'original_name': instance.original_name,
  'profile_path': instance.profile_path,
};

_$SeasonGuestStarImpl _$$SeasonGuestStarImplFromJson(
  Map<String, dynamic> json,
) => _$SeasonGuestStarImpl(
  character: json['character'] as String?,
  name: json['name'] as String?,
  original_name: json['original_name'] as String?,
  profile_path: json['profile_path'] as String?,
);

Map<String, dynamic> _$$SeasonGuestStarImplToJson(
  _$SeasonGuestStarImpl instance,
) => <String, dynamic>{
  'character': instance.character,
  'name': instance.name,
  'original_name': instance.original_name,
  'profile_path': instance.profile_path,
};
