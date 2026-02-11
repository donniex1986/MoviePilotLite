// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_submit_resp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubscribeSubmitResp _$SubscribeSubmitRespFromJson(Map<String, dynamic> json) {
  return _SubscribeSubmitResp.fromJson(json);
}

/// @nodoc
mixin _$SubscribeSubmitResp {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SubscribeSubmitData? get data => throw _privateConstructorUsedError;

  /// Serializes this SubscribeSubmitResp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscribeSubmitResp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscribeSubmitRespCopyWith<SubscribeSubmitResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeSubmitRespCopyWith<$Res> {
  factory $SubscribeSubmitRespCopyWith(
    SubscribeSubmitResp value,
    $Res Function(SubscribeSubmitResp) then,
  ) = _$SubscribeSubmitRespCopyWithImpl<$Res, SubscribeSubmitResp>;
  @useResult
  $Res call({bool? success, String? message, SubscribeSubmitData? data});

  $SubscribeSubmitDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SubscribeSubmitRespCopyWithImpl<$Res, $Val extends SubscribeSubmitResp>
    implements $SubscribeSubmitRespCopyWith<$Res> {
  _$SubscribeSubmitRespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscribeSubmitResp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: freezed == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as SubscribeSubmitData?,
          )
          as $Val,
    );
  }

  /// Create a copy of SubscribeSubmitResp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscribeSubmitDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SubscribeSubmitDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscribeSubmitRespImplCopyWith<$Res>
    implements $SubscribeSubmitRespCopyWith<$Res> {
  factory _$$SubscribeSubmitRespImplCopyWith(
    _$SubscribeSubmitRespImpl value,
    $Res Function(_$SubscribeSubmitRespImpl) then,
  ) = __$$SubscribeSubmitRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, SubscribeSubmitData? data});

  @override
  $SubscribeSubmitDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SubscribeSubmitRespImplCopyWithImpl<$Res>
    extends _$SubscribeSubmitRespCopyWithImpl<$Res, _$SubscribeSubmitRespImpl>
    implements _$$SubscribeSubmitRespImplCopyWith<$Res> {
  __$$SubscribeSubmitRespImplCopyWithImpl(
    _$SubscribeSubmitRespImpl _value,
    $Res Function(_$SubscribeSubmitRespImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscribeSubmitResp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$SubscribeSubmitRespImpl(
        success: freezed == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as SubscribeSubmitData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribeSubmitRespImpl implements _SubscribeSubmitResp {
  const _$SubscribeSubmitRespImpl({this.success, this.message, this.data});

  factory _$SubscribeSubmitRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscribeSubmitRespImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final SubscribeSubmitData? data;

  @override
  String toString() {
    return 'SubscribeSubmitResp(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeSubmitRespImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of SubscribeSubmitResp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeSubmitRespImplCopyWith<_$SubscribeSubmitRespImpl> get copyWith =>
      __$$SubscribeSubmitRespImplCopyWithImpl<_$SubscribeSubmitRespImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribeSubmitRespImplToJson(this);
  }
}

abstract class _SubscribeSubmitResp implements SubscribeSubmitResp {
  const factory _SubscribeSubmitResp({
    final bool? success,
    final String? message,
    final SubscribeSubmitData? data,
  }) = _$SubscribeSubmitRespImpl;

  factory _SubscribeSubmitResp.fromJson(Map<String, dynamic> json) =
      _$SubscribeSubmitRespImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  SubscribeSubmitData? get data;

  /// Create a copy of SubscribeSubmitResp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscribeSubmitRespImplCopyWith<_$SubscribeSubmitRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscribeSubmitData _$SubscribeSubmitDataFromJson(Map<String, dynamic> json) {
  return _SubscribeSubmitData.fromJson(json);
}

/// @nodoc
mixin _$SubscribeSubmitData {
  @JsonKey(fromJson: _intFromJson)
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this SubscribeSubmitData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscribeSubmitData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscribeSubmitDataCopyWith<SubscribeSubmitData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeSubmitDataCopyWith<$Res> {
  factory $SubscribeSubmitDataCopyWith(
    SubscribeSubmitData value,
    $Res Function(SubscribeSubmitData) then,
  ) = _$SubscribeSubmitDataCopyWithImpl<$Res, SubscribeSubmitData>;
  @useResult
  $Res call({@JsonKey(fromJson: _intFromJson) int? id});
}

/// @nodoc
class _$SubscribeSubmitDataCopyWithImpl<$Res, $Val extends SubscribeSubmitData>
    implements $SubscribeSubmitDataCopyWith<$Res> {
  _$SubscribeSubmitDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscribeSubmitData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed}) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscribeSubmitDataImplCopyWith<$Res>
    implements $SubscribeSubmitDataCopyWith<$Res> {
  factory _$$SubscribeSubmitDataImplCopyWith(
    _$SubscribeSubmitDataImpl value,
    $Res Function(_$SubscribeSubmitDataImpl) then,
  ) = __$$SubscribeSubmitDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(fromJson: _intFromJson) int? id});
}

/// @nodoc
class __$$SubscribeSubmitDataImplCopyWithImpl<$Res>
    extends _$SubscribeSubmitDataCopyWithImpl<$Res, _$SubscribeSubmitDataImpl>
    implements _$$SubscribeSubmitDataImplCopyWith<$Res> {
  __$$SubscribeSubmitDataImplCopyWithImpl(
    _$SubscribeSubmitDataImpl _value,
    $Res Function(_$SubscribeSubmitDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscribeSubmitData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed}) {
    return _then(
      _$SubscribeSubmitDataImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribeSubmitDataImpl implements _SubscribeSubmitData {
  const _$SubscribeSubmitDataImpl({@JsonKey(fromJson: _intFromJson) this.id});

  factory _$SubscribeSubmitDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscribeSubmitDataImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int? id;

  @override
  String toString() {
    return 'SubscribeSubmitData(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeSubmitDataImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SubscribeSubmitData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeSubmitDataImplCopyWith<_$SubscribeSubmitDataImpl> get copyWith =>
      __$$SubscribeSubmitDataImplCopyWithImpl<_$SubscribeSubmitDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribeSubmitDataImplToJson(this);
  }
}

abstract class _SubscribeSubmitData implements SubscribeSubmitData {
  const factory _SubscribeSubmitData({
    @JsonKey(fromJson: _intFromJson) final int? id,
  }) = _$SubscribeSubmitDataImpl;

  factory _SubscribeSubmitData.fromJson(Map<String, dynamic> json) =
      _$SubscribeSubmitDataImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromJson)
  int? get id;

  /// Create a copy of SubscribeSubmitData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscribeSubmitDataImplCopyWith<_$SubscribeSubmitDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
