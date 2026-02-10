import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_episode_detail.freezed.dart';
part 'season_episode_detail.g.dart';

@freezed
class SeasonEpisodeDetail with _$SeasonEpisodeDetail {
  const factory SeasonEpisodeDetail({
    String? air_date,
    @JsonKey(fromJson: _intFromJson) int? episode_number,
    String? episode_type,
    String? name,
    String? overview,
    @JsonKey(fromJson: _intFromJson) int? runtime,
    @JsonKey(fromJson: _intFromJson) int? season_number,
    String? still_path,
    @JsonKey(fromJson: _doubleFromJson) double? vote_average,
    List<SeasonCrewMember>? crew,
    List<SeasonGuestStar>? guest_stars,
  }) = _SeasonEpisodeDetail;

  factory SeasonEpisodeDetail.fromJson(Map<String, dynamic> json) =>
      _$SeasonEpisodeDetailFromJson(json);
}

@freezed
class SeasonCrewMember with _$SeasonCrewMember {
  const factory SeasonCrewMember({
    String? job,
    String? department,
    String? name,
    String? original_name,
    String? profile_path,
  }) = _SeasonCrewMember;

  factory SeasonCrewMember.fromJson(Map<String, dynamic> json) =>
      _$SeasonCrewMemberFromJson(json);
}

@freezed
class SeasonGuestStar with _$SeasonGuestStar {
  const factory SeasonGuestStar({
    String? character,
    String? name,
    String? original_name,
    String? profile_path,
  }) = _SeasonGuestStar;

  factory SeasonGuestStar.fromJson(Map<String, dynamic> json) =>
      _$SeasonGuestStarFromJson(json);
}

int? _intFromJson(dynamic json) {
  if (json == null) return null;
  if (json is int) return json;
  if (json is num) return json.toInt();
  if (json is String) return int.tryParse(json);
  return null;
}

double? _doubleFromJson(dynamic json) {
  if (json == null) return null;
  if (json is double) return json;
  if (json is num) return json.toDouble();
  if (json is String) return double.tryParse(json);
  return null;
}
