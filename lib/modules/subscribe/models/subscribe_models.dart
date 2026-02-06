import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscribe_models.freezed.dart';
part 'subscribe_models.g.dart';

/// 订阅项（用户订阅列表、热门订阅等）
@freezed
class SubscribeItem with _$SubscribeItem {
  const factory SubscribeItem({
    @JsonKey(fromJson: _intFromJson) int? id,
    String? name,
    String? year,
    String? type,
    String? keyword,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    @JsonKey(name: 'doubanid', fromJson: _intFromJson) int? doubanid,
    @JsonKey(name: 'bangumiid', fromJson: _intFromJson) int? bangumiid,
    String? mediaid,
    @JsonKey(fromJson: _intFromJson) int? season,
    String? poster,
    String? backdrop,
    @JsonKey(fromJson: _doubleFromJson) double? vote,
    String? description,
    String? filter,
    String? include,
    String? exclude,
    String? quality,
    String? resolution,
    String? effect,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson) int? totalEpisode,
    @JsonKey(name: 'start_episode', fromJson: _intFromJson) int? startEpisode,
    @JsonKey(name: 'lack_episode', fromJson: _intFromJson) int? lackEpisode,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    List<int>? note,
    String? state,
    @JsonKey(name: 'last_update') String? lastUpdate,
    String? username,
    @JsonKey(fromJson: _intListFromJson, toJson: _intListToJson)
    List<int>? sites,
    String? downloader,
    @JsonKey(name: 'best_version', fromJson: _intFromJson) int? bestVersion,
    @JsonKey(name: 'current_priority') int? currentPriority,
    @JsonKey(name: 'save_path') String? savePath,
    @JsonKey(name: 'search_imdbid', fromJson: _intFromJson) int? searchImdbid,
    String? date,
    @JsonKey(name: 'custom_words') String? customWords,
    @JsonKey(name: 'media_category') String? mediaCategory,
    @JsonKey(name: 'filter_groups') dynamic filterGroups,
    @JsonKey(name: 'episode_group') dynamic episodeGroup,
    /// 热门订阅专用：订阅人数
    @JsonKey(name: 'count', fromJson: _intFromJson) int? count,
  }) = _SubscribeItem;

  factory SubscribeItem.fromJson(Map<String, dynamic> json) =>
      _$SubscribeItemFromJson(json);
}

/// 订阅分享项（仅 TV 类型使用）
@freezed
class SubscribeShareItem with _$SubscribeShareItem {
  const factory SubscribeShareItem({
    @JsonKey(fromJson: _intFromJson) int? id,
    String? name,
    String? year,
    String? type,
    String? keyword,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    String? poster,
    String? backdrop,
    @JsonKey(fromJson: _doubleFromJson) double? vote,
    String? description,
    @JsonKey(fromJson: _intFromJson) int? season,
    @JsonKey(name: 'total_episode', fromJson: _intFromJson) int? totalEpisode,
    @JsonKey(name: 'share_user') String? shareUser,
    @JsonKey(name: 'share_time') String? shareTime,
  }) = _SubscribeShareItem;

  factory SubscribeShareItem.fromJson(Map<String, dynamic> json) =>
      _$SubscribeShareItemFromJson(json);
}

int? _intFromJson(Object? value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

double? _doubleFromJson(Object? value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

List<int> _intListFromJson(Object? value) {
  if (value is List) {
    return value.map(_intFromJson).whereType<int>().toList();
  }
  return const [];
}

List<int>? _intListToJson(List<int>? value) => value;
