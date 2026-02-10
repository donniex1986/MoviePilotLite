import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_models.freezed.dart';
part 'site_models.g.dart';

// ---------------------------------------------------------------------------
// 辅助 JSON 转换
// ---------------------------------------------------------------------------

int _intFromJson(Object? value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

double _doubleFromJson(Object? value) {
  if (value == null) return 0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}

String _stringFromJson(Object? value) {
  if (value == null) return '';
  return value.toString();
}

String? _stringNullableFromJson(Object? value) {
  if (value == null) return null;
  final s = value.toString();
  return s.isEmpty ? null : s;
}

bool _boolFromJson(Object? value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is int) return value != 0;
  if (value is String) return value.toLowerCase() == 'true' || value == '1';
  return false;
}

List<List<int>> _seedingInfoFromJson(Object? value) {
  if (value == null || value is! List) return [];
  return value.map((e) {
    if (e is! List) return <int>[];
    return e.map((x) => (x is num) ? x.toInt() : int.tryParse(x.toString()) ?? 0).toList();
  }).toList();
}

/// 站点信息（API: GET /api/v1/site/）
@freezed
class SiteModel with _$SiteModel {
  const factory SiteModel({
    required int id,
    required String name,
    required String domain,
    required String url,
    @Default(0) int pri,
    String? rss,
    String? cookie,
    String? ua,
    String? apikey,
    String? token,
    @JsonKey(fromJson: _intFromJson) @Default(0) int proxy,
    String? filter,
    @JsonKey(fromJson: _intFromJson) @Default(0) int render,
    @JsonKey(fromJson: _intFromJson) @Default(0) int public,
    String? note,
    @JsonKey(fromJson: _intFromJson) @Default(15) int timeout,
    @JsonKey(name: 'limit_interval', fromJson: _intFromJson) @Default(0) int limitInterval,
    @JsonKey(name: 'limit_count', fromJson: _intFromJson) @Default(0) int limitCount,
    @JsonKey(name: 'limit_seconds', fromJson: _intFromJson) @Default(0) int limitSeconds,
    @JsonKey(name: 'is_active', fromJson: _boolFromJson) @Default(true) bool isActive,
    @JsonKey(fromJson: _stringFromJson) @Default('') String downloader,
  }) = _SiteModel;

  factory SiteModel.fromJson(Map<String, dynamic> json) =>
      _$SiteModelFromJson(json);
}

/// 站点图标接口响应（API: GET /api/v1/site/icon/{id}）
@freezed
class SiteIconResponse with _$SiteIconResponse {
  const factory SiteIconResponse({
    @Default(true) bool success,
    String? message,
    SiteIconData? data,
  }) = _SiteIconResponse;

  factory SiteIconResponse.fromJson(Map<String, dynamic> json) =>
      _$SiteIconResponseFromJson(json);
}

@freezed
class SiteIconData with _$SiteIconData {
  const factory SiteIconData({
    @JsonKey(fromJson: _stringNullableFromJson) String? icon,
  }) = _SiteIconData;

  factory SiteIconData.fromJson(Map<String, dynamic> json) =>
      _$SiteIconDataFromJson(json);
}

/// 站点用户数据（API: GET /api/v1/site/userdata/latest）
@freezed
class SiteUserDataModel with _$SiteUserDataModel {
  const factory SiteUserDataModel({
    @JsonKey(fromJson: _stringFromJson) @Default('') String domain,
    @JsonKey(name: 'username', fromJson: _stringFromJson) @Default('') String username,
    @JsonKey(name: 'userid', fromJson: _stringFromJson) @Default('') String userid,
    @JsonKey(name: 'user_level', fromJson: _stringFromJson) @Default('') String userLevel,
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson) String? joinAt,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double bonus,
    @JsonKey(fromJson: _intFromJson) @Default(0) int upload,
    @JsonKey(fromJson: _intFromJson) @Default(0) int download,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double ratio,
    @JsonKey(fromJson: _intFromJson) @Default(0) int seeding,
    @JsonKey(fromJson: _intFromJson) @Default(0) int leeching,
    @JsonKey(name: 'seeding_size', fromJson: _intFromJson) @Default(0) int seedingSize,
    @JsonKey(name: 'leeching_size', fromJson: _intFromJson) @Default(0) int leechingSize,
    @JsonKey(name: 'seeding_info', fromJson: _seedingInfoFromJson) @Default([]) List<List<int>> seedingInfo,
    @JsonKey(name: 'message_unread', fromJson: _intFromJson) @Default(0) int messageUnread,
    @JsonKey(name: 'message_unread_contents') @Default([]) List<dynamic> messageUnreadContents,
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) @Default('') String errMsg,
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson) @Default('') String updatedDay,
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson) @Default('') String updatedTime,
  }) = _SiteUserDataModel;

  factory SiteUserDataModel.fromJson(Map<String, dynamic> json) =>
      _$SiteUserDataModelFromJson(json);
}

/// 合并后的站点展示项（站点信息 + 图标 + 用户数据），按 pri 排序后展示
@Freezed(fromJson: false, toJson: false)
class SiteItem with _$SiteItem {
  const factory SiteItem({
    required SiteModel site,
    String? iconBase64,
    @JsonKey(includeFromJson: false, includeToJson: false) List<int>? iconBytes,
    SiteUserDataModel? userData,
  }) = _SiteItem;
}

/// 站点用户数据历史接口响应（API: GET /api/v1/site/userdata/{siteId}）
@freezed
class SiteUserDataHistoryResponse with _$SiteUserDataHistoryResponse {
  const factory SiteUserDataHistoryResponse({
    @Default(true) bool success,
    String? message,
    @Default([]) List<SiteUserDataHistoryItem> data,
  }) = _SiteUserDataHistoryResponse;

  factory SiteUserDataHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SiteUserDataHistoryResponseFromJson(json);
}

/// 单条用户数据历史记录（用于图表等）
@freezed
class SiteUserDataHistoryItem with _$SiteUserDataHistoryItem {
  const factory SiteUserDataHistoryItem({
    required int id,
    @JsonKey(fromJson: _stringFromJson) @Default('') String domain,
    @JsonKey(fromJson: _stringFromJson) @Default('') String name,
    @JsonKey(name: 'username', fromJson: _stringFromJson) @Default('') String username,
    @JsonKey(name: 'userid', fromJson: _stringFromJson) @Default('') String userid,
    @JsonKey(name: 'user_level', fromJson: _stringFromJson) @Default('') String userLevel,
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson) String? joinAt,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double bonus,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double upload,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double download,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double ratio,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double seeding,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double leeching,
    @JsonKey(name: 'seeding_size', fromJson: _doubleFromJson) @Default(0) double seedingSize,
    @JsonKey(name: 'leeching_size', fromJson: _doubleFromJson) @Default(0) double leechingSize,
    @JsonKey(name: 'seeding_info') @Default([]) List<dynamic> seedingInfo,
    @JsonKey(name: 'message_unread', fromJson: _intFromJson) @Default(0) int messageUnread,
    @JsonKey(name: 'message_unread_contents') @Default([]) List<dynamic> messageUnreadContents,
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) @Default('') String errMsg,
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson) @Default('') String updatedDay,
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson) @Default('') String updatedTime,
  }) = _SiteUserDataHistoryItem;

  factory SiteUserDataHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$SiteUserDataHistoryItemFromJson(json);
}
