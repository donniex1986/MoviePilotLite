// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_notexists.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MediaNotExists _$MediaNotExistsFromJson(Map<String, dynamic> json) {
  return _MediaNotExists.fromJson(json);
}

/// @nodoc
mixin _$MediaNotExists {
  @JsonKey(fromJson: _intFromJson)
  int? get season => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringListFromJson)
  List<String?>? get episodes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get total_episode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get start_episode => throw _privateConstructorUsedError;

  /// Serializes this MediaNotExists to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaNotExists
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaNotExistsCopyWith<MediaNotExists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaNotExistsCopyWith<$Res> {
  factory $MediaNotExistsCopyWith(
    MediaNotExists value,
    $Res Function(MediaNotExists) then,
  ) = _$MediaNotExistsCopyWithImpl<$Res, MediaNotExists>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? season,
    @JsonKey(fromJson: _stringListFromJson) List<String?>? episodes,
    @JsonKey(fromJson: _intFromJson) int? total_episode,
    @JsonKey(fromJson: _intFromJson) int? start_episode,
  });
}

/// @nodoc
class _$MediaNotExistsCopyWithImpl<$Res, $Val extends MediaNotExists>
    implements $MediaNotExistsCopyWith<$Res> {
  _$MediaNotExistsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaNotExists
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? season = freezed,
    Object? episodes = freezed,
    Object? total_episode = freezed,
    Object? start_episode = freezed,
  }) {
    return _then(
      _value.copyWith(
            season: freezed == season
                ? _value.season
                : season // ignore: cast_nullable_to_non_nullable
                      as int?,
            episodes: freezed == episodes
                ? _value.episodes
                : episodes // ignore: cast_nullable_to_non_nullable
                      as List<String?>?,
            total_episode: freezed == total_episode
                ? _value.total_episode
                : total_episode // ignore: cast_nullable_to_non_nullable
                      as int?,
            start_episode: freezed == start_episode
                ? _value.start_episode
                : start_episode // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaNotExistsImplCopyWith<$Res>
    implements $MediaNotExistsCopyWith<$Res> {
  factory _$$MediaNotExistsImplCopyWith(
    _$MediaNotExistsImpl value,
    $Res Function(_$MediaNotExistsImpl) then,
  ) = __$$MediaNotExistsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _intFromJson) int? season,
    @JsonKey(fromJson: _stringListFromJson) List<String?>? episodes,
    @JsonKey(fromJson: _intFromJson) int? total_episode,
    @JsonKey(fromJson: _intFromJson) int? start_episode,
  });
}

/// @nodoc
class __$$MediaNotExistsImplCopyWithImpl<$Res>
    extends _$MediaNotExistsCopyWithImpl<$Res, _$MediaNotExistsImpl>
    implements _$$MediaNotExistsImplCopyWith<$Res> {
  __$$MediaNotExistsImplCopyWithImpl(
    _$MediaNotExistsImpl _value,
    $Res Function(_$MediaNotExistsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaNotExists
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? season = freezed,
    Object? episodes = freezed,
    Object? total_episode = freezed,
    Object? start_episode = freezed,
  }) {
    return _then(
      _$MediaNotExistsImpl(
        season: freezed == season
            ? _value.season
            : season // ignore: cast_nullable_to_non_nullable
                  as int?,
        episodes: freezed == episodes
            ? _value._episodes
            : episodes // ignore: cast_nullable_to_non_nullable
                  as List<String?>?,
        total_episode: freezed == total_episode
            ? _value.total_episode
            : total_episode // ignore: cast_nullable_to_non_nullable
                  as int?,
        start_episode: freezed == start_episode
            ? _value.start_episode
            : start_episode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaNotExistsImpl implements _MediaNotExists {
  const _$MediaNotExistsImpl({
    @JsonKey(fromJson: _intFromJson) this.season,
    @JsonKey(fromJson: _stringListFromJson) final List<String?>? episodes,
    @JsonKey(fromJson: _intFromJson) this.total_episode,
    @JsonKey(fromJson: _intFromJson) this.start_episode,
  }) : _episodes = episodes;

  factory _$MediaNotExistsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaNotExistsImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int? season;
  final List<String?>? _episodes;
  @override
  @JsonKey(fromJson: _stringListFromJson)
  List<String?>? get episodes {
    final value = _episodes;
    if (value == null) return null;
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: _intFromJson)
  final int? total_episode;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? start_episode;

  @override
  String toString() {
    return 'MediaNotExists(season: $season, episodes: $episodes, total_episode: $total_episode, start_episode: $start_episode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaNotExistsImpl &&
            (identical(other.season, season) || other.season == season) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes) &&
            (identical(other.total_episode, total_episode) ||
                other.total_episode == total_episode) &&
            (identical(other.start_episode, start_episode) ||
                other.start_episode == start_episode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    season,
    const DeepCollectionEquality().hash(_episodes),
    total_episode,
    start_episode,
  );

  /// Create a copy of MediaNotExists
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaNotExistsImplCopyWith<_$MediaNotExistsImpl> get copyWith =>
      __$$MediaNotExistsImplCopyWithImpl<_$MediaNotExistsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaNotExistsImplToJson(this);
  }
}

abstract class _MediaNotExists implements MediaNotExists {
  const factory _MediaNotExists({
    @JsonKey(fromJson: _intFromJson) final int? season,
    @JsonKey(fromJson: _stringListFromJson) final List<String?>? episodes,
    @JsonKey(fromJson: _intFromJson) final int? total_episode,
    @JsonKey(fromJson: _intFromJson) final int? start_episode,
  }) = _$MediaNotExistsImpl;

  factory _MediaNotExists.fromJson(Map<String, dynamic> json) =
      _$MediaNotExistsImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJson)
  int? get season;
  @override
  @JsonKey(fromJson: _stringListFromJson)
  List<String?>? get episodes;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get total_episode;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get start_episode;

  /// Create a copy of MediaNotExists
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaNotExistsImplCopyWith<_$MediaNotExistsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
