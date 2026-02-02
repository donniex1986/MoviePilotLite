// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MediaLibrary _$MediaLibraryFromJson(Map<String, dynamic> json) {
  return _MediaLibrary.fromJson(json);
}

/// @nodoc
mixin _$MediaLibrary {
  /// 服务器类型
  String get server => throw _privateConstructorUsedError;

  /// 库ID
  String get id => throw _privateConstructorUsedError;

  /// 库名称
  String get name => throw _privateConstructorUsedError;

  /// 库路径
  String? get path => throw _privateConstructorUsedError;

  /// 库类型
  String get type => throw _privateConstructorUsedError;

  /// 库图片
  String? get image => throw _privateConstructorUsedError;

  /// 库图片列表
  List<String>? get image_list => throw _privateConstructorUsedError;

  /// 库链接
  String? get link => throw _privateConstructorUsedError;

  /// 服务器类型
  String get server_type => throw _privateConstructorUsedError;

  /// 是否使用 cookies
  bool? get use_cookies => throw _privateConstructorUsedError;

  /// Serializes this MediaLibrary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaLibrary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaLibraryCopyWith<MediaLibrary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaLibraryCopyWith<$Res> {
  factory $MediaLibraryCopyWith(
    MediaLibrary value,
    $Res Function(MediaLibrary) then,
  ) = _$MediaLibraryCopyWithImpl<$Res, MediaLibrary>;
  @useResult
  $Res call({
    String server,
    String id,
    String name,
    String? path,
    String type,
    String? image,
    List<String>? image_list,
    String? link,
    String server_type,
    bool? use_cookies,
  });
}

/// @nodoc
class _$MediaLibraryCopyWithImpl<$Res, $Val extends MediaLibrary>
    implements $MediaLibraryCopyWith<$Res> {
  _$MediaLibraryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaLibrary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? server = null,
    Object? id = null,
    Object? name = null,
    Object? path = freezed,
    Object? type = null,
    Object? image = freezed,
    Object? image_list = freezed,
    Object? link = freezed,
    Object? server_type = null,
    Object? use_cookies = freezed,
  }) {
    return _then(
      _value.copyWith(
            server: null == server
                ? _value.server
                : server // ignore: cast_nullable_to_non_nullable
                      as String,
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            path: freezed == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            image_list: freezed == image_list
                ? _value.image_list
                : image_list // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            link: freezed == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                      as String?,
            server_type: null == server_type
                ? _value.server_type
                : server_type // ignore: cast_nullable_to_non_nullable
                      as String,
            use_cookies: freezed == use_cookies
                ? _value.use_cookies
                : use_cookies // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaLibraryImplCopyWith<$Res>
    implements $MediaLibraryCopyWith<$Res> {
  factory _$$MediaLibraryImplCopyWith(
    _$MediaLibraryImpl value,
    $Res Function(_$MediaLibraryImpl) then,
  ) = __$$MediaLibraryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String server,
    String id,
    String name,
    String? path,
    String type,
    String? image,
    List<String>? image_list,
    String? link,
    String server_type,
    bool? use_cookies,
  });
}

/// @nodoc
class __$$MediaLibraryImplCopyWithImpl<$Res>
    extends _$MediaLibraryCopyWithImpl<$Res, _$MediaLibraryImpl>
    implements _$$MediaLibraryImplCopyWith<$Res> {
  __$$MediaLibraryImplCopyWithImpl(
    _$MediaLibraryImpl _value,
    $Res Function(_$MediaLibraryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaLibrary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? server = null,
    Object? id = null,
    Object? name = null,
    Object? path = freezed,
    Object? type = null,
    Object? image = freezed,
    Object? image_list = freezed,
    Object? link = freezed,
    Object? server_type = null,
    Object? use_cookies = freezed,
  }) {
    return _then(
      _$MediaLibraryImpl(
        server: null == server
            ? _value.server
            : server // ignore: cast_nullable_to_non_nullable
                  as String,
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        path: freezed == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        image_list: freezed == image_list
            ? _value._image_list
            : image_list // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        link: freezed == link
            ? _value.link
            : link // ignore: cast_nullable_to_non_nullable
                  as String?,
        server_type: null == server_type
            ? _value.server_type
            : server_type // ignore: cast_nullable_to_non_nullable
                  as String,
        use_cookies: freezed == use_cookies
            ? _value.use_cookies
            : use_cookies // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaLibraryImpl implements _MediaLibrary {
  const _$MediaLibraryImpl({
    this.server = '',
    this.id = '',
    this.name = '',
    this.path,
    this.type = '',
    this.image,
    final List<String>? image_list,
    this.link,
    this.server_type = '',
    this.use_cookies,
  }) : _image_list = image_list;

  factory _$MediaLibraryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaLibraryImplFromJson(json);

  /// 服务器类型
  @override
  @JsonKey()
  final String server;

  /// 库ID
  @override
  @JsonKey()
  final String id;

  /// 库名称
  @override
  @JsonKey()
  final String name;

  /// 库路径
  @override
  final String? path;

  /// 库类型
  @override
  @JsonKey()
  final String type;

  /// 库图片
  @override
  final String? image;

  /// 库图片列表
  final List<String>? _image_list;

  /// 库图片列表
  @override
  List<String>? get image_list {
    final value = _image_list;
    if (value == null) return null;
    if (_image_list is EqualUnmodifiableListView) return _image_list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 库链接
  @override
  final String? link;

  /// 服务器类型
  @override
  @JsonKey()
  final String server_type;

  /// 是否使用 cookies
  @override
  final bool? use_cookies;

  @override
  String toString() {
    return 'MediaLibrary(server: $server, id: $id, name: $name, path: $path, type: $type, image: $image, image_list: $image_list, link: $link, server_type: $server_type, use_cookies: $use_cookies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaLibraryImpl &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(
              other._image_list,
              _image_list,
            ) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.server_type, server_type) ||
                other.server_type == server_type) &&
            (identical(other.use_cookies, use_cookies) ||
                other.use_cookies == use_cookies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    server,
    id,
    name,
    path,
    type,
    image,
    const DeepCollectionEquality().hash(_image_list),
    link,
    server_type,
    use_cookies,
  );

  /// Create a copy of MediaLibrary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaLibraryImplCopyWith<_$MediaLibraryImpl> get copyWith =>
      __$$MediaLibraryImplCopyWithImpl<_$MediaLibraryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaLibraryImplToJson(this);
  }
}

abstract class _MediaLibrary implements MediaLibrary {
  const factory _MediaLibrary({
    final String server,
    final String id,
    final String name,
    final String? path,
    final String type,
    final String? image,
    final List<String>? image_list,
    final String? link,
    final String server_type,
    final bool? use_cookies,
  }) = _$MediaLibraryImpl;

  factory _MediaLibrary.fromJson(Map<String, dynamic> json) =
      _$MediaLibraryImpl.fromJson;

  /// 服务器类型
  @override
  String get server;

  /// 库ID
  @override
  String get id;

  /// 库名称
  @override
  String get name;

  /// 库路径
  @override
  String? get path;

  /// 库类型
  @override
  String get type;

  /// 库图片
  @override
  String? get image;

  /// 库图片列表
  @override
  List<String>? get image_list;

  /// 库链接
  @override
  String? get link;

  /// 服务器类型
  @override
  String get server_type;

  /// 是否使用 cookies
  @override
  bool? get use_cookies;

  /// Create a copy of MediaLibrary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaLibraryImplCopyWith<_$MediaLibraryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaLibraryResponse _$MediaLibraryResponseFromJson(Map<String, dynamic> json) {
  return _MediaLibraryResponse.fromJson(json);
}

/// @nodoc
mixin _$MediaLibraryResponse {
  /// 是否成功
  bool get success => throw _privateConstructorUsedError;

  /// 消息
  String? get message => throw _privateConstructorUsedError;

  /// 数据
  List<MediaLibrary> get data => throw _privateConstructorUsedError;

  /// Serializes this MediaLibraryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaLibraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaLibraryResponseCopyWith<MediaLibraryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaLibraryResponseCopyWith<$Res> {
  factory $MediaLibraryResponseCopyWith(
    MediaLibraryResponse value,
    $Res Function(MediaLibraryResponse) then,
  ) = _$MediaLibraryResponseCopyWithImpl<$Res, MediaLibraryResponse>;
  @useResult
  $Res call({bool success, String? message, List<MediaLibrary> data});
}

/// @nodoc
class _$MediaLibraryResponseCopyWithImpl<
  $Res,
  $Val extends MediaLibraryResponse
>
    implements $MediaLibraryResponseCopyWith<$Res> {
  _$MediaLibraryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaLibraryResponse
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
                      as List<MediaLibrary>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaLibraryResponseImplCopyWith<$Res>
    implements $MediaLibraryResponseCopyWith<$Res> {
  factory _$$MediaLibraryResponseImplCopyWith(
    _$MediaLibraryResponseImpl value,
    $Res Function(_$MediaLibraryResponseImpl) then,
  ) = __$$MediaLibraryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, List<MediaLibrary> data});
}

/// @nodoc
class __$$MediaLibraryResponseImplCopyWithImpl<$Res>
    extends _$MediaLibraryResponseCopyWithImpl<$Res, _$MediaLibraryResponseImpl>
    implements _$$MediaLibraryResponseImplCopyWith<$Res> {
  __$$MediaLibraryResponseImplCopyWithImpl(
    _$MediaLibraryResponseImpl _value,
    $Res Function(_$MediaLibraryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaLibraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(
      _$MediaLibraryResponseImpl(
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
                  as List<MediaLibrary>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaLibraryResponseImpl implements _MediaLibraryResponse {
  const _$MediaLibraryResponseImpl({
    this.success = false,
    this.message,
    final List<MediaLibrary> data = const [],
  }) : _data = data;

  factory _$MediaLibraryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaLibraryResponseImplFromJson(json);

  /// 是否成功
  @override
  @JsonKey()
  final bool success;

  /// 消息
  @override
  final String? message;

  /// 数据
  final List<MediaLibrary> _data;

  /// 数据
  @override
  @JsonKey()
  List<MediaLibrary> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MediaLibraryResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaLibraryResponseImpl &&
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

  /// Create a copy of MediaLibraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaLibraryResponseImplCopyWith<_$MediaLibraryResponseImpl>
  get copyWith =>
      __$$MediaLibraryResponseImplCopyWithImpl<_$MediaLibraryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaLibraryResponseImplToJson(this);
  }
}

abstract class _MediaLibraryResponse implements MediaLibraryResponse {
  const factory _MediaLibraryResponse({
    final bool success,
    final String? message,
    final List<MediaLibrary> data,
  }) = _$MediaLibraryResponseImpl;

  factory _MediaLibraryResponse.fromJson(Map<String, dynamic> json) =
      _$MediaLibraryResponseImpl.fromJson;

  /// 是否成功
  @override
  bool get success;

  /// 消息
  @override
  String? get message;

  /// 数据
  @override
  List<MediaLibrary> get data;

  /// Create a copy of MediaLibraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaLibraryResponseImplCopyWith<_$MediaLibraryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
