import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloader_stats.freezed.dart';

double _doubleFromJson(Object? value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}

/// 下载器简要信息，对应 GET /api/v1/dashboard/downloader 返回值
@Freezed(toJson: false)
class DownloaderStats with _$DownloaderStats {
  const factory DownloaderStats({
    @Default(0) double downloadSpeed,
    @Default(0) double uploadSpeed,
    @Default(0) double downloadSize,
    @Default(0) double uploadSize,
    @Default(0) double freeSpace,
  }) = _DownloaderStats;

  factory DownloaderStats.fromJson(Map<String, dynamic> json) {
    return DownloaderStats(
      downloadSpeed: _doubleFromJson(json['download_speed']),
      uploadSpeed: _doubleFromJson(json['upload_speed']),
      downloadSize: _doubleFromJson(json['download_size']),
      uploadSize: _doubleFromJson(json['upload_size']),
      freeSpace: _doubleFromJson(json['free_space']),
    );
  }
}
