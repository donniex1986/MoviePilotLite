// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_organize_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageSettingImpl _$$StorageSettingImplFromJson(Map<String, dynamic> json) =>
    _$StorageSettingImpl(
      type: json['type'] as String,
      name: json['name'] as String,
      config: json['config'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$StorageSettingImplToJson(
  _$StorageSettingImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'name': instance.name,
  'config': instance.config,
};

_$MediaOrganizeFileItemImpl _$$MediaOrganizeFileItemImplFromJson(
  Map<String, dynamic> json,
) => _$MediaOrganizeFileItemImpl(
  path: json['path'] as String?,
  storage: json['storage'] as String?,
  type: json['type'] as String?,
  name: json['name'] as String?,
  basename: json['basename'] as String?,
  extension: json['extension'] as String?,
  size: _intFromJson(json['size']),
  modifyTime: _doubleFromJson(json['modify_time']),
  children: json['children'] as List<dynamic>? ?? const [],
  fileid: json['fileid'] as String?,
  parent_fileid: json['parent_fileid'] as String?,
  thumbnail: json['thumbnail'] as String?,
  pickcode: json['pickcode'] as String?,
  drive_id: json['drive_id'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$$MediaOrganizeFileItemImplToJson(
  _$MediaOrganizeFileItemImpl instance,
) => <String, dynamic>{
  'path': instance.path,
  'storage': instance.storage,
  'type': instance.type,
  'name': instance.name,
  'basename': instance.basename,
  'extension': instance.extension,
  'size': instance.size,
  'modify_time': instance.modifyTime,
  'children': instance.children,
  'fileid': instance.fileid,
  'parent_fileid': instance.parent_fileid,
  'thumbnail': instance.thumbnail,
  'pickcode': instance.pickcode,
  'drive_id': instance.drive_id,
  'url': instance.url,
};

_$MediaOrganizeTransferItemImpl _$$MediaOrganizeTransferItemImplFromJson(
  Map<String, dynamic> json,
) => _$MediaOrganizeTransferItemImpl(
  id: _intFromJson(json['id']),
  src: json['src'] as String?,
  src_storage: json['src_storage'] as String?,
  src_fileitem: json['src_fileitem'] == null
      ? null
      : MediaOrganizeFileItem.fromJson(
          json['src_fileitem'] as Map<String, dynamic>,
        ),
  dest: json['dest'] as String?,
  dest_storage: json['dest_storage'] as String?,
  dest_fileitem: json['dest_fileitem'] == null
      ? null
      : MediaOrganizeFileItem.fromJson(
          json['dest_fileitem'] as Map<String, dynamic>,
        ),
  mode: json['mode'] as String?,
  type: json['type'] as String?,
  category: json['category'] as String?,
  title: json['title'] as String?,
  year: json['year'] as String?,
  tmdbid: _intFromJson(json['tmdbid']),
  imdbid: json['imdbid'] as String?,
  tvdbid: _intFromJson(json['tvdbid']),
  doubanid: _intFromJson(json['doubanid']),
  seasons: json['seasons'] as String?,
  episodes: json['episodes'] as String?,
  image: json['image'] as String?,
  downloader: json['downloader'] as String?,
  download_hash: json['download_hash'] as String?,
  status: _boolFromJson(json['status']),
  errmsg: json['errmsg'] as String?,
  date: json['date'] as String?,
  files: json['files'] == null ? const [] : _stringListFromJson(json['files']),
  episode_group: json['episode_group'],
);

Map<String, dynamic> _$$MediaOrganizeTransferItemImplToJson(
  _$MediaOrganizeTransferItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'src': instance.src,
  'src_storage': instance.src_storage,
  'src_fileitem': instance.src_fileitem,
  'dest': instance.dest,
  'dest_storage': instance.dest_storage,
  'dest_fileitem': instance.dest_fileitem,
  'mode': instance.mode,
  'type': instance.type,
  'category': instance.category,
  'title': instance.title,
  'year': instance.year,
  'tmdbid': instance.tmdbid,
  'imdbid': instance.imdbid,
  'tvdbid': instance.tvdbid,
  'doubanid': instance.doubanid,
  'seasons': instance.seasons,
  'episodes': instance.episodes,
  'image': instance.image,
  'downloader': instance.downloader,
  'download_hash': instance.download_hash,
  'status': instance.status,
  'errmsg': instance.errmsg,
  'date': instance.date,
  'files': instance.files,
  'episode_group': instance.episode_group,
};
