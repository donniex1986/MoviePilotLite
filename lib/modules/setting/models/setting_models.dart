import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_models.freezed.dart';
part 'setting_models.g.dart';

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

/// 目录设置响应
@freezed
class DirectorySettingResponse with _$DirectorySettingResponse {
  const factory DirectorySettingResponse({
    @Default(false) bool success,
    String? message,
    DirectorySettingData? data,
  }) = _DirectorySettingResponse;

  factory DirectorySettingResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectorySettingResponseFromJson(json);
}

/// 目录设置数据
@freezed
class DirectorySettingData with _$DirectorySettingData {
  const factory DirectorySettingData({
    @Default([]) @JsonKey(fromJson: _directoryListFromJson) List<DirectorySetting> value,
  }) = _DirectorySettingData;

  factory DirectorySettingData.fromJson(Map<String, dynamic> json) =>
      _$DirectorySettingDataFromJson(json);
}

List<DirectorySetting> _directoryListFromJson(Object? value) {
  if (value == null || value is! List) return [];
  return value
      .whereType<Map<String, dynamic>>()
      .map((e) => DirectorySetting.fromJson(e))
      .toList();
}

/// 目录设置项
@freezed
class DirectorySetting with _$DirectorySetting {
  const factory DirectorySetting({
    @JsonKey(fromJson: _stringFromJson) @Default('') String name,
    @JsonKey(fromJson: _stringFromJson) @Default('') String storage,
    @JsonKey(name: 'download_path', fromJson: _stringFromJson) @Default('') String downloadPath,
    @JsonKey(fromJson: _intFromJson) @Default(0) int priority,
    @JsonKey(name: 'monitor_type', fromJson: _stringFromJson) @Default('') String monitorType,
    @JsonKey(name: 'media_type', fromJson: _stringFromJson) @Default('') String mediaType,
    @JsonKey(name: 'media_category', fromJson: _stringFromJson) @Default('') String mediaCategory,
    @JsonKey(name: 'transfer_type', fromJson: _stringFromJson) @Default('') String transferType,
    @JsonKey(name: 'library_path', fromJson: _stringFromJson) @Default('') String libraryPath,
    @JsonKey(name: 'library_type_folder', fromJson: _boolFromJson) @Default(false) bool libraryTypeFolder,
    @JsonKey(fromJson: _boolFromJson) @Default(false) bool renaming,
    @JsonKey(fromJson: _boolFromJson) @Default(false) bool scraping,
    @JsonKey(fromJson: _boolFromJson) @Default(false) bool notify,
    @JsonKey(name: 'overwrite_mode', fromJson: _stringFromJson) @Default('') String overwriteMode,
    @JsonKey(name: 'download_type_folder', fromJson: _boolFromJson) @Default(false) bool downloadTypeFolder,
    @JsonKey(name: 'library_storage', fromJson: _stringFromJson) @Default('') String libraryStorage,
    @JsonKey(name: 'library_category_folder', fromJson: _boolFromJson) @Default(false) bool libraryCategoryFolder,
    @JsonKey(name: 'download_category_folder', fromJson: _boolFromJson) @Default(false) bool downloadCategoryFolder,
  }) = _DirectorySetting;

  factory DirectorySetting.fromJson(Map<String, dynamic> json) =>
      _$DirectorySettingFromJson(json);
}

/// 下载客户端
@freezed
class DownloadClient with _$DownloadClient {
  const factory DownloadClient({
    @JsonKey(fromJson: _stringFromJson) @Default('') String name,
    @JsonKey(fromJson: _stringFromJson) @Default('') String type,
  }) = _DownloadClient;

  factory DownloadClient.fromJson(Map<String, dynamic> json) =>
      _$DownloadClientFromJson(json);
}
