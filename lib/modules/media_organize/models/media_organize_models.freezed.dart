// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_organize_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StorageSetting _$StorageSettingFromJson(Map<String, dynamic> json) {
  return _StorageSetting.fromJson(json);
}

/// @nodoc
mixin _$StorageSetting {
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<String, dynamic> get config => throw _privateConstructorUsedError;

  /// Serializes this StorageSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorageSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorageSettingCopyWith<StorageSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageSettingCopyWith<$Res> {
  factory $StorageSettingCopyWith(
    StorageSetting value,
    $Res Function(StorageSetting) then,
  ) = _$StorageSettingCopyWithImpl<$Res, StorageSetting>;
  @useResult
  $Res call({String type, String name, Map<String, dynamic> config});
}

/// @nodoc
class _$StorageSettingCopyWithImpl<$Res, $Val extends StorageSetting>
    implements $StorageSettingCopyWith<$Res> {
  _$StorageSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? name = null, Object? config = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StorageSettingImplCopyWith<$Res>
    implements $StorageSettingCopyWith<$Res> {
  factory _$$StorageSettingImplCopyWith(
    _$StorageSettingImpl value,
    $Res Function(_$StorageSettingImpl) then,
  ) = __$$StorageSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String name, Map<String, dynamic> config});
}

/// @nodoc
class __$$StorageSettingImplCopyWithImpl<$Res>
    extends _$StorageSettingCopyWithImpl<$Res, _$StorageSettingImpl>
    implements _$$StorageSettingImplCopyWith<$Res> {
  __$$StorageSettingImplCopyWithImpl(
    _$StorageSettingImpl _value,
    $Res Function(_$StorageSettingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StorageSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? name = null, Object? config = null}) {
    return _then(
      _$StorageSettingImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        config: null == config
            ? _value._config
            : config // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageSettingImpl implements _StorageSetting {
  const _$StorageSettingImpl({
    required this.type,
    required this.name,
    final Map<String, dynamic> config = const {},
  }) : _config = config;

  factory _$StorageSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageSettingImplFromJson(json);

  @override
  final String type;
  @override
  final String name;
  final Map<String, dynamic> _config;
  @override
  @JsonKey()
  Map<String, dynamic> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  String toString() {
    return 'StorageSetting(type: $type, name: $name, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageSettingImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._config, _config));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    name,
    const DeepCollectionEquality().hash(_config),
  );

  /// Create a copy of StorageSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageSettingImplCopyWith<_$StorageSettingImpl> get copyWith =>
      __$$StorageSettingImplCopyWithImpl<_$StorageSettingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageSettingImplToJson(this);
  }
}

abstract class _StorageSetting implements StorageSetting {
  const factory _StorageSetting({
    required final String type,
    required final String name,
    final Map<String, dynamic> config,
  }) = _$StorageSettingImpl;

  factory _StorageSetting.fromJson(Map<String, dynamic> json) =
      _$StorageSettingImpl.fromJson;

  @override
  String get type;
  @override
  String get name;
  @override
  Map<String, dynamic> get config;

  /// Create a copy of StorageSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageSettingImplCopyWith<_$StorageSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaOrganizeFileItem _$MediaOrganizeFileItemFromJson(
  Map<String, dynamic> json,
) {
  return _MediaOrganizeFileItem.fromJson(json);
}

/// @nodoc
mixin _$MediaOrganizeFileItem {
  String? get path => throw _privateConstructorUsedError;
  String? get storage => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get basename => throw _privateConstructorUsedError;
  String? get extension => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'modify_time', fromJson: _doubleFromJson)
  double? get modifyTime => throw _privateConstructorUsedError;
  List<dynamic> get children => throw _privateConstructorUsedError;
  String? get fileid => throw _privateConstructorUsedError;
  String? get parent_fileid => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get pickcode => throw _privateConstructorUsedError;
  String? get drive_id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this MediaOrganizeFileItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaOrganizeFileItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaOrganizeFileItemCopyWith<MediaOrganizeFileItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaOrganizeFileItemCopyWith<$Res> {
  factory $MediaOrganizeFileItemCopyWith(
    MediaOrganizeFileItem value,
    $Res Function(MediaOrganizeFileItem) then,
  ) = _$MediaOrganizeFileItemCopyWithImpl<$Res, MediaOrganizeFileItem>;
  @useResult
  $Res call({
    String? path,
    String? storage,
    String? type,
    String? name,
    String? basename,
    String? extension,
    @JsonKey(fromJson: _intFromJson) int? size,
    @JsonKey(name: 'modify_time', fromJson: _doubleFromJson) double? modifyTime,
    List<dynamic> children,
    String? fileid,
    String? parent_fileid,
    String? thumbnail,
    String? pickcode,
    String? drive_id,
    String? url,
  });
}

/// @nodoc
class _$MediaOrganizeFileItemCopyWithImpl<
  $Res,
  $Val extends MediaOrganizeFileItem
>
    implements $MediaOrganizeFileItemCopyWith<$Res> {
  _$MediaOrganizeFileItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaOrganizeFileItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = freezed,
    Object? storage = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? basename = freezed,
    Object? extension = freezed,
    Object? size = freezed,
    Object? modifyTime = freezed,
    Object? children = null,
    Object? fileid = freezed,
    Object? parent_fileid = freezed,
    Object? thumbnail = freezed,
    Object? pickcode = freezed,
    Object? drive_id = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _value.copyWith(
            path: freezed == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String?,
            storage: freezed == storage
                ? _value.storage
                : storage // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            basename: freezed == basename
                ? _value.basename
                : basename // ignore: cast_nullable_to_non_nullable
                      as String?,
            extension: freezed == extension
                ? _value.extension
                : extension // ignore: cast_nullable_to_non_nullable
                      as String?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
            modifyTime: freezed == modifyTime
                ? _value.modifyTime
                : modifyTime // ignore: cast_nullable_to_non_nullable
                      as double?,
            children: null == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            fileid: freezed == fileid
                ? _value.fileid
                : fileid // ignore: cast_nullable_to_non_nullable
                      as String?,
            parent_fileid: freezed == parent_fileid
                ? _value.parent_fileid
                : parent_fileid // ignore: cast_nullable_to_non_nullable
                      as String?,
            thumbnail: freezed == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                      as String?,
            pickcode: freezed == pickcode
                ? _value.pickcode
                : pickcode // ignore: cast_nullable_to_non_nullable
                      as String?,
            drive_id: freezed == drive_id
                ? _value.drive_id
                : drive_id // ignore: cast_nullable_to_non_nullable
                      as String?,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaOrganizeFileItemImplCopyWith<$Res>
    implements $MediaOrganizeFileItemCopyWith<$Res> {
  factory _$$MediaOrganizeFileItemImplCopyWith(
    _$MediaOrganizeFileItemImpl value,
    $Res Function(_$MediaOrganizeFileItemImpl) then,
  ) = __$$MediaOrganizeFileItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? path,
    String? storage,
    String? type,
    String? name,
    String? basename,
    String? extension,
    @JsonKey(fromJson: _intFromJson) int? size,
    @JsonKey(name: 'modify_time', fromJson: _doubleFromJson) double? modifyTime,
    List<dynamic> children,
    String? fileid,
    String? parent_fileid,
    String? thumbnail,
    String? pickcode,
    String? drive_id,
    String? url,
  });
}

/// @nodoc
class __$$MediaOrganizeFileItemImplCopyWithImpl<$Res>
    extends
        _$MediaOrganizeFileItemCopyWithImpl<$Res, _$MediaOrganizeFileItemImpl>
    implements _$$MediaOrganizeFileItemImplCopyWith<$Res> {
  __$$MediaOrganizeFileItemImplCopyWithImpl(
    _$MediaOrganizeFileItemImpl _value,
    $Res Function(_$MediaOrganizeFileItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaOrganizeFileItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = freezed,
    Object? storage = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? basename = freezed,
    Object? extension = freezed,
    Object? size = freezed,
    Object? modifyTime = freezed,
    Object? children = null,
    Object? fileid = freezed,
    Object? parent_fileid = freezed,
    Object? thumbnail = freezed,
    Object? pickcode = freezed,
    Object? drive_id = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _$MediaOrganizeFileItemImpl(
        path: freezed == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String?,
        storage: freezed == storage
            ? _value.storage
            : storage // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        basename: freezed == basename
            ? _value.basename
            : basename // ignore: cast_nullable_to_non_nullable
                  as String?,
        extension: freezed == extension
            ? _value.extension
            : extension // ignore: cast_nullable_to_non_nullable
                  as String?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
        modifyTime: freezed == modifyTime
            ? _value.modifyTime
            : modifyTime // ignore: cast_nullable_to_non_nullable
                  as double?,
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        fileid: freezed == fileid
            ? _value.fileid
            : fileid // ignore: cast_nullable_to_non_nullable
                  as String?,
        parent_fileid: freezed == parent_fileid
            ? _value.parent_fileid
            : parent_fileid // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnail: freezed == thumbnail
            ? _value.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as String?,
        pickcode: freezed == pickcode
            ? _value.pickcode
            : pickcode // ignore: cast_nullable_to_non_nullable
                  as String?,
        drive_id: freezed == drive_id
            ? _value.drive_id
            : drive_id // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaOrganizeFileItemImpl implements _MediaOrganizeFileItem {
  const _$MediaOrganizeFileItemImpl({
    this.path,
    this.storage,
    this.type,
    this.name,
    this.basename,
    this.extension,
    @JsonKey(fromJson: _intFromJson) this.size,
    @JsonKey(name: 'modify_time', fromJson: _doubleFromJson) this.modifyTime,
    final List<dynamic> children = const [],
    this.fileid,
    this.parent_fileid,
    this.thumbnail,
    this.pickcode,
    this.drive_id,
    this.url,
  }) : _children = children;

  factory _$MediaOrganizeFileItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaOrganizeFileItemImplFromJson(json);

  @override
  final String? path;
  @override
  final String? storage;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? basename;
  @override
  final String? extension;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? size;
  @override
  @JsonKey(name: 'modify_time', fromJson: _doubleFromJson)
  final double? modifyTime;
  final List<dynamic> _children;
  @override
  @JsonKey()
  List<dynamic> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final String? fileid;
  @override
  final String? parent_fileid;
  @override
  final String? thumbnail;
  @override
  final String? pickcode;
  @override
  final String? drive_id;
  @override
  final String? url;

  @override
  String toString() {
    return 'MediaOrganizeFileItem(path: $path, storage: $storage, type: $type, name: $name, basename: $basename, extension: $extension, size: $size, modifyTime: $modifyTime, children: $children, fileid: $fileid, parent_fileid: $parent_fileid, thumbnail: $thumbnail, pickcode: $pickcode, drive_id: $drive_id, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaOrganizeFileItemImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.storage, storage) || other.storage == storage) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.basename, basename) ||
                other.basename == basename) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.modifyTime, modifyTime) ||
                other.modifyTime == modifyTime) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.fileid, fileid) || other.fileid == fileid) &&
            (identical(other.parent_fileid, parent_fileid) ||
                other.parent_fileid == parent_fileid) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.pickcode, pickcode) ||
                other.pickcode == pickcode) &&
            (identical(other.drive_id, drive_id) ||
                other.drive_id == drive_id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    path,
    storage,
    type,
    name,
    basename,
    extension,
    size,
    modifyTime,
    const DeepCollectionEquality().hash(_children),
    fileid,
    parent_fileid,
    thumbnail,
    pickcode,
    drive_id,
    url,
  );

  /// Create a copy of MediaOrganizeFileItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaOrganizeFileItemImplCopyWith<_$MediaOrganizeFileItemImpl>
  get copyWith =>
      __$$MediaOrganizeFileItemImplCopyWithImpl<_$MediaOrganizeFileItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaOrganizeFileItemImplToJson(this);
  }
}

abstract class _MediaOrganizeFileItem implements MediaOrganizeFileItem {
  const factory _MediaOrganizeFileItem({
    final String? path,
    final String? storage,
    final String? type,
    final String? name,
    final String? basename,
    final String? extension,
    @JsonKey(fromJson: _intFromJson) final int? size,
    @JsonKey(name: 'modify_time', fromJson: _doubleFromJson)
    final double? modifyTime,
    final List<dynamic> children,
    final String? fileid,
    final String? parent_fileid,
    final String? thumbnail,
    final String? pickcode,
    final String? drive_id,
    final String? url,
  }) = _$MediaOrganizeFileItemImpl;

  factory _MediaOrganizeFileItem.fromJson(Map<String, dynamic> json) =
      _$MediaOrganizeFileItemImpl.fromJson;

  @override
  String? get path;
  @override
  String? get storage;
  @override
  String? get type;
  @override
  String? get name;
  @override
  String? get basename;
  @override
  String? get extension;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get size;
  @override
  @JsonKey(name: 'modify_time', fromJson: _doubleFromJson)
  double? get modifyTime;
  @override
  List<dynamic> get children;
  @override
  String? get fileid;
  @override
  String? get parent_fileid;
  @override
  String? get thumbnail;
  @override
  String? get pickcode;
  @override
  String? get drive_id;
  @override
  String? get url;

  /// Create a copy of MediaOrganizeFileItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaOrganizeFileItemImplCopyWith<_$MediaOrganizeFileItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MediaOrganizeTransferItem _$MediaOrganizeTransferItemFromJson(
  Map<String, dynamic> json,
) {
  return _MediaOrganizeTransferItem.fromJson(json);
}

/// @nodoc
mixin _$MediaOrganizeTransferItem {
  @JsonKey(fromJson: _intFromJson)
  int? get id => throw _privateConstructorUsedError;
  String? get src => throw _privateConstructorUsedError;
  String? get src_storage => throw _privateConstructorUsedError;
  MediaOrganizeFileItem? get src_fileitem => throw _privateConstructorUsedError;
  String? get dest => throw _privateConstructorUsedError;
  String? get dest_storage => throw _privateConstructorUsedError;
  MediaOrganizeFileItem? get dest_fileitem =>
      throw _privateConstructorUsedError;
  String? get mode => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get tmdbid => throw _privateConstructorUsedError;
  String? get imdbid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get tvdbid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get doubanid => throw _privateConstructorUsedError;
  String? get seasons => throw _privateConstructorUsedError;
  String? get episodes => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get downloader => throw _privateConstructorUsedError;
  String? get download_hash => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromJson)
  bool? get status => throw _privateConstructorUsedError;
  String? get errmsg => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get files => throw _privateConstructorUsedError;
  dynamic get episode_group => throw _privateConstructorUsedError;

  /// Serializes this MediaOrganizeTransferItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaOrganizeTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaOrganizeTransferItemCopyWith<MediaOrganizeTransferItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaOrganizeTransferItemCopyWith<$Res> {
  factory $MediaOrganizeTransferItemCopyWith(
    MediaOrganizeTransferItem value,
    $Res Function(MediaOrganizeTransferItem) then,
  ) = _$MediaOrganizeTransferItemCopyWithImpl<$Res, MediaOrganizeTransferItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? id,
    String? src,
    String? src_storage,
    MediaOrganizeFileItem? src_fileitem,
    String? dest,
    String? dest_storage,
    MediaOrganizeFileItem? dest_fileitem,
    String? mode,
    String? type,
    String? category,
    String? title,
    String? year,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    String? imdbid,
    @JsonKey(fromJson: _intFromJson) int? tvdbid,
    @JsonKey(fromJson: _intFromJson) int? doubanid,
    String? seasons,
    String? episodes,
    String? image,
    String? downloader,
    String? download_hash,
    @JsonKey(fromJson: _boolFromJson) bool? status,
    String? errmsg,
    String? date,
    @JsonKey(fromJson: _stringListFromJson) List<String> files,
    dynamic episode_group,
  });

  $MediaOrganizeFileItemCopyWith<$Res>? get src_fileitem;
  $MediaOrganizeFileItemCopyWith<$Res>? get dest_fileitem;
}

/// @nodoc
class _$MediaOrganizeTransferItemCopyWithImpl<
  $Res,
  $Val extends MediaOrganizeTransferItem
>
    implements $MediaOrganizeTransferItemCopyWith<$Res> {
  _$MediaOrganizeTransferItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaOrganizeTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? src = freezed,
    Object? src_storage = freezed,
    Object? src_fileitem = freezed,
    Object? dest = freezed,
    Object? dest_storage = freezed,
    Object? dest_fileitem = freezed,
    Object? mode = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? title = freezed,
    Object? year = freezed,
    Object? tmdbid = freezed,
    Object? imdbid = freezed,
    Object? tvdbid = freezed,
    Object? doubanid = freezed,
    Object? seasons = freezed,
    Object? episodes = freezed,
    Object? image = freezed,
    Object? downloader = freezed,
    Object? download_hash = freezed,
    Object? status = freezed,
    Object? errmsg = freezed,
    Object? date = freezed,
    Object? files = null,
    Object? episode_group = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            src: freezed == src
                ? _value.src
                : src // ignore: cast_nullable_to_non_nullable
                      as String?,
            src_storage: freezed == src_storage
                ? _value.src_storage
                : src_storage // ignore: cast_nullable_to_non_nullable
                      as String?,
            src_fileitem: freezed == src_fileitem
                ? _value.src_fileitem
                : src_fileitem // ignore: cast_nullable_to_non_nullable
                      as MediaOrganizeFileItem?,
            dest: freezed == dest
                ? _value.dest
                : dest // ignore: cast_nullable_to_non_nullable
                      as String?,
            dest_storage: freezed == dest_storage
                ? _value.dest_storage
                : dest_storage // ignore: cast_nullable_to_non_nullable
                      as String?,
            dest_fileitem: freezed == dest_fileitem
                ? _value.dest_fileitem
                : dest_fileitem // ignore: cast_nullable_to_non_nullable
                      as MediaOrganizeFileItem?,
            mode: freezed == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String?,
            tmdbid: freezed == tmdbid
                ? _value.tmdbid
                : tmdbid // ignore: cast_nullable_to_non_nullable
                      as int?,
            imdbid: freezed == imdbid
                ? _value.imdbid
                : imdbid // ignore: cast_nullable_to_non_nullable
                      as String?,
            tvdbid: freezed == tvdbid
                ? _value.tvdbid
                : tvdbid // ignore: cast_nullable_to_non_nullable
                      as int?,
            doubanid: freezed == doubanid
                ? _value.doubanid
                : doubanid // ignore: cast_nullable_to_non_nullable
                      as int?,
            seasons: freezed == seasons
                ? _value.seasons
                : seasons // ignore: cast_nullable_to_non_nullable
                      as String?,
            episodes: freezed == episodes
                ? _value.episodes
                : episodes // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            downloader: freezed == downloader
                ? _value.downloader
                : downloader // ignore: cast_nullable_to_non_nullable
                      as String?,
            download_hash: freezed == download_hash
                ? _value.download_hash
                : download_hash // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as bool?,
            errmsg: freezed == errmsg
                ? _value.errmsg
                : errmsg // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            files: null == files
                ? _value.files
                : files // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            episode_group: freezed == episode_group
                ? _value.episode_group
                : episode_group // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
  }

  /// Create a copy of MediaOrganizeTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaOrganizeFileItemCopyWith<$Res>? get src_fileitem {
    if (_value.src_fileitem == null) {
      return null;
    }

    return $MediaOrganizeFileItemCopyWith<$Res>(_value.src_fileitem!, (value) {
      return _then(_value.copyWith(src_fileitem: value) as $Val);
    });
  }

  /// Create a copy of MediaOrganizeTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaOrganizeFileItemCopyWith<$Res>? get dest_fileitem {
    if (_value.dest_fileitem == null) {
      return null;
    }

    return $MediaOrganizeFileItemCopyWith<$Res>(_value.dest_fileitem!, (value) {
      return _then(_value.copyWith(dest_fileitem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaOrganizeTransferItemImplCopyWith<$Res>
    implements $MediaOrganizeTransferItemCopyWith<$Res> {
  factory _$$MediaOrganizeTransferItemImplCopyWith(
    _$MediaOrganizeTransferItemImpl value,
    $Res Function(_$MediaOrganizeTransferItemImpl) then,
  ) = __$$MediaOrganizeTransferItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? id,
    String? src,
    String? src_storage,
    MediaOrganizeFileItem? src_fileitem,
    String? dest,
    String? dest_storage,
    MediaOrganizeFileItem? dest_fileitem,
    String? mode,
    String? type,
    String? category,
    String? title,
    String? year,
    @JsonKey(fromJson: _intFromJson) int? tmdbid,
    String? imdbid,
    @JsonKey(fromJson: _intFromJson) int? tvdbid,
    @JsonKey(fromJson: _intFromJson) int? doubanid,
    String? seasons,
    String? episodes,
    String? image,
    String? downloader,
    String? download_hash,
    @JsonKey(fromJson: _boolFromJson) bool? status,
    String? errmsg,
    String? date,
    @JsonKey(fromJson: _stringListFromJson) List<String> files,
    dynamic episode_group,
  });

  @override
  $MediaOrganizeFileItemCopyWith<$Res>? get src_fileitem;
  @override
  $MediaOrganizeFileItemCopyWith<$Res>? get dest_fileitem;
}

/// @nodoc
class __$$MediaOrganizeTransferItemImplCopyWithImpl<$Res>
    extends
        _$MediaOrganizeTransferItemCopyWithImpl<
          $Res,
          _$MediaOrganizeTransferItemImpl
        >
    implements _$$MediaOrganizeTransferItemImplCopyWith<$Res> {
  __$$MediaOrganizeTransferItemImplCopyWithImpl(
    _$MediaOrganizeTransferItemImpl _value,
    $Res Function(_$MediaOrganizeTransferItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaOrganizeTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? src = freezed,
    Object? src_storage = freezed,
    Object? src_fileitem = freezed,
    Object? dest = freezed,
    Object? dest_storage = freezed,
    Object? dest_fileitem = freezed,
    Object? mode = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? title = freezed,
    Object? year = freezed,
    Object? tmdbid = freezed,
    Object? imdbid = freezed,
    Object? tvdbid = freezed,
    Object? doubanid = freezed,
    Object? seasons = freezed,
    Object? episodes = freezed,
    Object? image = freezed,
    Object? downloader = freezed,
    Object? download_hash = freezed,
    Object? status = freezed,
    Object? errmsg = freezed,
    Object? date = freezed,
    Object? files = null,
    Object? episode_group = freezed,
  }) {
    return _then(
      _$MediaOrganizeTransferItemImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        src: freezed == src
            ? _value.src
            : src // ignore: cast_nullable_to_non_nullable
                  as String?,
        src_storage: freezed == src_storage
            ? _value.src_storage
            : src_storage // ignore: cast_nullable_to_non_nullable
                  as String?,
        src_fileitem: freezed == src_fileitem
            ? _value.src_fileitem
            : src_fileitem // ignore: cast_nullable_to_non_nullable
                  as MediaOrganizeFileItem?,
        dest: freezed == dest
            ? _value.dest
            : dest // ignore: cast_nullable_to_non_nullable
                  as String?,
        dest_storage: freezed == dest_storage
            ? _value.dest_storage
            : dest_storage // ignore: cast_nullable_to_non_nullable
                  as String?,
        dest_fileitem: freezed == dest_fileitem
            ? _value.dest_fileitem
            : dest_fileitem // ignore: cast_nullable_to_non_nullable
                  as MediaOrganizeFileItem?,
        mode: freezed == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String?,
        tmdbid: freezed == tmdbid
            ? _value.tmdbid
            : tmdbid // ignore: cast_nullable_to_non_nullable
                  as int?,
        imdbid: freezed == imdbid
            ? _value.imdbid
            : imdbid // ignore: cast_nullable_to_non_nullable
                  as String?,
        tvdbid: freezed == tvdbid
            ? _value.tvdbid
            : tvdbid // ignore: cast_nullable_to_non_nullable
                  as int?,
        doubanid: freezed == doubanid
            ? _value.doubanid
            : doubanid // ignore: cast_nullable_to_non_nullable
                  as int?,
        seasons: freezed == seasons
            ? _value.seasons
            : seasons // ignore: cast_nullable_to_non_nullable
                  as String?,
        episodes: freezed == episodes
            ? _value.episodes
            : episodes // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        downloader: freezed == downloader
            ? _value.downloader
            : downloader // ignore: cast_nullable_to_non_nullable
                  as String?,
        download_hash: freezed == download_hash
            ? _value.download_hash
            : download_hash // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as bool?,
        errmsg: freezed == errmsg
            ? _value.errmsg
            : errmsg // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        files: null == files
            ? _value._files
            : files // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        episode_group: freezed == episode_group
            ? _value.episode_group
            : episode_group // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaOrganizeTransferItemImpl implements _MediaOrganizeTransferItem {
  const _$MediaOrganizeTransferItemImpl({
    @JsonKey(fromJson: _intFromJson) this.id,
    this.src,
    this.src_storage,
    this.src_fileitem,
    this.dest,
    this.dest_storage,
    this.dest_fileitem,
    this.mode,
    this.type,
    this.category,
    this.title,
    this.year,
    @JsonKey(fromJson: _intFromJson) this.tmdbid,
    this.imdbid,
    @JsonKey(fromJson: _intFromJson) this.tvdbid,
    @JsonKey(fromJson: _intFromJson) this.doubanid,
    this.seasons,
    this.episodes,
    this.image,
    this.downloader,
    this.download_hash,
    @JsonKey(fromJson: _boolFromJson) this.status,
    this.errmsg,
    this.date,
    @JsonKey(fromJson: _stringListFromJson) final List<String> files = const [],
    this.episode_group,
  }) : _files = files;

  factory _$MediaOrganizeTransferItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaOrganizeTransferItemImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int? id;
  @override
  final String? src;
  @override
  final String? src_storage;
  @override
  final MediaOrganizeFileItem? src_fileitem;
  @override
  final String? dest;
  @override
  final String? dest_storage;
  @override
  final MediaOrganizeFileItem? dest_fileitem;
  @override
  final String? mode;
  @override
  final String? type;
  @override
  final String? category;
  @override
  final String? title;
  @override
  final String? year;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? tmdbid;
  @override
  final String? imdbid;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? tvdbid;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? doubanid;
  @override
  final String? seasons;
  @override
  final String? episodes;
  @override
  final String? image;
  @override
  final String? downloader;
  @override
  final String? download_hash;
  @override
  @JsonKey(fromJson: _boolFromJson)
  final bool? status;
  @override
  final String? errmsg;
  @override
  final String? date;
  final List<String> _files;
  @override
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final dynamic episode_group;

  @override
  String toString() {
    return 'MediaOrganizeTransferItem(id: $id, src: $src, src_storage: $src_storage, src_fileitem: $src_fileitem, dest: $dest, dest_storage: $dest_storage, dest_fileitem: $dest_fileitem, mode: $mode, type: $type, category: $category, title: $title, year: $year, tmdbid: $tmdbid, imdbid: $imdbid, tvdbid: $tvdbid, doubanid: $doubanid, seasons: $seasons, episodes: $episodes, image: $image, downloader: $downloader, download_hash: $download_hash, status: $status, errmsg: $errmsg, date: $date, files: $files, episode_group: $episode_group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaOrganizeTransferItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.src_storage, src_storage) ||
                other.src_storage == src_storage) &&
            (identical(other.src_fileitem, src_fileitem) ||
                other.src_fileitem == src_fileitem) &&
            (identical(other.dest, dest) || other.dest == dest) &&
            (identical(other.dest_storage, dest_storage) ||
                other.dest_storage == dest_storage) &&
            (identical(other.dest_fileitem, dest_fileitem) ||
                other.dest_fileitem == dest_fileitem) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.tmdbid, tmdbid) || other.tmdbid == tmdbid) &&
            (identical(other.imdbid, imdbid) || other.imdbid == imdbid) &&
            (identical(other.tvdbid, tvdbid) || other.tvdbid == tvdbid) &&
            (identical(other.doubanid, doubanid) ||
                other.doubanid == doubanid) &&
            (identical(other.seasons, seasons) || other.seasons == seasons) &&
            (identical(other.episodes, episodes) ||
                other.episodes == episodes) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.downloader, downloader) ||
                other.downloader == downloader) &&
            (identical(other.download_hash, download_hash) ||
                other.download_hash == download_hash) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errmsg, errmsg) || other.errmsg == errmsg) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality().equals(
              other.episode_group,
              episode_group,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    src,
    src_storage,
    src_fileitem,
    dest,
    dest_storage,
    dest_fileitem,
    mode,
    type,
    category,
    title,
    year,
    tmdbid,
    imdbid,
    tvdbid,
    doubanid,
    seasons,
    episodes,
    image,
    downloader,
    download_hash,
    status,
    errmsg,
    date,
    const DeepCollectionEquality().hash(_files),
    const DeepCollectionEquality().hash(episode_group),
  ]);

  /// Create a copy of MediaOrganizeTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaOrganizeTransferItemImplCopyWith<_$MediaOrganizeTransferItemImpl>
  get copyWith =>
      __$$MediaOrganizeTransferItemImplCopyWithImpl<
        _$MediaOrganizeTransferItemImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaOrganizeTransferItemImplToJson(this);
  }
}

abstract class _MediaOrganizeTransferItem implements MediaOrganizeTransferItem {
  const factory _MediaOrganizeTransferItem({
    @JsonKey(fromJson: _intFromJson) final int? id,
    final String? src,
    final String? src_storage,
    final MediaOrganizeFileItem? src_fileitem,
    final String? dest,
    final String? dest_storage,
    final MediaOrganizeFileItem? dest_fileitem,
    final String? mode,
    final String? type,
    final String? category,
    final String? title,
    final String? year,
    @JsonKey(fromJson: _intFromJson) final int? tmdbid,
    final String? imdbid,
    @JsonKey(fromJson: _intFromJson) final int? tvdbid,
    @JsonKey(fromJson: _intFromJson) final int? doubanid,
    final String? seasons,
    final String? episodes,
    final String? image,
    final String? downloader,
    final String? download_hash,
    @JsonKey(fromJson: _boolFromJson) final bool? status,
    final String? errmsg,
    final String? date,
    @JsonKey(fromJson: _stringListFromJson) final List<String> files,
    final dynamic episode_group,
  }) = _$MediaOrganizeTransferItemImpl;

  factory _MediaOrganizeTransferItem.fromJson(Map<String, dynamic> json) =
      _$MediaOrganizeTransferItemImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJson)
  int? get id;
  @override
  String? get src;
  @override
  String? get src_storage;
  @override
  MediaOrganizeFileItem? get src_fileitem;
  @override
  String? get dest;
  @override
  String? get dest_storage;
  @override
  MediaOrganizeFileItem? get dest_fileitem;
  @override
  String? get mode;
  @override
  String? get type;
  @override
  String? get category;
  @override
  String? get title;
  @override
  String? get year;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get tmdbid;
  @override
  String? get imdbid;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get tvdbid;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get doubanid;
  @override
  String? get seasons;
  @override
  String? get episodes;
  @override
  String? get image;
  @override
  String? get downloader;
  @override
  String? get download_hash;
  @override
  @JsonKey(fromJson: _boolFromJson)
  bool? get status;
  @override
  String? get errmsg;
  @override
  String? get date;
  @override
  @JsonKey(fromJson: _stringListFromJson)
  List<String> get files;
  @override
  dynamic get episode_group;

  /// Create a copy of MediaOrganizeTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaOrganizeTransferItemImplCopyWith<_$MediaOrganizeTransferItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}
