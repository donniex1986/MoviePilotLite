// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DirectorySettingResponse _$DirectorySettingResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DirectorySettingResponse.fromJson(json);
}

/// @nodoc
mixin _$DirectorySettingResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DirectorySettingData? get data => throw _privateConstructorUsedError;

  /// Serializes this DirectorySettingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DirectorySettingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectorySettingResponseCopyWith<DirectorySettingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectorySettingResponseCopyWith<$Res> {
  factory $DirectorySettingResponseCopyWith(
    DirectorySettingResponse value,
    $Res Function(DirectorySettingResponse) then,
  ) = _$DirectorySettingResponseCopyWithImpl<$Res, DirectorySettingResponse>;
  @useResult
  $Res call({bool success, String? message, DirectorySettingData? data});

  $DirectorySettingDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DirectorySettingResponseCopyWithImpl<
  $Res,
  $Val extends DirectorySettingResponse
>
    implements $DirectorySettingResponseCopyWith<$Res> {
  _$DirectorySettingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectorySettingResponse
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
                      as DirectorySettingData?,
          )
          as $Val,
    );
  }

  /// Create a copy of DirectorySettingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DirectorySettingDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DirectorySettingDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DirectorySettingResponseImplCopyWith<$Res>
    implements $DirectorySettingResponseCopyWith<$Res> {
  factory _$$DirectorySettingResponseImplCopyWith(
    _$DirectorySettingResponseImpl value,
    $Res Function(_$DirectorySettingResponseImpl) then,
  ) = __$$DirectorySettingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, DirectorySettingData? data});

  @override
  $DirectorySettingDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DirectorySettingResponseImplCopyWithImpl<$Res>
    extends
        _$DirectorySettingResponseCopyWithImpl<
          $Res,
          _$DirectorySettingResponseImpl
        >
    implements _$$DirectorySettingResponseImplCopyWith<$Res> {
  __$$DirectorySettingResponseImplCopyWithImpl(
    _$DirectorySettingResponseImpl _value,
    $Res Function(_$DirectorySettingResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DirectorySettingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$DirectorySettingResponseImpl(
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
                  as DirectorySettingData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectorySettingResponseImpl implements _DirectorySettingResponse {
  const _$DirectorySettingResponseImpl({
    this.success = false,
    this.message,
    this.data,
  });

  factory _$DirectorySettingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectorySettingResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final String? message;
  @override
  final DirectorySettingData? data;

  @override
  String toString() {
    return 'DirectorySettingResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectorySettingResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of DirectorySettingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectorySettingResponseImplCopyWith<_$DirectorySettingResponseImpl>
  get copyWith =>
      __$$DirectorySettingResponseImplCopyWithImpl<
        _$DirectorySettingResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectorySettingResponseImplToJson(this);
  }
}

abstract class _DirectorySettingResponse implements DirectorySettingResponse {
  const factory _DirectorySettingResponse({
    final bool success,
    final String? message,
    final DirectorySettingData? data,
  }) = _$DirectorySettingResponseImpl;

  factory _DirectorySettingResponse.fromJson(Map<String, dynamic> json) =
      _$DirectorySettingResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  DirectorySettingData? get data;

  /// Create a copy of DirectorySettingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectorySettingResponseImplCopyWith<_$DirectorySettingResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DirectorySettingData _$DirectorySettingDataFromJson(Map<String, dynamic> json) {
  return _DirectorySettingData.fromJson(json);
}

/// @nodoc
mixin _$DirectorySettingData {
  @JsonKey(fromJson: _directoryListFromJson)
  List<DirectorySetting> get value => throw _privateConstructorUsedError;

  /// Serializes this DirectorySettingData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DirectorySettingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectorySettingDataCopyWith<DirectorySettingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectorySettingDataCopyWith<$Res> {
  factory $DirectorySettingDataCopyWith(
    DirectorySettingData value,
    $Res Function(DirectorySettingData) then,
  ) = _$DirectorySettingDataCopyWithImpl<$Res, DirectorySettingData>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _directoryListFromJson) List<DirectorySetting> value,
  });
}

/// @nodoc
class _$DirectorySettingDataCopyWithImpl<
  $Res,
  $Val extends DirectorySettingData
>
    implements $DirectorySettingDataCopyWith<$Res> {
  _$DirectorySettingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectorySettingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as List<DirectorySetting>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DirectorySettingDataImplCopyWith<$Res>
    implements $DirectorySettingDataCopyWith<$Res> {
  factory _$$DirectorySettingDataImplCopyWith(
    _$DirectorySettingDataImpl value,
    $Res Function(_$DirectorySettingDataImpl) then,
  ) = __$$DirectorySettingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _directoryListFromJson) List<DirectorySetting> value,
  });
}

/// @nodoc
class __$$DirectorySettingDataImplCopyWithImpl<$Res>
    extends _$DirectorySettingDataCopyWithImpl<$Res, _$DirectorySettingDataImpl>
    implements _$$DirectorySettingDataImplCopyWith<$Res> {
  __$$DirectorySettingDataImplCopyWithImpl(
    _$DirectorySettingDataImpl _value,
    $Res Function(_$DirectorySettingDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DirectorySettingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$DirectorySettingDataImpl(
        value: null == value
            ? _value._value
            : value // ignore: cast_nullable_to_non_nullable
                  as List<DirectorySetting>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectorySettingDataImpl implements _DirectorySettingData {
  const _$DirectorySettingDataImpl({
    @JsonKey(fromJson: _directoryListFromJson)
    final List<DirectorySetting> value = const [],
  }) : _value = value;

  factory _$DirectorySettingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectorySettingDataImplFromJson(json);

  final List<DirectorySetting> _value;
  @override
  @JsonKey(fromJson: _directoryListFromJson)
  List<DirectorySetting> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'DirectorySettingData(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectorySettingDataImpl &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  /// Create a copy of DirectorySettingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectorySettingDataImplCopyWith<_$DirectorySettingDataImpl>
  get copyWith =>
      __$$DirectorySettingDataImplCopyWithImpl<_$DirectorySettingDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectorySettingDataImplToJson(this);
  }
}

abstract class _DirectorySettingData implements DirectorySettingData {
  const factory _DirectorySettingData({
    @JsonKey(fromJson: _directoryListFromJson)
    final List<DirectorySetting> value,
  }) = _$DirectorySettingDataImpl;

  factory _DirectorySettingData.fromJson(Map<String, dynamic> json) =
      _$DirectorySettingDataImpl.fromJson;

  @override
  @JsonKey(fromJson: _directoryListFromJson)
  List<DirectorySetting> get value;

  /// Create a copy of DirectorySettingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectorySettingDataImplCopyWith<_$DirectorySettingDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DirectorySetting _$DirectorySettingFromJson(Map<String, dynamic> json) {
  return _DirectorySetting.fromJson(json);
}

/// @nodoc
mixin _$DirectorySetting {
  @JsonKey(fromJson: _stringFromJson)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get storage => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_path', fromJson: _stringFromJson)
  String get downloadPath => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'monitor_type', fromJson: _stringFromJson)
  String get monitorType => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type', fromJson: _stringFromJson)
  String get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_category', fromJson: _stringFromJson)
  String get mediaCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_type', fromJson: _stringFromJson)
  String get transferType => throw _privateConstructorUsedError;
  @JsonKey(name: 'library_path', fromJson: _stringFromJson)
  String get libraryPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'library_type_folder', fromJson: _boolFromJson)
  bool get libraryTypeFolder => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromJson)
  bool get renaming => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromJson)
  bool get scraping => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromJson)
  bool get notify => throw _privateConstructorUsedError;
  @JsonKey(name: 'overwrite_mode', fromJson: _stringFromJson)
  String get overwriteMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_type_folder', fromJson: _boolFromJson)
  bool get downloadTypeFolder => throw _privateConstructorUsedError;
  @JsonKey(name: 'library_storage', fromJson: _stringFromJson)
  String get libraryStorage => throw _privateConstructorUsedError;
  @JsonKey(name: 'library_category_folder', fromJson: _boolFromJson)
  bool get libraryCategoryFolder => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_category_folder', fromJson: _boolFromJson)
  bool get downloadCategoryFolder => throw _privateConstructorUsedError;

  /// Serializes this DirectorySetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DirectorySetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectorySettingCopyWith<DirectorySetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectorySettingCopyWith<$Res> {
  factory $DirectorySettingCopyWith(
    DirectorySetting value,
    $Res Function(DirectorySetting) then,
  ) = _$DirectorySettingCopyWithImpl<$Res, DirectorySetting>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringFromJson) String name,
    @JsonKey(fromJson: _stringFromJson) String storage,
    @JsonKey(name: 'download_path', fromJson: _stringFromJson)
    String downloadPath,
    @JsonKey(fromJson: _intFromJson) int priority,
    @JsonKey(name: 'monitor_type', fromJson: _stringFromJson)
    String monitorType,
    @JsonKey(name: 'media_type', fromJson: _stringFromJson) String mediaType,
    @JsonKey(name: 'media_category', fromJson: _stringFromJson)
    String mediaCategory,
    @JsonKey(name: 'transfer_type', fromJson: _stringFromJson)
    String transferType,
    @JsonKey(name: 'library_path', fromJson: _stringFromJson)
    String libraryPath,
    @JsonKey(name: 'library_type_folder', fromJson: _boolFromJson)
    bool libraryTypeFolder,
    @JsonKey(fromJson: _boolFromJson) bool renaming,
    @JsonKey(fromJson: _boolFromJson) bool scraping,
    @JsonKey(fromJson: _boolFromJson) bool notify,
    @JsonKey(name: 'overwrite_mode', fromJson: _stringFromJson)
    String overwriteMode,
    @JsonKey(name: 'download_type_folder', fromJson: _boolFromJson)
    bool downloadTypeFolder,
    @JsonKey(name: 'library_storage', fromJson: _stringFromJson)
    String libraryStorage,
    @JsonKey(name: 'library_category_folder', fromJson: _boolFromJson)
    bool libraryCategoryFolder,
    @JsonKey(name: 'download_category_folder', fromJson: _boolFromJson)
    bool downloadCategoryFolder,
  });
}

/// @nodoc
class _$DirectorySettingCopyWithImpl<$Res, $Val extends DirectorySetting>
    implements $DirectorySettingCopyWith<$Res> {
  _$DirectorySettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectorySetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? storage = null,
    Object? downloadPath = null,
    Object? priority = null,
    Object? monitorType = null,
    Object? mediaType = null,
    Object? mediaCategory = null,
    Object? transferType = null,
    Object? libraryPath = null,
    Object? libraryTypeFolder = null,
    Object? renaming = null,
    Object? scraping = null,
    Object? notify = null,
    Object? overwriteMode = null,
    Object? downloadTypeFolder = null,
    Object? libraryStorage = null,
    Object? libraryCategoryFolder = null,
    Object? downloadCategoryFolder = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            storage: null == storage
                ? _value.storage
                : storage // ignore: cast_nullable_to_non_nullable
                      as String,
            downloadPath: null == downloadPath
                ? _value.downloadPath
                : downloadPath // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int,
            monitorType: null == monitorType
                ? _value.monitorType
                : monitorType // ignore: cast_nullable_to_non_nullable
                      as String,
            mediaType: null == mediaType
                ? _value.mediaType
                : mediaType // ignore: cast_nullable_to_non_nullable
                      as String,
            mediaCategory: null == mediaCategory
                ? _value.mediaCategory
                : mediaCategory // ignore: cast_nullable_to_non_nullable
                      as String,
            transferType: null == transferType
                ? _value.transferType
                : transferType // ignore: cast_nullable_to_non_nullable
                      as String,
            libraryPath: null == libraryPath
                ? _value.libraryPath
                : libraryPath // ignore: cast_nullable_to_non_nullable
                      as String,
            libraryTypeFolder: null == libraryTypeFolder
                ? _value.libraryTypeFolder
                : libraryTypeFolder // ignore: cast_nullable_to_non_nullable
                      as bool,
            renaming: null == renaming
                ? _value.renaming
                : renaming // ignore: cast_nullable_to_non_nullable
                      as bool,
            scraping: null == scraping
                ? _value.scraping
                : scraping // ignore: cast_nullable_to_non_nullable
                      as bool,
            notify: null == notify
                ? _value.notify
                : notify // ignore: cast_nullable_to_non_nullable
                      as bool,
            overwriteMode: null == overwriteMode
                ? _value.overwriteMode
                : overwriteMode // ignore: cast_nullable_to_non_nullable
                      as String,
            downloadTypeFolder: null == downloadTypeFolder
                ? _value.downloadTypeFolder
                : downloadTypeFolder // ignore: cast_nullable_to_non_nullable
                      as bool,
            libraryStorage: null == libraryStorage
                ? _value.libraryStorage
                : libraryStorage // ignore: cast_nullable_to_non_nullable
                      as String,
            libraryCategoryFolder: null == libraryCategoryFolder
                ? _value.libraryCategoryFolder
                : libraryCategoryFolder // ignore: cast_nullable_to_non_nullable
                      as bool,
            downloadCategoryFolder: null == downloadCategoryFolder
                ? _value.downloadCategoryFolder
                : downloadCategoryFolder // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DirectorySettingImplCopyWith<$Res>
    implements $DirectorySettingCopyWith<$Res> {
  factory _$$DirectorySettingImplCopyWith(
    _$DirectorySettingImpl value,
    $Res Function(_$DirectorySettingImpl) then,
  ) = __$$DirectorySettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringFromJson) String name,
    @JsonKey(fromJson: _stringFromJson) String storage,
    @JsonKey(name: 'download_path', fromJson: _stringFromJson)
    String downloadPath,
    @JsonKey(fromJson: _intFromJson) int priority,
    @JsonKey(name: 'monitor_type', fromJson: _stringFromJson)
    String monitorType,
    @JsonKey(name: 'media_type', fromJson: _stringFromJson) String mediaType,
    @JsonKey(name: 'media_category', fromJson: _stringFromJson)
    String mediaCategory,
    @JsonKey(name: 'transfer_type', fromJson: _stringFromJson)
    String transferType,
    @JsonKey(name: 'library_path', fromJson: _stringFromJson)
    String libraryPath,
    @JsonKey(name: 'library_type_folder', fromJson: _boolFromJson)
    bool libraryTypeFolder,
    @JsonKey(fromJson: _boolFromJson) bool renaming,
    @JsonKey(fromJson: _boolFromJson) bool scraping,
    @JsonKey(fromJson: _boolFromJson) bool notify,
    @JsonKey(name: 'overwrite_mode', fromJson: _stringFromJson)
    String overwriteMode,
    @JsonKey(name: 'download_type_folder', fromJson: _boolFromJson)
    bool downloadTypeFolder,
    @JsonKey(name: 'library_storage', fromJson: _stringFromJson)
    String libraryStorage,
    @JsonKey(name: 'library_category_folder', fromJson: _boolFromJson)
    bool libraryCategoryFolder,
    @JsonKey(name: 'download_category_folder', fromJson: _boolFromJson)
    bool downloadCategoryFolder,
  });
}

/// @nodoc
class __$$DirectorySettingImplCopyWithImpl<$Res>
    extends _$DirectorySettingCopyWithImpl<$Res, _$DirectorySettingImpl>
    implements _$$DirectorySettingImplCopyWith<$Res> {
  __$$DirectorySettingImplCopyWithImpl(
    _$DirectorySettingImpl _value,
    $Res Function(_$DirectorySettingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DirectorySetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? storage = null,
    Object? downloadPath = null,
    Object? priority = null,
    Object? monitorType = null,
    Object? mediaType = null,
    Object? mediaCategory = null,
    Object? transferType = null,
    Object? libraryPath = null,
    Object? libraryTypeFolder = null,
    Object? renaming = null,
    Object? scraping = null,
    Object? notify = null,
    Object? overwriteMode = null,
    Object? downloadTypeFolder = null,
    Object? libraryStorage = null,
    Object? libraryCategoryFolder = null,
    Object? downloadCategoryFolder = null,
  }) {
    return _then(
      _$DirectorySettingImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        storage: null == storage
            ? _value.storage
            : storage // ignore: cast_nullable_to_non_nullable
                  as String,
        downloadPath: null == downloadPath
            ? _value.downloadPath
            : downloadPath // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int,
        monitorType: null == monitorType
            ? _value.monitorType
            : monitorType // ignore: cast_nullable_to_non_nullable
                  as String,
        mediaType: null == mediaType
            ? _value.mediaType
            : mediaType // ignore: cast_nullable_to_non_nullable
                  as String,
        mediaCategory: null == mediaCategory
            ? _value.mediaCategory
            : mediaCategory // ignore: cast_nullable_to_non_nullable
                  as String,
        transferType: null == transferType
            ? _value.transferType
            : transferType // ignore: cast_nullable_to_non_nullable
                  as String,
        libraryPath: null == libraryPath
            ? _value.libraryPath
            : libraryPath // ignore: cast_nullable_to_non_nullable
                  as String,
        libraryTypeFolder: null == libraryTypeFolder
            ? _value.libraryTypeFolder
            : libraryTypeFolder // ignore: cast_nullable_to_non_nullable
                  as bool,
        renaming: null == renaming
            ? _value.renaming
            : renaming // ignore: cast_nullable_to_non_nullable
                  as bool,
        scraping: null == scraping
            ? _value.scraping
            : scraping // ignore: cast_nullable_to_non_nullable
                  as bool,
        notify: null == notify
            ? _value.notify
            : notify // ignore: cast_nullable_to_non_nullable
                  as bool,
        overwriteMode: null == overwriteMode
            ? _value.overwriteMode
            : overwriteMode // ignore: cast_nullable_to_non_nullable
                  as String,
        downloadTypeFolder: null == downloadTypeFolder
            ? _value.downloadTypeFolder
            : downloadTypeFolder // ignore: cast_nullable_to_non_nullable
                  as bool,
        libraryStorage: null == libraryStorage
            ? _value.libraryStorage
            : libraryStorage // ignore: cast_nullable_to_non_nullable
                  as String,
        libraryCategoryFolder: null == libraryCategoryFolder
            ? _value.libraryCategoryFolder
            : libraryCategoryFolder // ignore: cast_nullable_to_non_nullable
                  as bool,
        downloadCategoryFolder: null == downloadCategoryFolder
            ? _value.downloadCategoryFolder
            : downloadCategoryFolder // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectorySettingImpl implements _DirectorySetting {
  const _$DirectorySettingImpl({
    @JsonKey(fromJson: _stringFromJson) this.name = '',
    @JsonKey(fromJson: _stringFromJson) this.storage = '',
    @JsonKey(name: 'download_path', fromJson: _stringFromJson)
    this.downloadPath = '',
    @JsonKey(fromJson: _intFromJson) this.priority = 0,
    @JsonKey(name: 'monitor_type', fromJson: _stringFromJson)
    this.monitorType = '',
    @JsonKey(name: 'media_type', fromJson: _stringFromJson) this.mediaType = '',
    @JsonKey(name: 'media_category', fromJson: _stringFromJson)
    this.mediaCategory = '',
    @JsonKey(name: 'transfer_type', fromJson: _stringFromJson)
    this.transferType = '',
    @JsonKey(name: 'library_path', fromJson: _stringFromJson)
    this.libraryPath = '',
    @JsonKey(name: 'library_type_folder', fromJson: _boolFromJson)
    this.libraryTypeFolder = false,
    @JsonKey(fromJson: _boolFromJson) this.renaming = false,
    @JsonKey(fromJson: _boolFromJson) this.scraping = false,
    @JsonKey(fromJson: _boolFromJson) this.notify = false,
    @JsonKey(name: 'overwrite_mode', fromJson: _stringFromJson)
    this.overwriteMode = '',
    @JsonKey(name: 'download_type_folder', fromJson: _boolFromJson)
    this.downloadTypeFolder = false,
    @JsonKey(name: 'library_storage', fromJson: _stringFromJson)
    this.libraryStorage = '',
    @JsonKey(name: 'library_category_folder', fromJson: _boolFromJson)
    this.libraryCategoryFolder = false,
    @JsonKey(name: 'download_category_folder', fromJson: _boolFromJson)
    this.downloadCategoryFolder = false,
  });

  factory _$DirectorySettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectorySettingImplFromJson(json);

  @override
  @JsonKey(fromJson: _stringFromJson)
  final String name;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String storage;
  @override
  @JsonKey(name: 'download_path', fromJson: _stringFromJson)
  final String downloadPath;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int priority;
  @override
  @JsonKey(name: 'monitor_type', fromJson: _stringFromJson)
  final String monitorType;
  @override
  @JsonKey(name: 'media_type', fromJson: _stringFromJson)
  final String mediaType;
  @override
  @JsonKey(name: 'media_category', fromJson: _stringFromJson)
  final String mediaCategory;
  @override
  @JsonKey(name: 'transfer_type', fromJson: _stringFromJson)
  final String transferType;
  @override
  @JsonKey(name: 'library_path', fromJson: _stringFromJson)
  final String libraryPath;
  @override
  @JsonKey(name: 'library_type_folder', fromJson: _boolFromJson)
  final bool libraryTypeFolder;
  @override
  @JsonKey(fromJson: _boolFromJson)
  final bool renaming;
  @override
  @JsonKey(fromJson: _boolFromJson)
  final bool scraping;
  @override
  @JsonKey(fromJson: _boolFromJson)
  final bool notify;
  @override
  @JsonKey(name: 'overwrite_mode', fromJson: _stringFromJson)
  final String overwriteMode;
  @override
  @JsonKey(name: 'download_type_folder', fromJson: _boolFromJson)
  final bool downloadTypeFolder;
  @override
  @JsonKey(name: 'library_storage', fromJson: _stringFromJson)
  final String libraryStorage;
  @override
  @JsonKey(name: 'library_category_folder', fromJson: _boolFromJson)
  final bool libraryCategoryFolder;
  @override
  @JsonKey(name: 'download_category_folder', fromJson: _boolFromJson)
  final bool downloadCategoryFolder;

  @override
  String toString() {
    return 'DirectorySetting(name: $name, storage: $storage, downloadPath: $downloadPath, priority: $priority, monitorType: $monitorType, mediaType: $mediaType, mediaCategory: $mediaCategory, transferType: $transferType, libraryPath: $libraryPath, libraryTypeFolder: $libraryTypeFolder, renaming: $renaming, scraping: $scraping, notify: $notify, overwriteMode: $overwriteMode, downloadTypeFolder: $downloadTypeFolder, libraryStorage: $libraryStorage, libraryCategoryFolder: $libraryCategoryFolder, downloadCategoryFolder: $downloadCategoryFolder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectorySettingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.storage, storage) || other.storage == storage) &&
            (identical(other.downloadPath, downloadPath) ||
                other.downloadPath == downloadPath) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.monitorType, monitorType) ||
                other.monitorType == monitorType) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.mediaCategory, mediaCategory) ||
                other.mediaCategory == mediaCategory) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.libraryPath, libraryPath) ||
                other.libraryPath == libraryPath) &&
            (identical(other.libraryTypeFolder, libraryTypeFolder) ||
                other.libraryTypeFolder == libraryTypeFolder) &&
            (identical(other.renaming, renaming) ||
                other.renaming == renaming) &&
            (identical(other.scraping, scraping) ||
                other.scraping == scraping) &&
            (identical(other.notify, notify) || other.notify == notify) &&
            (identical(other.overwriteMode, overwriteMode) ||
                other.overwriteMode == overwriteMode) &&
            (identical(other.downloadTypeFolder, downloadTypeFolder) ||
                other.downloadTypeFolder == downloadTypeFolder) &&
            (identical(other.libraryStorage, libraryStorage) ||
                other.libraryStorage == libraryStorage) &&
            (identical(other.libraryCategoryFolder, libraryCategoryFolder) ||
                other.libraryCategoryFolder == libraryCategoryFolder) &&
            (identical(other.downloadCategoryFolder, downloadCategoryFolder) ||
                other.downloadCategoryFolder == downloadCategoryFolder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    storage,
    downloadPath,
    priority,
    monitorType,
    mediaType,
    mediaCategory,
    transferType,
    libraryPath,
    libraryTypeFolder,
    renaming,
    scraping,
    notify,
    overwriteMode,
    downloadTypeFolder,
    libraryStorage,
    libraryCategoryFolder,
    downloadCategoryFolder,
  );

  /// Create a copy of DirectorySetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectorySettingImplCopyWith<_$DirectorySettingImpl> get copyWith =>
      __$$DirectorySettingImplCopyWithImpl<_$DirectorySettingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectorySettingImplToJson(this);
  }
}

abstract class _DirectorySetting implements DirectorySetting {
  const factory _DirectorySetting({
    @JsonKey(fromJson: _stringFromJson) final String name,
    @JsonKey(fromJson: _stringFromJson) final String storage,
    @JsonKey(name: 'download_path', fromJson: _stringFromJson)
    final String downloadPath,
    @JsonKey(fromJson: _intFromJson) final int priority,
    @JsonKey(name: 'monitor_type', fromJson: _stringFromJson)
    final String monitorType,
    @JsonKey(name: 'media_type', fromJson: _stringFromJson)
    final String mediaType,
    @JsonKey(name: 'media_category', fromJson: _stringFromJson)
    final String mediaCategory,
    @JsonKey(name: 'transfer_type', fromJson: _stringFromJson)
    final String transferType,
    @JsonKey(name: 'library_path', fromJson: _stringFromJson)
    final String libraryPath,
    @JsonKey(name: 'library_type_folder', fromJson: _boolFromJson)
    final bool libraryTypeFolder,
    @JsonKey(fromJson: _boolFromJson) final bool renaming,
    @JsonKey(fromJson: _boolFromJson) final bool scraping,
    @JsonKey(fromJson: _boolFromJson) final bool notify,
    @JsonKey(name: 'overwrite_mode', fromJson: _stringFromJson)
    final String overwriteMode,
    @JsonKey(name: 'download_type_folder', fromJson: _boolFromJson)
    final bool downloadTypeFolder,
    @JsonKey(name: 'library_storage', fromJson: _stringFromJson)
    final String libraryStorage,
    @JsonKey(name: 'library_category_folder', fromJson: _boolFromJson)
    final bool libraryCategoryFolder,
    @JsonKey(name: 'download_category_folder', fromJson: _boolFromJson)
    final bool downloadCategoryFolder,
  }) = _$DirectorySettingImpl;

  factory _DirectorySetting.fromJson(Map<String, dynamic> json) =
      _$DirectorySettingImpl.fromJson;

  @override
  @JsonKey(fromJson: _stringFromJson)
  String get name;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get storage;
  @override
  @JsonKey(name: 'download_path', fromJson: _stringFromJson)
  String get downloadPath;
  @override
  @JsonKey(fromJson: _intFromJson)
  int get priority;
  @override
  @JsonKey(name: 'monitor_type', fromJson: _stringFromJson)
  String get monitorType;
  @override
  @JsonKey(name: 'media_type', fromJson: _stringFromJson)
  String get mediaType;
  @override
  @JsonKey(name: 'media_category', fromJson: _stringFromJson)
  String get mediaCategory;
  @override
  @JsonKey(name: 'transfer_type', fromJson: _stringFromJson)
  String get transferType;
  @override
  @JsonKey(name: 'library_path', fromJson: _stringFromJson)
  String get libraryPath;
  @override
  @JsonKey(name: 'library_type_folder', fromJson: _boolFromJson)
  bool get libraryTypeFolder;
  @override
  @JsonKey(fromJson: _boolFromJson)
  bool get renaming;
  @override
  @JsonKey(fromJson: _boolFromJson)
  bool get scraping;
  @override
  @JsonKey(fromJson: _boolFromJson)
  bool get notify;
  @override
  @JsonKey(name: 'overwrite_mode', fromJson: _stringFromJson)
  String get overwriteMode;
  @override
  @JsonKey(name: 'download_type_folder', fromJson: _boolFromJson)
  bool get downloadTypeFolder;
  @override
  @JsonKey(name: 'library_storage', fromJson: _stringFromJson)
  String get libraryStorage;
  @override
  @JsonKey(name: 'library_category_folder', fromJson: _boolFromJson)
  bool get libraryCategoryFolder;
  @override
  @JsonKey(name: 'download_category_folder', fromJson: _boolFromJson)
  bool get downloadCategoryFolder;

  /// Create a copy of DirectorySetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectorySettingImplCopyWith<_$DirectorySettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DownloadClient _$DownloadClientFromJson(Map<String, dynamic> json) {
  return _DownloadClient.fromJson(json);
}

/// @nodoc
mixin _$DownloadClient {
  @JsonKey(fromJson: _stringFromJson)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringFromJson)
  String get type => throw _privateConstructorUsedError;

  /// Serializes this DownloadClient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DownloadClient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DownloadClientCopyWith<DownloadClient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadClientCopyWith<$Res> {
  factory $DownloadClientCopyWith(
    DownloadClient value,
    $Res Function(DownloadClient) then,
  ) = _$DownloadClientCopyWithImpl<$Res, DownloadClient>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringFromJson) String name,
    @JsonKey(fromJson: _stringFromJson) String type,
  });
}

/// @nodoc
class _$DownloadClientCopyWithImpl<$Res, $Val extends DownloadClient>
    implements $DownloadClientCopyWith<$Res> {
  _$DownloadClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloadClient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? type = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DownloadClientImplCopyWith<$Res>
    implements $DownloadClientCopyWith<$Res> {
  factory _$$DownloadClientImplCopyWith(
    _$DownloadClientImpl value,
    $Res Function(_$DownloadClientImpl) then,
  ) = __$$DownloadClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _stringFromJson) String name,
    @JsonKey(fromJson: _stringFromJson) String type,
  });
}

/// @nodoc
class __$$DownloadClientImplCopyWithImpl<$Res>
    extends _$DownloadClientCopyWithImpl<$Res, _$DownloadClientImpl>
    implements _$$DownloadClientImplCopyWith<$Res> {
  __$$DownloadClientImplCopyWithImpl(
    _$DownloadClientImpl _value,
    $Res Function(_$DownloadClientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DownloadClient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? type = null}) {
    return _then(
      _$DownloadClientImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadClientImpl implements _DownloadClient {
  const _$DownloadClientImpl({
    @JsonKey(fromJson: _stringFromJson) this.name = '',
    @JsonKey(fromJson: _stringFromJson) this.type = '',
  });

  factory _$DownloadClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloadClientImplFromJson(json);

  @override
  @JsonKey(fromJson: _stringFromJson)
  final String name;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String type;

  @override
  String toString() {
    return 'DownloadClient(name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadClientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, type);

  /// Create a copy of DownloadClient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadClientImplCopyWith<_$DownloadClientImpl> get copyWith =>
      __$$DownloadClientImplCopyWithImpl<_$DownloadClientImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadClientImplToJson(this);
  }
}

abstract class _DownloadClient implements DownloadClient {
  const factory _DownloadClient({
    @JsonKey(fromJson: _stringFromJson) final String name,
    @JsonKey(fromJson: _stringFromJson) final String type,
  }) = _$DownloadClientImpl;

  factory _DownloadClient.fromJson(Map<String, dynamic> json) =
      _$DownloadClientImpl.fromJson;

  @override
  @JsonKey(fromJson: _stringFromJson)
  String get name;
  @override
  @JsonKey(fromJson: _stringFromJson)
  String get type;

  /// Create a copy of DownloadClient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadClientImplCopyWith<_$DownloadClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
