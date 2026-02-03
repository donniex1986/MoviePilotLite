// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_superuser')
  bool get isSuperuser => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_otp')
  bool get isOtp => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String, dynamic>{})
  Map<String, dynamic> get permissions => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String, dynamic>{})
  Map<String, dynamic> get settings => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call({
    int id,
    String name,
    String email,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'is_superuser') bool isSuperuser,
    String? avatar,
    @JsonKey(name: 'is_otp') bool isOtp,
    @JsonKey(defaultValue: <String, dynamic>{})
    Map<String, dynamic> permissions,
    @JsonKey(defaultValue: <String, dynamic>{}) Map<String, dynamic> settings,
    String? nickname,
  });
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? isActive = null,
    Object? isSuperuser = null,
    Object? avatar = freezed,
    Object? isOtp = null,
    Object? permissions = null,
    Object? settings = null,
    Object? nickname = freezed,
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
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSuperuser: null == isSuperuser
                ? _value.isSuperuser
                : isSuperuser // ignore: cast_nullable_to_non_nullable
                      as bool,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOtp: null == isOtp
                ? _value.isOtp
                : isOtp // ignore: cast_nullable_to_non_nullable
                      as bool,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            settings: null == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
    _$UserInfoImpl value,
    $Res Function(_$UserInfoImpl) then,
  ) = __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String email,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'is_superuser') bool isSuperuser,
    String? avatar,
    @JsonKey(name: 'is_otp') bool isOtp,
    @JsonKey(defaultValue: <String, dynamic>{})
    Map<String, dynamic> permissions,
    @JsonKey(defaultValue: <String, dynamic>{}) Map<String, dynamic> settings,
    String? nickname,
  });
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
    _$UserInfoImpl _value,
    $Res Function(_$UserInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? isActive = null,
    Object? isSuperuser = null,
    Object? avatar = freezed,
    Object? isOtp = null,
    Object? permissions = null,
    Object? settings = null,
    Object? nickname = freezed,
  }) {
    return _then(
      _$UserInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSuperuser: null == isSuperuser
            ? _value.isSuperuser
            : isSuperuser // ignore: cast_nullable_to_non_nullable
                  as bool,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOtp: null == isOtp
            ? _value.isOtp
            : isOtp // ignore: cast_nullable_to_non_nullable
                  as bool,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        settings: null == settings
            ? _value._settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl({
    required this.id,
    required this.name,
    required this.email,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'is_superuser') required this.isSuperuser,
    this.avatar,
    @JsonKey(name: 'is_otp') required this.isOtp,
    @JsonKey(defaultValue: <String, dynamic>{})
    required final Map<String, dynamic> permissions,
    @JsonKey(defaultValue: <String, dynamic>{})
    required final Map<String, dynamic> settings,
    this.nickname,
  }) : _permissions = permissions,
       _settings = settings;

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_superuser')
  final bool isSuperuser;
  @override
  final String? avatar;
  @override
  @JsonKey(name: 'is_otp')
  final bool isOtp;
  final Map<String, dynamic> _permissions;
  @override
  @JsonKey(defaultValue: <String, dynamic>{})
  Map<String, dynamic> get permissions {
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_permissions);
  }

  final Map<String, dynamic> _settings;
  @override
  @JsonKey(defaultValue: <String, dynamic>{})
  Map<String, dynamic> get settings {
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_settings);
  }

  @override
  final String? nickname;

  @override
  String toString() {
    return 'UserInfo(id: $id, name: $name, email: $email, isActive: $isActive, isSuperuser: $isSuperuser, avatar: $avatar, isOtp: $isOtp, permissions: $permissions, settings: $settings, nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSuperuser, isSuperuser) ||
                other.isSuperuser == isSuperuser) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.isOtp, isOtp) || other.isOtp == isOtp) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ) &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    email,
    isActive,
    isSuperuser,
    avatar,
    isOtp,
    const DeepCollectionEquality().hash(_permissions),
    const DeepCollectionEquality().hash(_settings),
    nickname,
  );

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(this);
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo({
    required final int id,
    required final String name,
    required final String email,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'is_superuser') required final bool isSuperuser,
    final String? avatar,
    @JsonKey(name: 'is_otp') required final bool isOtp,
    @JsonKey(defaultValue: <String, dynamic>{})
    required final Map<String, dynamic> permissions,
    @JsonKey(defaultValue: <String, dynamic>{})
    required final Map<String, dynamic> settings,
    final String? nickname,
  }) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_superuser')
  bool get isSuperuser;
  @override
  String? get avatar;
  @override
  @JsonKey(name: 'is_otp')
  bool get isOtp;
  @override
  @JsonKey(defaultValue: <String, dynamic>{})
  Map<String, dynamic> get permissions;
  @override
  @JsonKey(defaultValue: <String, dynamic>{})
  Map<String, dynamic> get settings;
  @override
  String? get nickname;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
