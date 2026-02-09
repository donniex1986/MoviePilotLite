import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_organize_models.freezed.dart';
part 'media_organize_models.g.dart';

/// 存储设置项（API: /api/v1/system/setting/Storages）
@freezed
class StorageSetting with _$StorageSetting {
  const factory StorageSetting({
    required String type,
    required String name,
    @Default({}) Map<String, dynamic> config,
  }) = _StorageSetting;

  factory StorageSetting.fromJson(Map<String, dynamic> json) =>
      _$StorageSettingFromJson(json);
}

/// 文件项（src_fileitem / dest_fileitem）
@freezed
class MediaOrganizeFileItem with _$MediaOrganizeFileItem {
  const factory MediaOrganizeFileItem({
    String? path,
    String? storage,
    String? type,
    String? name,
    String? basename,
    String? extension,
    @JsonKey(fromJson: _intFromJson) int? size,
    @JsonKey(name: 'modify_time', fromJson: _doubleFromJson) double? modifyTime,
    @Default([]) List<dynamic> children,
    String? fileid,
    String? parent_fileid,
    String? thumbnail,
    String? pickcode,
    String? drive_id,
    String? url,
  }) = _MediaOrganizeFileItem;

  factory MediaOrganizeFileItem.fromJson(Map<String, dynamic> json) =>
      _$MediaOrganizeFileItemFromJson(json);
}

/// 整理历史项（API: /api/v1/history/transfer）
@freezed
class MediaOrganizeTransferItem with _$MediaOrganizeTransferItem {
  const factory MediaOrganizeTransferItem({
    @JsonKey(fromJson: _intFromJson) int? id,
    String? src,
    String? src_storage,
    MediaOrganizeFileItem? src_fileitem,
    String? dest,
    String? dest_storage,
    MediaOrganizeFileItem? dest_fileitem,
    String? mode,
    String? type,
    String? category,
    String? title,
    String? year,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    String? imdbid,
    @JsonKey(fromJson: _intFromJson) int? tvdbid,
    @JsonKey(fromJson: _intFromJson) int? doubanid,
    String? seasons,
    String? episodes,
    String? image,
    String? downloader,
    String? download_hash,
    @JsonKey(fromJson: _boolFromJson) bool? status,
    String? errmsg,
    String? date,
    @JsonKey(fromJson: _stringListFromJson) @Default([]) List<String> files,
    dynamic episode_group,
  }) = _MediaOrganizeTransferItem;

  factory MediaOrganizeTransferItem.fromJson(Map<String, dynamic> json) =>
      _$MediaOrganizeTransferItemFromJson(json);
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

bool? _boolFromJson(Object? value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is int) return value != 0;
  if (value is String) return value.toLowerCase() == 'true' || value == '1';
  return null;
}

List<String> _stringListFromJson(Object? value) {
  if (value is List) {
    return value.map((e) => e?.toString() ?? '').where((s) => s.isNotEmpty).toList();
  }
  return [];
}
