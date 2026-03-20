import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_detail.freezed.dart';
part 'person_detail.g.dart';

int? _intFromJson(Object? value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

@freezed
class PersonDetail with _$PersonDetail {
  const factory PersonDetail({
    String? source,
    @JsonKey(fromJson: _intFromJson) int? id,
    @JsonKey(fromJson: _intFromJson) int? type,
    String? name,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(fromJson: _intFromJson) int? gender,
    @JsonKey(name: 'also_known_as') List<String>? alsoKnownAs,
    String? biography,
    String? avatar,
  }) = _PersonDetail;

  factory PersonDetail.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailFromJson(json);
}

