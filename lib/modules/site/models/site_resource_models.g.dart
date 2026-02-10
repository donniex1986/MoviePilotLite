// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_resource_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteResourceCategoryImpl _$$SiteResourceCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$SiteResourceCategoryImpl(
  id: (json['id'] as num).toInt(),
  cat: json['cat'] == null ? '' : _stringFromJson(json['cat']),
  desc: json['desc'] == null ? '' : _stringFromJson(json['desc']),
);

Map<String, dynamic> _$$SiteResourceCategoryImplToJson(
  _$SiteResourceCategoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'cat': instance.cat,
  'desc': instance.desc,
};

_$SiteResourceItemImpl _$$SiteResourceItemImplFromJson(
  Map<String, dynamic> json,
) => _$SiteResourceItemImpl(
  site: json['site'] == null ? 0 : _intFromJson(json['site']),
  siteName: json['site_name'] == null ? '' : _stringFromJson(json['site_name']),
  siteCookie: _stringNullableFromJson(json['site_cookie']),
  siteUa: _stringNullableFromJson(json['site_ua']),
  siteProxy: json['site_proxy'] == null
      ? false
      : _boolFromJson(json['site_proxy']),
  siteOrder: json['site_order'] == null ? 0 : _intFromJson(json['site_order']),
  siteDownloader: json['site_downloader'] == null
      ? ''
      : _stringFromJson(json['site_downloader']),
  title: json['title'] == null ? '' : _stringFromJson(json['title']),
  description: json['description'] == null
      ? ''
      : _stringFromJson(json['description']),
  imdbid: _stringNullableFromJson(json['imdbid']),
  enclosure: _stringNullableFromJson(json['enclosure']),
  pageUrl: _stringNullableFromJson(json['page_url']),
  size: json['size'] == null ? 0 : _doubleFromJson(json['size']),
  seeders: json['seeders'] == null ? 0 : _intFromJson(json['seeders']),
  peers: json['peers'] == null ? 0 : _intFromJson(json['peers']),
  grabs: json['grabs'] == null ? 0 : _intFromJson(json['grabs']),
  pubdate: _stringNullableFromJson(json['pubdate']),
  dateElapsed: _stringNullableFromJson(json['date_elapsed']),
  freedate: _stringNullableFromJson(json['freedate']),
  uploadVolumeFactor: json['uploadvolumefactor'] == null
      ? 1
      : _doubleFromJson(json['uploadvolumefactor']),
  downloadVolumeFactor: json['downloadvolumefactor'] == null
      ? 1
      : _doubleFromJson(json['downloadvolumefactor']),
  hitAndRun: json['hit_and_run'] == null
      ? false
      : _boolFromJson(json['hit_and_run']),
  labels: json['labels'] == null
      ? const []
      : _stringListFromJson(json['labels']),
  priOrder: json['pri_order'] == null ? 0 : _intFromJson(json['pri_order']),
  volumeFactor: json['volume_factor'] == null
      ? ''
      : _stringFromJson(json['volume_factor']),
  freedateDiff: json['freedate_diff'] == null
      ? ''
      : _stringFromJson(json['freedate_diff']),
);

Map<String, dynamic> _$$SiteResourceItemImplToJson(
  _$SiteResourceItemImpl instance,
) => <String, dynamic>{
  'site': instance.site,
  'site_name': instance.siteName,
  'site_cookie': instance.siteCookie,
  'site_ua': instance.siteUa,
  'site_proxy': instance.siteProxy,
  'site_order': instance.siteOrder,
  'site_downloader': instance.siteDownloader,
  'title': instance.title,
  'description': instance.description,
  'imdbid': instance.imdbid,
  'enclosure': instance.enclosure,
  'page_url': instance.pageUrl,
  'size': instance.size,
  'seeders': instance.seeders,
  'peers': instance.peers,
  'grabs': instance.grabs,
  'pubdate': instance.pubdate,
  'date_elapsed': instance.dateElapsed,
  'freedate': instance.freedate,
  'uploadvolumefactor': instance.uploadVolumeFactor,
  'downloadvolumefactor': instance.downloadVolumeFactor,
  'hit_and_run': instance.hitAndRun,
  'labels': instance.labels,
  'pri_order': instance.priOrder,
  'volume_factor': instance.volumeFactor,
  'freedate_diff': instance.freedateDiff,
};
