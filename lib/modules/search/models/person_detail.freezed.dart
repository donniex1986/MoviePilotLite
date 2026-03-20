// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PersonDetail _$PersonDetailFromJson(Map<String, dynamic> json) {
  return _PersonDetail.fromJson(json);
}

/// @nodoc
mixin _$PersonDetail {
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'also_known_as')
  List<String>? get alsoKnownAs => throw _privateConstructorUsedError;
  String? get biography => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  /// Serializes this PersonDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonDetailCopyWith<PersonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonDetailCopyWith<$Res> {
  factory $PersonDetailCopyWith(
    PersonDetail value,
    $Res Function(PersonDetail) then,
  ) = _$PersonDetailCopyWithImpl<$Res, PersonDetail>;
  @useResult
  $Res call({
    String? source,
    @JsonKey(fromJson: _intFromJson) int? id,
    @JsonKey(fromJson: _intFromJson) int? type,
    String? name,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(fromJson: _intFromJson) int? gender,
    @JsonKey(name: 'also_known_as') List<String>? alsoKnownAs,
    String? biography,
    String? avatar,
  });
}

/// @nodoc
class _$PersonDetailCopyWithImpl<$Res, $Val extends PersonDetail>
    implements $PersonDetailCopyWith<$Res> {
  _$PersonDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? profilePath = freezed,
    Object? gender = freezed,
    Object? alsoKnownAs = freezed,
    Object? biography = freezed,
    Object? avatar = freezed,
  }) {
    return _then(
      _value.copyWith(
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            profilePath: freezed == profilePath
                ? _value.profilePath
                : profilePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as int?,
            alsoKnownAs: freezed == alsoKnownAs
                ? _value.alsoKnownAs
                : alsoKnownAs // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            biography: freezed == biography
                ? _value.biography
                : biography // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PersonDetailImplCopyWith<$Res>
    implements $PersonDetailCopyWith<$Res> {
  factory _$$PersonDetailImplCopyWith(
    _$PersonDetailImpl value,
    $Res Function(_$PersonDetailImpl) then,
  ) = __$$PersonDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? source,
    @JsonKey(fromJson: _intFromJson) int? id,
    @JsonKey(fromJson: _intFromJson) int? type,
    String? name,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(fromJson: _intFromJson) int? gender,
    @JsonKey(name: 'also_known_as') List<String>? alsoKnownAs,
    String? biography,
    String? avatar,
  });
}

/// @nodoc
class __$$PersonDetailImplCopyWithImpl<$Res>
    extends _$PersonDetailCopyWithImpl<$Res, _$PersonDetailImpl>
    implements _$$PersonDetailImplCopyWith<$Res> {
  __$$PersonDetailImplCopyWithImpl(
    _$PersonDetailImpl _value,
    $Res Function(_$PersonDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PersonDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? profilePath = freezed,
    Object? gender = freezed,
    Object? alsoKnownAs = freezed,
    Object? biography = freezed,
    Object? avatar = freezed,
  }) {
    return _then(
      _$PersonDetailImpl(
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        profilePath: freezed == profilePath
            ? _value.profilePath
            : profilePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as int?,
        alsoKnownAs: freezed == alsoKnownAs
            ? _value._alsoKnownAs
            : alsoKnownAs // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        biography: freezed == biography
            ? _value.biography
            : biography // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonDetailImpl implements _PersonDetail {
  const _$PersonDetailImpl({
    this.source,
    @JsonKey(fromJson: _intFromJson) this.id,
    @JsonKey(fromJson: _intFromJson) this.type,
    this.name,
    @JsonKey(name: 'profile_path') this.profilePath,
    @JsonKey(fromJson: _intFromJson) this.gender,
    @JsonKey(name: 'also_known_as') final List<String>? alsoKnownAs,
    this.biography,
    this.avatar,
  }) : _alsoKnownAs = alsoKnownAs;

  factory _$PersonDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonDetailImplFromJson(json);

  @override
  final String? source;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? id;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? type;
  @override
  final String? name;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? gender;
  final List<String>? _alsoKnownAs;
  @override
  @JsonKey(name: 'also_known_as')
  List<String>? get alsoKnownAs {
    final value = _alsoKnownAs;
    if (value == null) return null;
    if (_alsoKnownAs is EqualUnmodifiableListView) return _alsoKnownAs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? biography;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'PersonDetail(source: $source, id: $id, type: $type, name: $name, profilePath: $profilePath, gender: $gender, alsoKnownAs: $alsoKnownAs, biography: $biography, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonDetailImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality().equals(
              other._alsoKnownAs,
              _alsoKnownAs,
            ) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    source,
    id,
    type,
    name,
    profilePath,
    gender,
    const DeepCollectionEquality().hash(_alsoKnownAs),
    biography,
    avatar,
  );

  /// Create a copy of PersonDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonDetailImplCopyWith<_$PersonDetailImpl> get copyWith =>
      __$$PersonDetailImplCopyWithImpl<_$PersonDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonDetailImplToJson(this);
  }
}

abstract class _PersonDetail implements PersonDetail {
  const factory _PersonDetail({
    final String? source,
    @JsonKey(fromJson: _intFromJson) final int? id,
    @JsonKey(fromJson: _intFromJson) final int? type,
    final String? name,
    @JsonKey(name: 'profile_path') final String? profilePath,
    @JsonKey(fromJson: _intFromJson) final int? gender,
    @JsonKey(name: 'also_known_as') final List<String>? alsoKnownAs,
    final String? biography,
    final String? avatar,
  }) = _$PersonDetailImpl;

  factory _PersonDetail.fromJson(Map<String, dynamic> json) =
      _$PersonDetailImpl.fromJson;

  @override
  String? get source;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get id;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get type;
  @override
  String? get name;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get gender;
  @override
  @JsonKey(name: 'also_known_as')
  List<String>? get alsoKnownAs;
  @override
  String? get biography;
  @override
  String? get avatar;

  /// Create a copy of PersonDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonDetailImplCopyWith<_$PersonDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
