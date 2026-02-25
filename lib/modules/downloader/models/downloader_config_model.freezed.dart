// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloader_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PathMapping _$PathMappingFromJson(Map<String, dynamic> json) {
  return _PathMapping.fromJson(json);
}

/// @nodoc
mixin _$PathMapping {
  @JsonKey(name: 'from', fromJson: _stringFromJson)
  String get fromPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'to', fromJson: _stringFromJson)
  String get toPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage', fromJson: _stringFromJson)
  String get storage => throw _privateConstructorUsedError;

  /// Serializes this PathMapping to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PathMapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PathMappingCopyWith<PathMapping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathMappingCopyWith<$Res> {
  factory $PathMappingCopyWith(
    PathMapping value,
    $Res Function(PathMapping) then,
  ) = _$PathMappingCopyWithImpl<$Res, PathMapping>;
  @useResult
  $Res call({
    @JsonKey(name: 'from', fromJson: _stringFromJson) String fromPath,
    @JsonKey(name: 'to', fromJson: _stringFromJson) String toPath,
    @JsonKey(name: 'storage', fromJson: _stringFromJson) String storage,
  });
}

/// @nodoc
class _$PathMappingCopyWithImpl<$Res, $Val extends PathMapping>
    implements $PathMappingCopyWith<$Res> {
  _$PathMappingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PathMapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromPath = null,
    Object? toPath = null,
    Object? storage = null,
  }) {
    return _then(
      _value.copyWith(
            fromPath: null == fromPath
                ? _value.fromPath
                : fromPath // ignore: cast_nullable_to_non_nullable
                      as String,
            toPath: null == toPath
                ? _value.toPath
                : toPath // ignore: cast_nullable_to_non_nullable
                      as String,
            storage: null == storage
                ? _value.storage
                : storage // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PathMappingImplCopyWith<$Res>
    implements $PathMappingCopyWith<$Res> {
  factory _$$PathMappingImplCopyWith(
    _$PathMappingImpl value,
    $Res Function(_$PathMappingImpl) then,
  ) = __$$PathMappingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'from', fromJson: _stringFromJson) String fromPath,
    @JsonKey(name: 'to', fromJson: _stringFromJson) String toPath,
    @JsonKey(name: 'storage', fromJson: _stringFromJson) String storage,
  });
}

/// @nodoc
class __$$PathMappingImplCopyWithImpl<$Res>
    extends _$PathMappingCopyWithImpl<$Res, _$PathMappingImpl>
    implements _$$PathMappingImplCopyWith<$Res> {
  __$$PathMappingImplCopyWithImpl(
    _$PathMappingImpl _value,
    $Res Function(_$PathMappingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PathMapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromPath = null,
    Object? toPath = null,
    Object? storage = null,
  }) {
    return _then(
      _$PathMappingImpl(
        fromPath: null == fromPath
            ? _value.fromPath
            : fromPath // ignore: cast_nullable_to_non_nullable
                  as String,
        toPath: null == toPath
            ? _value.toPath
            : toPath // ignore: cast_nullable_to_non_nullable
                  as String,
        storage: null == storage
            ? _value.storage
            : storage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PathMappingImpl implements _PathMapping {
  const _$PathMappingImpl({
    @JsonKey(name: 'from', fromJson: _stringFromJson) this.fromPath = '',
    @JsonKey(name: 'to', fromJson: _stringFromJson) this.toPath = '',
    @JsonKey(name: 'storage', fromJson: _stringFromJson) this.storage = 'local',
  });

  factory _$PathMappingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PathMappingImplFromJson(json);

  @override
  @JsonKey(name: 'from', fromJson: _stringFromJson)
  final String fromPath;
  @override
  @JsonKey(name: 'to', fromJson: _stringFromJson)
  final String toPath;
  @override
  @JsonKey(name: 'storage', fromJson: _stringFromJson)
  final String storage;

  @override
  String toString() {
    return 'PathMapping(fromPath: $fromPath, toPath: $toPath, storage: $storage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathMappingImpl &&
            (identical(other.fromPath, fromPath) ||
                other.fromPath == fromPath) &&
            (identical(other.toPath, toPath) || other.toPath == toPath) &&
            (identical(other.storage, storage) || other.storage == storage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fromPath, toPath, storage);

  /// Create a copy of PathMapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PathMappingImplCopyWith<_$PathMappingImpl> get copyWith =>
      __$$PathMappingImplCopyWithImpl<_$PathMappingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PathMappingImplToJson(this);
  }
}

abstract class _PathMapping implements PathMapping {
  const factory _PathMapping({
    @JsonKey(name: 'from', fromJson: _stringFromJson) final String fromPath,
    @JsonKey(name: 'to', fromJson: _stringFromJson) final String toPath,
    @JsonKey(name: 'storage', fromJson: _stringFromJson) final String storage,
  }) = _$PathMappingImpl;

  factory _PathMapping.fromJson(Map<String, dynamic> json) =
      _$PathMappingImpl.fromJson;

  @override
  @JsonKey(name: 'from', fromJson: _stringFromJson)
  String get fromPath;
  @override
  @JsonKey(name: 'to', fromJson: _stringFromJson)
  String get toPath;
  @override
  @JsonKey(name: 'storage', fromJson: _stringFromJson)
  String get storage;

  /// Create a copy of PathMapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PathMappingImplCopyWith<_$PathMappingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DownloaderConfig _$DownloaderConfigFromJson(Map<String, dynamic> json) {
  return _DownloaderConfig.fromJson(json);
}

/// @nodoc
mixin _$DownloaderConfig {
  @JsonKey(fromJson: _stringFromJson)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromJson)
  bool get enabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'default', fromJson: _boolFromJson)
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'host', fromJson: _stringFromJson)
  String get host => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'password', fromJson: _stringFromJson)
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto_category', fromJson: _boolFromJson)
  bool get autoCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequential', fromJson: _boolFromJson)
  bool get sequential => throw _privateConstructorUsedError;
  @JsonKey(name: 'force_resume', fromJson: _boolFromJson)
  bool get forceResume => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_last_priority', fromJson: _boolFromJson)
  bool get firstLastPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'path_mappings', fromJson: _pathMappingsFromJson)
  List<PathMapping> get pathMappings => throw _privateConstructorUsedError;

  /// Serializes this DownloaderConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DownloaderConfigCopyWith<DownloaderConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloaderConfigCopyWith<$Res> {
  factory $DownloaderConfigCopyWith(
    DownloaderConfig value,
    $Res Function(DownloaderConfig) then,
  ) = _$DownloaderConfigCopyWithImpl<$Res, DownloaderConfig>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringFromJson) String name,
    @JsonKey(fromJson: _stringFromJson) String type,
    @JsonKey(fromJson: _boolFromJson) bool enabled,
    @JsonKey(name: 'default', fromJson: _boolFromJson) bool isDefault,
    @JsonKey(name: 'host', fromJson: _stringFromJson) String host,
    @JsonKey(name: 'username', fromJson: _stringFromJson) String username,
    @JsonKey(name: 'password', fromJson: _stringFromJson) String password,
    @JsonKey(name: 'auto_category', fromJson: _boolFromJson) bool autoCategory,
    @JsonKey(name: 'sequential', fromJson: _boolFromJson) bool sequential,
    @JsonKey(name: 'force_resume', fromJson: _boolFromJson) bool forceResume,
    @JsonKey(name: 'first_last_priority', fromJson: _boolFromJson)
    bool firstLastPriority,
    @JsonKey(name: 'path_mappings', fromJson: _pathMappingsFromJson)
    List<PathMapping> pathMappings,
  });
}

/// @nodoc
class _$DownloaderConfigCopyWithImpl<$Res, $Val extends DownloaderConfig>
    implements $DownloaderConfigCopyWith<$Res> {
  _$DownloaderConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? enabled = null,
    Object? isDefault = null,
    Object? host = null,
    Object? username = null,
    Object? password = null,
    Object? autoCategory = null,
    Object? sequential = null,
    Object? forceResume = null,
    Object? firstLastPriority = null,
    Object? pathMappings = null,
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
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
            host: null == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            autoCategory: null == autoCategory
                ? _value.autoCategory
                : autoCategory // ignore: cast_nullable_to_non_nullable
                      as bool,
            sequential: null == sequential
                ? _value.sequential
                : sequential // ignore: cast_nullable_to_non_nullable
                      as bool,
            forceResume: null == forceResume
                ? _value.forceResume
                : forceResume // ignore: cast_nullable_to_non_nullable
                      as bool,
            firstLastPriority: null == firstLastPriority
                ? _value.firstLastPriority
                : firstLastPriority // ignore: cast_nullable_to_non_nullable
                      as bool,
            pathMappings: null == pathMappings
                ? _value.pathMappings
                : pathMappings // ignore: cast_nullable_to_non_nullable
                      as List<PathMapping>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DownloaderConfigImplCopyWith<$Res>
    implements $DownloaderConfigCopyWith<$Res> {
  factory _$$DownloaderConfigImplCopyWith(
    _$DownloaderConfigImpl value,
    $Res Function(_$DownloaderConfigImpl) then,
  ) = __$$DownloaderConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringFromJson) String name,
    @JsonKey(fromJson: _stringFromJson) String type,
    @JsonKey(fromJson: _boolFromJson) bool enabled,
    @JsonKey(name: 'default', fromJson: _boolFromJson) bool isDefault,
    @JsonKey(name: 'host', fromJson: _stringFromJson) String host,
    @JsonKey(name: 'username', fromJson: _stringFromJson) String username,
    @JsonKey(name: 'password', fromJson: _stringFromJson) String password,
    @JsonKey(name: 'auto_category', fromJson: _boolFromJson) bool autoCategory,
    @JsonKey(name: 'sequential', fromJson: _boolFromJson) bool sequential,
    @JsonKey(name: 'force_resume', fromJson: _boolFromJson) bool forceResume,
    @JsonKey(name: 'first_last_priority', fromJson: _boolFromJson)
    bool firstLastPriority,
    @JsonKey(name: 'path_mappings', fromJson: _pathMappingsFromJson)
    List<PathMapping> pathMappings,
  });
}

/// @nodoc
class __$$DownloaderConfigImplCopyWithImpl<$Res>
    extends _$DownloaderConfigCopyWithImpl<$Res, _$DownloaderConfigImpl>
    implements _$$DownloaderConfigImplCopyWith<$Res> {
  __$$DownloaderConfigImplCopyWithImpl(
    _$DownloaderConfigImpl _value,
    $Res Function(_$DownloaderConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? enabled = null,
    Object? isDefault = null,
    Object? host = null,
    Object? username = null,
    Object? password = null,
    Object? autoCategory = null,
    Object? sequential = null,
    Object? forceResume = null,
    Object? firstLastPriority = null,
    Object? pathMappings = null,
  }) {
    return _then(
      _$DownloaderConfigImpl(
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
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        host: null == host
            ? _value.host
            : host // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        autoCategory: null == autoCategory
            ? _value.autoCategory
            : autoCategory // ignore: cast_nullable_to_non_nullable
                  as bool,
        sequential: null == sequential
            ? _value.sequential
            : sequential // ignore: cast_nullable_to_non_nullable
                  as bool,
        forceResume: null == forceResume
            ? _value.forceResume
            : forceResume // ignore: cast_nullable_to_non_nullable
                  as bool,
        firstLastPriority: null == firstLastPriority
            ? _value.firstLastPriority
            : firstLastPriority // ignore: cast_nullable_to_non_nullable
                  as bool,
        pathMappings: null == pathMappings
            ? _value._pathMappings
            : pathMappings // ignore: cast_nullable_to_non_nullable
                  as List<PathMapping>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloaderConfigImpl implements _DownloaderConfig {
  const _$DownloaderConfigImpl({
    @JsonKey(fromJson: _stringFromJson) this.name = '',
    @JsonKey(fromJson: _stringFromJson) this.type = '',
    @JsonKey(fromJson: _boolFromJson) this.enabled = true,
    @JsonKey(name: 'default', fromJson: _boolFromJson) this.isDefault = false,
    @JsonKey(name: 'host', fromJson: _stringFromJson) this.host = '',
    @JsonKey(name: 'username', fromJson: _stringFromJson) this.username = '',
    @JsonKey(name: 'password', fromJson: _stringFromJson) this.password = '',
    @JsonKey(name: 'auto_category', fromJson: _boolFromJson)
    this.autoCategory = false,
    @JsonKey(name: 'sequential', fromJson: _boolFromJson)
    this.sequential = false,
    @JsonKey(name: 'force_resume', fromJson: _boolFromJson)
    this.forceResume = false,
    @JsonKey(name: 'first_last_priority', fromJson: _boolFromJson)
    this.firstLastPriority = false,
    @JsonKey(name: 'path_mappings', fromJson: _pathMappingsFromJson)
    final List<PathMapping> pathMappings = const [],
  }) : _pathMappings = pathMappings;

  factory _$DownloaderConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloaderConfigImplFromJson(json);

  @override
  @JsonKey(fromJson: _stringFromJson)
  final String name;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String type;
  @override
  @JsonKey(fromJson: _boolFromJson)
  final bool enabled;
  @override
  @JsonKey(name: 'default', fromJson: _boolFromJson)
  final bool isDefault;
  @override
  @JsonKey(name: 'host', fromJson: _stringFromJson)
  final String host;
  @override
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  final String username;
  @override
  @JsonKey(name: 'password', fromJson: _stringFromJson)
  final String password;
  @override
  @JsonKey(name: 'auto_category', fromJson: _boolFromJson)
  final bool autoCategory;
  @override
  @JsonKey(name: 'sequential', fromJson: _boolFromJson)
  final bool sequential;
  @override
  @JsonKey(name: 'force_resume', fromJson: _boolFromJson)
  final bool forceResume;
  @override
  @JsonKey(name: 'first_last_priority', fromJson: _boolFromJson)
  final bool firstLastPriority;
  final List<PathMapping> _pathMappings;
  @override
  @JsonKey(name: 'path_mappings', fromJson: _pathMappingsFromJson)
  List<PathMapping> get pathMappings {
    if (_pathMappings is EqualUnmodifiableListView) return _pathMappings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathMappings);
  }

  @override
  String toString() {
    return 'DownloaderConfig(name: $name, type: $type, enabled: $enabled, isDefault: $isDefault, host: $host, username: $username, password: $password, autoCategory: $autoCategory, sequential: $sequential, forceResume: $forceResume, firstLastPriority: $firstLastPriority, pathMappings: $pathMappings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloaderConfigImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.autoCategory, autoCategory) ||
                other.autoCategory == autoCategory) &&
            (identical(other.sequential, sequential) ||
                other.sequential == sequential) &&
            (identical(other.forceResume, forceResume) ||
                other.forceResume == forceResume) &&
            (identical(other.firstLastPriority, firstLastPriority) ||
                other.firstLastPriority == firstLastPriority) &&
            const DeepCollectionEquality().equals(
              other._pathMappings,
              _pathMappings,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    type,
    enabled,
    isDefault,
    host,
    username,
    password,
    autoCategory,
    sequential,
    forceResume,
    firstLastPriority,
    const DeepCollectionEquality().hash(_pathMappings),
  );

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloaderConfigImplCopyWith<_$DownloaderConfigImpl> get copyWith =>
      __$$DownloaderConfigImplCopyWithImpl<_$DownloaderConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloaderConfigImplToJson(this);
  }
}

abstract class _DownloaderConfig implements DownloaderConfig {
  const factory _DownloaderConfig({
    @JsonKey(fromJson: _stringFromJson) final String name,
    @JsonKey(fromJson: _stringFromJson) final String type,
    @JsonKey(fromJson: _boolFromJson) final bool enabled,
    @JsonKey(name: 'default', fromJson: _boolFromJson) final bool isDefault,
    @JsonKey(name: 'host', fromJson: _stringFromJson) final String host,
    @JsonKey(name: 'username', fromJson: _stringFromJson) final String username,
    @JsonKey(name: 'password', fromJson: _stringFromJson) final String password,
    @JsonKey(name: 'auto_category', fromJson: _boolFromJson)
    final bool autoCategory,
    @JsonKey(name: 'sequential', fromJson: _boolFromJson) final bool sequential,
    @JsonKey(name: 'force_resume', fromJson: _boolFromJson)
    final bool forceResume,
    @JsonKey(name: 'first_last_priority', fromJson: _boolFromJson)
    final bool firstLastPriority,
    @JsonKey(name: 'path_mappings', fromJson: _pathMappingsFromJson)
    final List<PathMapping> pathMappings,
  }) = _$DownloaderConfigImpl;

  factory _DownloaderConfig.fromJson(Map<String, dynamic> json) =
      _$DownloaderConfigImpl.fromJson;

  @override
  @JsonKey(fromJson: _stringFromJson)
  String get name;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get type;
  @override
  @JsonKey(fromJson: _boolFromJson)
  bool get enabled;
  @override
  @JsonKey(name: 'default', fromJson: _boolFromJson)
  bool get isDefault;
  @override
  @JsonKey(name: 'host', fromJson: _stringFromJson)
  String get host;
  @override
  @JsonKey(name: 'username', fromJson: _stringFromJson)
  String get username;
  @override
  @JsonKey(name: 'password', fromJson: _stringFromJson)
  String get password;
  @override
  @JsonKey(name: 'auto_category', fromJson: _boolFromJson)
  bool get autoCategory;
  @override
  @JsonKey(name: 'sequential', fromJson: _boolFromJson)
  bool get sequential;
  @override
  @JsonKey(name: 'force_resume', fromJson: _boolFromJson)
  bool get forceResume;
  @override
  @JsonKey(name: 'first_last_priority', fromJson: _boolFromJson)
  bool get firstLastPriority;
  @override
  @JsonKey(name: 'path_mappings', fromJson: _pathMappingsFromJson)
  List<PathMapping> get pathMappings;

  /// Create a copy of DownloaderConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloaderConfigImplCopyWith<_$DownloaderConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DownloaderConfigResponse _$DownloaderConfigResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DownloaderConfigResponse.fromJson(json);
}

/// @nodoc
mixin _$DownloaderConfigResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DownloaderConfigData? get data => throw _privateConstructorUsedError;

  /// Serializes this DownloaderConfigResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DownloaderConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DownloaderConfigResponseCopyWith<DownloaderConfigResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloaderConfigResponseCopyWith<$Res> {
  factory $DownloaderConfigResponseCopyWith(
    DownloaderConfigResponse value,
    $Res Function(DownloaderConfigResponse) then,
  ) = _$DownloaderConfigResponseCopyWithImpl<$Res, DownloaderConfigResponse>;
  @useResult
  $Res call({bool success, String? message, DownloaderConfigData? data});

  $DownloaderConfigDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DownloaderConfigResponseCopyWithImpl<
  $Res,
  $Val extends DownloaderConfigResponse
>
    implements $DownloaderConfigResponseCopyWith<$Res> {
  _$DownloaderConfigResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloaderConfigResponse
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
                      as DownloaderConfigData?,
          )
          as $Val,
    );
  }

  /// Create a copy of DownloaderConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloaderConfigDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DownloaderConfigDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DownloaderConfigResponseImplCopyWith<$Res>
    implements $DownloaderConfigResponseCopyWith<$Res> {
  factory _$$DownloaderConfigResponseImplCopyWith(
    _$DownloaderConfigResponseImpl value,
    $Res Function(_$DownloaderConfigResponseImpl) then,
  ) = __$$DownloaderConfigResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, DownloaderConfigData? data});

  @override
  $DownloaderConfigDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DownloaderConfigResponseImplCopyWithImpl<$Res>
    extends
        _$DownloaderConfigResponseCopyWithImpl<
          $Res,
          _$DownloaderConfigResponseImpl
        >
    implements _$$DownloaderConfigResponseImplCopyWith<$Res> {
  __$$DownloaderConfigResponseImplCopyWithImpl(
    _$DownloaderConfigResponseImpl _value,
    $Res Function(_$DownloaderConfigResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DownloaderConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$DownloaderConfigResponseImpl(
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
                  as DownloaderConfigData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloaderConfigResponseImpl implements _DownloaderConfigResponse {
  const _$DownloaderConfigResponseImpl({
    this.success = false,
    this.message,
    this.data,
  });

  factory _$DownloaderConfigResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloaderConfigResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final String? message;
  @override
  final DownloaderConfigData? data;

  @override
  String toString() {
    return 'DownloaderConfigResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloaderConfigResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of DownloaderConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloaderConfigResponseImplCopyWith<_$DownloaderConfigResponseImpl>
  get copyWith =>
      __$$DownloaderConfigResponseImplCopyWithImpl<
        _$DownloaderConfigResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloaderConfigResponseImplToJson(this);
  }
}

abstract class _DownloaderConfigResponse implements DownloaderConfigResponse {
  const factory _DownloaderConfigResponse({
    final bool success,
    final String? message,
    final DownloaderConfigData? data,
  }) = _$DownloaderConfigResponseImpl;

  factory _DownloaderConfigResponse.fromJson(Map<String, dynamic> json) =
      _$DownloaderConfigResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  DownloaderConfigData? get data;

  /// Create a copy of DownloaderConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloaderConfigResponseImplCopyWith<_$DownloaderConfigResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DownloaderConfigData _$DownloaderConfigDataFromJson(Map<String, dynamic> json) {
  return _DownloaderConfigData.fromJson(json);
}

/// @nodoc
mixin _$DownloaderConfigData {
  @JsonKey(fromJson: _configListFromJson)
  List<DownloaderConfig> get value => throw _privateConstructorUsedError;

  /// Serializes this DownloaderConfigData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DownloaderConfigData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DownloaderConfigDataCopyWith<DownloaderConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloaderConfigDataCopyWith<$Res> {
  factory $DownloaderConfigDataCopyWith(
    DownloaderConfigData value,
    $Res Function(DownloaderConfigData) then,
  ) = _$DownloaderConfigDataCopyWithImpl<$Res, DownloaderConfigData>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _configListFromJson) List<DownloaderConfig> value,
  });
}

/// @nodoc
class _$DownloaderConfigDataCopyWithImpl<
  $Res,
  $Val extends DownloaderConfigData
>
    implements $DownloaderConfigDataCopyWith<$Res> {
  _$DownloaderConfigDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloaderConfigData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as List<DownloaderConfig>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DownloaderConfigDataImplCopyWith<$Res>
    implements $DownloaderConfigDataCopyWith<$Res> {
  factory _$$DownloaderConfigDataImplCopyWith(
    _$DownloaderConfigDataImpl value,
    $Res Function(_$DownloaderConfigDataImpl) then,
  ) = __$$DownloaderConfigDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _configListFromJson) List<DownloaderConfig> value,
  });
}

/// @nodoc
class __$$DownloaderConfigDataImplCopyWithImpl<$Res>
    extends _$DownloaderConfigDataCopyWithImpl<$Res, _$DownloaderConfigDataImpl>
    implements _$$DownloaderConfigDataImplCopyWith<$Res> {
  __$$DownloaderConfigDataImplCopyWithImpl(
    _$DownloaderConfigDataImpl _value,
    $Res Function(_$DownloaderConfigDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DownloaderConfigData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$DownloaderConfigDataImpl(
        value: null == value
            ? _value._value
            : value // ignore: cast_nullable_to_non_nullable
                  as List<DownloaderConfig>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloaderConfigDataImpl implements _DownloaderConfigData {
  const _$DownloaderConfigDataImpl({
    @JsonKey(fromJson: _configListFromJson)
    final List<DownloaderConfig> value = const [],
  }) : _value = value;

  factory _$DownloaderConfigDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloaderConfigDataImplFromJson(json);

  final List<DownloaderConfig> _value;
  @override
  @JsonKey(fromJson: _configListFromJson)
  List<DownloaderConfig> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'DownloaderConfigData(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloaderConfigDataImpl &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  /// Create a copy of DownloaderConfigData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloaderConfigDataImplCopyWith<_$DownloaderConfigDataImpl>
  get copyWith =>
      __$$DownloaderConfigDataImplCopyWithImpl<_$DownloaderConfigDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloaderConfigDataImplToJson(this);
  }
}

abstract class _DownloaderConfigData implements DownloaderConfigData {
  const factory _DownloaderConfigData({
    @JsonKey(fromJson: _configListFromJson) final List<DownloaderConfig> value,
  }) = _$DownloaderConfigDataImpl;

  factory _DownloaderConfigData.fromJson(Map<String, dynamic> json) =
      _$DownloaderConfigDataImpl.fromJson;

  @override
  @JsonKey(fromJson: _configListFromJson)
  List<DownloaderConfig> get value;

  /// Create a copy of DownloaderConfigData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloaderConfigDataImplCopyWith<_$DownloaderConfigDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}
