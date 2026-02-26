import 'package:moviepilot_mobile/modules/settings/models/settings_enums.dart';

/// 媒体质量枚举（字面量 = 展示用，value = 接口/存储用，稍后由你提供具体映射）
enum MediaQuality {
  all('全部', ''),
  blurayRemux('Remux', 'Remux'),
  bluray('BluRay', 'Blu-?Ray'),
  bluraySource(
    '蓝光原盘',
    'Blu-?Ray.+VC-?1|Blu-?Ray.+AVC|UHD.+blu-?ray.+HEVC|MiniBD',
  ),
  uhd('UHD', 'UHD|UltraHD'),
  webdl('WEB-DL', 'WEB-?DL|WEB-?RIP'),
  hdtv('HDTV', 'HDTV'),
  h265('H.265', '[Hx].?265|HEVC'),
  h264('H.264', '[Hx].?264|AVC');

  const MediaQuality(this.label, this.value);
  final String label;
  final String value;

  static MediaQuality? fromValue(String? v) {
    if (v == null || v.isEmpty) return MediaQuality.all;
    for (final e in MediaQuality.values) {
      if (e.value == v || e.label == v) return e;
    }
    return null;
  }

  static MediaQuality get defaultValue => MediaQuality.all;

  static List<SettingsEnumOption> get selectOptions => MediaQuality.values
      .map((e) => SettingsEnumOption(value: e.value, label: e.label))
      .toList();
}

/// 媒体分辨率枚举（字面量 = 展示用，value = 接口/存储用，稍后由你提供具体映射）
enum MediaResolution {
  all('全部', ''),
  r4k('4k', '4K|2160p|x2160'),
  r1080p('1080p', '1080[pi]|x1080'),
  r720p('720p', '720[pi]|x720');

  const MediaResolution(this.label, this.value);
  final String label;
  final String value;

  static MediaResolution? fromValue(String? v) {
    if (v == null || v.isEmpty) return MediaResolution.all;
    for (final e in MediaResolution.values) {
      if (e.value == v || e.label == v) return e;
    }
    return null;
  }

  static MediaResolution get defaultValue => MediaResolution.r1080p;

  static List<SettingsEnumOption> get selectOptions => MediaResolution.values
      .map((e) => SettingsEnumOption(value: e.value, label: e.label))
      .toList();
}

/// 媒体特效枚举（字面量 = 展示用，value = 接口/存储用，稍后由你提供具体映射）
enum MediaEffect {
  all('全部', ''),
  dolbyVision('杜比视界', 'Dolby[\\s.]+Vision|DOVI|[\\s.]+DV[\\s.]+'),
  dolbyAtmos('杜比全景声', 'Dolby[\\s.]*\\+?Atmos|Atmos'),
  hdr('HDR', '[\\s.]+HDR[\\s.]+|HDR10|HDR10\\+'),
  sdr('SDR', '[\\s.]+SDR[\\s.]+');

  const MediaEffect(this.label, this.value);
  final String label;
  final String value;

  static MediaEffect? fromValue(String? v) {
    if (v == null || v.isEmpty) return MediaEffect.all;
    for (final e in MediaEffect.values) {
      if (e.value == v || e.label == v) return e;
    }
    return null;
  }

  static MediaEffect get defaultValue => MediaEffect.all;

  static List<SettingsEnumOption> get selectOptions => MediaEffect.values
      .map((e) => SettingsEnumOption(value: e.value, label: e.label))
      .toList();
}
