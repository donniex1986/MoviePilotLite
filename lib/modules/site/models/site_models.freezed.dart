// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SiteModel _$SiteModelFromJson(Map<String, dynamic> json) {
  return _SiteModel.fromJson(json);
}

/// @nodoc
mixin _$SiteModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get domain => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int get pri => throw _privateConstructorUsedError;
  String? get rss => throw _privateConstructorUsedError;
  String? get cookie => throw _privateConstructorUsedError;
  String? get ua => throw _privateConstructorUsedError;
  String? get apikey => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get proxy => throw _privateConstructorUsedError;
  String? get filter => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get render => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get public => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get timeout => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit_interval', fromJson: _intFromJson)
  int get limitInterval => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit_count', fromJson: _intFromJson)
  int get limitCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit_seconds', fromJson: _intFromJson)
  int get limitSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: _boolFromJson)
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get downloader => throw _privateConstructorUsedError;

  /// Serializes this SiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteModelCopyWith<SiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteModelCopyWith<$Res> {
  factory $SiteModelCopyWith(SiteModel value, $Res Function(SiteModel) then) =
      _$SiteModelCopyWithImpl<$Res, SiteModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String domain,
    String url,
    int pri,
    String? rss,
    String? cookie,
    String? ua,
    String? apikey,
    String? token,
    @JsonKey(fromJson: _intFromJson) int proxy,
    String? filter,
    @JsonKey(fromJson: _intFromJson) int render,
    @JsonKey(fromJson: _intFromJson) int public,
    String? note,
    @JsonKey(fromJson: _intFromJson) int timeout,
    @JsonKey(name: 'limit_interval', fromJson: _intFromJson) int limitInterval,
    @JsonKey(name: 'limit_count', fromJson: _intFromJson) int limitCount,
    @JsonKey(name: 'limit_seconds', fromJson: _intFromJson) int limitSeconds,
    @JsonKey(name: 'is_active', fromJson: _boolFromJson) bool isActive,
    @JsonKey(fromJson: _stringFromJson) String downloader,
  });
}

/// @nodoc
class _$SiteModelCopyWithImpl<$Res, $Val extends SiteModel>
    implements $SiteModelCopyWith<$Res> {
  _$SiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? domain = null,
    Object? url = null,
    Object? pri = null,
    Object? rss = freezed,
    Object? cookie = freezed,
    Object? ua = freezed,
    Object? apikey = freezed,
    Object? token = freezed,
    Object? proxy = null,
    Object? filter = freezed,
    Object? render = null,
    Object? public = null,
    Object? note = freezed,
    Object? timeout = null,
    Object? limitInterval = null,
    Object? limitCount = null,
    Object? limitSeconds = null,
    Object? isActive = null,
    Object? downloader = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            domain: null == domain
                ? _value.domain
                : domain // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            pri: null == pri
                ? _value.pri
                : pri // ignore: cast_nullable_to_non_nullable
                      as int,
            rss: freezed == rss
                ? _value.rss
                : rss // ignore: cast_nullable_to_non_nullable
                      as String?,
            cookie: freezed == cookie
                ? _value.cookie
                : cookie // ignore: cast_nullable_to_non_nullable
                      as String?,
            ua: freezed == ua
                ? _value.ua
                : ua // ignore: cast_nullable_to_non_nullable
                      as String?,
            apikey: freezed == apikey
                ? _value.apikey
                : apikey // ignore: cast_nullable_to_non_nullable
                      as String?,
            token: freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String?,
            proxy: null == proxy
                ? _value.proxy
                : proxy // ignore: cast_nullable_to_non_nullable
                      as int,
            filter: freezed == filter
                ? _value.filter
                : filter // ignore: cast_nullable_to_non_nullable
                      as String?,
            render: null == render
                ? _value.render
                : render // ignore: cast_nullable_to_non_nullable
                      as int,
            public: null == public
                ? _value.public
                : public // ignore: cast_nullable_to_non_nullable
                      as int,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            timeout: null == timeout
                ? _value.timeout
                : timeout // ignore: cast_nullable_to_non_nullable
                      as int,
            limitInterval: null == limitInterval
                ? _value.limitInterval
                : limitInterval // ignore: cast_nullable_to_non_nullable
                      as int,
            limitCount: null == limitCount
                ? _value.limitCount
                : limitCount // ignore: cast_nullable_to_non_nullable
                      as int,
            limitSeconds: null == limitSeconds
                ? _value.limitSeconds
                : limitSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            downloader: null == downloader
                ? _value.downloader
                : downloader // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteModelImplCopyWith<$Res>
    implements $SiteModelCopyWith<$Res> {
  factory _$$SiteModelImplCopyWith(
    _$SiteModelImpl value,
    $Res Function(_$SiteModelImpl) then,
  ) = __$$SiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String domain,
    String url,
    int pri,
    String? rss,
    String? cookie,
    String? ua,
    String? apikey,
    String? token,
    @JsonKey(fromJson: _intFromJson) int proxy,
    String? filter,
    @JsonKey(fromJson: _intFromJson) int render,
    @JsonKey(fromJson: _intFromJson) int public,
    String? note,
    @JsonKey(fromJson: _intFromJson) int timeout,
    @JsonKey(name: 'limit_interval', fromJson: _intFromJson) int limitInterval,
    @JsonKey(name: 'limit_count', fromJson: _intFromJson) int limitCount,
    @JsonKey(name: 'limit_seconds', fromJson: _intFromJson) int limitSeconds,
    @JsonKey(name: 'is_active', fromJson: _boolFromJson) bool isActive,
    @JsonKey(fromJson: _stringFromJson) String downloader,
  });
}

/// @nodoc
class __$$SiteModelImplCopyWithImpl<$Res>
    extends _$SiteModelCopyWithImpl<$Res, _$SiteModelImpl>
    implements _$$SiteModelImplCopyWith<$Res> {
  __$$SiteModelImplCopyWithImpl(
    _$SiteModelImpl _value,
    $Res Function(_$SiteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? domain = null,
    Object? url = null,
    Object? pri = null,
    Object? rss = freezed,
    Object? cookie = freezed,
    Object? ua = freezed,
    Object? apikey = freezed,
    Object? token = freezed,
    Object? proxy = null,
    Object? filter = freezed,
    Object? render = null,
    Object? public = null,
    Object? note = freezed,
    Object? timeout = null,
    Object? limitInterval = null,
    Object? limitCount = null,
    Object? limitSeconds = null,
    Object? isActive = null,
    Object? downloader = null,
  }) {
    return _then(
      _$SiteModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        domain: null == domain
            ? _value.domain
            : domain // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        pri: null == pri
            ? _value.pri
            : pri // ignore: cast_nullable_to_non_nullable
                  as int,
        rss: freezed == rss
            ? _value.rss
            : rss // ignore: cast_nullable_to_non_nullable
                  as String?,
        cookie: freezed == cookie
            ? _value.cookie
            : cookie // ignore: cast_nullable_to_non_nullable
                  as String?,
        ua: freezed == ua
            ? _value.ua
            : ua // ignore: cast_nullable_to_non_nullable
                  as String?,
        apikey: freezed == apikey
            ? _value.apikey
            : apikey // ignore: cast_nullable_to_non_nullable
                  as String?,
        token: freezed == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String?,
        proxy: null == proxy
            ? _value.proxy
            : proxy // ignore: cast_nullable_to_non_nullable
                  as int,
        filter: freezed == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as String?,
        render: null == render
            ? _value.render
            : render // ignore: cast_nullable_to_non_nullable
                  as int,
        public: null == public
            ? _value.public
            : public // ignore: cast_nullable_to_non_nullable
                  as int,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeout: null == timeout
            ? _value.timeout
            : timeout // ignore: cast_nullable_to_non_nullable
                  as int,
        limitInterval: null == limitInterval
            ? _value.limitInterval
            : limitInterval // ignore: cast_nullable_to_non_nullable
                  as int,
        limitCount: null == limitCount
            ? _value.limitCount
            : limitCount // ignore: cast_nullable_to_non_nullable
                  as int,
        limitSeconds: null == limitSeconds
            ? _value.limitSeconds
            : limitSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        downloader: null == downloader
            ? _value.downloader
            : downloader // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteModelImpl implements _SiteModel {
  const _$SiteModelImpl({
    required this.id,
    required this.name,
    required this.domain,
    required this.url,
    this.pri = 0,
    this.rss,
    this.cookie,
    this.ua,
    this.apikey,
    this.token,
    @JsonKey(fromJson: _intFromJson) this.proxy = 0,
    this.filter,
    @JsonKey(fromJson: _intFromJson) this.render = 0,
    @JsonKey(fromJson: _intFromJson) this.public = 0,
    this.note,
    @JsonKey(fromJson: _intFromJson) this.timeout = 15,
    @JsonKey(name: 'limit_interval', fromJson: _intFromJson)
    this.limitInterval = 0,
    @JsonKey(name: 'limit_count', fromJson: _intFromJson) this.limitCount = 0,
    @JsonKey(name: 'limit_seconds', fromJson: _intFromJson)
    this.limitSeconds = 0,
    @JsonKey(name: 'is_active', fromJson: _boolFromJson) this.isActive = true,
    @JsonKey(fromJson: _stringFromJson) this.downloader = '',
  });

  factory _$SiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String domain;
  @override
  final String url;
  @override
  @JsonKey()
  final int pri;
  @override
  final String? rss;
  @override
  final String? cookie;
  @override
  final String? ua;
  @override
  final String? apikey;
  @override
  final String? token;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int proxy;
  @override
  final String? filter;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int render;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int public;
  @override
  final String? note;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int timeout;
  @override
  @JsonKey(name: 'limit_interval', fromJson: _intFromJson)
  final int limitInterval;
  @override
  @JsonKey(name: 'limit_count', fromJson: _intFromJson)
  final int limitCount;
  @override
  @JsonKey(name: 'limit_seconds', fromJson: _intFromJson)
  final int limitSeconds;
  @override
  @JsonKey(name: 'is_active', fromJson: _boolFromJson)
  final bool isActive;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String downloader;

  @override
  String toString() {
    return 'SiteModel(id: $id, name: $name, domain: $domain, url: $url, pri: $pri, rss: $rss, cookie: $cookie, ua: $ua, apikey: $apikey, token: $token, proxy: $proxy, filter: $filter, render: $render, public: $public, note: $note, timeout: $timeout, limitInterval: $limitInterval, limitCount: $limitCount, limitSeconds: $limitSeconds, isActive: $isActive, downloader: $downloader)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.pri, pri) || other.pri == pri) &&
            (identical(other.rss, rss) || other.rss == rss) &&
            (identical(other.cookie, cookie) || other.cookie == cookie) &&
            (identical(other.ua, ua) || other.ua == ua) &&
            (identical(other.apikey, apikey) || other.apikey == apikey) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.proxy, proxy) || other.proxy == proxy) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.render, render) || other.render == render) &&
            (identical(other.public, public) || other.public == public) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.limitInterval, limitInterval) ||
                other.limitInterval == limitInterval) &&
            (identical(other.limitCount, limitCount) ||
                other.limitCount == limitCount) &&
            (identical(other.limitSeconds, limitSeconds) ||
                other.limitSeconds == limitSeconds) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.downloader, downloader) ||
                other.downloader == downloader));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    domain,
    url,
    pri,
    rss,
    cookie,
    ua,
    apikey,
    token,
    proxy,
    filter,
    render,
    public,
    note,
    timeout,
    limitInterval,
    limitCount,
    limitSeconds,
    isActive,
    downloader,
  ]);

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteModelImplCopyWith<_$SiteModelImpl> get copyWith =>
      __$$SiteModelImplCopyWithImpl<_$SiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteModelImplToJson(this);
  }
}

abstract class _SiteModel implements SiteModel {
  const factory _SiteModel({
    required final int id,
    required final String name,
    required final String domain,
    required final String url,
    final int pri,
    final String? rss,
    final String? cookie,
    final String? ua,
    final String? apikey,
    final String? token,
    @JsonKey(fromJson: _intFromJson) final int proxy,
    final String? filter,
    @JsonKey(fromJson: _intFromJson) final int render,
    @JsonKey(fromJson: _intFromJson) final int public,
    final String? note,
    @JsonKey(fromJson: _intFromJson) final int timeout,
    @JsonKey(name: 'limit_interval', fromJson: _intFromJson)
    final int limitInterval,
    @JsonKey(name: 'limit_count', fromJson: _intFromJson) final int limitCount,
    @JsonKey(name: 'limit_seconds', fromJson: _intFromJson)
    final int limitSeconds,
    @JsonKey(name: 'is_active', fromJson: _boolFromJson) final bool isActive,
    @JsonKey(fromJson: _stringFromJson) final String downloader,
  }) = _$SiteModelImpl;

  factory _SiteModel.fromJson(Map<String, dynamic> json) =
      _$SiteModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get domain;
  @override
  String get url;
  @override
  int get pri;
  @override
  String? get rss;
  @override
  String? get cookie;
  @override
  String? get ua;
  @override
  String? get apikey;
  @override
  String? get token;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get proxy;
  @override
  String? get filter;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get render;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get public;
  @override
  String? get note;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get timeout;
  @override
  @JsonKey(name: 'limit_interval', fromJson: _intFromJson)
  int get limitInterval;
  @override
  @JsonKey(name: 'limit_count', fromJson: _intFromJson)
  int get limitCount;
  @override
  @JsonKey(name: 'limit_seconds', fromJson: _intFromJson)
  int get limitSeconds;
  @override
  @JsonKey(name: 'is_active', fromJson: _boolFromJson)
  bool get isActive;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get downloader;

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteModelImplCopyWith<_$SiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SiteIconResponse _$SiteIconResponseFromJson(Map<String, dynamic> json) {
  return _SiteIconResponse.fromJson(json);
}

/// @nodoc
mixin _$SiteIconResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SiteIconData? get data => throw _privateConstructorUsedError;

  /// Serializes this SiteIconResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteIconResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteIconResponseCopyWith<SiteIconResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteIconResponseCopyWith<$Res> {
  factory $SiteIconResponseCopyWith(
    SiteIconResponse value,
    $Res Function(SiteIconResponse) then,
  ) = _$SiteIconResponseCopyWithImpl<$Res, SiteIconResponse>;
  @useResult
  $Res call({bool success, String? message, SiteIconData? data});

  $SiteIconDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SiteIconResponseCopyWithImpl<$Res, $Val extends SiteIconResponse>
    implements $SiteIconResponseCopyWith<$Res> {
  _$SiteIconResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteIconResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as SiteIconData?,
          )
          as $Val,
    );
  }

  /// Create a copy of SiteIconResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SiteIconDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SiteIconDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SiteIconResponseImplCopyWith<$Res>
    implements $SiteIconResponseCopyWith<$Res> {
  factory _$$SiteIconResponseImplCopyWith(
    _$SiteIconResponseImpl value,
    $Res Function(_$SiteIconResponseImpl) then,
  ) = __$$SiteIconResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, SiteIconData? data});

  @override
  $SiteIconDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SiteIconResponseImplCopyWithImpl<$Res>
    extends _$SiteIconResponseCopyWithImpl<$Res, _$SiteIconResponseImpl>
    implements _$$SiteIconResponseImplCopyWith<$Res> {
  __$$SiteIconResponseImplCopyWithImpl(
    _$SiteIconResponseImpl _value,
    $Res Function(_$SiteIconResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteIconResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$SiteIconResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as SiteIconData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteIconResponseImpl implements _SiteIconResponse {
  const _$SiteIconResponseImpl({this.success = true, this.message, this.data});

  factory _$SiteIconResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteIconResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final String? message;
  @override
  final SiteIconData? data;

  @override
  String toString() {
    return 'SiteIconResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteIconResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of SiteIconResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteIconResponseImplCopyWith<_$SiteIconResponseImpl> get copyWith =>
      __$$SiteIconResponseImplCopyWithImpl<_$SiteIconResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteIconResponseImplToJson(this);
  }
}

abstract class _SiteIconResponse implements SiteIconResponse {
  const factory _SiteIconResponse({
    final bool success,
    final String? message,
    final SiteIconData? data,
  }) = _$SiteIconResponseImpl;

  factory _SiteIconResponse.fromJson(Map<String, dynamic> json) =
      _$SiteIconResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  SiteIconData? get data;

  /// Create a copy of SiteIconResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteIconResponseImplCopyWith<_$SiteIconResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SiteIconData _$SiteIconDataFromJson(Map<String, dynamic> json) {
  return _SiteIconData.fromJson(json);
}

/// @nodoc
mixin _$SiteIconData {
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get icon => throw _privateConstructorUsedError;

  /// Serializes this SiteIconData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteIconData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteIconDataCopyWith<SiteIconData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteIconDataCopyWith<$Res> {
  factory $SiteIconDataCopyWith(
    SiteIconData value,
    $Res Function(SiteIconData) then,
  ) = _$SiteIconDataCopyWithImpl<$Res, SiteIconData>;
  @useResult
  $Res call({@JsonKey(fromJson: _stringNullableFromJson) String? icon});
}

/// @nodoc
class _$SiteIconDataCopyWithImpl<$Res, $Val extends SiteIconData>
    implements $SiteIconDataCopyWith<$Res> {
  _$SiteIconDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteIconData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? icon = freezed}) {
    return _then(
      _value.copyWith(
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteIconDataImplCopyWith<$Res>
    implements $SiteIconDataCopyWith<$Res> {
  factory _$$SiteIconDataImplCopyWith(
    _$SiteIconDataImpl value,
    $Res Function(_$SiteIconDataImpl) then,
  ) = __$$SiteIconDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(fromJson: _stringNullableFromJson) String? icon});
}

/// @nodoc
class __$$SiteIconDataImplCopyWithImpl<$Res>
    extends _$SiteIconDataCopyWithImpl<$Res, _$SiteIconDataImpl>
    implements _$$SiteIconDataImplCopyWith<$Res> {
  __$$SiteIconDataImplCopyWithImpl(
    _$SiteIconDataImpl _value,
    $Res Function(_$SiteIconDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteIconData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? icon = freezed}) {
    return _then(
      _$SiteIconDataImpl(
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteIconDataImpl implements _SiteIconData {
  const _$SiteIconDataImpl({
    @JsonKey(fromJson: _stringNullableFromJson) this.icon,
  });

  factory _$SiteIconDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteIconDataImplFromJson(json);

  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  final String? icon;

  @override
  String toString() {
    return 'SiteIconData(icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteIconDataImpl &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, icon);

  /// Create a copy of SiteIconData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteIconDataImplCopyWith<_$SiteIconDataImpl> get copyWith =>
      __$$SiteIconDataImplCopyWithImpl<_$SiteIconDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteIconDataImplToJson(this);
  }
}

abstract class _SiteIconData implements SiteIconData {
  const factory _SiteIconData({
    @JsonKey(fromJson: _stringNullableFromJson) final String? icon,
  }) = _$SiteIconDataImpl;

  factory _SiteIconData.fromJson(Map<String, dynamic> json) =
      _$SiteIconDataImpl.fromJson;

  @override
  @JsonKey(fromJson: _stringNullableFromJson)
  String? get icon;

  /// Create a copy of SiteIconData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteIconDataImplCopyWith<_$SiteIconDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SiteUserDataModel _$SiteUserDataModelFromJson(Map<String, dynamic> json) {
  return _SiteUserDataModel.fromJson(json);
}

/// @nodoc
mixin _$SiteUserDataModel {
  @JsonKey(fromJson: _stringFromJson)
  String get domain => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'userid', fromJson: _stringFromJson)
  String get userid => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_level', fromJson: _stringFromJson)
  String get userLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson)
  String? get joinAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get bonus => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get upload => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get download => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get ratio => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get seeding => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get leeching => throw _privateConstructorUsedError;
  @JsonKey(name: 'seeding_size', fromJson: _intFromJson)
  int get seedingSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'leeching_size', fromJson: _intFromJson)
  int get leechingSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'seeding_info', fromJson: _seedingInfoFromJson)
  List<List<int>> get seedingInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_unread', fromJson: _intFromJson)
  int get messageUnread => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_unread_contents')
  List<dynamic> get messageUnreadContents => throw _privateConstructorUsedError;
  @JsonKey(name: 'err_msg', fromJson: _stringFromJson)
  String get errMsg => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
  String get updatedDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
  String get updatedTime => throw _privateConstructorUsedError;

  /// Serializes this SiteUserDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteUserDataModelCopyWith<SiteUserDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteUserDataModelCopyWith<$Res> {
  factory $SiteUserDataModelCopyWith(
    SiteUserDataModel value,
    $Res Function(SiteUserDataModel) then,
  ) = _$SiteUserDataModelCopyWithImpl<$Res, SiteUserDataModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringFromJson) String domain,
    @JsonKey(name: 'username', fromJson: _stringFromJson) String username,
    @JsonKey(name: 'userid', fromJson: _stringFromJson) String userid,
    @JsonKey(name: 'user_level', fromJson: _stringFromJson) String userLevel,
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson) String? joinAt,
    @JsonKey(fromJson: _doubleFromJson) double bonus,
    @JsonKey(fromJson: _intFromJson) int upload,
    @JsonKey(fromJson: _intFromJson) int download,
    @JsonKey(fromJson: _doubleFromJson) double ratio,
    @JsonKey(fromJson: _intFromJson) int seeding,
    @JsonKey(fromJson: _intFromJson) int leeching,
    @JsonKey(name: 'seeding_size', fromJson: _intFromJson) int seedingSize,
    @JsonKey(name: 'leeching_size', fromJson: _intFromJson) int leechingSize,
    @JsonKey(name: 'seeding_info', fromJson: _seedingInfoFromJson)
    List<List<int>> seedingInfo,
    @JsonKey(name: 'message_unread', fromJson: _intFromJson) int messageUnread,
    @JsonKey(name: 'message_unread_contents')
    List<dynamic> messageUnreadContents,
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) String errMsg,
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson) String updatedDay,
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
    String updatedTime,
  });
}

/// @nodoc
class _$SiteUserDataModelCopyWithImpl<$Res, $Val extends SiteUserDataModel>
    implements $SiteUserDataModelCopyWith<$Res> {
  _$SiteUserDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domain = null,
    Object? username = null,
    Object? userid = null,
    Object? userLevel = null,
    Object? joinAt = freezed,
    Object? bonus = null,
    Object? upload = null,
    Object? download = null,
    Object? ratio = null,
    Object? seeding = null,
    Object? leeching = null,
    Object? seedingSize = null,
    Object? leechingSize = null,
    Object? seedingInfo = null,
    Object? messageUnread = null,
    Object? messageUnreadContents = null,
    Object? errMsg = null,
    Object? updatedDay = null,
    Object? updatedTime = null,
  }) {
    return _then(
      _value.copyWith(
            domain: null == domain
                ? _value.domain
                : domain // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            userid: null == userid
                ? _value.userid
                : userid // ignore: cast_nullable_to_non_nullable
                      as String,
            userLevel: null == userLevel
                ? _value.userLevel
                : userLevel // ignore: cast_nullable_to_non_nullable
                      as String,
            joinAt: freezed == joinAt
                ? _value.joinAt
                : joinAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            bonus: null == bonus
                ? _value.bonus
                : bonus // ignore: cast_nullable_to_non_nullable
                      as double,
            upload: null == upload
                ? _value.upload
                : upload // ignore: cast_nullable_to_non_nullable
                      as int,
            download: null == download
                ? _value.download
                : download // ignore: cast_nullable_to_non_nullable
                      as int,
            ratio: null == ratio
                ? _value.ratio
                : ratio // ignore: cast_nullable_to_non_nullable
                      as double,
            seeding: null == seeding
                ? _value.seeding
                : seeding // ignore: cast_nullable_to_non_nullable
                      as int,
            leeching: null == leeching
                ? _value.leeching
                : leeching // ignore: cast_nullable_to_non_nullable
                      as int,
            seedingSize: null == seedingSize
                ? _value.seedingSize
                : seedingSize // ignore: cast_nullable_to_non_nullable
                      as int,
            leechingSize: null == leechingSize
                ? _value.leechingSize
                : leechingSize // ignore: cast_nullable_to_non_nullable
                      as int,
            seedingInfo: null == seedingInfo
                ? _value.seedingInfo
                : seedingInfo // ignore: cast_nullable_to_non_nullable
                      as List<List<int>>,
            messageUnread: null == messageUnread
                ? _value.messageUnread
                : messageUnread // ignore: cast_nullable_to_non_nullable
                      as int,
            messageUnreadContents: null == messageUnreadContents
                ? _value.messageUnreadContents
                : messageUnreadContents // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            errMsg: null == errMsg
                ? _value.errMsg
                : errMsg // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedDay: null == updatedDay
                ? _value.updatedDay
                : updatedDay // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedTime: null == updatedTime
                ? _value.updatedTime
                : updatedTime // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteUserDataModelImplCopyWith<$Res>
    implements $SiteUserDataModelCopyWith<$Res> {
  factory _$$SiteUserDataModelImplCopyWith(
    _$SiteUserDataModelImpl value,
    $Res Function(_$SiteUserDataModelImpl) then,
  ) = __$$SiteUserDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringFromJson) String domain,
    @JsonKey(name: 'username', fromJson: _stringFromJson) String username,
    @JsonKey(name: 'userid', fromJson: _stringFromJson) String userid,
    @JsonKey(name: 'user_level', fromJson: _stringFromJson) String userLevel,
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson) String? joinAt,
    @JsonKey(fromJson: _doubleFromJson) double bonus,
    @JsonKey(fromJson: _intFromJson) int upload,
    @JsonKey(fromJson: _intFromJson) int download,
    @JsonKey(fromJson: _doubleFromJson) double ratio,
    @JsonKey(fromJson: _intFromJson) int seeding,
    @JsonKey(fromJson: _intFromJson) int leeching,
    @JsonKey(name: 'seeding_size', fromJson: _intFromJson) int seedingSize,
    @JsonKey(name: 'leeching_size', fromJson: _intFromJson) int leechingSize,
    @JsonKey(name: 'seeding_info', fromJson: _seedingInfoFromJson)
    List<List<int>> seedingInfo,
    @JsonKey(name: 'message_unread', fromJson: _intFromJson) int messageUnread,
    @JsonKey(name: 'message_unread_contents')
    List<dynamic> messageUnreadContents,
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) String errMsg,
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson) String updatedDay,
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
    String updatedTime,
  });
}

/// @nodoc
class __$$SiteUserDataModelImplCopyWithImpl<$Res>
    extends _$SiteUserDataModelCopyWithImpl<$Res, _$SiteUserDataModelImpl>
    implements _$$SiteUserDataModelImplCopyWith<$Res> {
  __$$SiteUserDataModelImplCopyWithImpl(
    _$SiteUserDataModelImpl _value,
    $Res Function(_$SiteUserDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domain = null,
    Object? username = null,
    Object? userid = null,
    Object? userLevel = null,
    Object? joinAt = freezed,
    Object? bonus = null,
    Object? upload = null,
    Object? download = null,
    Object? ratio = null,
    Object? seeding = null,
    Object? leeching = null,
    Object? seedingSize = null,
    Object? leechingSize = null,
    Object? seedingInfo = null,
    Object? messageUnread = null,
    Object? messageUnreadContents = null,
    Object? errMsg = null,
    Object? updatedDay = null,
    Object? updatedTime = null,
  }) {
    return _then(
      _$SiteUserDataModelImpl(
        domain: null == domain
            ? _value.domain
            : domain // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        userid: null == userid
            ? _value.userid
            : userid // ignore: cast_nullable_to_non_nullable
                  as String,
        userLevel: null == userLevel
            ? _value.userLevel
            : userLevel // ignore: cast_nullable_to_non_nullable
                  as String,
        joinAt: freezed == joinAt
            ? _value.joinAt
            : joinAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        bonus: null == bonus
            ? _value.bonus
            : bonus // ignore: cast_nullable_to_non_nullable
                  as double,
        upload: null == upload
            ? _value.upload
            : upload // ignore: cast_nullable_to_non_nullable
                  as int,
        download: null == download
            ? _value.download
            : download // ignore: cast_nullable_to_non_nullable
                  as int,
        ratio: null == ratio
            ? _value.ratio
            : ratio // ignore: cast_nullable_to_non_nullable
                  as double,
        seeding: null == seeding
            ? _value.seeding
            : seeding // ignore: cast_nullable_to_non_nullable
                  as int,
        leeching: null == leeching
            ? _value.leeching
            : leeching // ignore: cast_nullable_to_non_nullable
                  as int,
        seedingSize: null == seedingSize
            ? _value.seedingSize
            : seedingSize // ignore: cast_nullable_to_non_nullable
                  as int,
        leechingSize: null == leechingSize
            ? _value.leechingSize
            : leechingSize // ignore: cast_nullable_to_non_nullable
                  as int,
        seedingInfo: null == seedingInfo
            ? _value._seedingInfo
            : seedingInfo // ignore: cast_nullable_to_non_nullable
                  as List<List<int>>,
        messageUnread: null == messageUnread
            ? _value.messageUnread
            : messageUnread // ignore: cast_nullable_to_non_nullable
                  as int,
        messageUnreadContents: null == messageUnreadContents
            ? _value._messageUnreadContents
            : messageUnreadContents // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        errMsg: null == errMsg
            ? _value.errMsg
            : errMsg // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedDay: null == updatedDay
            ? _value.updatedDay
            : updatedDay // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedTime: null == updatedTime
            ? _value.updatedTime
            : updatedTime // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteUserDataModelImpl implements _SiteUserDataModel {
  const _$SiteUserDataModelImpl({
    @JsonKey(fromJson: _stringFromJson) this.domain = '',
    @JsonKey(name: 'username', fromJson: _stringFromJson) this.username = '',
    @JsonKey(name: 'userid', fromJson: _stringFromJson) this.userid = '',
    @JsonKey(name: 'user_level', fromJson: _stringFromJson) this.userLevel = '',
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson) this.joinAt,
    @JsonKey(fromJson: _doubleFromJson) this.bonus = 0,
    @JsonKey(fromJson: _intFromJson) this.upload = 0,
    @JsonKey(fromJson: _intFromJson) this.download = 0,
    @JsonKey(fromJson: _doubleFromJson) this.ratio = 0,
    @JsonKey(fromJson: _intFromJson) this.seeding = 0,
    @JsonKey(fromJson: _intFromJson) this.leeching = 0,
    @JsonKey(name: 'seeding_size', fromJson: _intFromJson) this.seedingSize = 0,
    @JsonKey(name: 'leeching_size', fromJson: _intFromJson)
    this.leechingSize = 0,
    @JsonKey(name: 'seeding_info', fromJson: _seedingInfoFromJson)
    final List<List<int>> seedingInfo = const [],
    @JsonKey(name: 'message_unread', fromJson: _intFromJson)
    this.messageUnread = 0,
    @JsonKey(name: 'message_unread_contents')
    final List<dynamic> messageUnreadContents = const [],
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) this.errMsg = '',
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
    this.updatedDay = '',
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
    this.updatedTime = '',
  }) : _seedingInfo = seedingInfo,
       _messageUnreadContents = messageUnreadContents;

  factory _$SiteUserDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteUserDataModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _stringFromJson)
  final String domain;
  @override
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  final String username;
  @override
  @JsonKey(name: 'userid', fromJson: _stringFromJson)
  final String userid;
  @override
  @JsonKey(name: 'user_level', fromJson: _stringFromJson)
  final String userLevel;
  @override
  @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson)
  final String? joinAt;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double bonus;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int upload;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int download;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double ratio;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int seeding;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int leeching;
  @override
  @JsonKey(name: 'seeding_size', fromJson: _intFromJson)
  final int seedingSize;
  @override
  @JsonKey(name: 'leeching_size', fromJson: _intFromJson)
  final int leechingSize;
  final List<List<int>> _seedingInfo;
  @override
  @JsonKey(name: 'seeding_info', fromJson: _seedingInfoFromJson)
  List<List<int>> get seedingInfo {
    if (_seedingInfo is EqualUnmodifiableListView) return _seedingInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seedingInfo);
  }

  @override
  @JsonKey(name: 'message_unread', fromJson: _intFromJson)
  final int messageUnread;
  final List<dynamic> _messageUnreadContents;
  @override
  @JsonKey(name: 'message_unread_contents')
  List<dynamic> get messageUnreadContents {
    if (_messageUnreadContents is EqualUnmodifiableListView)
      return _messageUnreadContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageUnreadContents);
  }

  @override
  @JsonKey(name: 'err_msg', fromJson: _stringFromJson)
  final String errMsg;
  @override
  @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
  final String updatedDay;
  @override
  @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
  final String updatedTime;

  @override
  String toString() {
    return 'SiteUserDataModel(domain: $domain, username: $username, userid: $userid, userLevel: $userLevel, joinAt: $joinAt, bonus: $bonus, upload: $upload, download: $download, ratio: $ratio, seeding: $seeding, leeching: $leeching, seedingSize: $seedingSize, leechingSize: $leechingSize, seedingInfo: $seedingInfo, messageUnread: $messageUnread, messageUnreadContents: $messageUnreadContents, errMsg: $errMsg, updatedDay: $updatedDay, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteUserDataModelImpl &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userid, userid) || other.userid == userid) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            (identical(other.joinAt, joinAt) || other.joinAt == joinAt) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            (identical(other.upload, upload) || other.upload == upload) &&
            (identical(other.download, download) ||
                other.download == download) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.seeding, seeding) || other.seeding == seeding) &&
            (identical(other.leeching, leeching) ||
                other.leeching == leeching) &&
            (identical(other.seedingSize, seedingSize) ||
                other.seedingSize == seedingSize) &&
            (identical(other.leechingSize, leechingSize) ||
                other.leechingSize == leechingSize) &&
            const DeepCollectionEquality().equals(
              other._seedingInfo,
              _seedingInfo,
            ) &&
            (identical(other.messageUnread, messageUnread) ||
                other.messageUnread == messageUnread) &&
            const DeepCollectionEquality().equals(
              other._messageUnreadContents,
              _messageUnreadContents,
            ) &&
            (identical(other.errMsg, errMsg) || other.errMsg == errMsg) &&
            (identical(other.updatedDay, updatedDay) ||
                other.updatedDay == updatedDay) &&
            (identical(other.updatedTime, updatedTime) ||
                other.updatedTime == updatedTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    domain,
    username,
    userid,
    userLevel,
    joinAt,
    bonus,
    upload,
    download,
    ratio,
    seeding,
    leeching,
    seedingSize,
    leechingSize,
    const DeepCollectionEquality().hash(_seedingInfo),
    messageUnread,
    const DeepCollectionEquality().hash(_messageUnreadContents),
    errMsg,
    updatedDay,
    updatedTime,
  ]);

  /// Create a copy of SiteUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteUserDataModelImplCopyWith<_$SiteUserDataModelImpl> get copyWith =>
      __$$SiteUserDataModelImplCopyWithImpl<_$SiteUserDataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteUserDataModelImplToJson(this);
  }
}

abstract class _SiteUserDataModel implements SiteUserDataModel {
  const factory _SiteUserDataModel({
    @JsonKey(fromJson: _stringFromJson) final String domain,
    @JsonKey(name: 'username', fromJson: _stringFromJson) final String username,
    @JsonKey(name: 'userid', fromJson: _stringFromJson) final String userid,
    @JsonKey(name: 'user_level', fromJson: _stringFromJson)
    final String userLevel,
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson)
    final String? joinAt,
    @JsonKey(fromJson: _doubleFromJson) final double bonus,
    @JsonKey(fromJson: _intFromJson) final int upload,
    @JsonKey(fromJson: _intFromJson) final int download,
    @JsonKey(fromJson: _doubleFromJson) final double ratio,
    @JsonKey(fromJson: _intFromJson) final int seeding,
    @JsonKey(fromJson: _intFromJson) final int leeching,
    @JsonKey(name: 'seeding_size', fromJson: _intFromJson)
    final int seedingSize,
    @JsonKey(name: 'leeching_size', fromJson: _intFromJson)
    final int leechingSize,
    @JsonKey(name: 'seeding_info', fromJson: _seedingInfoFromJson)
    final List<List<int>> seedingInfo,
    @JsonKey(name: 'message_unread', fromJson: _intFromJson)
    final int messageUnread,
    @JsonKey(name: 'message_unread_contents')
    final List<dynamic> messageUnreadContents,
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) final String errMsg,
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
    final String updatedDay,
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
    final String updatedTime,
  }) = _$SiteUserDataModelImpl;

  factory _SiteUserDataModel.fromJson(Map<String, dynamic> json) =
      _$SiteUserDataModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _stringFromJson)
  String get domain;
  @override
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  String get username;
  @override
  @JsonKey(name: 'userid', fromJson: _stringFromJson)
  String get userid;
  @override
  @JsonKey(name: 'user_level', fromJson: _stringFromJson)
  String get userLevel;
  @override
  @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson)
  String? get joinAt;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get bonus;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get upload;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get download;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get ratio;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get seeding;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get leeching;
  @override
  @JsonKey(name: 'seeding_size', fromJson: _intFromJson)
  int get seedingSize;
  @override
  @JsonKey(name: 'leeching_size', fromJson: _intFromJson)
  int get leechingSize;
  @override
  @JsonKey(name: 'seeding_info', fromJson: _seedingInfoFromJson)
  List<List<int>> get seedingInfo;
  @override
  @JsonKey(name: 'message_unread', fromJson: _intFromJson)
  int get messageUnread;
  @override
  @JsonKey(name: 'message_unread_contents')
  List<dynamic> get messageUnreadContents;
  @override
  @JsonKey(name: 'err_msg', fromJson: _stringFromJson)
  String get errMsg;
  @override
  @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
  String get updatedDay;
  @override
  @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
  String get updatedTime;

  /// Create a copy of SiteUserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteUserDataModelImplCopyWith<_$SiteUserDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SiteItem {
  SiteModel get site => throw _privateConstructorUsedError;
  String? get iconBase64 => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<int>? get iconBytes => throw _privateConstructorUsedError;
  SiteUserDataModel? get userData => throw _privateConstructorUsedError;

  /// Create a copy of SiteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteItemCopyWith<SiteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteItemCopyWith<$Res> {
  factory $SiteItemCopyWith(SiteItem value, $Res Function(SiteItem) then) =
      _$SiteItemCopyWithImpl<$Res, SiteItem>;
  @useResult
  $Res call({
    SiteModel site,
    String? iconBase64,
    @JsonKey(includeFromJson: false, includeToJson: false) List<int>? iconBytes,
    SiteUserDataModel? userData,
  });

  $SiteModelCopyWith<$Res> get site;
  $SiteUserDataModelCopyWith<$Res>? get userData;
}

/// @nodoc
class _$SiteItemCopyWithImpl<$Res, $Val extends SiteItem>
    implements $SiteItemCopyWith<$Res> {
  _$SiteItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = null,
    Object? iconBase64 = freezed,
    Object? iconBytes = freezed,
    Object? userData = freezed,
  }) {
    return _then(
      _value.copyWith(
            site: null == site
                ? _value.site
                : site // ignore: cast_nullable_to_non_nullable
                      as SiteModel,
            iconBase64: freezed == iconBase64
                ? _value.iconBase64
                : iconBase64 // ignore: cast_nullable_to_non_nullable
                      as String?,
            iconBytes: freezed == iconBytes
                ? _value.iconBytes
                : iconBytes // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            userData: freezed == userData
                ? _value.userData
                : userData // ignore: cast_nullable_to_non_nullable
                      as SiteUserDataModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of SiteItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SiteModelCopyWith<$Res> get site {
    return $SiteModelCopyWith<$Res>(_value.site, (value) {
      return _then(_value.copyWith(site: value) as $Val);
    });
  }

  /// Create a copy of SiteItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SiteUserDataModelCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $SiteUserDataModelCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SiteItemImplCopyWith<$Res>
    implements $SiteItemCopyWith<$Res> {
  factory _$$SiteItemImplCopyWith(
    _$SiteItemImpl value,
    $Res Function(_$SiteItemImpl) then,
  ) = __$$SiteItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SiteModel site,
    String? iconBase64,
    @JsonKey(includeFromJson: false, includeToJson: false) List<int>? iconBytes,
    SiteUserDataModel? userData,
  });

  @override
  $SiteModelCopyWith<$Res> get site;
  @override
  $SiteUserDataModelCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$SiteItemImplCopyWithImpl<$Res>
    extends _$SiteItemCopyWithImpl<$Res, _$SiteItemImpl>
    implements _$$SiteItemImplCopyWith<$Res> {
  __$$SiteItemImplCopyWithImpl(
    _$SiteItemImpl _value,
    $Res Function(_$SiteItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? site = null,
    Object? iconBase64 = freezed,
    Object? iconBytes = freezed,
    Object? userData = freezed,
  }) {
    return _then(
      _$SiteItemImpl(
        site: null == site
            ? _value.site
            : site // ignore: cast_nullable_to_non_nullable
                  as SiteModel,
        iconBase64: freezed == iconBase64
            ? _value.iconBase64
            : iconBase64 // ignore: cast_nullable_to_non_nullable
                  as String?,
        iconBytes: freezed == iconBytes
            ? _value._iconBytes
            : iconBytes // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        userData: freezed == userData
            ? _value.userData
            : userData // ignore: cast_nullable_to_non_nullable
                  as SiteUserDataModel?,
      ),
    );
  }
}

/// @nodoc

class _$SiteItemImpl implements _SiteItem {
  const _$SiteItemImpl({
    required this.site,
    this.iconBase64,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<int>? iconBytes,
    this.userData,
  }) : _iconBytes = iconBytes;

  @override
  final SiteModel site;
  @override
  final String? iconBase64;
  final List<int>? _iconBytes;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<int>? get iconBytes {
    final value = _iconBytes;
    if (value == null) return null;
    if (_iconBytes is EqualUnmodifiableListView) return _iconBytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SiteUserDataModel? userData;

  @override
  String toString() {
    return 'SiteItem(site: $site, iconBase64: $iconBase64, iconBytes: $iconBytes, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteItemImpl &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.iconBase64, iconBase64) ||
                other.iconBase64 == iconBase64) &&
            const DeepCollectionEquality().equals(
              other._iconBytes,
              _iconBytes,
            ) &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    site,
    iconBase64,
    const DeepCollectionEquality().hash(_iconBytes),
    userData,
  );

  /// Create a copy of SiteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteItemImplCopyWith<_$SiteItemImpl> get copyWith =>
      __$$SiteItemImplCopyWithImpl<_$SiteItemImpl>(this, _$identity);
}

abstract class _SiteItem implements SiteItem {
  const factory _SiteItem({
    required final SiteModel site,
    final String? iconBase64,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<int>? iconBytes,
    final SiteUserDataModel? userData,
  }) = _$SiteItemImpl;

  @override
  SiteModel get site;
  @override
  String? get iconBase64;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<int>? get iconBytes;
  @override
  SiteUserDataModel? get userData;

  /// Create a copy of SiteItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteItemImplCopyWith<_$SiteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SiteUserDataHistoryResponse _$SiteUserDataHistoryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SiteUserDataHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$SiteUserDataHistoryResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<SiteUserDataHistoryItem> get data => throw _privateConstructorUsedError;

  /// Serializes this SiteUserDataHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteUserDataHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteUserDataHistoryResponseCopyWith<SiteUserDataHistoryResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteUserDataHistoryResponseCopyWith<$Res> {
  factory $SiteUserDataHistoryResponseCopyWith(
    SiteUserDataHistoryResponse value,
    $Res Function(SiteUserDataHistoryResponse) then,
  ) =
      _$SiteUserDataHistoryResponseCopyWithImpl<
        $Res,
        SiteUserDataHistoryResponse
      >;
  @useResult
  $Res call({
    bool success,
    String? message,
    List<SiteUserDataHistoryItem> data,
  });
}

/// @nodoc
class _$SiteUserDataHistoryResponseCopyWithImpl<
  $Res,
  $Val extends SiteUserDataHistoryResponse
>
    implements $SiteUserDataHistoryResponseCopyWith<$Res> {
  _$SiteUserDataHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteUserDataHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<SiteUserDataHistoryItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteUserDataHistoryResponseImplCopyWith<$Res>
    implements $SiteUserDataHistoryResponseCopyWith<$Res> {
  factory _$$SiteUserDataHistoryResponseImplCopyWith(
    _$SiteUserDataHistoryResponseImpl value,
    $Res Function(_$SiteUserDataHistoryResponseImpl) then,
  ) = __$$SiteUserDataHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String? message,
    List<SiteUserDataHistoryItem> data,
  });
}

/// @nodoc
class __$$SiteUserDataHistoryResponseImplCopyWithImpl<$Res>
    extends
        _$SiteUserDataHistoryResponseCopyWithImpl<
          $Res,
          _$SiteUserDataHistoryResponseImpl
        >
    implements _$$SiteUserDataHistoryResponseImplCopyWith<$Res> {
  __$$SiteUserDataHistoryResponseImplCopyWithImpl(
    _$SiteUserDataHistoryResponseImpl _value,
    $Res Function(_$SiteUserDataHistoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteUserDataHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(
      _$SiteUserDataHistoryResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<SiteUserDataHistoryItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteUserDataHistoryResponseImpl
    implements _SiteUserDataHistoryResponse {
  const _$SiteUserDataHistoryResponseImpl({
    this.success = true,
    this.message,
    final List<SiteUserDataHistoryItem> data = const [],
  }) : _data = data;

  factory _$SiteUserDataHistoryResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SiteUserDataHistoryResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final String? message;
  final List<SiteUserDataHistoryItem> _data;
  @override
  @JsonKey()
  List<SiteUserDataHistoryItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SiteUserDataHistoryResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteUserDataHistoryResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of SiteUserDataHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteUserDataHistoryResponseImplCopyWith<_$SiteUserDataHistoryResponseImpl>
  get copyWith =>
      __$$SiteUserDataHistoryResponseImplCopyWithImpl<
        _$SiteUserDataHistoryResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteUserDataHistoryResponseImplToJson(this);
  }
}

abstract class _SiteUserDataHistoryResponse
    implements SiteUserDataHistoryResponse {
  const factory _SiteUserDataHistoryResponse({
    final bool success,
    final String? message,
    final List<SiteUserDataHistoryItem> data,
  }) = _$SiteUserDataHistoryResponseImpl;

  factory _SiteUserDataHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$SiteUserDataHistoryResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  List<SiteUserDataHistoryItem> get data;

  /// Create a copy of SiteUserDataHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteUserDataHistoryResponseImplCopyWith<_$SiteUserDataHistoryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SiteUserDataHistoryItem _$SiteUserDataHistoryItemFromJson(
  Map<String, dynamic> json,
) {
  return _SiteUserDataHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$SiteUserDataHistoryItem {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get domain => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'userid', fromJson: _stringFromJson)
  String get userid => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_level', fromJson: _stringFromJson)
  String get userLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson)
  String? get joinAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get bonus => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get upload => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get download => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get ratio => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get seeding => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double get leeching => throw _privateConstructorUsedError;
  @JsonKey(name: 'seeding_size', fromJson: _doubleFromJson)
  double get seedingSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'leeching_size', fromJson: _doubleFromJson)
  double get leechingSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'seeding_info')
  List<dynamic> get seedingInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_unread', fromJson: _intFromJson)
  int get messageUnread => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_unread_contents')
  List<dynamic> get messageUnreadContents => throw _privateConstructorUsedError;
  @JsonKey(name: 'err_msg', fromJson: _stringFromJson)
  String get errMsg => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
  String get updatedDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
  String get updatedTime => throw _privateConstructorUsedError;

  /// Serializes this SiteUserDataHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteUserDataHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteUserDataHistoryItemCopyWith<SiteUserDataHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteUserDataHistoryItemCopyWith<$Res> {
  factory $SiteUserDataHistoryItemCopyWith(
    SiteUserDataHistoryItem value,
    $Res Function(SiteUserDataHistoryItem) then,
  ) = _$SiteUserDataHistoryItemCopyWithImpl<$Res, SiteUserDataHistoryItem>;
  @useResult
  $Res call({
    int id,
    @JsonKey(fromJson: _stringFromJson) String domain,
    @JsonKey(fromJson: _stringFromJson) String name,
    @JsonKey(name: 'username', fromJson: _stringFromJson) String username,
    @JsonKey(name: 'userid', fromJson: _stringFromJson) String userid,
    @JsonKey(name: 'user_level', fromJson: _stringFromJson) String userLevel,
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson) String? joinAt,
    @JsonKey(fromJson: _doubleFromJson) double bonus,
    @JsonKey(fromJson: _doubleFromJson) double upload,
    @JsonKey(fromJson: _doubleFromJson) double download,
    @JsonKey(fromJson: _doubleFromJson) double ratio,
    @JsonKey(fromJson: _doubleFromJson) double seeding,
    @JsonKey(fromJson: _doubleFromJson) double leeching,
    @JsonKey(name: 'seeding_size', fromJson: _doubleFromJson)
    double seedingSize,
    @JsonKey(name: 'leeching_size', fromJson: _doubleFromJson)
    double leechingSize,
    @JsonKey(name: 'seeding_info') List<dynamic> seedingInfo,
    @JsonKey(name: 'message_unread', fromJson: _intFromJson) int messageUnread,
    @JsonKey(name: 'message_unread_contents')
    List<dynamic> messageUnreadContents,
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) String errMsg,
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson) String updatedDay,
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
    String updatedTime,
  });
}

/// @nodoc
class _$SiteUserDataHistoryItemCopyWithImpl<
  $Res,
  $Val extends SiteUserDataHistoryItem
>
    implements $SiteUserDataHistoryItemCopyWith<$Res> {
  _$SiteUserDataHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteUserDataHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? domain = null,
    Object? name = null,
    Object? username = null,
    Object? userid = null,
    Object? userLevel = null,
    Object? joinAt = freezed,
    Object? bonus = null,
    Object? upload = null,
    Object? download = null,
    Object? ratio = null,
    Object? seeding = null,
    Object? leeching = null,
    Object? seedingSize = null,
    Object? leechingSize = null,
    Object? seedingInfo = null,
    Object? messageUnread = null,
    Object? messageUnreadContents = null,
    Object? errMsg = null,
    Object? updatedDay = null,
    Object? updatedTime = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            domain: null == domain
                ? _value.domain
                : domain // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            userid: null == userid
                ? _value.userid
                : userid // ignore: cast_nullable_to_non_nullable
                      as String,
            userLevel: null == userLevel
                ? _value.userLevel
                : userLevel // ignore: cast_nullable_to_non_nullable
                      as String,
            joinAt: freezed == joinAt
                ? _value.joinAt
                : joinAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            bonus: null == bonus
                ? _value.bonus
                : bonus // ignore: cast_nullable_to_non_nullable
                      as double,
            upload: null == upload
                ? _value.upload
                : upload // ignore: cast_nullable_to_non_nullable
                      as double,
            download: null == download
                ? _value.download
                : download // ignore: cast_nullable_to_non_nullable
                      as double,
            ratio: null == ratio
                ? _value.ratio
                : ratio // ignore: cast_nullable_to_non_nullable
                      as double,
            seeding: null == seeding
                ? _value.seeding
                : seeding // ignore: cast_nullable_to_non_nullable
                      as double,
            leeching: null == leeching
                ? _value.leeching
                : leeching // ignore: cast_nullable_to_non_nullable
                      as double,
            seedingSize: null == seedingSize
                ? _value.seedingSize
                : seedingSize // ignore: cast_nullable_to_non_nullable
                      as double,
            leechingSize: null == leechingSize
                ? _value.leechingSize
                : leechingSize // ignore: cast_nullable_to_non_nullable
                      as double,
            seedingInfo: null == seedingInfo
                ? _value.seedingInfo
                : seedingInfo // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            messageUnread: null == messageUnread
                ? _value.messageUnread
                : messageUnread // ignore: cast_nullable_to_non_nullable
                      as int,
            messageUnreadContents: null == messageUnreadContents
                ? _value.messageUnreadContents
                : messageUnreadContents // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            errMsg: null == errMsg
                ? _value.errMsg
                : errMsg // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedDay: null == updatedDay
                ? _value.updatedDay
                : updatedDay // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedTime: null == updatedTime
                ? _value.updatedTime
                : updatedTime // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteUserDataHistoryItemImplCopyWith<$Res>
    implements $SiteUserDataHistoryItemCopyWith<$Res> {
  factory _$$SiteUserDataHistoryItemImplCopyWith(
    _$SiteUserDataHistoryItemImpl value,
    $Res Function(_$SiteUserDataHistoryItemImpl) then,
  ) = __$$SiteUserDataHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(fromJson: _stringFromJson) String domain,
    @JsonKey(fromJson: _stringFromJson) String name,
    @JsonKey(name: 'username', fromJson: _stringFromJson) String username,
    @JsonKey(name: 'userid', fromJson: _stringFromJson) String userid,
    @JsonKey(name: 'user_level', fromJson: _stringFromJson) String userLevel,
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson) String? joinAt,
    @JsonKey(fromJson: _doubleFromJson) double bonus,
    @JsonKey(fromJson: _doubleFromJson) double upload,
    @JsonKey(fromJson: _doubleFromJson) double download,
    @JsonKey(fromJson: _doubleFromJson) double ratio,
    @JsonKey(fromJson: _doubleFromJson) double seeding,
    @JsonKey(fromJson: _doubleFromJson) double leeching,
    @JsonKey(name: 'seeding_size', fromJson: _doubleFromJson)
    double seedingSize,
    @JsonKey(name: 'leeching_size', fromJson: _doubleFromJson)
    double leechingSize,
    @JsonKey(name: 'seeding_info') List<dynamic> seedingInfo,
    @JsonKey(name: 'message_unread', fromJson: _intFromJson) int messageUnread,
    @JsonKey(name: 'message_unread_contents')
    List<dynamic> messageUnreadContents,
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) String errMsg,
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson) String updatedDay,
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
    String updatedTime,
  });
}

/// @nodoc
class __$$SiteUserDataHistoryItemImplCopyWithImpl<$Res>
    extends
        _$SiteUserDataHistoryItemCopyWithImpl<
          $Res,
          _$SiteUserDataHistoryItemImpl
        >
    implements _$$SiteUserDataHistoryItemImplCopyWith<$Res> {
  __$$SiteUserDataHistoryItemImplCopyWithImpl(
    _$SiteUserDataHistoryItemImpl _value,
    $Res Function(_$SiteUserDataHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteUserDataHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? domain = null,
    Object? name = null,
    Object? username = null,
    Object? userid = null,
    Object? userLevel = null,
    Object? joinAt = freezed,
    Object? bonus = null,
    Object? upload = null,
    Object? download = null,
    Object? ratio = null,
    Object? seeding = null,
    Object? leeching = null,
    Object? seedingSize = null,
    Object? leechingSize = null,
    Object? seedingInfo = null,
    Object? messageUnread = null,
    Object? messageUnreadContents = null,
    Object? errMsg = null,
    Object? updatedDay = null,
    Object? updatedTime = null,
  }) {
    return _then(
      _$SiteUserDataHistoryItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        domain: null == domain
            ? _value.domain
            : domain // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        userid: null == userid
            ? _value.userid
            : userid // ignore: cast_nullable_to_non_nullable
                  as String,
        userLevel: null == userLevel
            ? _value.userLevel
            : userLevel // ignore: cast_nullable_to_non_nullable
                  as String,
        joinAt: freezed == joinAt
            ? _value.joinAt
            : joinAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        bonus: null == bonus
            ? _value.bonus
            : bonus // ignore: cast_nullable_to_non_nullable
                  as double,
        upload: null == upload
            ? _value.upload
            : upload // ignore: cast_nullable_to_non_nullable
                  as double,
        download: null == download
            ? _value.download
            : download // ignore: cast_nullable_to_non_nullable
                  as double,
        ratio: null == ratio
            ? _value.ratio
            : ratio // ignore: cast_nullable_to_non_nullable
                  as double,
        seeding: null == seeding
            ? _value.seeding
            : seeding // ignore: cast_nullable_to_non_nullable
                  as double,
        leeching: null == leeching
            ? _value.leeching
            : leeching // ignore: cast_nullable_to_non_nullable
                  as double,
        seedingSize: null == seedingSize
            ? _value.seedingSize
            : seedingSize // ignore: cast_nullable_to_non_nullable
                  as double,
        leechingSize: null == leechingSize
            ? _value.leechingSize
            : leechingSize // ignore: cast_nullable_to_non_nullable
                  as double,
        seedingInfo: null == seedingInfo
            ? _value._seedingInfo
            : seedingInfo // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        messageUnread: null == messageUnread
            ? _value.messageUnread
            : messageUnread // ignore: cast_nullable_to_non_nullable
                  as int,
        messageUnreadContents: null == messageUnreadContents
            ? _value._messageUnreadContents
            : messageUnreadContents // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        errMsg: null == errMsg
            ? _value.errMsg
            : errMsg // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedDay: null == updatedDay
            ? _value.updatedDay
            : updatedDay // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedTime: null == updatedTime
            ? _value.updatedTime
            : updatedTime // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteUserDataHistoryItemImpl implements _SiteUserDataHistoryItem {
  const _$SiteUserDataHistoryItemImpl({
    required this.id,
    @JsonKey(fromJson: _stringFromJson) this.domain = '',
    @JsonKey(fromJson: _stringFromJson) this.name = '',
    @JsonKey(name: 'username', fromJson: _stringFromJson) this.username = '',
    @JsonKey(name: 'userid', fromJson: _stringFromJson) this.userid = '',
    @JsonKey(name: 'user_level', fromJson: _stringFromJson) this.userLevel = '',
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson) this.joinAt,
    @JsonKey(fromJson: _doubleFromJson) this.bonus = 0,
    @JsonKey(fromJson: _doubleFromJson) this.upload = 0,
    @JsonKey(fromJson: _doubleFromJson) this.download = 0,
    @JsonKey(fromJson: _doubleFromJson) this.ratio = 0,
    @JsonKey(fromJson: _doubleFromJson) this.seeding = 0,
    @JsonKey(fromJson: _doubleFromJson) this.leeching = 0,
    @JsonKey(name: 'seeding_size', fromJson: _doubleFromJson)
    this.seedingSize = 0,
    @JsonKey(name: 'leeching_size', fromJson: _doubleFromJson)
    this.leechingSize = 0,
    @JsonKey(name: 'seeding_info') final List<dynamic> seedingInfo = const [],
    @JsonKey(name: 'message_unread', fromJson: _intFromJson)
    this.messageUnread = 0,
    @JsonKey(name: 'message_unread_contents')
    final List<dynamic> messageUnreadContents = const [],
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) this.errMsg = '',
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
    this.updatedDay = '',
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
    this.updatedTime = '',
  }) : _seedingInfo = seedingInfo,
       _messageUnreadContents = messageUnreadContents;

  factory _$SiteUserDataHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteUserDataHistoryItemImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String domain;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String name;
  @override
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  final String username;
  @override
  @JsonKey(name: 'userid', fromJson: _stringFromJson)
  final String userid;
  @override
  @JsonKey(name: 'user_level', fromJson: _stringFromJson)
  final String userLevel;
  @override
  @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson)
  final String? joinAt;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double bonus;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double upload;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double download;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double ratio;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double seeding;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double leeching;
  @override
  @JsonKey(name: 'seeding_size', fromJson: _doubleFromJson)
  final double seedingSize;
  @override
  @JsonKey(name: 'leeching_size', fromJson: _doubleFromJson)
  final double leechingSize;
  final List<dynamic> _seedingInfo;
  @override
  @JsonKey(name: 'seeding_info')
  List<dynamic> get seedingInfo {
    if (_seedingInfo is EqualUnmodifiableListView) return _seedingInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seedingInfo);
  }

  @override
  @JsonKey(name: 'message_unread', fromJson: _intFromJson)
  final int messageUnread;
  final List<dynamic> _messageUnreadContents;
  @override
  @JsonKey(name: 'message_unread_contents')
  List<dynamic> get messageUnreadContents {
    if (_messageUnreadContents is EqualUnmodifiableListView)
      return _messageUnreadContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageUnreadContents);
  }

  @override
  @JsonKey(name: 'err_msg', fromJson: _stringFromJson)
  final String errMsg;
  @override
  @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
  final String updatedDay;
  @override
  @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
  final String updatedTime;

  @override
  String toString() {
    return 'SiteUserDataHistoryItem(id: $id, domain: $domain, name: $name, username: $username, userid: $userid, userLevel: $userLevel, joinAt: $joinAt, bonus: $bonus, upload: $upload, download: $download, ratio: $ratio, seeding: $seeding, leeching: $leeching, seedingSize: $seedingSize, leechingSize: $leechingSize, seedingInfo: $seedingInfo, messageUnread: $messageUnread, messageUnreadContents: $messageUnreadContents, errMsg: $errMsg, updatedDay: $updatedDay, updatedTime: $updatedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteUserDataHistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userid, userid) || other.userid == userid) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            (identical(other.joinAt, joinAt) || other.joinAt == joinAt) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            (identical(other.upload, upload) || other.upload == upload) &&
            (identical(other.download, download) ||
                other.download == download) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.seeding, seeding) || other.seeding == seeding) &&
            (identical(other.leeching, leeching) ||
                other.leeching == leeching) &&
            (identical(other.seedingSize, seedingSize) ||
                other.seedingSize == seedingSize) &&
            (identical(other.leechingSize, leechingSize) ||
                other.leechingSize == leechingSize) &&
            const DeepCollectionEquality().equals(
              other._seedingInfo,
              _seedingInfo,
            ) &&
            (identical(other.messageUnread, messageUnread) ||
                other.messageUnread == messageUnread) &&
            const DeepCollectionEquality().equals(
              other._messageUnreadContents,
              _messageUnreadContents,
            ) &&
            (identical(other.errMsg, errMsg) || other.errMsg == errMsg) &&
            (identical(other.updatedDay, updatedDay) ||
                other.updatedDay == updatedDay) &&
            (identical(other.updatedTime, updatedTime) ||
                other.updatedTime == updatedTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    domain,
    name,
    username,
    userid,
    userLevel,
    joinAt,
    bonus,
    upload,
    download,
    ratio,
    seeding,
    leeching,
    seedingSize,
    leechingSize,
    const DeepCollectionEquality().hash(_seedingInfo),
    messageUnread,
    const DeepCollectionEquality().hash(_messageUnreadContents),
    errMsg,
    updatedDay,
    updatedTime,
  ]);

  /// Create a copy of SiteUserDataHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteUserDataHistoryItemImplCopyWith<_$SiteUserDataHistoryItemImpl>
  get copyWith =>
      __$$SiteUserDataHistoryItemImplCopyWithImpl<
        _$SiteUserDataHistoryItemImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteUserDataHistoryItemImplToJson(this);
  }
}

abstract class _SiteUserDataHistoryItem implements SiteUserDataHistoryItem {
  const factory _SiteUserDataHistoryItem({
    required final int id,
    @JsonKey(fromJson: _stringFromJson) final String domain,
    @JsonKey(fromJson: _stringFromJson) final String name,
    @JsonKey(name: 'username', fromJson: _stringFromJson) final String username,
    @JsonKey(name: 'userid', fromJson: _stringFromJson) final String userid,
    @JsonKey(name: 'user_level', fromJson: _stringFromJson)
    final String userLevel,
    @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson)
    final String? joinAt,
    @JsonKey(fromJson: _doubleFromJson) final double bonus,
    @JsonKey(fromJson: _doubleFromJson) final double upload,
    @JsonKey(fromJson: _doubleFromJson) final double download,
    @JsonKey(fromJson: _doubleFromJson) final double ratio,
    @JsonKey(fromJson: _doubleFromJson) final double seeding,
    @JsonKey(fromJson: _doubleFromJson) final double leeching,
    @JsonKey(name: 'seeding_size', fromJson: _doubleFromJson)
    final double seedingSize,
    @JsonKey(name: 'leeching_size', fromJson: _doubleFromJson)
    final double leechingSize,
    @JsonKey(name: 'seeding_info') final List<dynamic> seedingInfo,
    @JsonKey(name: 'message_unread', fromJson: _intFromJson)
    final int messageUnread,
    @JsonKey(name: 'message_unread_contents')
    final List<dynamic> messageUnreadContents,
    @JsonKey(name: 'err_msg', fromJson: _stringFromJson) final String errMsg,
    @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
    final String updatedDay,
    @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
    final String updatedTime,
  }) = _$SiteUserDataHistoryItemImpl;

  factory _SiteUserDataHistoryItem.fromJson(Map<String, dynamic> json) =
      _$SiteUserDataHistoryItemImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get domain;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get name;
  @override
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  String get username;
  @override
  @JsonKey(name: 'userid', fromJson: _stringFromJson)
  String get userid;
  @override
  @JsonKey(name: 'user_level', fromJson: _stringFromJson)
  String get userLevel;
  @override
  @JsonKey(name: 'join_at', fromJson: _stringNullableFromJson)
  String? get joinAt;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get bonus;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get upload;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get download;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get ratio;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get seeding;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double get leeching;
  @override
  @JsonKey(name: 'seeding_size', fromJson: _doubleFromJson)
  double get seedingSize;
  @override
  @JsonKey(name: 'leeching_size', fromJson: _doubleFromJson)
  double get leechingSize;
  @override
  @JsonKey(name: 'seeding_info')
  List<dynamic> get seedingInfo;
  @override
  @JsonKey(name: 'message_unread', fromJson: _intFromJson)
  int get messageUnread;
  @override
  @JsonKey(name: 'message_unread_contents')
  List<dynamic> get messageUnreadContents;
  @override
  @JsonKey(name: 'err_msg', fromJson: _stringFromJson)
  String get errMsg;
  @override
  @JsonKey(name: 'updated_day', fromJson: _stringFromJson)
  String get updatedDay;
  @override
  @JsonKey(name: 'updated_time', fromJson: _stringFromJson)
  String get updatedTime;

  /// Create a copy of SiteUserDataHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteUserDataHistoryItemImplCopyWith<_$SiteUserDataHistoryItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}
