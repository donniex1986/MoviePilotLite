// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_episode_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SeasonEpisodeDetail _$SeasonEpisodeDetailFromJson(Map<String, dynamic> json) {
  return _SeasonEpisodeDetail.fromJson(json);
}

/// @nodoc
mixin _$SeasonEpisodeDetail {
  String? get air_date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get episode_number => throw _privateConstructorUsedError;
  String? get episode_type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get runtime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromJson)
  int? get season_number => throw _privateConstructorUsedError;
  String? get still_path => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromJson)
  double? get vote_average => throw _privateConstructorUsedError;
  List<SeasonCrewMember>? get crew => throw _privateConstructorUsedError;
  List<SeasonGuestStar>? get guest_stars => throw _privateConstructorUsedError;

  /// Serializes this SeasonEpisodeDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeasonEpisodeDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeasonEpisodeDetailCopyWith<SeasonEpisodeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonEpisodeDetailCopyWith<$Res> {
  factory $SeasonEpisodeDetailCopyWith(
    SeasonEpisodeDetail value,
    $Res Function(SeasonEpisodeDetail) then,
  ) = _$SeasonEpisodeDetailCopyWithImpl<$Res, SeasonEpisodeDetail>;
  @useResult
  $Res call({
    String? air_date,
    @JsonKey(fromJson: _intFromJson) int? episode_number,
    String? episode_type,
    String? name,
    String? overview,
    @JsonKey(fromJson: _intFromJson) int? runtime,
    @JsonKey(fromJson: _intFromJson) int? season_number,
    String? still_path,
    @JsonKey(fromJson: _doubleFromJson) double? vote_average,
    List<SeasonCrewMember>? crew,
    List<SeasonGuestStar>? guest_stars,
  });
}

/// @nodoc
class _$SeasonEpisodeDetailCopyWithImpl<$Res, $Val extends SeasonEpisodeDetail>
    implements $SeasonEpisodeDetailCopyWith<$Res> {
  _$SeasonEpisodeDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeasonEpisodeDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? air_date = freezed,
    Object? episode_number = freezed,
    Object? episode_type = freezed,
    Object? name = freezed,
    Object? overview = freezed,
    Object? runtime = freezed,
    Object? season_number = freezed,
    Object? still_path = freezed,
    Object? vote_average = freezed,
    Object? crew = freezed,
    Object? guest_stars = freezed,
  }) {
    return _then(
      _value.copyWith(
            air_date: freezed == air_date
                ? _value.air_date
                : air_date // ignore: cast_nullable_to_non_nullable
                      as String?,
            episode_number: freezed == episode_number
                ? _value.episode_number
                : episode_number // ignore: cast_nullable_to_non_nullable
                      as int?,
            episode_type: freezed == episode_type
                ? _value.episode_type
                : episode_type // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            overview: freezed == overview
                ? _value.overview
                : overview // ignore: cast_nullable_to_non_nullable
                      as String?,
            runtime: freezed == runtime
                ? _value.runtime
                : runtime // ignore: cast_nullable_to_non_nullable
                      as int?,
            season_number: freezed == season_number
                ? _value.season_number
                : season_number // ignore: cast_nullable_to_non_nullable
                      as int?,
            still_path: freezed == still_path
                ? _value.still_path
                : still_path // ignore: cast_nullable_to_non_nullable
                      as String?,
            vote_average: freezed == vote_average
                ? _value.vote_average
                : vote_average // ignore: cast_nullable_to_non_nullable
                      as double?,
            crew: freezed == crew
                ? _value.crew
                : crew // ignore: cast_nullable_to_non_nullable
                      as List<SeasonCrewMember>?,
            guest_stars: freezed == guest_stars
                ? _value.guest_stars
                : guest_stars // ignore: cast_nullable_to_non_nullable
                      as List<SeasonGuestStar>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SeasonEpisodeDetailImplCopyWith<$Res>
    implements $SeasonEpisodeDetailCopyWith<$Res> {
  factory _$$SeasonEpisodeDetailImplCopyWith(
    _$SeasonEpisodeDetailImpl value,
    $Res Function(_$SeasonEpisodeDetailImpl) then,
  ) = __$$SeasonEpisodeDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? air_date,
    @JsonKey(fromJson: _intFromJson) int? episode_number,
    String? episode_type,
    String? name,
    String? overview,
    @JsonKey(fromJson: _intFromJson) int? runtime,
    @JsonKey(fromJson: _intFromJson) int? season_number,
    String? still_path,
    @JsonKey(fromJson: _doubleFromJson) double? vote_average,
    List<SeasonCrewMember>? crew,
    List<SeasonGuestStar>? guest_stars,
  });
}

/// @nodoc
class __$$SeasonEpisodeDetailImplCopyWithImpl<$Res>
    extends _$SeasonEpisodeDetailCopyWithImpl<$Res, _$SeasonEpisodeDetailImpl>
    implements _$$SeasonEpisodeDetailImplCopyWith<$Res> {
  __$$SeasonEpisodeDetailImplCopyWithImpl(
    _$SeasonEpisodeDetailImpl _value,
    $Res Function(_$SeasonEpisodeDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SeasonEpisodeDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? air_date = freezed,
    Object? episode_number = freezed,
    Object? episode_type = freezed,
    Object? name = freezed,
    Object? overview = freezed,
    Object? runtime = freezed,
    Object? season_number = freezed,
    Object? still_path = freezed,
    Object? vote_average = freezed,
    Object? crew = freezed,
    Object? guest_stars = freezed,
  }) {
    return _then(
      _$SeasonEpisodeDetailImpl(
        air_date: freezed == air_date
            ? _value.air_date
            : air_date // ignore: cast_nullable_to_non_nullable
                  as String?,
        episode_number: freezed == episode_number
            ? _value.episode_number
            : episode_number // ignore: cast_nullable_to_non_nullable
                  as int?,
        episode_type: freezed == episode_type
            ? _value.episode_type
            : episode_type // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        overview: freezed == overview
            ? _value.overview
            : overview // ignore: cast_nullable_to_non_nullable
                  as String?,
        runtime: freezed == runtime
            ? _value.runtime
            : runtime // ignore: cast_nullable_to_non_nullable
                  as int?,
        season_number: freezed == season_number
            ? _value.season_number
            : season_number // ignore: cast_nullable_to_non_nullable
                  as int?,
        still_path: freezed == still_path
            ? _value.still_path
            : still_path // ignore: cast_nullable_to_non_nullable
                  as String?,
        vote_average: freezed == vote_average
            ? _value.vote_average
            : vote_average // ignore: cast_nullable_to_non_nullable
                  as double?,
        crew: freezed == crew
            ? _value._crew
            : crew // ignore: cast_nullable_to_non_nullable
                  as List<SeasonCrewMember>?,
        guest_stars: freezed == guest_stars
            ? _value._guest_stars
            : guest_stars // ignore: cast_nullable_to_non_nullable
                  as List<SeasonGuestStar>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasonEpisodeDetailImpl implements _SeasonEpisodeDetail {
  const _$SeasonEpisodeDetailImpl({
    this.air_date,
    @JsonKey(fromJson: _intFromJson) this.episode_number,
    this.episode_type,
    this.name,
    this.overview,
    @JsonKey(fromJson: _intFromJson) this.runtime,
    @JsonKey(fromJson: _intFromJson) this.season_number,
    this.still_path,
    @JsonKey(fromJson: _doubleFromJson) this.vote_average,
    final List<SeasonCrewMember>? crew,
    final List<SeasonGuestStar>? guest_stars,
  }) : _crew = crew,
       _guest_stars = guest_stars;

  factory _$SeasonEpisodeDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonEpisodeDetailImplFromJson(json);

  @override
  final String? air_date;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? episode_number;
  @override
  final String? episode_type;
  @override
  final String? name;
  @override
  final String? overview;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? runtime;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int? season_number;
  @override
  final String? still_path;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  final double? vote_average;
  final List<SeasonCrewMember>? _crew;
  @override
  List<SeasonCrewMember>? get crew {
    final value = _crew;
    if (value == null) return null;
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SeasonGuestStar>? _guest_stars;
  @override
  List<SeasonGuestStar>? get guest_stars {
    final value = _guest_stars;
    if (value == null) return null;
    if (_guest_stars is EqualUnmodifiableListView) return _guest_stars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SeasonEpisodeDetail(air_date: $air_date, episode_number: $episode_number, episode_type: $episode_type, name: $name, overview: $overview, runtime: $runtime, season_number: $season_number, still_path: $still_path, vote_average: $vote_average, crew: $crew, guest_stars: $guest_stars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonEpisodeDetailImpl &&
            (identical(other.air_date, air_date) ||
                other.air_date == air_date) &&
            (identical(other.episode_number, episode_number) ||
                other.episode_number == episode_number) &&
            (identical(other.episode_type, episode_type) ||
                other.episode_type == episode_type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.season_number, season_number) ||
                other.season_number == season_number) &&
            (identical(other.still_path, still_path) ||
                other.still_path == still_path) &&
            (identical(other.vote_average, vote_average) ||
                other.vote_average == vote_average) &&
            const DeepCollectionEquality().equals(other._crew, _crew) &&
            const DeepCollectionEquality().equals(
              other._guest_stars,
              _guest_stars,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    air_date,
    episode_number,
    episode_type,
    name,
    overview,
    runtime,
    season_number,
    still_path,
    vote_average,
    const DeepCollectionEquality().hash(_crew),
    const DeepCollectionEquality().hash(_guest_stars),
  );

  /// Create a copy of SeasonEpisodeDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonEpisodeDetailImplCopyWith<_$SeasonEpisodeDetailImpl> get copyWith =>
      __$$SeasonEpisodeDetailImplCopyWithImpl<_$SeasonEpisodeDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonEpisodeDetailImplToJson(this);
  }
}

abstract class _SeasonEpisodeDetail implements SeasonEpisodeDetail {
  const factory _SeasonEpisodeDetail({
    final String? air_date,
    @JsonKey(fromJson: _intFromJson) final int? episode_number,
    final String? episode_type,
    final String? name,
    final String? overview,
    @JsonKey(fromJson: _intFromJson) final int? runtime,
    @JsonKey(fromJson: _intFromJson) final int? season_number,
    final String? still_path,
    @JsonKey(fromJson: _doubleFromJson) final double? vote_average,
    final List<SeasonCrewMember>? crew,
    final List<SeasonGuestStar>? guest_stars,
  }) = _$SeasonEpisodeDetailImpl;

  factory _SeasonEpisodeDetail.fromJson(Map<String, dynamic> json) =
      _$SeasonEpisodeDetailImpl.fromJson;

  @override
  String? get air_date;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get episode_number;
  @override
  String? get episode_type;
  @override
  String? get name;
  @override
  String? get overview;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get runtime;
  @override
  @JsonKey(fromJson: _intFromJson)
  int? get season_number;
  @override
  String? get still_path;
  @override
  @JsonKey(fromJson: _doubleFromJson)
  double? get vote_average;
  @override
  List<SeasonCrewMember>? get crew;
  @override
  List<SeasonGuestStar>? get guest_stars;

  /// Create a copy of SeasonEpisodeDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeasonEpisodeDetailImplCopyWith<_$SeasonEpisodeDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeasonCrewMember _$SeasonCrewMemberFromJson(Map<String, dynamic> json) {
  return _SeasonCrewMember.fromJson(json);
}

/// @nodoc
mixin _$SeasonCrewMember {
  String? get job => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get original_name => throw _privateConstructorUsedError;
  String? get profile_path => throw _privateConstructorUsedError;

  /// Serializes this SeasonCrewMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeasonCrewMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeasonCrewMemberCopyWith<SeasonCrewMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonCrewMemberCopyWith<$Res> {
  factory $SeasonCrewMemberCopyWith(
    SeasonCrewMember value,
    $Res Function(SeasonCrewMember) then,
  ) = _$SeasonCrewMemberCopyWithImpl<$Res, SeasonCrewMember>;
  @useResult
  $Res call({
    String? job,
    String? department,
    String? name,
    String? original_name,
    String? profile_path,
  });
}

/// @nodoc
class _$SeasonCrewMemberCopyWithImpl<$Res, $Val extends SeasonCrewMember>
    implements $SeasonCrewMemberCopyWith<$Res> {
  _$SeasonCrewMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeasonCrewMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = freezed,
    Object? department = freezed,
    Object? name = freezed,
    Object? original_name = freezed,
    Object? profile_path = freezed,
  }) {
    return _then(
      _value.copyWith(
            job: freezed == job
                ? _value.job
                : job // ignore: cast_nullable_to_non_nullable
                      as String?,
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            original_name: freezed == original_name
                ? _value.original_name
                : original_name // ignore: cast_nullable_to_non_nullable
                      as String?,
            profile_path: freezed == profile_path
                ? _value.profile_path
                : profile_path // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SeasonCrewMemberImplCopyWith<$Res>
    implements $SeasonCrewMemberCopyWith<$Res> {
  factory _$$SeasonCrewMemberImplCopyWith(
    _$SeasonCrewMemberImpl value,
    $Res Function(_$SeasonCrewMemberImpl) then,
  ) = __$$SeasonCrewMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? job,
    String? department,
    String? name,
    String? original_name,
    String? profile_path,
  });
}

/// @nodoc
class __$$SeasonCrewMemberImplCopyWithImpl<$Res>
    extends _$SeasonCrewMemberCopyWithImpl<$Res, _$SeasonCrewMemberImpl>
    implements _$$SeasonCrewMemberImplCopyWith<$Res> {
  __$$SeasonCrewMemberImplCopyWithImpl(
    _$SeasonCrewMemberImpl _value,
    $Res Function(_$SeasonCrewMemberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SeasonCrewMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job = freezed,
    Object? department = freezed,
    Object? name = freezed,
    Object? original_name = freezed,
    Object? profile_path = freezed,
  }) {
    return _then(
      _$SeasonCrewMemberImpl(
        job: freezed == job
            ? _value.job
            : job // ignore: cast_nullable_to_non_nullable
                  as String?,
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        original_name: freezed == original_name
            ? _value.original_name
            : original_name // ignore: cast_nullable_to_non_nullable
                  as String?,
        profile_path: freezed == profile_path
            ? _value.profile_path
            : profile_path // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasonCrewMemberImpl implements _SeasonCrewMember {
  const _$SeasonCrewMemberImpl({
    this.job,
    this.department,
    this.name,
    this.original_name,
    this.profile_path,
  });

  factory _$SeasonCrewMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonCrewMemberImplFromJson(json);

  @override
  final String? job;
  @override
  final String? department;
  @override
  final String? name;
  @override
  final String? original_name;
  @override
  final String? profile_path;

  @override
  String toString() {
    return 'SeasonCrewMember(job: $job, department: $department, name: $name, original_name: $original_name, profile_path: $profile_path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonCrewMemberImpl &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.original_name, original_name) ||
                other.original_name == original_name) &&
            (identical(other.profile_path, profile_path) ||
                other.profile_path == profile_path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    job,
    department,
    name,
    original_name,
    profile_path,
  );

  /// Create a copy of SeasonCrewMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonCrewMemberImplCopyWith<_$SeasonCrewMemberImpl> get copyWith =>
      __$$SeasonCrewMemberImplCopyWithImpl<_$SeasonCrewMemberImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonCrewMemberImplToJson(this);
  }
}

abstract class _SeasonCrewMember implements SeasonCrewMember {
  const factory _SeasonCrewMember({
    final String? job,
    final String? department,
    final String? name,
    final String? original_name,
    final String? profile_path,
  }) = _$SeasonCrewMemberImpl;

  factory _SeasonCrewMember.fromJson(Map<String, dynamic> json) =
      _$SeasonCrewMemberImpl.fromJson;

  @override
  String? get job;
  @override
  String? get department;
  @override
  String? get name;
  @override
  String? get original_name;
  @override
  String? get profile_path;

  /// Create a copy of SeasonCrewMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeasonCrewMemberImplCopyWith<_$SeasonCrewMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeasonGuestStar _$SeasonGuestStarFromJson(Map<String, dynamic> json) {
  return _SeasonGuestStar.fromJson(json);
}

/// @nodoc
mixin _$SeasonGuestStar {
  String? get character => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get original_name => throw _privateConstructorUsedError;
  String? get profile_path => throw _privateConstructorUsedError;

  /// Serializes this SeasonGuestStar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeasonGuestStar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeasonGuestStarCopyWith<SeasonGuestStar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonGuestStarCopyWith<$Res> {
  factory $SeasonGuestStarCopyWith(
    SeasonGuestStar value,
    $Res Function(SeasonGuestStar) then,
  ) = _$SeasonGuestStarCopyWithImpl<$Res, SeasonGuestStar>;
  @useResult
  $Res call({
    String? character,
    String? name,
    String? original_name,
    String? profile_path,
  });
}

/// @nodoc
class _$SeasonGuestStarCopyWithImpl<$Res, $Val extends SeasonGuestStar>
    implements $SeasonGuestStarCopyWith<$Res> {
  _$SeasonGuestStarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeasonGuestStar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = freezed,
    Object? name = freezed,
    Object? original_name = freezed,
    Object? profile_path = freezed,
  }) {
    return _then(
      _value.copyWith(
            character: freezed == character
                ? _value.character
                : character // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            original_name: freezed == original_name
                ? _value.original_name
                : original_name // ignore: cast_nullable_to_non_nullable
                      as String?,
            profile_path: freezed == profile_path
                ? _value.profile_path
                : profile_path // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SeasonGuestStarImplCopyWith<$Res>
    implements $SeasonGuestStarCopyWith<$Res> {
  factory _$$SeasonGuestStarImplCopyWith(
    _$SeasonGuestStarImpl value,
    $Res Function(_$SeasonGuestStarImpl) then,
  ) = __$$SeasonGuestStarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? character,
    String? name,
    String? original_name,
    String? profile_path,
  });
}

/// @nodoc
class __$$SeasonGuestStarImplCopyWithImpl<$Res>
    extends _$SeasonGuestStarCopyWithImpl<$Res, _$SeasonGuestStarImpl>
    implements _$$SeasonGuestStarImplCopyWith<$Res> {
  __$$SeasonGuestStarImplCopyWithImpl(
    _$SeasonGuestStarImpl _value,
    $Res Function(_$SeasonGuestStarImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SeasonGuestStar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = freezed,
    Object? name = freezed,
    Object? original_name = freezed,
    Object? profile_path = freezed,
  }) {
    return _then(
      _$SeasonGuestStarImpl(
        character: freezed == character
            ? _value.character
            : character // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        original_name: freezed == original_name
            ? _value.original_name
            : original_name // ignore: cast_nullable_to_non_nullable
                  as String?,
        profile_path: freezed == profile_path
            ? _value.profile_path
            : profile_path // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasonGuestStarImpl implements _SeasonGuestStar {
  const _$SeasonGuestStarImpl({
    this.character,
    this.name,
    this.original_name,
    this.profile_path,
  });

  factory _$SeasonGuestStarImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonGuestStarImplFromJson(json);

  @override
  final String? character;
  @override
  final String? name;
  @override
  final String? original_name;
  @override
  final String? profile_path;

  @override
  String toString() {
    return 'SeasonGuestStar(character: $character, name: $name, original_name: $original_name, profile_path: $profile_path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonGuestStarImpl &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.original_name, original_name) ||
                other.original_name == original_name) &&
            (identical(other.profile_path, profile_path) ||
                other.profile_path == profile_path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, character, name, original_name, profile_path);

  /// Create a copy of SeasonGuestStar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonGuestStarImplCopyWith<_$SeasonGuestStarImpl> get copyWith =>
      __$$SeasonGuestStarImplCopyWithImpl<_$SeasonGuestStarImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonGuestStarImplToJson(this);
  }
}

abstract class _SeasonGuestStar implements SeasonGuestStar {
  const factory _SeasonGuestStar({
    final String? character,
    final String? name,
    final String? original_name,
    final String? profile_path,
  }) = _$SeasonGuestStarImpl;

  factory _SeasonGuestStar.fromJson(Map<String, dynamic> json) =
      _$SeasonGuestStarImpl.fromJson;

  @override
  String? get character;
  @override
  String? get name;
  @override
  String? get original_name;
  @override
  String? get profile_path;

  /// Create a copy of SeasonGuestStar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeasonGuestStarImplCopyWith<_$SeasonGuestStarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
