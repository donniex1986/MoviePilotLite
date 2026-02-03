import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_message.freezed.dart';
part 'system_message.g.dart';

class _DateTimeConverter implements JsonConverter<DateTime, Object?> {
  const _DateTimeConverter();

  @override
  DateTime fromJson(Object? json) {
    if (json == null) return DateTime.now();
    if (json is int) {
      if (json > 1000000000000) {
        return DateTime.fromMillisecondsSinceEpoch(json);
      }
      return DateTime.fromMillisecondsSinceEpoch(json * 1000);
    }
    if (json is String) {
      return DateTime.parse(json.replaceFirst(' ', 'T'));
    }
    return DateTime.now();
  }

  @override
  Object toJson(DateTime object) => object.toIso8601String();
}

String _stringFromJson(Object? json) {
  if (json == null) return '';
  return json.toString();
}

String? _stringFromJsonNullable(Object? json) {
  if (json == null) return null;
  final value = json.toString();
  return value.isEmpty ? null : value;
}

int _intFromJson(Object? json) {
  if (json == null) return 0;
  if (json is num) return json.toInt();
  if (json is String) return int.tryParse(json) ?? 0;
  return 0;
}

int? _intFromJsonNullable(Object? json) {
  if (json == null) return null;
  if (json is num) return json.toInt();
  if (json is String) return int.tryParse(json);
  return null;
}

Object? _intToJson(int? value) => value;

double? _doubleFromJson(Object? json) {
  if (json == null) return null;
  if (json is num) return json.toDouble();
  if (json is String) return double.tryParse(json);
  return null;
}

Object? _doubleToJson(double? value) => value;

bool? _boolFromJson(Object? json) {
  if (json == null) return null;
  if (json is bool) return json;
  if (json is num) return json != 0;
  if (json is String) {
    final value = json.toLowerCase();
    if (value == 'true' || value == '1') return true;
    if (value == 'false' || value == '0') return false;
  }
  return null;
}

List<String> _stringListFromJson(Object? json) {
  if (json is List) {
    return json.map((item) => item.toString()).toList();
  }
  return const <String>[];
}

List<SystemMessageNote> _noteFromJson(Object? json) {
  if (json is List) {
    return json
        .whereType<Map>()
        .map((item) => SystemMessageNote.fromJson(
              Map<String, dynamic>.from(item),
            ))
        .toList();
  }
  if (json is Map) {
    if (json.isEmpty) return <SystemMessageNote>[];
    return [SystemMessageNote.fromJson(Map<String, dynamic>.from(json))];
  }
  return <SystemMessageNote>[];
}

Object? _noteToJson(List<SystemMessageNote> value) =>
    value.map((item) => item.toJson()).toList();

@freezed
class SystemMessage with _$SystemMessage {
  const factory SystemMessage({
    @JsonKey(fromJson: _intFromJson, toJson: _intToJson) required int id,
    @JsonKey(fromJson: _stringFromJsonNullable) String? channel,
    @JsonKey(fromJson: _stringFromJsonNullable) String? source,
    @JsonKey(fromJson: _stringFromJson) @Default('') String mtype,
    @JsonKey(fromJson: _stringFromJson) @Default('') String title,
    @JsonKey(fromJson: _stringFromJson) @Default('') String text,
    @JsonKey(fromJson: _stringFromJson) @Default('') String image,
    @JsonKey(fromJson: _stringFromJsonNullable) String? link,
    @JsonKey(fromJson: _stringFromJsonNullable) String? userid,
    @_DateTimeConverter() @JsonKey(name: 'reg_time') required DateTime regTime,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? action,
    @JsonKey(fromJson: _noteFromJson, toJson: _noteToJson)
    @Default(<SystemMessageNote>[])
    List<SystemMessageNote> note,
  }) = _SystemMessage;

  factory SystemMessage.fromJson(Map<String, dynamic> json) =>
      _$SystemMessageFromJson(json);
}

@freezed
class SystemMessageNote with _$SystemMessageNote {
  const factory SystemMessageNote({
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? site,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_name')
    String? siteName,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_cookie')
    String? siteCookie,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_ua')
    String? siteUa,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson, name: 'site_proxy')
    int? siteProxy,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson, name: 'site_order')
    int? siteOrder,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_downloader')
    String? siteDownloader,
    @JsonKey(fromJson: _stringFromJsonNullable) String? title,
    @JsonKey(fromJson: _stringFromJsonNullable) String? description,
    @JsonKey(fromJson: _stringFromJsonNullable) String? imdbid,
    @JsonKey(fromJson: _stringFromJsonNullable) String? enclosure,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'page_url')
    String? pageUrl,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? size,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? seeders,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? peers,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? grabs,
    @JsonKey(fromJson: _stringFromJsonNullable) String? pubdate,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'date_elapsed')
    String? dateElapsed,
    @JsonKey(fromJson: _stringFromJsonNullable) String? freedate,
    @JsonKey(fromJson: _doubleFromJson, toJson: _doubleToJson, name: 'uploadvolumefactor')
    double? uploadVolumeFactor,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'downloadvolumefactor',
    )
    double? downloadVolumeFactor,
    @JsonKey(fromJson: _boolFromJson, name: 'hit_and_run') bool? hitAndRun,
    @JsonKey(fromJson: _stringListFromJson)
    @Default(<String>[])
    List<String> labels,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson, name: 'pri_order')
    int? priOrder,
    @JsonKey(fromJson: _stringFromJsonNullable) String? category,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'volume_factor')
    String? volumeFactor,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'freedate_diff')
    String? freedateDiff,
  }) = _SystemMessageNote;

  factory SystemMessageNote.fromJson(Map<String, dynamic> json) =>
      _$SystemMessageNoteFromJson(json);
}
