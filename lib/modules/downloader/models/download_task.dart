/// 下载任务媒体信息
class DownloadTaskMedia {
  const DownloadTaskMedia({
    this.tmdbid,
    this.type,
    this.title,
    this.season,
    this.episode,
    this.image,
  });

  final int? tmdbid;
  final String? type;
  final String? title;
  final String? season;
  final String? episode;
  final String? image;

  factory DownloadTaskMedia.fromJson(Map<String, dynamic> json) {
    return DownloadTaskMedia(
      tmdbid: json['tmdbid'] as int?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      season: json['season'] as String?,
      episode: json['episode'] as String?,
      image: json['image'] as String?,
    );
  }
}

/// 下载任务
class DownloadTask {
  const DownloadTask({
    this.downloader,
    this.hash,
    this.title,
    this.name,
    this.year,
    this.seasonEpisode,
    this.size,
    this.progress,
    this.state,
    this.upspeed,
    this.dlspeed,
    this.media,
    this.userid,
    this.username,
    this.leftTime,
  });

  final String? downloader;
  final String? hash;
  final String? title;
  final String? name;
  final String? year;
  final String? seasonEpisode;
  final double? size;
  final double? progress;
  final String? state;
  final String? upspeed;
  final String? dlspeed;
  final DownloadTaskMedia? media;
  final String? userid;
  final String? username;
  final String? leftTime;

  factory DownloadTask.fromJson(Map<String, dynamic> json) {
    return DownloadTask(
      downloader: json['downloader'] as String?,
      hash: json['hash'] as String?,
      title: json['title'] as String?,
      name: json['name'] as String?,
      year: json['year'] as String?,
      seasonEpisode: json['season_episode'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      progress: (json['progress'] as num?)?.toDouble(),
      state: json['state'] as String?,
      upspeed: json['upspeed'] as String?,
      dlspeed: json['dlspeed'] as String?,
      media: json['media'] != null
          ? DownloadTaskMedia.fromJson(
              json['media'] as Map<String, dynamic>,
            )
          : null,
      userid: json['userid'] as String?,
      username: json['username'] as String?,
      leftTime: json['left_time'] as String?,
    );
  }

  /// 主标题：媒体名 + 季数，如 "豪斯医生 S02"
  String get displayTitle {
    final mediaTitle = media?.title ?? name ?? '';
    final season = media?.season ?? seasonEpisode ?? '';
    if (mediaTitle.isEmpty) return title ?? '';
    if (season.isEmpty) return mediaTitle;
    return '$mediaTitle $season';
  }
}
