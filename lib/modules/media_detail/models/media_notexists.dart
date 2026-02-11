import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_notexists.freezed.dart';
part 'media_notexists.g.dart';

@freezed
class MediaNotExists with _$MediaNotExists {
  const factory MediaNotExists({
    @JsonKey(fromJson: _intFromJson) int? season,
    @JsonKey(fromJson: _intListFromJson) List<int?>? episodes,
    @JsonKey(fromJson: _intFromJson) int? total_episode,
    @JsonKey(fromJson: _intFromJson) int? start_episode,
  }) = _MediaNotExists;

  factory MediaNotExists.fromJson(Map<String, dynamic> json) =>
      _$MediaNotExistsFromJson(json);
}

int _intFromJson(dynamic json) =>
    json is int ? json : int.parse(json.toString());

List<String?> _stringListFromJson(dynamic json) =>
    json is List ? json.map((e) => e as String?).toList() : [];

List<int?> _intListFromJson(dynamic json) =>
    json is List ? json.map((e) => e as int?).toList() : [];
