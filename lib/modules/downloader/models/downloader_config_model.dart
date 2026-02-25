import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloader_config_model.freezed.dart';
part 'downloader_config_model.g.dart';

// ---------------------------------------------------------------------------
// 辅助 JSON 转换
// ---------------------------------------------------------------------------

bool _boolFromJson(Object? value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is int) return value != 0;
  if (value is String) return value.toLowerCase() == 'true' || value == '1';
  return false;
}

String _stringFromJson(Object? value) {
  if (value == null) return '';
  return value.toString();
}

List<PathMapping> _pathMappingsFromJson(Object? value) {
  if (value == null || value is! List) return [];
  return value
      .whereType<Map<String, dynamic>>()
      .map((e) => PathMapping.fromJson(e))
      .toList();
}

/// 路径映射项
@freezed
class PathMapping with _$PathMapping {
  const factory PathMapping({
    @JsonKey(name: 'from', fromJson: _stringFromJson) @Default('') String fromPath,
    @JsonKey(name: 'to', fromJson: _stringFromJson) @Default('') String toPath,
    @JsonKey(name: 'storage', fromJson: _stringFromJson) @Default('local') String storage,
  }) = _PathMapping;

  factory PathMapping.fromJson(Map<String, dynamic> json) =>
      _$PathMappingFromJson(json);
}

/// 下载器配置
/// API: /api/v1/system/setting/Downloads
@freezed
class DownloaderConfig with _$DownloaderConfig {
  const factory DownloaderConfig({
    @JsonKey(fromJson: _stringFromJson) @Default('') String name,
    @JsonKey(fromJson: _stringFromJson) @Default('') String type,
    @JsonKey(fromJson: _boolFromJson) @Default(true) bool enabled,
    @JsonKey(name: 'default', fromJson: _boolFromJson) @Default(false) bool isDefault,
    @JsonKey(name: 'host', fromJson: _stringFromJson) @Default('') String host,
    @JsonKey(name: 'username', fromJson: _stringFromJson) @Default('') String username,
    @JsonKey(name: 'password', fromJson: _stringFromJson) @Default('') String password,
    @JsonKey(name: 'auto_category', fromJson: _boolFromJson) @Default(false) bool autoCategory,
    @JsonKey(name: 'sequential', fromJson: _boolFromJson) @Default(false) bool sequential,
    @JsonKey(name: 'force_resume', fromJson: _boolFromJson) @Default(false) bool forceResume,
    @JsonKey(name: 'first_last_priority', fromJson: _boolFromJson) @Default(false) bool firstLastPriority,
    @JsonKey(name: 'path_mappings', fromJson: _pathMappingsFromJson)
    @Default([]) List<PathMapping> pathMappings,
  }) = _DownloaderConfig;

  factory DownloaderConfig.fromJson(Map<String, dynamic> json) =>
      _$DownloaderConfigFromJson(json);
}

/// 下载器配置 API 响应
@freezed
class DownloaderConfigResponse with _$DownloaderConfigResponse {
  const factory DownloaderConfigResponse({
    @Default(false) bool success,
    String? message,
    DownloaderConfigData? data,
  }) = _DownloaderConfigResponse;

  factory DownloaderConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$DownloaderConfigResponseFromJson(json);
}

List<DownloaderConfig> _configListFromJson(Object? value) {
  if (value == null || value is! List) return [];
  return value
      .whereType<Map<String, dynamic>>()
      .map((e) => DownloaderConfig.fromJson(e))
      .toList();
}

@freezed
class DownloaderConfigData with _$DownloaderConfigData {
  const factory DownloaderConfigData({
    @JsonKey(fromJson: _configListFromJson) @Default([]) List<DownloaderConfig> value,
  }) = _DownloaderConfigData;

  factory DownloaderConfigData.fromJson(Map<String, dynamic> json) =>
      _$DownloaderConfigDataFromJson(json);
}
