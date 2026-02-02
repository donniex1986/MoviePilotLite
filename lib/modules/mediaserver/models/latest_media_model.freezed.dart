// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LatestMedia _$LatestMediaFromJson(Map<String, dynamic> json) {
  return _LatestMedia.fromJson(json);
}

/// @nodoc
mixin _$LatestMedia {
  /// 媒体ID
  String get id => throw _privateConstructorUsedError;

  /// 媒体标题
  String get title => throw _privateConstructorUsedError;

  /// 媒体副标题
  String get subtitle => throw _privateConstructorUsedError;

  /// 媒体类型
  String get type => throw _privateConstructorUsedError;

  /// 媒体封面
  String get image => throw _privateConstructorUsedError;

  /// 媒体链接
  String get link => throw _privateConstructorUsedError;

  /// 百分比
  double? get percent => throw _privateConstructorUsedError;

  /// 背景图片标签
  @JsonKey(name: 'BackdropImageTags')
  List<String> get backdropImageTags => throw _privateConstructorUsedError;

  /// 服务器类型
  @JsonKey(name: 'server_type')
  String get serverType => throw _privateConstructorUsedError;

  /// 是否使用cookie
  @JsonKey(name: 'use_cookies')
  bool? get useCookies => throw _privateConstructorUsedError;

  /// 媒体库名称
  String get libraryName => throw _privateConstructorUsedError;

  /// Serializes this LatestMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatestMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatestMediaCopyWith<LatestMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestMediaCopyWith<$Res> {
  factory $LatestMediaCopyWith(
    LatestMedia value,
    $Res Function(LatestMedia) then,
  ) = _$LatestMediaCopyWithImpl<$Res, LatestMedia>;
  @useResult
  $Res call({
    String id,
    String title,
    String subtitle,
    String type,
    String image,
    String link,
    double? percent,
    @JsonKey(name: 'BackdropImageTags') List<String> backdropImageTags,
    @JsonKey(name: 'server_type') String serverType,
    @JsonKey(name: 'use_cookies') bool? useCookies,
    String libraryName,
  });
}

/// @nodoc
class _$LatestMediaCopyWithImpl<$Res, $Val extends LatestMedia>
    implements $LatestMediaCopyWith<$Res> {
  _$LatestMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatestMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? type = null,
    Object? image = null,
    Object? link = null,
    Object? percent = freezed,
    Object? backdropImageTags = null,
    Object? serverType = null,
    Object? useCookies = freezed,
    Object? libraryName = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            subtitle: null == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            link: null == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                      as String,
            percent: freezed == percent
                ? _value.percent
                : percent // ignore: cast_nullable_to_non_nullable
                      as double?,
            backdropImageTags: null == backdropImageTags
                ? _value.backdropImageTags
                : backdropImageTags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            serverType: null == serverType
                ? _value.serverType
                : serverType // ignore: cast_nullable_to_non_nullable
                      as String,
            useCookies: freezed == useCookies
                ? _value.useCookies
                : useCookies // ignore: cast_nullable_to_non_nullable
                      as bool?,
            libraryName: null == libraryName
                ? _value.libraryName
                : libraryName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LatestMediaImplCopyWith<$Res>
    implements $LatestMediaCopyWith<$Res> {
  factory _$$LatestMediaImplCopyWith(
    _$LatestMediaImpl value,
    $Res Function(_$LatestMediaImpl) then,
  ) = __$$LatestMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String subtitle,
    String type,
    String image,
    String link,
    double? percent,
    @JsonKey(name: 'BackdropImageTags') List<String> backdropImageTags,
    @JsonKey(name: 'server_type') String serverType,
    @JsonKey(name: 'use_cookies') bool? useCookies,
    String libraryName,
  });
}

/// @nodoc
class __$$LatestMediaImplCopyWithImpl<$Res>
    extends _$LatestMediaCopyWithImpl<$Res, _$LatestMediaImpl>
    implements _$$LatestMediaImplCopyWith<$Res> {
  __$$LatestMediaImplCopyWithImpl(
    _$LatestMediaImpl _value,
    $Res Function(_$LatestMediaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LatestMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? type = null,
    Object? image = null,
    Object? link = null,
    Object? percent = freezed,
    Object? backdropImageTags = null,
    Object? serverType = null,
    Object? useCookies = freezed,
    Object? libraryName = null,
  }) {
    return _then(
      _$LatestMediaImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        subtitle: null == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        link: null == link
            ? _value.link
            : link // ignore: cast_nullable_to_non_nullable
                  as String,
        percent: freezed == percent
            ? _value.percent
            : percent // ignore: cast_nullable_to_non_nullable
                  as double?,
        backdropImageTags: null == backdropImageTags
            ? _value._backdropImageTags
            : backdropImageTags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        serverType: null == serverType
            ? _value.serverType
            : serverType // ignore: cast_nullable_to_non_nullable
                  as String,
        useCookies: freezed == useCookies
            ? _value.useCookies
            : useCookies // ignore: cast_nullable_to_non_nullable
                  as bool?,
        libraryName: null == libraryName
            ? _value.libraryName
            : libraryName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestMediaImpl implements _LatestMedia {
  const _$LatestMediaImpl({
    this.id = '',
    this.title = '',
    this.subtitle = '',
    this.type = '',
    this.image = '',
    this.link = '',
    this.percent,
    @JsonKey(name: 'BackdropImageTags')
    final List<String> backdropImageTags = const [],
    @JsonKey(name: 'server_type') this.serverType = '',
    @JsonKey(name: 'use_cookies') this.useCookies,
    this.libraryName = '',
  }) : _backdropImageTags = backdropImageTags;

  factory _$LatestMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestMediaImplFromJson(json);

  /// 媒体ID
  @override
  @JsonKey()
  final String id;

  /// 媒体标题
  @override
  @JsonKey()
  final String title;

  /// 媒体副标题
  @override
  @JsonKey()
  final String subtitle;

  /// 媒体类型
  @override
  @JsonKey()
  final String type;

  /// 媒体封面
  @override
  @JsonKey()
  final String image;

  /// 媒体链接
  @override
  @JsonKey()
  final String link;

  /// 百分比
  @override
  final double? percent;

  /// 背景图片标签
  final List<String> _backdropImageTags;

  /// 背景图片标签
  @override
  @JsonKey(name: 'BackdropImageTags')
  List<String> get backdropImageTags {
    if (_backdropImageTags is EqualUnmodifiableListView)
      return _backdropImageTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_backdropImageTags);
  }

  /// 服务器类型
  @override
  @JsonKey(name: 'server_type')
  final String serverType;

  /// 是否使用cookie
  @override
  @JsonKey(name: 'use_cookies')
  final bool? useCookies;

  /// 媒体库名称
  @override
  @JsonKey()
  final String libraryName;

  @override
  String toString() {
    return 'LatestMedia(id: $id, title: $title, subtitle: $subtitle, type: $type, image: $image, link: $link, percent: $percent, backdropImageTags: $backdropImageTags, serverType: $serverType, useCookies: $useCookies, libraryName: $libraryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            const DeepCollectionEquality().equals(
              other._backdropImageTags,
              _backdropImageTags,
            ) &&
            (identical(other.serverType, serverType) ||
                other.serverType == serverType) &&
            (identical(other.useCookies, useCookies) ||
                other.useCookies == useCookies) &&
            (identical(other.libraryName, libraryName) ||
                other.libraryName == libraryName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    subtitle,
    type,
    image,
    link,
    percent,
    const DeepCollectionEquality().hash(_backdropImageTags),
    serverType,
    useCookies,
    libraryName,
  );

  /// Create a copy of LatestMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestMediaImplCopyWith<_$LatestMediaImpl> get copyWith =>
      __$$LatestMediaImplCopyWithImpl<_$LatestMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestMediaImplToJson(this);
  }
}

abstract class _LatestMedia implements LatestMedia {
  const factory _LatestMedia({
    final String id,
    final String title,
    final String subtitle,
    final String type,
    final String image,
    final String link,
    final double? percent,
    @JsonKey(name: 'BackdropImageTags') final List<String> backdropImageTags,
    @JsonKey(name: 'server_type') final String serverType,
    @JsonKey(name: 'use_cookies') final bool? useCookies,
    final String libraryName,
  }) = _$LatestMediaImpl;

  factory _LatestMedia.fromJson(Map<String, dynamic> json) =
      _$LatestMediaImpl.fromJson;

  /// 媒体ID
  @override
  String get id;

  /// 媒体标题
  @override
  String get title;

  /// 媒体副标题
  @override
  String get subtitle;

  /// 媒体类型
  @override
  String get type;

  /// 媒体封面
  @override
  String get image;

  /// 媒体链接
  @override
  String get link;

  /// 百分比
  @override
  double? get percent;

  /// 背景图片标签
  @override
  @JsonKey(name: 'BackdropImageTags')
  List<String> get backdropImageTags;

  /// 服务器类型
  @override
  @JsonKey(name: 'server_type')
  String get serverType;

  /// 是否使用cookie
  @override
  @JsonKey(name: 'use_cookies')
  bool? get useCookies;

  /// 媒体库名称
  @override
  String get libraryName;

  /// Create a copy of LatestMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatestMediaImplCopyWith<_$LatestMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LatestMediaResponse _$LatestMediaResponseFromJson(Map<String, dynamic> json) {
  return _LatestMediaResponse.fromJson(json);
}

/// @nodoc
mixin _$LatestMediaResponse {
  /// 是否成功
  bool get success => throw _privateConstructorUsedError;

  /// 消息
  String? get message => throw _privateConstructorUsedError;

  /// 数据
  List<LatestMedia> get data => throw _privateConstructorUsedError;

  /// Serializes this LatestMediaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatestMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatestMediaResponseCopyWith<LatestMediaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestMediaResponseCopyWith<$Res> {
  factory $LatestMediaResponseCopyWith(
    LatestMediaResponse value,
    $Res Function(LatestMediaResponse) then,
  ) = _$LatestMediaResponseCopyWithImpl<$Res, LatestMediaResponse>;
  @useResult
  $Res call({bool success, String? message, List<LatestMedia> data});
}

/// @nodoc
class _$LatestMediaResponseCopyWithImpl<$Res, $Val extends LatestMediaResponse>
    implements $LatestMediaResponseCopyWith<$Res> {
  _$LatestMediaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatestMediaResponse
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
                      as List<LatestMedia>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LatestMediaResponseImplCopyWith<$Res>
    implements $LatestMediaResponseCopyWith<$Res> {
  factory _$$LatestMediaResponseImplCopyWith(
    _$LatestMediaResponseImpl value,
    $Res Function(_$LatestMediaResponseImpl) then,
  ) = __$$LatestMediaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, List<LatestMedia> data});
}

/// @nodoc
class __$$LatestMediaResponseImplCopyWithImpl<$Res>
    extends _$LatestMediaResponseCopyWithImpl<$Res, _$LatestMediaResponseImpl>
    implements _$$LatestMediaResponseImplCopyWith<$Res> {
  __$$LatestMediaResponseImplCopyWithImpl(
    _$LatestMediaResponseImpl _value,
    $Res Function(_$LatestMediaResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LatestMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(
      _$LatestMediaResponseImpl(
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
                  as List<LatestMedia>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestMediaResponseImpl implements _LatestMediaResponse {
  const _$LatestMediaResponseImpl({
    this.success = false,
    this.message,
    final List<LatestMedia> data = const [],
  }) : _data = data;

  factory _$LatestMediaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestMediaResponseImplFromJson(json);

  /// 是否成功
  @override
  @JsonKey()
  final bool success;

  /// 消息
  @override
  final String? message;

  /// 数据
  final List<LatestMedia> _data;

  /// 数据
  @override
  @JsonKey()
  List<LatestMedia> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LatestMediaResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestMediaResponseImpl &&
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

  /// Create a copy of LatestMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestMediaResponseImplCopyWith<_$LatestMediaResponseImpl> get copyWith =>
      __$$LatestMediaResponseImplCopyWithImpl<_$LatestMediaResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestMediaResponseImplToJson(this);
  }
}

abstract class _LatestMediaResponse implements LatestMediaResponse {
  const factory _LatestMediaResponse({
    final bool success,
    final String? message,
    final List<LatestMedia> data,
  }) = _$LatestMediaResponseImpl;

  factory _LatestMediaResponse.fromJson(Map<String, dynamic> json) =
      _$LatestMediaResponseImpl.fromJson;

  /// 是否成功
  @override
  bool get success;

  /// 消息
  @override
  String? get message;

  /// 数据
  @override
  List<LatestMedia> get data;

  /// Create a copy of LatestMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatestMediaResponseImplCopyWith<_$LatestMediaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
