import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_model.freezed.dart';
part 'cache_model.g.dart';

@freezed
class CacheResponse with _$CacheResponse {
  const factory CacheResponse({
    required bool success,
    String? message,
    CachePayload? data,
  }) = _CacheResponse;

  factory CacheResponse.fromJson(Map<String, dynamic> json) =>
      _$CacheResponseFromJson(json);
}

@freezed
class CachePayload with _$CachePayload {
  const factory CachePayload({
    @JsonKey(fromJson: _intFromJson) int? count,
    @JsonKey(fromJson: _intFromJson) int? sites,
    @JsonKey(name: 'data') List<CacheItem>? items,
  }) = _CachePayload;

  factory CachePayload.fromJson(Map<String, dynamic> json) =>
      _$CachePayloadFromJson(json);
}

@freezed
class CacheItem with _$CacheItem {
  const factory CacheItem({
    String? hash,
    String? domain,
    String? title,
    String? description,
    @JsonKey(fromJson: _intFromJson) int? size,
    String? pubdate,
    @JsonKey(name: 'site_name') String? siteName,
    @JsonKey(name: 'media_name') String? mediaName,
    @JsonKey(name: 'media_year') String? mediaYear,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'season_episode') String? seasonEpisode,
    @JsonKey(name: 'resource_term') String? resourceTerm,
    String? enclosure,
    @JsonKey(name: 'page_url') String? pageUrl,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
  }) = _CacheItem;

  factory CacheItem.fromJson(Map<String, dynamic> json) =>
      _$CacheItemFromJson(json);
}

int? _intFromJson(Object? value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
