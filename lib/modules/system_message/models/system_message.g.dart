// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SystemMessageImpl _$$SystemMessageImplFromJson(Map<String, dynamic> json) =>
    _$SystemMessageImpl(
      id: _intFromJson(json['id']),
      channel: _stringFromJsonNullable(json['channel']),
      source: _stringFromJsonNullable(json['source']),
      mtype: json['mtype'] == null ? '' : _stringFromJson(json['mtype']),
      title: json['title'] == null ? '' : _stringFromJson(json['title']),
      text: json['text'] == null ? '' : _stringFromJson(json['text']),
      image: json['image'] == null ? '' : _stringFromJson(json['image']),
      link: _stringFromJsonNullable(json['link']),
      userid: _stringFromJsonNullable(json['userid']),
      regTime: const _DateTimeConverter().fromJson(json['reg_time']),
      action: _intFromJsonNullable(json['action']),
      note: json['note'] == null
          ? const <SystemMessageNote>[]
          : _noteFromJson(json['note']),
    );

Map<String, dynamic> _$$SystemMessageImplToJson(_$SystemMessageImpl instance) =>
    <String, dynamic>{
      'id': _intToJson(instance.id),
      'channel': instance.channel,
      'source': instance.source,
      'mtype': instance.mtype,
      'title': instance.title,
      'text': instance.text,
      'image': instance.image,
      'link': instance.link,
      'userid': instance.userid,
      'reg_time': const _DateTimeConverter().toJson(instance.regTime),
      'action': _intToJson(instance.action),
      'note': _noteToJson(instance.note),
    };

_$SystemMessageNoteImpl _$$SystemMessageNoteImplFromJson(
  Map<String, dynamic> json,
) => _$SystemMessageNoteImpl(
  site: _intFromJsonNullable(json['site']),
  siteName: _stringFromJsonNullable(json['site_name']),
  siteCookie: _stringFromJsonNullable(json['site_cookie']),
  siteUa: _stringFromJsonNullable(json['site_ua']),
  siteProxy: _intFromJsonNullable(json['site_proxy']),
  siteOrder: _intFromJsonNullable(json['site_order']),
  siteDownloader: _stringFromJsonNullable(json['site_downloader']),
  title: _stringFromJsonNullable(json['title']),
  description: _stringFromJsonNullable(json['description']),
  imdbid: _stringFromJsonNullable(json['imdbid']),
  enclosure: _stringFromJsonNullable(json['enclosure']),
  pageUrl: _stringFromJsonNullable(json['page_url']),
  size: _intFromJsonNullable(json['size']),
  seeders: _intFromJsonNullable(json['seeders']),
  peers: _intFromJsonNullable(json['peers']),
  grabs: _intFromJsonNullable(json['grabs']),
  pubdate: _stringFromJsonNullable(json['pubdate']),
  dateElapsed: _stringFromJsonNullable(json['date_elapsed']),
  freedate: _stringFromJsonNullable(json['freedate']),
  uploadVolumeFactor: _doubleFromJson(json['uploadvolumefactor']),
  downloadVolumeFactor: _doubleFromJson(json['downloadvolumefactor']),
  hitAndRun: _boolFromJson(json['hit_and_run']),
  labels: json['labels'] == null
      ? const <String>[]
      : _stringListFromJson(json['labels']),
  priOrder: _intFromJsonNullable(json['pri_order']),
  category: _stringFromJsonNullable(json['category']),
  volumeFactor: _stringFromJsonNullable(json['volume_factor']),
  freedateDiff: _stringFromJsonNullable(json['freedate_diff']),
);

Map<String, dynamic> _$$SystemMessageNoteImplToJson(
  _$SystemMessageNoteImpl instance,
) => <String, dynamic>{
  'site': _intToJson(instance.site),
  'site_name': instance.siteName,
  'site_cookie': instance.siteCookie,
  'site_ua': instance.siteUa,
  'site_proxy': _intToJson(instance.siteProxy),
  'site_order': _intToJson(instance.siteOrder),
  'site_downloader': instance.siteDownloader,
  'title': instance.title,
  'description': instance.description,
  'imdbid': instance.imdbid,
  'enclosure': instance.enclosure,
  'page_url': instance.pageUrl,
  'size': _intToJson(instance.size),
  'seeders': _intToJson(instance.seeders),
  'peers': _intToJson(instance.peers),
  'grabs': _intToJson(instance.grabs),
  'pubdate': instance.pubdate,
  'date_elapsed': instance.dateElapsed,
  'freedate': instance.freedate,
  'uploadvolumefactor': _doubleToJson(instance.uploadVolumeFactor),
  'downloadvolumefactor': _doubleToJson(instance.downloadVolumeFactor),
  'hit_and_run': instance.hitAndRun,
  'labels': instance.labels,
  'pri_order': _intToJson(instance.priOrder),
  'category': instance.category,
  'volume_factor': instance.volumeFactor,
  'freedate_diff': instance.freedateDiff,
};
