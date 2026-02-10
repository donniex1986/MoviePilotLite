import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_resource_models.freezed.dart';
part 'site_resource_models.g.dart';

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

List<String> _stringListFromJson(Object? value) {
  if (value == null || value is! List) return [];
  return value.map((e) => e.toString()).toList();
}

/// 站点资源分类（API: GET /api/v1/site/category/{siteId}）
@freezed
class SiteResourceCategory with _$SiteResourceCategory {
  const factory SiteResourceCategory({
    required int id,
    @JsonKey(fromJson: _stringFromJson) @Default('') String cat,
    @JsonKey(fromJson: _stringFromJson) @Default('') String desc,
  }) = _SiteResourceCategory;

  factory SiteResourceCategory.fromJson(Map<String, dynamic> json) =>
      _$SiteResourceCategoryFromJson(json);
}

/// 站点资源项（API: GET /api/v1/site/resource/{siteId}?cat=&keyword=）
@freezed
class SiteResourceItem with _$SiteResourceItem {
  const factory SiteResourceItem({
    @JsonKey(fromJson: _intFromJson) @Default(0) int site,
    @JsonKey(name: 'site_name', fromJson: _stringFromJson) @Default('') String siteName,
    @JsonKey(name: 'site_cookie', fromJson: _stringNullableFromJson) String? siteCookie,
    @JsonKey(name: 'site_ua', fromJson: _stringNullableFromJson) String? siteUa,
    @JsonKey(name: 'site_proxy', fromJson: _boolFromJson) @Default(false) bool siteProxy,
    @JsonKey(name: 'site_order', fromJson: _intFromJson) @Default(0) int siteOrder,
    @JsonKey(name: 'site_downloader', fromJson: _stringFromJson) @Default('') String siteDownloader,
    @JsonKey(fromJson: _stringFromJson) @Default('') String title,
    @JsonKey(fromJson: _stringFromJson) @Default('') String description,
    @JsonKey(fromJson: _stringNullableFromJson) String? imdbid,
    @JsonKey(fromJson: _stringNullableFromJson) String? enclosure,
    @JsonKey(name: 'page_url', fromJson: _stringNullableFromJson) String? pageUrl,
    @JsonKey(fromJson: _doubleFromJson) @Default(0) double size,
    @JsonKey(fromJson: _intFromJson) @Default(0) int seeders,
    @JsonKey(fromJson: _intFromJson) @Default(0) int peers,
    @JsonKey(fromJson: _intFromJson) @Default(0) int grabs,
    @JsonKey(fromJson: _stringNullableFromJson) String? pubdate,
    @JsonKey(name: 'date_elapsed', fromJson: _stringNullableFromJson) String? dateElapsed,
    @JsonKey(fromJson: _stringNullableFromJson) String? freedate,
    @JsonKey(name: 'uploadvolumefactor', fromJson: _doubleFromJson) @Default(1) double uploadVolumeFactor,
    @JsonKey(name: 'downloadvolumefactor', fromJson: _doubleFromJson) @Default(1) double downloadVolumeFactor,
    @JsonKey(name: 'hit_and_run', fromJson: _boolFromJson) @Default(false) bool hitAndRun,
    @JsonKey(fromJson: _stringListFromJson) @Default([]) List<String> labels,
    @JsonKey(name: 'pri_order', fromJson: _intFromJson) @Default(0) int priOrder,
    @JsonKey(name: 'volume_factor', fromJson: _stringFromJson) @Default('') String volumeFactor,
    @JsonKey(name: 'freedate_diff', fromJson: _stringFromJson) @Default('') String freedateDiff,
  }) = _SiteResourceItem;

  factory SiteResourceItem.fromJson(Map<String, dynamic> json) =>
      _$SiteResourceItemFromJson(json);
}
