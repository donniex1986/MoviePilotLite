import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_notexists.freezed.dart';
part 'media_notexists.g.dart';

@freezed
class MediaNotExists with _$MediaNotExists {
  const factory MediaNotExists({
    @JsonKey(fromJson: _intFromJson) int? season,
    List<String>? episodes,
    @JsonKey(fromJson: _intFromJson) int? total_episodes,
    @JsonKey(fromJson: _intFromJson) int? start_episode,
  }) = _MediaNotExists;

  factory MediaNotExists.fromJson(Map<String, dynamic> json) =>
      _$MediaNotExistsFromJson(json);
}

int _intFromJson(dynamic json) =>
    json is int ? json : int.parse(json.toString());
