// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardConfigModel _$DashboardConfigModelFromJson(Map<String, dynamic> json) {
  return _DashboardConfigModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardConfigModel {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DashboardConfigData get data => throw _privateConstructorUsedError;

  /// Serializes this DashboardConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardConfigModelCopyWith<DashboardConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardConfigModelCopyWith<$Res> {
  factory $DashboardConfigModelCopyWith(
    DashboardConfigModel value,
    $Res Function(DashboardConfigModel) then,
  ) = _$DashboardConfigModelCopyWithImpl<$Res, DashboardConfigModel>;
  @useResult
  $Res call({bool success, String? message, DashboardConfigData data});

  $DashboardConfigDataCopyWith<$Res> get data;
}

/// @nodoc
class _$DashboardConfigModelCopyWithImpl<
  $Res,
  $Val extends DashboardConfigModel
>
    implements $DashboardConfigModelCopyWith<$Res> {
  _$DashboardConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardConfigModel
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
                      as DashboardConfigData,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardConfigDataCopyWith<$Res> get data {
    return $DashboardConfigDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardConfigModelImplCopyWith<$Res>
    implements $DashboardConfigModelCopyWith<$Res> {
  factory _$$DashboardConfigModelImplCopyWith(
    _$DashboardConfigModelImpl value,
    $Res Function(_$DashboardConfigModelImpl) then,
  ) = __$$DashboardConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, DashboardConfigData data});

  @override
  $DashboardConfigDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DashboardConfigModelImplCopyWithImpl<$Res>
    extends _$DashboardConfigModelCopyWithImpl<$Res, _$DashboardConfigModelImpl>
    implements _$$DashboardConfigModelImplCopyWith<$Res> {
  __$$DashboardConfigModelImplCopyWithImpl(
    _$DashboardConfigModelImpl _value,
    $Res Function(_$DashboardConfigModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(
      _$DashboardConfigModelImpl(
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
                  as DashboardConfigData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardConfigModelImpl implements _DashboardConfigModel {
  const _$DashboardConfigModelImpl({
    required this.success,
    this.message,
    required this.data,
  });

  factory _$DashboardConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardConfigModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final DashboardConfigData data;

  @override
  String toString() {
    return 'DashboardConfigModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardConfigModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of DashboardConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardConfigModelImplCopyWith<_$DashboardConfigModelImpl>
  get copyWith =>
      __$$DashboardConfigModelImplCopyWithImpl<_$DashboardConfigModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardConfigModelImplToJson(this);
  }
}

abstract class _DashboardConfigModel implements DashboardConfigModel {
  const factory _DashboardConfigModel({
    required final bool success,
    final String? message,
    required final DashboardConfigData data,
  }) = _$DashboardConfigModelImpl;

  factory _DashboardConfigModel.fromJson(Map<String, dynamic> json) =
      _$DashboardConfigModelImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  DashboardConfigData get data;

  /// Create a copy of DashboardConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardConfigModelImplCopyWith<_$DashboardConfigModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DashboardConfigData _$DashboardConfigDataFromJson(Map<String, dynamic> json) {
  return _DashboardConfigData.fromJson(json);
}

/// @nodoc
mixin _$DashboardConfigData {
  DashboardConfigValue get value => throw _privateConstructorUsedError;

  /// Serializes this DashboardConfigData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardConfigData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardConfigDataCopyWith<DashboardConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardConfigDataCopyWith<$Res> {
  factory $DashboardConfigDataCopyWith(
    DashboardConfigData value,
    $Res Function(DashboardConfigData) then,
  ) = _$DashboardConfigDataCopyWithImpl<$Res, DashboardConfigData>;
  @useResult
  $Res call({DashboardConfigValue value});

  $DashboardConfigValueCopyWith<$Res> get value;
}

/// @nodoc
class _$DashboardConfigDataCopyWithImpl<$Res, $Val extends DashboardConfigData>
    implements $DashboardConfigDataCopyWith<$Res> {
  _$DashboardConfigDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardConfigData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as DashboardConfigValue,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardConfigData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardConfigValueCopyWith<$Res> get value {
    return $DashboardConfigValueCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardConfigDataImplCopyWith<$Res>
    implements $DashboardConfigDataCopyWith<$Res> {
  factory _$$DashboardConfigDataImplCopyWith(
    _$DashboardConfigDataImpl value,
    $Res Function(_$DashboardConfigDataImpl) then,
  ) = __$$DashboardConfigDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardConfigValue value});

  @override
  $DashboardConfigValueCopyWith<$Res> get value;
}

/// @nodoc
class __$$DashboardConfigDataImplCopyWithImpl<$Res>
    extends _$DashboardConfigDataCopyWithImpl<$Res, _$DashboardConfigDataImpl>
    implements _$$DashboardConfigDataImplCopyWith<$Res> {
  __$$DashboardConfigDataImplCopyWithImpl(
    _$DashboardConfigDataImpl _value,
    $Res Function(_$DashboardConfigDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardConfigData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$DashboardConfigDataImpl(
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as DashboardConfigValue,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardConfigDataImpl implements _DashboardConfigData {
  const _$DashboardConfigDataImpl({required this.value});

  factory _$DashboardConfigDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardConfigDataImplFromJson(json);

  @override
  final DashboardConfigValue value;

  @override
  String toString() {
    return 'DashboardConfigData(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardConfigDataImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of DashboardConfigData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardConfigDataImplCopyWith<_$DashboardConfigDataImpl> get copyWith =>
      __$$DashboardConfigDataImplCopyWithImpl<_$DashboardConfigDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardConfigDataImplToJson(this);
  }
}

abstract class _DashboardConfigData implements DashboardConfigData {
  const factory _DashboardConfigData({
    required final DashboardConfigValue value,
  }) = _$DashboardConfigDataImpl;

  factory _DashboardConfigData.fromJson(Map<String, dynamic> json) =
      _$DashboardConfigDataImpl.fromJson;

  @override
  DashboardConfigValue get value;

  /// Create a copy of DashboardConfigData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardConfigDataImplCopyWith<_$DashboardConfigDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardConfigValue _$DashboardConfigValueFromJson(Map<String, dynamic> json) {
  return _DashboardConfigValue.fromJson(json);
}

/// @nodoc
mixin _$DashboardConfigValue {
  @JsonKey(name: 'mediaStatistic')
  bool get mediaStatistic => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduler')
  bool get scheduler => throw _privateConstructorUsedError;
  @JsonKey(name: 'speed')
  bool get speed => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage')
  bool get storage => throw _privateConstructorUsedError;
  @JsonKey(name: 'weeklyOverview')
  bool get weeklyOverview => throw _privateConstructorUsedError;
  @JsonKey(name: 'cpu')
  bool get cpu => throw _privateConstructorUsedError;
  @JsonKey(name: 'memory')
  bool get memory => throw _privateConstructorUsedError;
  @JsonKey(name: 'network')
  bool get network => throw _privateConstructorUsedError;
  @JsonKey(name: 'library')
  bool get library => throw _privateConstructorUsedError;
  @JsonKey(name: 'playing')
  bool get playing => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest')
  bool get latest => throw _privateConstructorUsedError;

  /// Serializes this DashboardConfigValue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardConfigValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardConfigValueCopyWith<DashboardConfigValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardConfigValueCopyWith<$Res> {
  factory $DashboardConfigValueCopyWith(
    DashboardConfigValue value,
    $Res Function(DashboardConfigValue) then,
  ) = _$DashboardConfigValueCopyWithImpl<$Res, DashboardConfigValue>;
  @useResult
  $Res call({
    @JsonKey(name: 'mediaStatistic') bool mediaStatistic,
    @JsonKey(name: 'scheduler') bool scheduler,
    @JsonKey(name: 'speed') bool speed,
    @JsonKey(name: 'storage') bool storage,
    @JsonKey(name: 'weeklyOverview') bool weeklyOverview,
    @JsonKey(name: 'cpu') bool cpu,
    @JsonKey(name: 'memory') bool memory,
    @JsonKey(name: 'network') bool network,
    @JsonKey(name: 'library') bool library,
    @JsonKey(name: 'playing') bool playing,
    @JsonKey(name: 'latest') bool latest,
  });
}

/// @nodoc
class _$DashboardConfigValueCopyWithImpl<
  $Res,
  $Val extends DashboardConfigValue
>
    implements $DashboardConfigValueCopyWith<$Res> {
  _$DashboardConfigValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardConfigValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaStatistic = null,
    Object? scheduler = null,
    Object? speed = null,
    Object? storage = null,
    Object? weeklyOverview = null,
    Object? cpu = null,
    Object? memory = null,
    Object? network = null,
    Object? library = null,
    Object? playing = null,
    Object? latest = null,
  }) {
    return _then(
      _value.copyWith(
            mediaStatistic: null == mediaStatistic
                ? _value.mediaStatistic
                : mediaStatistic // ignore: cast_nullable_to_non_nullable
                      as bool,
            scheduler: null == scheduler
                ? _value.scheduler
                : scheduler // ignore: cast_nullable_to_non_nullable
                      as bool,
            speed: null == speed
                ? _value.speed
                : speed // ignore: cast_nullable_to_non_nullable
                      as bool,
            storage: null == storage
                ? _value.storage
                : storage // ignore: cast_nullable_to_non_nullable
                      as bool,
            weeklyOverview: null == weeklyOverview
                ? _value.weeklyOverview
                : weeklyOverview // ignore: cast_nullable_to_non_nullable
                      as bool,
            cpu: null == cpu
                ? _value.cpu
                : cpu // ignore: cast_nullable_to_non_nullable
                      as bool,
            memory: null == memory
                ? _value.memory
                : memory // ignore: cast_nullable_to_non_nullable
                      as bool,
            network: null == network
                ? _value.network
                : network // ignore: cast_nullable_to_non_nullable
                      as bool,
            library: null == library
                ? _value.library
                : library // ignore: cast_nullable_to_non_nullable
                      as bool,
            playing: null == playing
                ? _value.playing
                : playing // ignore: cast_nullable_to_non_nullable
                      as bool,
            latest: null == latest
                ? _value.latest
                : latest // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardConfigValueImplCopyWith<$Res>
    implements $DashboardConfigValueCopyWith<$Res> {
  factory _$$DashboardConfigValueImplCopyWith(
    _$DashboardConfigValueImpl value,
    $Res Function(_$DashboardConfigValueImpl) then,
  ) = __$$DashboardConfigValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'mediaStatistic') bool mediaStatistic,
    @JsonKey(name: 'scheduler') bool scheduler,
    @JsonKey(name: 'speed') bool speed,
    @JsonKey(name: 'storage') bool storage,
    @JsonKey(name: 'weeklyOverview') bool weeklyOverview,
    @JsonKey(name: 'cpu') bool cpu,
    @JsonKey(name: 'memory') bool memory,
    @JsonKey(name: 'network') bool network,
    @JsonKey(name: 'library') bool library,
    @JsonKey(name: 'playing') bool playing,
    @JsonKey(name: 'latest') bool latest,
  });
}

/// @nodoc
class __$$DashboardConfigValueImplCopyWithImpl<$Res>
    extends _$DashboardConfigValueCopyWithImpl<$Res, _$DashboardConfigValueImpl>
    implements _$$DashboardConfigValueImplCopyWith<$Res> {
  __$$DashboardConfigValueImplCopyWithImpl(
    _$DashboardConfigValueImpl _value,
    $Res Function(_$DashboardConfigValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardConfigValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaStatistic = null,
    Object? scheduler = null,
    Object? speed = null,
    Object? storage = null,
    Object? weeklyOverview = null,
    Object? cpu = null,
    Object? memory = null,
    Object? network = null,
    Object? library = null,
    Object? playing = null,
    Object? latest = null,
  }) {
    return _then(
      _$DashboardConfigValueImpl(
        mediaStatistic: null == mediaStatistic
            ? _value.mediaStatistic
            : mediaStatistic // ignore: cast_nullable_to_non_nullable
                  as bool,
        scheduler: null == scheduler
            ? _value.scheduler
            : scheduler // ignore: cast_nullable_to_non_nullable
                  as bool,
        speed: null == speed
            ? _value.speed
            : speed // ignore: cast_nullable_to_non_nullable
                  as bool,
        storage: null == storage
            ? _value.storage
            : storage // ignore: cast_nullable_to_non_nullable
                  as bool,
        weeklyOverview: null == weeklyOverview
            ? _value.weeklyOverview
            : weeklyOverview // ignore: cast_nullable_to_non_nullable
                  as bool,
        cpu: null == cpu
            ? _value.cpu
            : cpu // ignore: cast_nullable_to_non_nullable
                  as bool,
        memory: null == memory
            ? _value.memory
            : memory // ignore: cast_nullable_to_non_nullable
                  as bool,
        network: null == network
            ? _value.network
            : network // ignore: cast_nullable_to_non_nullable
                  as bool,
        library: null == library
            ? _value.library
            : library // ignore: cast_nullable_to_non_nullable
                  as bool,
        playing: null == playing
            ? _value.playing
            : playing // ignore: cast_nullable_to_non_nullable
                  as bool,
        latest: null == latest
            ? _value.latest
            : latest // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardConfigValueImpl implements _DashboardConfigValue {
  const _$DashboardConfigValueImpl({
    @JsonKey(name: 'mediaStatistic') required this.mediaStatistic,
    @JsonKey(name: 'scheduler') required this.scheduler,
    @JsonKey(name: 'speed') required this.speed,
    @JsonKey(name: 'storage') required this.storage,
    @JsonKey(name: 'weeklyOverview') required this.weeklyOverview,
    @JsonKey(name: 'cpu') required this.cpu,
    @JsonKey(name: 'memory') required this.memory,
    @JsonKey(name: 'network') required this.network,
    @JsonKey(name: 'library') required this.library,
    @JsonKey(name: 'playing') required this.playing,
    @JsonKey(name: 'latest') required this.latest,
  });

  factory _$DashboardConfigValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardConfigValueImplFromJson(json);

  @override
  @JsonKey(name: 'mediaStatistic')
  final bool mediaStatistic;
  @override
  @JsonKey(name: 'scheduler')
  final bool scheduler;
  @override
  @JsonKey(name: 'speed')
  final bool speed;
  @override
  @JsonKey(name: 'storage')
  final bool storage;
  @override
  @JsonKey(name: 'weeklyOverview')
  final bool weeklyOverview;
  @override
  @JsonKey(name: 'cpu')
  final bool cpu;
  @override
  @JsonKey(name: 'memory')
  final bool memory;
  @override
  @JsonKey(name: 'network')
  final bool network;
  @override
  @JsonKey(name: 'library')
  final bool library;
  @override
  @JsonKey(name: 'playing')
  final bool playing;
  @override
  @JsonKey(name: 'latest')
  final bool latest;

  @override
  String toString() {
    return 'DashboardConfigValue(mediaStatistic: $mediaStatistic, scheduler: $scheduler, speed: $speed, storage: $storage, weeklyOverview: $weeklyOverview, cpu: $cpu, memory: $memory, network: $network, library: $library, playing: $playing, latest: $latest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardConfigValueImpl &&
            (identical(other.mediaStatistic, mediaStatistic) ||
                other.mediaStatistic == mediaStatistic) &&
            (identical(other.scheduler, scheduler) ||
                other.scheduler == scheduler) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.storage, storage) || other.storage == storage) &&
            (identical(other.weeklyOverview, weeklyOverview) ||
                other.weeklyOverview == weeklyOverview) &&
            (identical(other.cpu, cpu) || other.cpu == cpu) &&
            (identical(other.memory, memory) || other.memory == memory) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.library, library) || other.library == library) &&
            (identical(other.playing, playing) || other.playing == playing) &&
            (identical(other.latest, latest) || other.latest == latest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mediaStatistic,
    scheduler,
    speed,
    storage,
    weeklyOverview,
    cpu,
    memory,
    network,
    library,
    playing,
    latest,
  );

  /// Create a copy of DashboardConfigValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardConfigValueImplCopyWith<_$DashboardConfigValueImpl>
  get copyWith =>
      __$$DashboardConfigValueImplCopyWithImpl<_$DashboardConfigValueImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardConfigValueImplToJson(this);
  }
}

abstract class _DashboardConfigValue implements DashboardConfigValue {
  const factory _DashboardConfigValue({
    @JsonKey(name: 'mediaStatistic') required final bool mediaStatistic,
    @JsonKey(name: 'scheduler') required final bool scheduler,
    @JsonKey(name: 'speed') required final bool speed,
    @JsonKey(name: 'storage') required final bool storage,
    @JsonKey(name: 'weeklyOverview') required final bool weeklyOverview,
    @JsonKey(name: 'cpu') required final bool cpu,
    @JsonKey(name: 'memory') required final bool memory,
    @JsonKey(name: 'network') required final bool network,
    @JsonKey(name: 'library') required final bool library,
    @JsonKey(name: 'playing') required final bool playing,
    @JsonKey(name: 'latest') required final bool latest,
  }) = _$DashboardConfigValueImpl;

  factory _DashboardConfigValue.fromJson(Map<String, dynamic> json) =
      _$DashboardConfigValueImpl.fromJson;

  @override
  @JsonKey(name: 'mediaStatistic')
  bool get mediaStatistic;
  @override
  @JsonKey(name: 'scheduler')
  bool get scheduler;
  @override
  @JsonKey(name: 'speed')
  bool get speed;
  @override
  @JsonKey(name: 'storage')
  bool get storage;
  @override
  @JsonKey(name: 'weeklyOverview')
  bool get weeklyOverview;
  @override
  @JsonKey(name: 'cpu')
  bool get cpu;
  @override
  @JsonKey(name: 'memory')
  bool get memory;
  @override
  @JsonKey(name: 'network')
  bool get network;
  @override
  @JsonKey(name: 'library')
  bool get library;
  @override
  @JsonKey(name: 'playing')
  bool get playing;
  @override
  @JsonKey(name: 'latest')
  bool get latest;

  /// Create a copy of DashboardConfigValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardConfigValueImplCopyWith<_$DashboardConfigValueImpl>
  get copyWith => throw _privateConstructorUsedError;
}
