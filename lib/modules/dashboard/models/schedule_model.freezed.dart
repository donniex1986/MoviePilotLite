// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) {
  return _ScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModel {
  /// 任务ID
  String get id => throw _privateConstructorUsedError;

  /// 任务名称
  String get name => throw _privateConstructorUsedError;

  /// 任务提供者
  String get provider => throw _privateConstructorUsedError;

  /// 任务状态
  String get status => throw _privateConstructorUsedError;

  /// 下次运行时间
  String get next_run => throw _privateConstructorUsedError;

  /// Serializes this ScheduleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
    ScheduleModel value,
    $Res Function(ScheduleModel) then,
  ) = _$ScheduleModelCopyWithImpl<$Res, ScheduleModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String provider,
    String status,
    String next_run,
  });
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res, $Val extends ScheduleModel>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? provider = null,
    Object? status = null,
    Object? next_run = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            next_run: null == next_run
                ? _value.next_run
                : next_run // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScheduleModelImplCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$$ScheduleModelImplCopyWith(
    _$ScheduleModelImpl value,
    $Res Function(_$ScheduleModelImpl) then,
  ) = __$$ScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String provider,
    String status,
    String next_run,
  });
}

/// @nodoc
class __$$ScheduleModelImplCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res, _$ScheduleModelImpl>
    implements _$$ScheduleModelImplCopyWith<$Res> {
  __$$ScheduleModelImplCopyWithImpl(
    _$ScheduleModelImpl _value,
    $Res Function(_$ScheduleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? provider = null,
    Object? status = null,
    Object? next_run = null,
  }) {
    return _then(
      _$ScheduleModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        next_run: null == next_run
            ? _value.next_run
            : next_run // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleModelImpl implements _ScheduleModel {
  const _$ScheduleModelImpl({
    this.id = '',
    this.name = '',
    this.provider = '',
    this.status = '',
    this.next_run = '',
  });

  factory _$ScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleModelImplFromJson(json);

  /// 任务ID
  @override
  @JsonKey()
  final String id;

  /// 任务名称
  @override
  @JsonKey()
  final String name;

  /// 任务提供者
  @override
  @JsonKey()
  final String provider;

  /// 任务状态
  @override
  @JsonKey()
  final String status;

  /// 下次运行时间
  @override
  @JsonKey()
  final String next_run;

  @override
  String toString() {
    return 'ScheduleModel(id: $id, name: $name, provider: $provider, status: $status, next_run: $next_run)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.next_run, next_run) ||
                other.next_run == next_run));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, provider, status, next_run);

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      __$$ScheduleModelImplCopyWithImpl<_$ScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleModelImplToJson(this);
  }
}

abstract class _ScheduleModel implements ScheduleModel {
  const factory _ScheduleModel({
    final String id,
    final String name,
    final String provider,
    final String status,
    final String next_run,
  }) = _$ScheduleModelImpl;

  factory _ScheduleModel.fromJson(Map<String, dynamic> json) =
      _$ScheduleModelImpl.fromJson;

  /// 任务ID
  @override
  String get id;

  /// 任务名称
  @override
  String get name;

  /// 任务提供者
  @override
  String get provider;

  /// 任务状态
  @override
  String get status;

  /// 下次运行时间
  @override
  String get next_run;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
