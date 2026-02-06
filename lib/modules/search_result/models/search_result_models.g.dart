// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultItemImpl _$$SearchResultItemImplFromJson(
  Map<String, dynamic> json,
) => _$SearchResultItemImpl(
  meta_info: json['meta_info'] == null
      ? null
      : SearchMetaInfo.fromJson(json['meta_info'] as Map<String, dynamic>),
  media_info: json['media_info'] as Map<String, dynamic>?,
  torrent_info: json['torrent_info'] == null
      ? null
      : SearchTorrentInfo.fromJson(
          json['torrent_info'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$SearchResultItemImplToJson(
  _$SearchResultItemImpl instance,
) => <String, dynamic>{
  'meta_info': instance.meta_info,
  'media_info': instance.media_info,
  'torrent_info': instance.torrent_info,
};

_$SearchMetaInfoImpl _$$SearchMetaInfoImplFromJson(Map<String, dynamic> json) =>
    _$SearchMetaInfoImpl(
      isfile: json['isfile'] as bool?,
      org_string: json['org_string'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      cn_name: json['cn_name'] as String?,
      en_name: json['en_name'] as String?,
      year: json['year'] as String?,
      total_season: _intFromJson(json['total_season']),
      begin_season: _intFromJson(json['begin_season']),
      end_season: _intFromJson(json['end_season']),
      total_episode: _intFromJson(json['total_episode']),
      begin_episode: _intFromJson(json['begin_episode']),
      end_episode: _intFromJson(json['end_episode']),
      season_episode: json['season_episode'] as String?,
      episode_list: _intListFromJson(json['episode_list']),
      part: json['part'] as String?,
      resource_type: json['resource_type'] as String?,
      resource_effect: json['resource_effect'] as String?,
      resource_pix: json['resource_pix'] as String?,
      resource_team: json['resource_team'] as String?,
      video_encode: json['video_encode'] as String?,
      audio_encode: json['audio_encode'] as String?,
      edition: json['edition'] as String?,
      web_source: json['web_source'] as String?,
      apply_words: _stringListFromJson(json['apply_words']),
    );

Map<String, dynamic> _$$SearchMetaInfoImplToJson(
  _$SearchMetaInfoImpl instance,
) => <String, dynamic>{
  'isfile': instance.isfile,
  'org_string': instance.org_string,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'type': instance.type,
  'name': instance.name,
  'cn_name': instance.cn_name,
  'en_name': instance.en_name,
  'year': instance.year,
  'total_season': instance.total_season,
  'begin_season': instance.begin_season,
  'end_season': instance.end_season,
  'total_episode': instance.total_episode,
  'begin_episode': instance.begin_episode,
  'end_episode': instance.end_episode,
  'season_episode': instance.season_episode,
  'episode_list': _intListToJson(instance.episode_list),
  'part': instance.part,
  'resource_type': instance.resource_type,
  'resource_effect': instance.resource_effect,
  'resource_pix': instance.resource_pix,
  'resource_team': instance.resource_team,
  'video_encode': instance.video_encode,
  'audio_encode': instance.audio_encode,
  'edition': instance.edition,
  'web_source': instance.web_source,
  'apply_words': _stringListToJson(instance.apply_words),
};

_$SearchTorrentInfoImpl _$$SearchTorrentInfoImplFromJson(
  Map<String, dynamic> json,
) => _$SearchTorrentInfoImpl(
  site: _intFromJson(json['site']),
  site_name: json['site_name'] as String?,
  site_cookie: json['site_cookie'] as String?,
  site_ua: json['site_ua'] as String?,
  site_proxy: _boolFromJson(json['site_proxy']),
  site_order: _intFromJson(json['site_order']),
  site_downloader: json['site_downloader'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  imdbid: json['imdbid'] as String?,
  enclosure: json['enclosure'] as String?,
  page_url: json['page_url'] as String?,
  size: _doubleFromJson(json['size']),
  seeders: _intFromJson(json['seeders']),
  peers: _intFromJson(json['peers']),
  grabs: _intFromJson(json['grabs']),
  pubdate: json['pubdate'] as String?,
  date_elapsed: json['date_elapsed'] as String?,
  freedate: json['freedate'] as String?,
  uploadvolumefactor: _doubleFromJson(json['uploadvolumefactor']),
  downloadvolumefactor: _doubleFromJson(json['downloadvolumefactor']),
  hit_and_run: _boolFromJson(json['hit_and_run']),
  labels: _stringListFromJson(json['labels']),
  pri_order: _intFromJson(json['pri_order']),
  volume_factor: json['volume_factor'] as String?,
  freedate_diff: json['freedate_diff'] as String?,
);

Map<String, dynamic> _$$SearchTorrentInfoImplToJson(
  _$SearchTorrentInfoImpl instance,
) => <String, dynamic>{
  'site': instance.site,
  'site_name': instance.site_name,
  'site_cookie': instance.site_cookie,
  'site_ua': instance.site_ua,
  'site_proxy': instance.site_proxy,
  'site_order': instance.site_order,
  'site_downloader': instance.site_downloader,
  'title': instance.title,
  'description': instance.description,
  'imdbid': instance.imdbid,
  'enclosure': instance.enclosure,
  'page_url': instance.page_url,
  'size': instance.size,
  'seeders': instance.seeders,
  'peers': instance.peers,
  'grabs': instance.grabs,
  'pubdate': instance.pubdate,
  'date_elapsed': instance.date_elapsed,
  'freedate': instance.freedate,
  'uploadvolumefactor': instance.uploadvolumefactor,
  'downloadvolumefactor': instance.downloadvolumefactor,
  'hit_and_run': instance.hit_and_run,
  'labels': _stringListToJson(instance.labels),
  'pri_order': instance.pri_order,
  'volume_factor': instance.volume_factor,
  'freedate_diff': instance.freedate_diff,
};
