/// TMDB 单集信息：API GET /api/v1/tmdb/{tmdbid}/{season}
class TmdbEpisode {
  const TmdbEpisode({
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.name,
    this.overview,
    this.runtime,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.crew,
    this.guestStars,
  });

  final String? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? name;
  final String? overview;
  final int? runtime;
  final int? seasonNumber;
  final String? stillPath;
  final double? voteAverage;
  final dynamic crew;
  final dynamic guestStars;

  factory TmdbEpisode.fromJson(Map<String, dynamic> json) {
    return TmdbEpisode(
      airDate: json['air_date'] as String?,
      episodeNumber: _intFromJson(json['episode_number']),
      episodeType: json['episode_type'] as String?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      runtime: _intFromJson(json['runtime']),
      seasonNumber: _intFromJson(json['season_number']),
      stillPath: json['still_path'] as String?,
      voteAverage: _doubleFromJson(json['vote_average']),
      crew: json['crew'],
      guestStars: json['guest_stars'],
    );
  }

  static int? _intFromJson(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is num) return v.toInt();
    if (v is String) return int.tryParse(v);
    return null;
  }

  static double? _doubleFromJson(dynamic v) {
    if (v == null) return null;
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v);
    return null;
  }
}

/// 日历单项：剧集 + 所属订阅信息（用于时间轴展示与按剧集筛选）
class CalendarEpisodeItem {
  const CalendarEpisodeItem({
    required this.episode,
    required this.showName,
    this.showPoster,
    required this.tmdbId,
    required this.seasonNumber,
  });

  final TmdbEpisode episode;
  final String showName;
  final String? showPoster;
  final int tmdbId;
  final int seasonNumber;

  String get airDate => episode.airDate ?? '';
  int get seasonEpisodeKey => tmdbId * 1000 + (seasonNumber % 1000);
}
