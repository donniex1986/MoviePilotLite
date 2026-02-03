// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SystemMessage _$SystemMessageFromJson(Map<String, dynamic> json) {
  return _SystemMessage.fromJson(json);
}

/// @nodoc
mixin _$SystemMessage {
  @JsonKey(fromJson: _intFromJson, toJson: _intToJson)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get channel => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get mtype => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get text => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get image => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get userid => throw _privateConstructorUsedError;
  @_DateTimeConverter()
  @JsonKey(name: 'reg_time')
  DateTime get regTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get action => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _noteFromJson, toJson: _noteToJson)
  List<SystemMessageNote> get note => throw _privateConstructorUsedError;

  /// Serializes this SystemMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemMessageCopyWith<SystemMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemMessageCopyWith<$Res> {
  factory $SystemMessageCopyWith(
    SystemMessage value,
    $Res Function(SystemMessage) then,
  ) = _$SystemMessageCopyWithImpl<$Res, SystemMessage>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson, toJson: _intToJson) int id,
    @JsonKey(fromJson: _stringFromJsonNullable) String? channel,
    @JsonKey(fromJson: _stringFromJsonNullable) String? source,
    @JsonKey(fromJson: _stringFromJson) String mtype,
    @JsonKey(fromJson: _stringFromJson) String title,
    @JsonKey(fromJson: _stringFromJson) String text,
    @JsonKey(fromJson: _stringFromJson) String image,
    @JsonKey(fromJson: _stringFromJsonNullable) String? link,
    @JsonKey(fromJson: _stringFromJsonNullable) String? userid,
    @_DateTimeConverter() @JsonKey(name: 'reg_time') DateTime regTime,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? action,
    @JsonKey(fromJson: _noteFromJson, toJson: _noteToJson)
    List<SystemMessageNote> note,
  });
}

/// @nodoc
class _$SystemMessageCopyWithImpl<$Res, $Val extends SystemMessage>
    implements $SystemMessageCopyWith<$Res> {
  _$SystemMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? channel = freezed,
    Object? source = freezed,
    Object? mtype = null,
    Object? title = null,
    Object? text = null,
    Object? image = null,
    Object? link = freezed,
    Object? userid = freezed,
    Object? regTime = null,
    Object? action = freezed,
    Object? note = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            channel: freezed == channel
                ? _value.channel
                : channel // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
            mtype: null == mtype
                ? _value.mtype
                : mtype // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            link: freezed == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                      as String?,
            userid: freezed == userid
                ? _value.userid
                : userid // ignore: cast_nullable_to_non_nullable
                      as String?,
            regTime: null == regTime
                ? _value.regTime
                : regTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            action: freezed == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as int?,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as List<SystemMessageNote>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SystemMessageImplCopyWith<$Res>
    implements $SystemMessageCopyWith<$Res> {
  factory _$$SystemMessageImplCopyWith(
    _$SystemMessageImpl value,
    $Res Function(_$SystemMessageImpl) then,
  ) = __$$SystemMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson, toJson: _intToJson) int id,
    @JsonKey(fromJson: _stringFromJsonNullable) String? channel,
    @JsonKey(fromJson: _stringFromJsonNullable) String? source,
    @JsonKey(fromJson: _stringFromJson) String mtype,
    @JsonKey(fromJson: _stringFromJson) String title,
    @JsonKey(fromJson: _stringFromJson) String text,
    @JsonKey(fromJson: _stringFromJson) String image,
    @JsonKey(fromJson: _stringFromJsonNullable) String? link,
    @JsonKey(fromJson: _stringFromJsonNullable) String? userid,
    @_DateTimeConverter() @JsonKey(name: 'reg_time') DateTime regTime,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? action,
    @JsonKey(fromJson: _noteFromJson, toJson: _noteToJson)
    List<SystemMessageNote> note,
  });
}

/// @nodoc
class __$$SystemMessageImplCopyWithImpl<$Res>
    extends _$SystemMessageCopyWithImpl<$Res, _$SystemMessageImpl>
    implements _$$SystemMessageImplCopyWith<$Res> {
  __$$SystemMessageImplCopyWithImpl(
    _$SystemMessageImpl _value,
    $Res Function(_$SystemMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? channel = freezed,
    Object? source = freezed,
    Object? mtype = null,
    Object? title = null,
    Object? text = null,
    Object? image = null,
    Object? link = freezed,
    Object? userid = freezed,
    Object? regTime = null,
    Object? action = freezed,
    Object? note = null,
  }) {
    return _then(
      _$SystemMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        channel: freezed == channel
            ? _value.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
        mtype: null == mtype
            ? _value.mtype
            : mtype // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        link: freezed == link
            ? _value.link
            : link // ignore: cast_nullable_to_non_nullable
                  as String?,
        userid: freezed == userid
            ? _value.userid
            : userid // ignore: cast_nullable_to_non_nullable
                  as String?,
        regTime: null == regTime
            ? _value.regTime
            : regTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        action: freezed == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as int?,
        note: null == note
            ? _value._note
            : note // ignore: cast_nullable_to_non_nullable
                  as List<SystemMessageNote>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemMessageImpl implements _SystemMessage {
  const _$SystemMessageImpl({
    @JsonKey(fromJson: _intFromJson, toJson: _intToJson) required this.id,
    @JsonKey(fromJson: _stringFromJsonNullable) this.channel,
    @JsonKey(fromJson: _stringFromJsonNullable) this.source,
    @JsonKey(fromJson: _stringFromJson) this.mtype = '',
    @JsonKey(fromJson: _stringFromJson) this.title = '',
    @JsonKey(fromJson: _stringFromJson) this.text = '',
    @JsonKey(fromJson: _stringFromJson) this.image = '',
    @JsonKey(fromJson: _stringFromJsonNullable) this.link,
    @JsonKey(fromJson: _stringFromJsonNullable) this.userid,
    @_DateTimeConverter() @JsonKey(name: 'reg_time') required this.regTime,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) this.action,
    @JsonKey(fromJson: _noteFromJson, toJson: _noteToJson)
    final List<SystemMessageNote> note = const <SystemMessageNote>[],
  }) : _note = note;

  factory _$SystemMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemMessageImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson, toJson: _intToJson)
  final int id;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? channel;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? source;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String mtype;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String title;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String text;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String image;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? link;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? userid;
  @override
  @_DateTimeConverter()
  @JsonKey(name: 'reg_time')
  final DateTime regTime;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  final int? action;
  final List<SystemMessageNote> _note;
  @override
  @JsonKey(fromJson: _noteFromJson, toJson: _noteToJson)
  List<SystemMessageNote> get note {
    if (_note is EqualUnmodifiableListView) return _note;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_note);
  }

  @override
  String toString() {
    return 'SystemMessage(id: $id, channel: $channel, source: $source, mtype: $mtype, title: $title, text: $text, image: $image, link: $link, userid: $userid, regTime: $regTime, action: $action, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.mtype, mtype) || other.mtype == mtype) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.userid, userid) || other.userid == userid) &&
            (identical(other.regTime, regTime) || other.regTime == regTime) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._note, _note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    channel,
    source,
    mtype,
    title,
    text,
    image,
    link,
    userid,
    regTime,
    action,
    const DeepCollectionEquality().hash(_note),
  );

  /// Create a copy of SystemMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemMessageImplCopyWith<_$SystemMessageImpl> get copyWith =>
      __$$SystemMessageImplCopyWithImpl<_$SystemMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemMessageImplToJson(this);
  }
}

abstract class _SystemMessage implements SystemMessage {
  const factory _SystemMessage({
    @JsonKey(fromJson: _intFromJson, toJson: _intToJson) required final int id,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? channel,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? source,
    @JsonKey(fromJson: _stringFromJson) final String mtype,
    @JsonKey(fromJson: _stringFromJson) final String title,
    @JsonKey(fromJson: _stringFromJson) final String text,
    @JsonKey(fromJson: _stringFromJson) final String image,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? link,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? userid,
    @_DateTimeConverter()
    @JsonKey(name: 'reg_time')
    required final DateTime regTime,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
    final int? action,
    @JsonKey(fromJson: _noteFromJson, toJson: _noteToJson)
    final List<SystemMessageNote> note,
  }) = _$SystemMessageImpl;

  factory _SystemMessage.fromJson(Map<String, dynamic> json) =
      _$SystemMessageImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJson, toJson: _intToJson)
  int get id;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get channel;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get source;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get mtype;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get title;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get text;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get image;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get link;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get userid;
  @override
  @_DateTimeConverter()
  @JsonKey(name: 'reg_time')
  DateTime get regTime;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get action;
  @override
  @JsonKey(fromJson: _noteFromJson, toJson: _noteToJson)
  List<SystemMessageNote> get note;

  /// Create a copy of SystemMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemMessageImplCopyWith<_$SystemMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SystemMessageNote _$SystemMessageNoteFromJson(Map<String, dynamic> json) {
  return _SystemMessageNote.fromJson(json);
}

/// @nodoc
mixin _$SystemMessageNote {
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get site => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_name')
  String? get siteName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_cookie')
  String? get siteCookie => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_ua')
  String? get siteUa => throw _privateConstructorUsedError;
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'site_proxy',
  )
  int? get siteProxy => throw _privateConstructorUsedError;
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'site_order',
  )
  int? get siteOrder => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_downloader')
  String? get siteDownloader => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get imdbid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get enclosure => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'page_url')
  String? get pageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get size => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get seeders => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get peers => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get grabs => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get pubdate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'date_elapsed')
  String? get dateElapsed => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get freedate => throw _privateConstructorUsedError;
  @JsonKey(
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
    name: 'uploadvolumefactor',
  )
  double? get uploadVolumeFactor => throw _privateConstructorUsedError;
  @JsonKey(
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
    name: 'downloadvolumefactor',
  )
  double? get downloadVolumeFactor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromJson, name: 'hit_and_run')
  bool? get hitAndRun => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get labels => throw _privateConstructorUsedError;
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'pri_order',
  )
  int? get priOrder => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'volume_factor')
  String? get volumeFactor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'freedate_diff')
  String? get freedateDiff => throw _privateConstructorUsedError;

  /// Serializes this SystemMessageNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemMessageNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemMessageNoteCopyWith<SystemMessageNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemMessageNoteCopyWith<$Res> {
  factory $SystemMessageNoteCopyWith(
    SystemMessageNote value,
    $Res Function(SystemMessageNote) then,
  ) = _$SystemMessageNoteCopyWithImpl<$Res, SystemMessageNote>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? site,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_name')
    String? siteName,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_cookie')
    String? siteCookie,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_ua') String? siteUa,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'site_proxy',
    )
    int? siteProxy,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'site_order',
    )
    int? siteOrder,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_downloader')
    String? siteDownloader,
    @JsonKey(fromJson: _stringFromJsonNullable) String? title,
    @JsonKey(fromJson: _stringFromJsonNullable) String? description,
    @JsonKey(fromJson: _stringFromJsonNullable) String? imdbid,
    @JsonKey(fromJson: _stringFromJsonNullable) String? enclosure,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'page_url')
    String? pageUrl,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? size,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? seeders,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? peers,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? grabs,
    @JsonKey(fromJson: _stringFromJsonNullable) String? pubdate,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'date_elapsed')
    String? dateElapsed,
    @JsonKey(fromJson: _stringFromJsonNullable) String? freedate,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'uploadvolumefactor',
    )
    double? uploadVolumeFactor,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'downloadvolumefactor',
    )
    double? downloadVolumeFactor,
    @JsonKey(fromJson: _boolFromJson, name: 'hit_and_run') bool? hitAndRun,
    @JsonKey(fromJson: _stringListFromJson) List<String> labels,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'pri_order',
    )
    int? priOrder,
    @JsonKey(fromJson: _stringFromJsonNullable) String? category,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'volume_factor')
    String? volumeFactor,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'freedate_diff')
    String? freedateDiff,
  });
}

/// @nodoc
class _$SystemMessageNoteCopyWithImpl<$Res, $Val extends SystemMessageNote>
    implements $SystemMessageNoteCopyWith<$Res> {
  _$SystemMessageNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemMessageNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = freezed,
    Object? siteName = freezed,
    Object? siteCookie = freezed,
    Object? siteUa = freezed,
    Object? siteProxy = freezed,
    Object? siteOrder = freezed,
    Object? siteDownloader = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imdbid = freezed,
    Object? enclosure = freezed,
    Object? pageUrl = freezed,
    Object? size = freezed,
    Object? seeders = freezed,
    Object? peers = freezed,
    Object? grabs = freezed,
    Object? pubdate = freezed,
    Object? dateElapsed = freezed,
    Object? freedate = freezed,
    Object? uploadVolumeFactor = freezed,
    Object? downloadVolumeFactor = freezed,
    Object? hitAndRun = freezed,
    Object? labels = null,
    Object? priOrder = freezed,
    Object? category = freezed,
    Object? volumeFactor = freezed,
    Object? freedateDiff = freezed,
  }) {
    return _then(
      _value.copyWith(
            site: freezed == site
                ? _value.site
                : site // ignore: cast_nullable_to_non_nullable
                      as int?,
            siteName: freezed == siteName
                ? _value.siteName
                : siteName // ignore: cast_nullable_to_non_nullable
                      as String?,
            siteCookie: freezed == siteCookie
                ? _value.siteCookie
                : siteCookie // ignore: cast_nullable_to_non_nullable
                      as String?,
            siteUa: freezed == siteUa
                ? _value.siteUa
                : siteUa // ignore: cast_nullable_to_non_nullable
                      as String?,
            siteProxy: freezed == siteProxy
                ? _value.siteProxy
                : siteProxy // ignore: cast_nullable_to_non_nullable
                      as int?,
            siteOrder: freezed == siteOrder
                ? _value.siteOrder
                : siteOrder // ignore: cast_nullable_to_non_nullable
                      as int?,
            siteDownloader: freezed == siteDownloader
                ? _value.siteDownloader
                : siteDownloader // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            imdbid: freezed == imdbid
                ? _value.imdbid
                : imdbid // ignore: cast_nullable_to_non_nullable
                      as String?,
            enclosure: freezed == enclosure
                ? _value.enclosure
                : enclosure // ignore: cast_nullable_to_non_nullable
                      as String?,
            pageUrl: freezed == pageUrl
                ? _value.pageUrl
                : pageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
            seeders: freezed == seeders
                ? _value.seeders
                : seeders // ignore: cast_nullable_to_non_nullable
                      as int?,
            peers: freezed == peers
                ? _value.peers
                : peers // ignore: cast_nullable_to_non_nullable
                      as int?,
            grabs: freezed == grabs
                ? _value.grabs
                : grabs // ignore: cast_nullable_to_non_nullable
                      as int?,
            pubdate: freezed == pubdate
                ? _value.pubdate
                : pubdate // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateElapsed: freezed == dateElapsed
                ? _value.dateElapsed
                : dateElapsed // ignore: cast_nullable_to_non_nullable
                      as String?,
            freedate: freezed == freedate
                ? _value.freedate
                : freedate // ignore: cast_nullable_to_non_nullable
                      as String?,
            uploadVolumeFactor: freezed == uploadVolumeFactor
                ? _value.uploadVolumeFactor
                : uploadVolumeFactor // ignore: cast_nullable_to_non_nullable
                      as double?,
            downloadVolumeFactor: freezed == downloadVolumeFactor
                ? _value.downloadVolumeFactor
                : downloadVolumeFactor // ignore: cast_nullable_to_non_nullable
                      as double?,
            hitAndRun: freezed == hitAndRun
                ? _value.hitAndRun
                : hitAndRun // ignore: cast_nullable_to_non_nullable
                      as bool?,
            labels: null == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            priOrder: freezed == priOrder
                ? _value.priOrder
                : priOrder // ignore: cast_nullable_to_non_nullable
                      as int?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            volumeFactor: freezed == volumeFactor
                ? _value.volumeFactor
                : volumeFactor // ignore: cast_nullable_to_non_nullable
                      as String?,
            freedateDiff: freezed == freedateDiff
                ? _value.freedateDiff
                : freedateDiff // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SystemMessageNoteImplCopyWith<$Res>
    implements $SystemMessageNoteCopyWith<$Res> {
  factory _$$SystemMessageNoteImplCopyWith(
    _$SystemMessageNoteImpl value,
    $Res Function(_$SystemMessageNoteImpl) then,
  ) = __$$SystemMessageNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? site,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_name')
    String? siteName,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_cookie')
    String? siteCookie,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_ua') String? siteUa,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'site_proxy',
    )
    int? siteProxy,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'site_order',
    )
    int? siteOrder,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_downloader')
    String? siteDownloader,
    @JsonKey(fromJson: _stringFromJsonNullable) String? title,
    @JsonKey(fromJson: _stringFromJsonNullable) String? description,
    @JsonKey(fromJson: _stringFromJsonNullable) String? imdbid,
    @JsonKey(fromJson: _stringFromJsonNullable) String? enclosure,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'page_url')
    String? pageUrl,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? size,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? seeders,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? peers,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) int? grabs,
    @JsonKey(fromJson: _stringFromJsonNullable) String? pubdate,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'date_elapsed')
    String? dateElapsed,
    @JsonKey(fromJson: _stringFromJsonNullable) String? freedate,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'uploadvolumefactor',
    )
    double? uploadVolumeFactor,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'downloadvolumefactor',
    )
    double? downloadVolumeFactor,
    @JsonKey(fromJson: _boolFromJson, name: 'hit_and_run') bool? hitAndRun,
    @JsonKey(fromJson: _stringListFromJson) List<String> labels,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'pri_order',
    )
    int? priOrder,
    @JsonKey(fromJson: _stringFromJsonNullable) String? category,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'volume_factor')
    String? volumeFactor,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'freedate_diff')
    String? freedateDiff,
  });
}

/// @nodoc
class __$$SystemMessageNoteImplCopyWithImpl<$Res>
    extends _$SystemMessageNoteCopyWithImpl<$Res, _$SystemMessageNoteImpl>
    implements _$$SystemMessageNoteImplCopyWith<$Res> {
  __$$SystemMessageNoteImplCopyWithImpl(
    _$SystemMessageNoteImpl _value,
    $Res Function(_$SystemMessageNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemMessageNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = freezed,
    Object? siteName = freezed,
    Object? siteCookie = freezed,
    Object? siteUa = freezed,
    Object? siteProxy = freezed,
    Object? siteOrder = freezed,
    Object? siteDownloader = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imdbid = freezed,
    Object? enclosure = freezed,
    Object? pageUrl = freezed,
    Object? size = freezed,
    Object? seeders = freezed,
    Object? peers = freezed,
    Object? grabs = freezed,
    Object? pubdate = freezed,
    Object? dateElapsed = freezed,
    Object? freedate = freezed,
    Object? uploadVolumeFactor = freezed,
    Object? downloadVolumeFactor = freezed,
    Object? hitAndRun = freezed,
    Object? labels = null,
    Object? priOrder = freezed,
    Object? category = freezed,
    Object? volumeFactor = freezed,
    Object? freedateDiff = freezed,
  }) {
    return _then(
      _$SystemMessageNoteImpl(
        site: freezed == site
            ? _value.site
            : site // ignore: cast_nullable_to_non_nullable
                  as int?,
        siteName: freezed == siteName
            ? _value.siteName
            : siteName // ignore: cast_nullable_to_non_nullable
                  as String?,
        siteCookie: freezed == siteCookie
            ? _value.siteCookie
            : siteCookie // ignore: cast_nullable_to_non_nullable
                  as String?,
        siteUa: freezed == siteUa
            ? _value.siteUa
            : siteUa // ignore: cast_nullable_to_non_nullable
                  as String?,
        siteProxy: freezed == siteProxy
            ? _value.siteProxy
            : siteProxy // ignore: cast_nullable_to_non_nullable
                  as int?,
        siteOrder: freezed == siteOrder
            ? _value.siteOrder
            : siteOrder // ignore: cast_nullable_to_non_nullable
                  as int?,
        siteDownloader: freezed == siteDownloader
            ? _value.siteDownloader
            : siteDownloader // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        imdbid: freezed == imdbid
            ? _value.imdbid
            : imdbid // ignore: cast_nullable_to_non_nullable
                  as String?,
        enclosure: freezed == enclosure
            ? _value.enclosure
            : enclosure // ignore: cast_nullable_to_non_nullable
                  as String?,
        pageUrl: freezed == pageUrl
            ? _value.pageUrl
            : pageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
        seeders: freezed == seeders
            ? _value.seeders
            : seeders // ignore: cast_nullable_to_non_nullable
                  as int?,
        peers: freezed == peers
            ? _value.peers
            : peers // ignore: cast_nullable_to_non_nullable
                  as int?,
        grabs: freezed == grabs
            ? _value.grabs
            : grabs // ignore: cast_nullable_to_non_nullable
                  as int?,
        pubdate: freezed == pubdate
            ? _value.pubdate
            : pubdate // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateElapsed: freezed == dateElapsed
            ? _value.dateElapsed
            : dateElapsed // ignore: cast_nullable_to_non_nullable
                  as String?,
        freedate: freezed == freedate
            ? _value.freedate
            : freedate // ignore: cast_nullable_to_non_nullable
                  as String?,
        uploadVolumeFactor: freezed == uploadVolumeFactor
            ? _value.uploadVolumeFactor
            : uploadVolumeFactor // ignore: cast_nullable_to_non_nullable
                  as double?,
        downloadVolumeFactor: freezed == downloadVolumeFactor
            ? _value.downloadVolumeFactor
            : downloadVolumeFactor // ignore: cast_nullable_to_non_nullable
                  as double?,
        hitAndRun: freezed == hitAndRun
            ? _value.hitAndRun
            : hitAndRun // ignore: cast_nullable_to_non_nullable
                  as bool?,
        labels: null == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        priOrder: freezed == priOrder
            ? _value.priOrder
            : priOrder // ignore: cast_nullable_to_non_nullable
                  as int?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        volumeFactor: freezed == volumeFactor
            ? _value.volumeFactor
            : volumeFactor // ignore: cast_nullable_to_non_nullable
                  as String?,
        freedateDiff: freezed == freedateDiff
            ? _value.freedateDiff
            : freedateDiff // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemMessageNoteImpl implements _SystemMessageNote {
  const _$SystemMessageNoteImpl({
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) this.site,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_name')
    this.siteName,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_cookie')
    this.siteCookie,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_ua') this.siteUa,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'site_proxy',
    )
    this.siteProxy,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'site_order',
    )
    this.siteOrder,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_downloader')
    this.siteDownloader,
    @JsonKey(fromJson: _stringFromJsonNullable) this.title,
    @JsonKey(fromJson: _stringFromJsonNullable) this.description,
    @JsonKey(fromJson: _stringFromJsonNullable) this.imdbid,
    @JsonKey(fromJson: _stringFromJsonNullable) this.enclosure,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'page_url') this.pageUrl,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) this.size,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) this.seeders,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) this.peers,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson) this.grabs,
    @JsonKey(fromJson: _stringFromJsonNullable) this.pubdate,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'date_elapsed')
    this.dateElapsed,
    @JsonKey(fromJson: _stringFromJsonNullable) this.freedate,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'uploadvolumefactor',
    )
    this.uploadVolumeFactor,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'downloadvolumefactor',
    )
    this.downloadVolumeFactor,
    @JsonKey(fromJson: _boolFromJson, name: 'hit_and_run') this.hitAndRun,
    @JsonKey(fromJson: _stringListFromJson)
    final List<String> labels = const <String>[],
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'pri_order',
    )
    this.priOrder,
    @JsonKey(fromJson: _stringFromJsonNullable) this.category,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'volume_factor')
    this.volumeFactor,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'freedate_diff')
    this.freedateDiff,
  }) : _labels = labels;

  factory _$SystemMessageNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemMessageNoteImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  final int? site;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_name')
  final String? siteName;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_cookie')
  final String? siteCookie;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_ua')
  final String? siteUa;
  @override
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'site_proxy',
  )
  final int? siteProxy;
  @override
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'site_order',
  )
  final int? siteOrder;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_downloader')
  final String? siteDownloader;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? title;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? description;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? imdbid;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? enclosure;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'page_url')
  final String? pageUrl;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  final int? size;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  final int? seeders;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  final int? peers;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  final int? grabs;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? pubdate;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'date_elapsed')
  final String? dateElapsed;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? freedate;
  @override
  @JsonKey(
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
    name: 'uploadvolumefactor',
  )
  final double? uploadVolumeFactor;
  @override
  @JsonKey(
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
    name: 'downloadvolumefactor',
  )
  final double? downloadVolumeFactor;
  @override
  @JsonKey(fromJson: _boolFromJson, name: 'hit_and_run')
  final bool? hitAndRun;
  final List<String> _labels;
  @override
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'pri_order',
  )
  final int? priOrder;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  final String? category;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'volume_factor')
  final String? volumeFactor;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'freedate_diff')
  final String? freedateDiff;

  @override
  String toString() {
    return 'SystemMessageNote(site: $site, siteName: $siteName, siteCookie: $siteCookie, siteUa: $siteUa, siteProxy: $siteProxy, siteOrder: $siteOrder, siteDownloader: $siteDownloader, title: $title, description: $description, imdbid: $imdbid, enclosure: $enclosure, pageUrl: $pageUrl, size: $size, seeders: $seeders, peers: $peers, grabs: $grabs, pubdate: $pubdate, dateElapsed: $dateElapsed, freedate: $freedate, uploadVolumeFactor: $uploadVolumeFactor, downloadVolumeFactor: $downloadVolumeFactor, hitAndRun: $hitAndRun, labels: $labels, priOrder: $priOrder, category: $category, volumeFactor: $volumeFactor, freedateDiff: $freedateDiff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemMessageNoteImpl &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.siteCookie, siteCookie) ||
                other.siteCookie == siteCookie) &&
            (identical(other.siteUa, siteUa) || other.siteUa == siteUa) &&
            (identical(other.siteProxy, siteProxy) ||
                other.siteProxy == siteProxy) &&
            (identical(other.siteOrder, siteOrder) ||
                other.siteOrder == siteOrder) &&
            (identical(other.siteDownloader, siteDownloader) ||
                other.siteDownloader == siteDownloader) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imdbid, imdbid) || other.imdbid == imdbid) &&
            (identical(other.enclosure, enclosure) ||
                other.enclosure == enclosure) &&
            (identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.seeders, seeders) || other.seeders == seeders) &&
            (identical(other.peers, peers) || other.peers == peers) &&
            (identical(other.grabs, grabs) || other.grabs == grabs) &&
            (identical(other.pubdate, pubdate) || other.pubdate == pubdate) &&
            (identical(other.dateElapsed, dateElapsed) ||
                other.dateElapsed == dateElapsed) &&
            (identical(other.freedate, freedate) ||
                other.freedate == freedate) &&
            (identical(other.uploadVolumeFactor, uploadVolumeFactor) ||
                other.uploadVolumeFactor == uploadVolumeFactor) &&
            (identical(other.downloadVolumeFactor, downloadVolumeFactor) ||
                other.downloadVolumeFactor == downloadVolumeFactor) &&
            (identical(other.hitAndRun, hitAndRun) ||
                other.hitAndRun == hitAndRun) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.priOrder, priOrder) ||
                other.priOrder == priOrder) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.volumeFactor, volumeFactor) ||
                other.volumeFactor == volumeFactor) &&
            (identical(other.freedateDiff, freedateDiff) ||
                other.freedateDiff == freedateDiff));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    site,
    siteName,
    siteCookie,
    siteUa,
    siteProxy,
    siteOrder,
    siteDownloader,
    title,
    description,
    imdbid,
    enclosure,
    pageUrl,
    size,
    seeders,
    peers,
    grabs,
    pubdate,
    dateElapsed,
    freedate,
    uploadVolumeFactor,
    downloadVolumeFactor,
    hitAndRun,
    const DeepCollectionEquality().hash(_labels),
    priOrder,
    category,
    volumeFactor,
    freedateDiff,
  ]);

  /// Create a copy of SystemMessageNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemMessageNoteImplCopyWith<_$SystemMessageNoteImpl> get copyWith =>
      __$$SystemMessageNoteImplCopyWithImpl<_$SystemMessageNoteImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemMessageNoteImplToJson(this);
  }
}

abstract class _SystemMessageNote implements SystemMessageNote {
  const factory _SystemMessageNote({
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
    final int? site,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_name')
    final String? siteName,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_cookie')
    final String? siteCookie,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_ua')
    final String? siteUa,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'site_proxy',
    )
    final int? siteProxy,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'site_order',
    )
    final int? siteOrder,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_downloader')
    final String? siteDownloader,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? title,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? description,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? imdbid,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? enclosure,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'page_url')
    final String? pageUrl,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
    final int? size,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
    final int? seeders,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
    final int? peers,
    @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
    final int? grabs,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? pubdate,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'date_elapsed')
    final String? dateElapsed,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? freedate,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'uploadvolumefactor',
    )
    final double? uploadVolumeFactor,
    @JsonKey(
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
      name: 'downloadvolumefactor',
    )
    final double? downloadVolumeFactor,
    @JsonKey(fromJson: _boolFromJson, name: 'hit_and_run')
    final bool? hitAndRun,
    @JsonKey(fromJson: _stringListFromJson) final List<String> labels,
    @JsonKey(
      fromJson: _intFromJsonNullable,
      toJson: _intToJson,
      name: 'pri_order',
    )
    final int? priOrder,
    @JsonKey(fromJson: _stringFromJsonNullable) final String? category,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'volume_factor')
    final String? volumeFactor,
    @JsonKey(fromJson: _stringFromJsonNullable, name: 'freedate_diff')
    final String? freedateDiff,
  }) = _$SystemMessageNoteImpl;

  factory _SystemMessageNote.fromJson(Map<String, dynamic> json) =
      _$SystemMessageNoteImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get site;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_name')
  String? get siteName;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_cookie')
  String? get siteCookie;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_ua')
  String? get siteUa;
  @override
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'site_proxy',
  )
  int? get siteProxy;
  @override
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'site_order',
  )
  int? get siteOrder;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'site_downloader')
  String? get siteDownloader;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get title;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get description;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get imdbid;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get enclosure;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'page_url')
  String? get pageUrl;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get size;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get seeders;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get peers;
  @override
  @JsonKey(fromJson: _intFromJsonNullable, toJson: _intToJson)
  int? get grabs;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get pubdate;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'date_elapsed')
  String? get dateElapsed;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get freedate;
  @override
  @JsonKey(
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
    name: 'uploadvolumefactor',
  )
  double? get uploadVolumeFactor;
  @override
  @JsonKey(
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
    name: 'downloadvolumefactor',
  )
  double? get downloadVolumeFactor;
  @override
  @JsonKey(fromJson: _boolFromJson, name: 'hit_and_run')
  bool? get hitAndRun;
  @override
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get labels;
  @override
  @JsonKey(
    fromJson: _intFromJsonNullable,
    toJson: _intToJson,
    name: 'pri_order',
  )
  int? get priOrder;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable)
  String? get category;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'volume_factor')
  String? get volumeFactor;
  @override
  @JsonKey(fromJson: _stringFromJsonNullable, name: 'freedate_diff')
  String? get freedateDiff;

  /// Create a copy of SystemMessageNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemMessageNoteImplCopyWith<_$SystemMessageNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
