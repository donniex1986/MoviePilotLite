import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_api_item.freezed.dart';
part 'recommend_api_item.g.dart';

@freezed
class RecommendApiItem with _$RecommendApiItem {
  const factory RecommendApiItem({
    String? source,
    String? type,
    String? title,
    String? en_title,
    String? year,
    String? title_year,
    @JsonKey(fromJson: _asInt) int? season,
    @JsonKey(fromJson: _asString) String? tmdb_id,
    @JsonKey(fromJson: _asString) String? imdb_id,
    @JsonKey(fromJson: _asString) String? tvdb_id,
    @JsonKey(fromJson: _asString) String? douban_id,
    @JsonKey(fromJson: _asString) String? bangumi_id,
    @JsonKey(fromJson: _asString) String? collection_id,
    @JsonKey(fromJson: _asString) String? mediaid_prefix,
    @JsonKey(fromJson: _asString) String? media_id,
    String? original_language,
    String? original_title,
    String? release_date,
    String? backdrop_path,
    String? poster_path,
    @JsonKey(fromJson: _asDouble) double? vote_average,
    String? overview,
    String? category,
    @JsonKey(fromJson: _asMap) Map<String, dynamic>? seasons,
    @Default(<dynamic>[]) List<dynamic> season_info,
    @Default(<dynamic>[]) List<dynamic> names,
    @Default(<dynamic>[]) List<dynamic> actors,
    @Default(<dynamic>[]) List<dynamic> directors,
    String? detail_link,
    bool? adult,
    @Default(<dynamic>[]) List<dynamic> created_by,
    @Default(<dynamic>[]) List<dynamic> episode_run_time,
    @Default(<dynamic>[]) List<dynamic> genres,
    String? first_air_date,
    String? homepage,
    @Default(<dynamic>[]) List<dynamic> languages,
    String? last_air_date,
    @Default(<dynamic>[]) List<dynamic> networks,
    @JsonKey(fromJson: _asInt) int? number_of_episodes,
    @JsonKey(fromJson: _asInt) int? number_of_seasons,
    @Default(<dynamic>[]) List<dynamic> origin_country,
    String? original_name,
    @Default(<dynamic>[]) List<dynamic> production_companies,
    @Default(<dynamic>[]) List<dynamic> production_countries,
    @Default(<dynamic>[]) List<dynamic> spoken_languages,
    @Default(<dynamic>[]) List<dynamic> release_dates,
    String? status,
    String? tagline,
    @Default(<dynamic>[]) List<dynamic> genre_ids,
    @JsonKey(fromJson: _asInt) int? vote_count,
    @JsonKey(fromJson: _asDouble) double? popularity,
    @JsonKey(fromJson: _asInt) int? runtime,
    @JsonKey(fromJson: _asMap) Map<String, dynamic>? next_episode_to_air,
    @Default(<dynamic>[]) List<dynamic> episode_groups,
    @JsonKey(fromJson: _asMapOrNull) Map<String, dynamic>? episode_group,
  }) = _RecommendApiItem;

  factory RecommendApiItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendApiItemFromJson(json);
}

String? _asString(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  return value.toString();
}

int? _asInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

double? _asDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

Map<String, dynamic> _asMap(dynamic value) {
  if (value is Map) {
    return value.map(
      (key, entry) => MapEntry(key.toString(), entry),
    );
  }
  return <String, dynamic>{};
}

Map<String, dynamic>? _asMapOrNull(dynamic value) {
  if (value == null) return null;
  if (value is Map) {
    return value.map(
      (key, entry) => MapEntry(key.toString(), entry),
    );
  }
  return null;
}
