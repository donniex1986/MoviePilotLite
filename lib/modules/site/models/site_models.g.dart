// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteModelImpl _$$SiteModelImplFromJson(Map<String, dynamic> json) =>
    _$SiteModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      domain: json['domain'] as String,
      url: json['url'] as String,
      pri: (json['pri'] as num?)?.toInt() ?? 0,
      rss: json['rss'] as String?,
      cookie: json['cookie'] as String?,
      ua: json['ua'] as String?,
      apikey: json['apikey'] as String?,
      token: json['token'] as String?,
      proxy: json['proxy'] == null ? 0 : _intFromJson(json['proxy']),
      filter: json['filter'] as String?,
      render: json['render'] == null ? 0 : _intFromJson(json['render']),
      public: json['public'] == null ? 0 : _intFromJson(json['public']),
      note: json['note'] as String?,
      timeout: json['timeout'] == null ? 15 : _intFromJson(json['timeout']),
      limitInterval: json['limit_interval'] == null
          ? 0
          : _intFromJson(json['limit_interval']),
      limitCount: json['limit_count'] == null
          ? 0
          : _intFromJson(json['limit_count']),
      limitSeconds: json['limit_seconds'] == null
          ? 0
          : _intFromJson(json['limit_seconds']),
      isActive: json['is_active'] == null
          ? true
          : _boolFromJson(json['is_active']),
      downloader: json['downloader'] == null
          ? ''
          : _stringFromJson(json['downloader']),
    );

Map<String, dynamic> _$$SiteModelImplToJson(_$SiteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'domain': instance.domain,
      'url': instance.url,
      'pri': instance.pri,
      'rss': instance.rss,
      'cookie': instance.cookie,
      'ua': instance.ua,
      'apikey': instance.apikey,
      'token': instance.token,
      'proxy': instance.proxy,
      'filter': instance.filter,
      'render': instance.render,
      'public': instance.public,
      'note': instance.note,
      'timeout': instance.timeout,
      'limit_interval': instance.limitInterval,
      'limit_count': instance.limitCount,
      'limit_seconds': instance.limitSeconds,
      'is_active': instance.isActive,
      'downloader': instance.downloader,
    };

_$SiteIconResponseImpl _$$SiteIconResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SiteIconResponseImpl(
  success: json['success'] as bool? ?? true,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : SiteIconData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SiteIconResponseImplToJson(
  _$SiteIconResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$SiteIconDataImpl _$$SiteIconDataImplFromJson(Map<String, dynamic> json) =>
    _$SiteIconDataImpl(icon: _stringNullableFromJson(json['icon']));

Map<String, dynamic> _$$SiteIconDataImplToJson(_$SiteIconDataImpl instance) =>
    <String, dynamic>{'icon': instance.icon};

_$SiteUserDataModelImpl _$$SiteUserDataModelImplFromJson(
  Map<String, dynamic> json,
) => _$SiteUserDataModelImpl(
  domain: json['domain'] == null ? '' : _stringFromJson(json['domain']),
  username: json['username'] == null ? '' : _stringFromJson(json['username']),
  userid: json['userid'] == null ? '' : _stringFromJson(json['userid']),
  userLevel: json['user_level'] == null
      ? ''
      : _stringFromJson(json['user_level']),
  joinAt: _stringNullableFromJson(json['join_at']),
  bonus: json['bonus'] == null ? 0 : _doubleFromJson(json['bonus']),
  upload: json['upload'] == null ? 0 : _intFromJson(json['upload']),
  download: json['download'] == null ? 0 : _intFromJson(json['download']),
  ratio: json['ratio'] == null ? 0 : _doubleFromJson(json['ratio']),
  seeding: json['seeding'] == null ? 0 : _intFromJson(json['seeding']),
  leeching: json['leeching'] == null ? 0 : _intFromJson(json['leeching']),
  seedingSize: json['seeding_size'] == null
      ? 0
      : _intFromJson(json['seeding_size']),
  leechingSize: json['leeching_size'] == null
      ? 0
      : _intFromJson(json['leeching_size']),
  seedingInfo: json['seeding_info'] == null
      ? const []
      : _seedingInfoFromJson(json['seeding_info']),
  messageUnread: json['message_unread'] == null
      ? 0
      : _intFromJson(json['message_unread']),
  messageUnreadContents:
      json['message_unread_contents'] as List<dynamic>? ?? const [],
  errMsg: json['err_msg'] == null ? '' : _stringFromJson(json['err_msg']),
  updatedDay: json['updated_day'] == null
      ? ''
      : _stringFromJson(json['updated_day']),
  updatedTime: json['updated_time'] == null
      ? ''
      : _stringFromJson(json['updated_time']),
);

Map<String, dynamic> _$$SiteUserDataModelImplToJson(
  _$SiteUserDataModelImpl instance,
) => <String, dynamic>{
  'domain': instance.domain,
  'username': instance.username,
  'userid': instance.userid,
  'user_level': instance.userLevel,
  'join_at': instance.joinAt,
  'bonus': instance.bonus,
  'upload': instance.upload,
  'download': instance.download,
  'ratio': instance.ratio,
  'seeding': instance.seeding,
  'leeching': instance.leeching,
  'seeding_size': instance.seedingSize,
  'leeching_size': instance.leechingSize,
  'seeding_info': instance.seedingInfo,
  'message_unread': instance.messageUnread,
  'message_unread_contents': instance.messageUnreadContents,
  'err_msg': instance.errMsg,
  'updated_day': instance.updatedDay,
  'updated_time': instance.updatedTime,
};

_$SiteUserDataHistoryResponseImpl _$$SiteUserDataHistoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SiteUserDataHistoryResponseImpl(
  success: json['success'] as bool? ?? true,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => SiteUserDataHistoryItem.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$SiteUserDataHistoryResponseImplToJson(
  _$SiteUserDataHistoryResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$SiteUserDataHistoryItemImpl _$$SiteUserDataHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$SiteUserDataHistoryItemImpl(
  id: (json['id'] as num).toInt(),
  domain: json['domain'] == null ? '' : _stringFromJson(json['domain']),
  name: json['name'] == null ? '' : _stringFromJson(json['name']),
  username: json['username'] == null ? '' : _stringFromJson(json['username']),
  userid: json['userid'] == null ? '' : _stringFromJson(json['userid']),
  userLevel: json['user_level'] == null
      ? ''
      : _stringFromJson(json['user_level']),
  joinAt: _stringNullableFromJson(json['join_at']),
  bonus: json['bonus'] == null ? 0 : _doubleFromJson(json['bonus']),
  upload: json['upload'] == null ? 0 : _doubleFromJson(json['upload']),
  download: json['download'] == null ? 0 : _doubleFromJson(json['download']),
  ratio: json['ratio'] == null ? 0 : _doubleFromJson(json['ratio']),
  seeding: json['seeding'] == null ? 0 : _doubleFromJson(json['seeding']),
  leeching: json['leeching'] == null ? 0 : _doubleFromJson(json['leeching']),
  seedingSize: json['seeding_size'] == null
      ? 0
      : _doubleFromJson(json['seeding_size']),
  leechingSize: json['leeching_size'] == null
      ? 0
      : _doubleFromJson(json['leeching_size']),
  seedingInfo: json['seeding_info'] as List<dynamic>? ?? const [],
  messageUnread: json['message_unread'] == null
      ? 0
      : _intFromJson(json['message_unread']),
  messageUnreadContents:
      json['message_unread_contents'] as List<dynamic>? ?? const [],
  errMsg: json['err_msg'] == null ? '' : _stringFromJson(json['err_msg']),
  updatedDay: json['updated_day'] == null
      ? ''
      : _stringFromJson(json['updated_day']),
  updatedTime: json['updated_time'] == null
      ? ''
      : _stringFromJson(json['updated_time']),
);

Map<String, dynamic> _$$SiteUserDataHistoryItemImplToJson(
  _$SiteUserDataHistoryItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'domain': instance.domain,
  'name': instance.name,
  'username': instance.username,
  'userid': instance.userid,
  'user_level': instance.userLevel,
  'join_at': instance.joinAt,
  'bonus': instance.bonus,
  'upload': instance.upload,
  'download': instance.download,
  'ratio': instance.ratio,
  'seeding': instance.seeding,
  'leeching': instance.leeching,
  'seeding_size': instance.seedingSize,
  'leeching_size': instance.leechingSize,
  'seeding_info': instance.seedingInfo,
  'message_unread': instance.messageUnread,
  'message_unread_contents': instance.messageUnreadContents,
  'err_msg': instance.errMsg,
  'updated_day': instance.updatedDay,
  'updated_time': instance.updatedTime,
};
