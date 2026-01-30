// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mediaserver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MediaServerConfig _$MediaServerConfigFromJson(Map<String, dynamic> json) {
  return _MediaServerConfig.fromJson(json);
}

/// @nodoc
mixin _$MediaServerConfig {
  /// 主机地址
  String get host => throw _privateConstructorUsedError;

  /// 播放地址
  String get play_host => throw _privateConstructorUsedError;

  /// 用户名
  String get username => throw _privateConstructorUsedError;

  /// API密钥
  String get apikey => throw _privateConstructorUsedError;

  /// Serializes this MediaServerConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaServerConfigCopyWith<MediaServerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaServerConfigCopyWith<$Res> {
  factory $MediaServerConfigCopyWith(
    MediaServerConfig value,
    $Res Function(MediaServerConfig) then,
  ) = _$MediaServerConfigCopyWithImpl<$Res, MediaServerConfig>;
  @useResult
  $Res call({String host, String play_host, String username, String apikey});
}

/// @nodoc
class _$MediaServerConfigCopyWithImpl<$Res, $Val extends MediaServerConfig>
    implements $MediaServerConfigCopyWith<$Res> {
  _$MediaServerConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? play_host = null,
    Object? username = null,
    Object? apikey = null,
  }) {
    return _then(
      _value.copyWith(
            host: null == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                      as String,
            play_host: null == play_host
                ? _value.play_host
                : play_host // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            apikey: null == apikey
                ? _value.apikey
                : apikey // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaServerConfigImplCopyWith<$Res>
    implements $MediaServerConfigCopyWith<$Res> {
  factory _$$MediaServerConfigImplCopyWith(
    _$MediaServerConfigImpl value,
    $Res Function(_$MediaServerConfigImpl) then,
  ) = __$$MediaServerConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String host, String play_host, String username, String apikey});
}

/// @nodoc
class __$$MediaServerConfigImplCopyWithImpl<$Res>
    extends _$MediaServerConfigCopyWithImpl<$Res, _$MediaServerConfigImpl>
    implements _$$MediaServerConfigImplCopyWith<$Res> {
  __$$MediaServerConfigImplCopyWithImpl(
    _$MediaServerConfigImpl _value,
    $Res Function(_$MediaServerConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? play_host = null,
    Object? username = null,
    Object? apikey = null,
  }) {
    return _then(
      _$MediaServerConfigImpl(
        host: null == host
            ? _value.host
            : host // ignore: cast_nullable_to_non_nullable
                  as String,
        play_host: null == play_host
            ? _value.play_host
            : play_host // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        apikey: null == apikey
            ? _value.apikey
            : apikey // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaServerConfigImpl implements _MediaServerConfig {
  const _$MediaServerConfigImpl({
    this.host = '',
    this.play_host = '',
    this.username = '',
    this.apikey = '',
  });

  factory _$MediaServerConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaServerConfigImplFromJson(json);

  /// 主机地址
  @override
  @JsonKey()
  final String host;

  /// 播放地址
  @override
  @JsonKey()
  final String play_host;

  /// 用户名
  @override
  @JsonKey()
  final String username;

  /// API密钥
  @override
  @JsonKey()
  final String apikey;

  @override
  String toString() {
    return 'MediaServerConfig(host: $host, play_host: $play_host, username: $username, apikey: $apikey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaServerConfigImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.play_host, play_host) ||
                other.play_host == play_host) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.apikey, apikey) || other.apikey == apikey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, host, play_host, username, apikey);

  /// Create a copy of MediaServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaServerConfigImplCopyWith<_$MediaServerConfigImpl> get copyWith =>
      __$$MediaServerConfigImplCopyWithImpl<_$MediaServerConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaServerConfigImplToJson(this);
  }
}

abstract class _MediaServerConfig implements MediaServerConfig {
  const factory _MediaServerConfig({
    final String host,
    final String play_host,
    final String username,
    final String apikey,
  }) = _$MediaServerConfigImpl;

  factory _MediaServerConfig.fromJson(Map<String, dynamic> json) =
      _$MediaServerConfigImpl.fromJson;

  /// 主机地址
  @override
  String get host;

  /// 播放地址
  @override
  String get play_host;

  /// 用户名
  @override
  String get username;

  /// API密钥
  @override
  String get apikey;

  /// Create a copy of MediaServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaServerConfigImplCopyWith<_$MediaServerConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaServer _$MediaServerFromJson(Map<String, dynamic> json) {
  return _MediaServer.fromJson(json);
}

/// @nodoc
mixin _$MediaServer {
  /// 名称
  String get name => throw _privateConstructorUsedError;

  /// 类型
  String get type => throw _privateConstructorUsedError;

  /// 是否启用
  bool get enabled => throw _privateConstructorUsedError;

  /// 配置
  MediaServerConfig get config => throw _privateConstructorUsedError;

  /// 同步的库
  List<String> get sync_libraries => throw _privateConstructorUsedError;

  /// Serializes this MediaServer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaServer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaServerCopyWith<MediaServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaServerCopyWith<$Res> {
  factory $MediaServerCopyWith(
    MediaServer value,
    $Res Function(MediaServer) then,
  ) = _$MediaServerCopyWithImpl<$Res, MediaServer>;
  @useResult
  $Res call({
    String name,
    String type,
    bool enabled,
    MediaServerConfig config,
    List<String> sync_libraries,
  });

  $MediaServerConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$MediaServerCopyWithImpl<$Res, $Val extends MediaServer>
    implements $MediaServerCopyWith<$Res> {
  _$MediaServerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaServer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? enabled = null,
    Object? config = null,
    Object? sync_libraries = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as MediaServerConfig,
            sync_libraries: null == sync_libraries
                ? _value.sync_libraries
                : sync_libraries // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of MediaServer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaServerConfigCopyWith<$Res> get config {
    return $MediaServerConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaServerImplCopyWith<$Res>
    implements $MediaServerCopyWith<$Res> {
  factory _$$MediaServerImplCopyWith(
    _$MediaServerImpl value,
    $Res Function(_$MediaServerImpl) then,
  ) = __$$MediaServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String type,
    bool enabled,
    MediaServerConfig config,
    List<String> sync_libraries,
  });

  @override
  $MediaServerConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$MediaServerImplCopyWithImpl<$Res>
    extends _$MediaServerCopyWithImpl<$Res, _$MediaServerImpl>
    implements _$$MediaServerImplCopyWith<$Res> {
  __$$MediaServerImplCopyWithImpl(
    _$MediaServerImpl _value,
    $Res Function(_$MediaServerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaServer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? enabled = null,
    Object? config = null,
    Object? sync_libraries = null,
  }) {
    return _then(
      _$MediaServerImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        config: null == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as MediaServerConfig,
        sync_libraries: null == sync_libraries
            ? _value._sync_libraries
            : sync_libraries // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaServerImpl implements _MediaServer {
  const _$MediaServerImpl({
    this.name = '',
    this.type = '',
    this.enabled = false,
    this.config = const MediaServerConfig(),
    final List<String> sync_libraries = const [],
  }) : _sync_libraries = sync_libraries;

  factory _$MediaServerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaServerImplFromJson(json);

  /// 名称
  @override
  @JsonKey()
  final String name;

  /// 类型
  @override
  @JsonKey()
  final String type;

  /// 是否启用
  @override
  @JsonKey()
  final bool enabled;

  /// 配置
  @override
  @JsonKey()
  final MediaServerConfig config;

  /// 同步的库
  final List<String> _sync_libraries;

  /// 同步的库
  @override
  @JsonKey()
  List<String> get sync_libraries {
    if (_sync_libraries is EqualUnmodifiableListView) return _sync_libraries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sync_libraries);
  }

  @override
  String toString() {
    return 'MediaServer(name: $name, type: $type, enabled: $enabled, config: $config, sync_libraries: $sync_libraries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaServerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality().equals(
              other._sync_libraries,
              _sync_libraries,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    type,
    enabled,
    config,
    const DeepCollectionEquality().hash(_sync_libraries),
  );

  /// Create a copy of MediaServer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaServerImplCopyWith<_$MediaServerImpl> get copyWith =>
      __$$MediaServerImplCopyWithImpl<_$MediaServerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaServerImplToJson(this);
  }
}

abstract class _MediaServer implements MediaServer {
  const factory _MediaServer({
    final String name,
    final String type,
    final bool enabled,
    final MediaServerConfig config,
    final List<String> sync_libraries,
  }) = _$MediaServerImpl;

  factory _MediaServer.fromJson(Map<String, dynamic> json) =
      _$MediaServerImpl.fromJson;

  /// 名称
  @override
  String get name;

  /// 类型
  @override
  String get type;

  /// 是否启用
  @override
  bool get enabled;

  /// 配置
  @override
  MediaServerConfig get config;

  /// 同步的库
  @override
  List<String> get sync_libraries;

  /// Create a copy of MediaServer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaServerImplCopyWith<_$MediaServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaServerResponse _$MediaServerResponseFromJson(Map<String, dynamic> json) {
  return _MediaServerResponse.fromJson(json);
}

/// @nodoc
mixin _$MediaServerResponse {
  /// 是否成功
  bool get success => throw _privateConstructorUsedError;

  /// 消息
  String? get message => throw _privateConstructorUsedError;

  /// 数据
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this MediaServerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaServerResponseCopyWith<MediaServerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaServerResponseCopyWith<$Res> {
  factory $MediaServerResponseCopyWith(
    MediaServerResponse value,
    $Res Function(MediaServerResponse) then,
  ) = _$MediaServerResponseCopyWithImpl<$Res, MediaServerResponse>;
  @useResult
  $Res call({bool success, String? message, Map<String, dynamic> data});
}

/// @nodoc
class _$MediaServerResponseCopyWithImpl<$Res, $Val extends MediaServerResponse>
    implements $MediaServerResponseCopyWith<$Res> {
  _$MediaServerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaServerResponse
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
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaServerResponseImplCopyWith<$Res>
    implements $MediaServerResponseCopyWith<$Res> {
  factory _$$MediaServerResponseImplCopyWith(
    _$MediaServerResponseImpl value,
    $Res Function(_$MediaServerResponseImpl) then,
  ) = __$$MediaServerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, Map<String, dynamic> data});
}

/// @nodoc
class __$$MediaServerResponseImplCopyWithImpl<$Res>
    extends _$MediaServerResponseCopyWithImpl<$Res, _$MediaServerResponseImpl>
    implements _$$MediaServerResponseImplCopyWith<$Res> {
  __$$MediaServerResponseImplCopyWithImpl(
    _$MediaServerResponseImpl _value,
    $Res Function(_$MediaServerResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(
      _$MediaServerResponseImpl(
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
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaServerResponseImpl implements _MediaServerResponse {
  const _$MediaServerResponseImpl({
    this.success = false,
    this.message,
    final Map<String, dynamic> data = const {},
  }) : _data = data;

  factory _$MediaServerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaServerResponseImplFromJson(json);

  /// 是否成功
  @override
  @JsonKey()
  final bool success;

  /// 消息
  @override
  final String? message;

  /// 数据
  final Map<String, dynamic> _data;

  /// 数据
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'MediaServerResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaServerResponseImpl &&
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

  /// Create a copy of MediaServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaServerResponseImplCopyWith<_$MediaServerResponseImpl> get copyWith =>
      __$$MediaServerResponseImplCopyWithImpl<_$MediaServerResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaServerResponseImplToJson(this);
  }
}

abstract class _MediaServerResponse implements MediaServerResponse {
  const factory _MediaServerResponse({
    final bool success,
    final String? message,
    final Map<String, dynamic> data,
  }) = _$MediaServerResponseImpl;

  factory _MediaServerResponse.fromJson(Map<String, dynamic> json) =
      _$MediaServerResponseImpl.fromJson;

  /// 是否成功
  @override
  bool get success;

  /// 消息
  @override
  String? get message;

  /// 数据
  @override
  Map<String, dynamic> get data;

  /// Create a copy of MediaServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaServerResponseImplCopyWith<_$MediaServerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
