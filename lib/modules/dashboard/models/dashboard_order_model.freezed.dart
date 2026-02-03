// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardOrderModel _$DashboardOrderModelFromJson(Map<String, dynamic> json) {
  return _DashboardOrderModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardOrderModel {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DashboardOrderData get data => throw _privateConstructorUsedError;

  /// Serializes this DashboardOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardOrderModelCopyWith<DashboardOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardOrderModelCopyWith<$Res> {
  factory $DashboardOrderModelCopyWith(
    DashboardOrderModel value,
    $Res Function(DashboardOrderModel) then,
  ) = _$DashboardOrderModelCopyWithImpl<$Res, DashboardOrderModel>;
  @useResult
  $Res call({bool success, String? message, DashboardOrderData data});

  $DashboardOrderDataCopyWith<$Res> get data;
}

/// @nodoc
class _$DashboardOrderModelCopyWithImpl<$Res, $Val extends DashboardOrderModel>
    implements $DashboardOrderModelCopyWith<$Res> {
  _$DashboardOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardOrderModel
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
                      as DashboardOrderData,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardOrderDataCopyWith<$Res> get data {
    return $DashboardOrderDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardOrderModelImplCopyWith<$Res>
    implements $DashboardOrderModelCopyWith<$Res> {
  factory _$$DashboardOrderModelImplCopyWith(
    _$DashboardOrderModelImpl value,
    $Res Function(_$DashboardOrderModelImpl) then,
  ) = __$$DashboardOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, DashboardOrderData data});

  @override
  $DashboardOrderDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DashboardOrderModelImplCopyWithImpl<$Res>
    extends _$DashboardOrderModelCopyWithImpl<$Res, _$DashboardOrderModelImpl>
    implements _$$DashboardOrderModelImplCopyWith<$Res> {
  __$$DashboardOrderModelImplCopyWithImpl(
    _$DashboardOrderModelImpl _value,
    $Res Function(_$DashboardOrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(
      _$DashboardOrderModelImpl(
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
                  as DashboardOrderData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardOrderModelImpl implements _DashboardOrderModel {
  const _$DashboardOrderModelImpl({
    required this.success,
    this.message,
    required this.data,
  });

  factory _$DashboardOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardOrderModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final DashboardOrderData data;

  @override
  String toString() {
    return 'DashboardOrderModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardOrderModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of DashboardOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardOrderModelImplCopyWith<_$DashboardOrderModelImpl> get copyWith =>
      __$$DashboardOrderModelImplCopyWithImpl<_$DashboardOrderModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardOrderModelImplToJson(this);
  }
}

abstract class _DashboardOrderModel implements DashboardOrderModel {
  const factory _DashboardOrderModel({
    required final bool success,
    final String? message,
    required final DashboardOrderData data,
  }) = _$DashboardOrderModelImpl;

  factory _DashboardOrderModel.fromJson(Map<String, dynamic> json) =
      _$DashboardOrderModelImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  DashboardOrderData get data;

  /// Create a copy of DashboardOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardOrderModelImplCopyWith<_$DashboardOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardOrderData _$DashboardOrderDataFromJson(Map<String, dynamic> json) {
  return _DashboardOrderData.fromJson(json);
}

/// @nodoc
mixin _$DashboardOrderData {
  List<DashboardOrderItem> get value => throw _privateConstructorUsedError;

  /// Serializes this DashboardOrderData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardOrderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardOrderDataCopyWith<DashboardOrderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardOrderDataCopyWith<$Res> {
  factory $DashboardOrderDataCopyWith(
    DashboardOrderData value,
    $Res Function(DashboardOrderData) then,
  ) = _$DashboardOrderDataCopyWithImpl<$Res, DashboardOrderData>;
  @useResult
  $Res call({List<DashboardOrderItem> value});
}

/// @nodoc
class _$DashboardOrderDataCopyWithImpl<$Res, $Val extends DashboardOrderData>
    implements $DashboardOrderDataCopyWith<$Res> {
  _$DashboardOrderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardOrderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as List<DashboardOrderItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardOrderDataImplCopyWith<$Res>
    implements $DashboardOrderDataCopyWith<$Res> {
  factory _$$DashboardOrderDataImplCopyWith(
    _$DashboardOrderDataImpl value,
    $Res Function(_$DashboardOrderDataImpl) then,
  ) = __$$DashboardOrderDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DashboardOrderItem> value});
}

/// @nodoc
class __$$DashboardOrderDataImplCopyWithImpl<$Res>
    extends _$DashboardOrderDataCopyWithImpl<$Res, _$DashboardOrderDataImpl>
    implements _$$DashboardOrderDataImplCopyWith<$Res> {
  __$$DashboardOrderDataImplCopyWithImpl(
    _$DashboardOrderDataImpl _value,
    $Res Function(_$DashboardOrderDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardOrderData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$DashboardOrderDataImpl(
        value: null == value
            ? _value._value
            : value // ignore: cast_nullable_to_non_nullable
                  as List<DashboardOrderItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardOrderDataImpl implements _DashboardOrderData {
  const _$DashboardOrderDataImpl({
    required final List<DashboardOrderItem> value,
  }) : _value = value;

  factory _$DashboardOrderDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardOrderDataImplFromJson(json);

  final List<DashboardOrderItem> _value;
  @override
  List<DashboardOrderItem> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'DashboardOrderData(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardOrderDataImpl &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  /// Create a copy of DashboardOrderData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardOrderDataImplCopyWith<_$DashboardOrderDataImpl> get copyWith =>
      __$$DashboardOrderDataImplCopyWithImpl<_$DashboardOrderDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardOrderDataImplToJson(this);
  }
}

abstract class _DashboardOrderData implements DashboardOrderData {
  const factory _DashboardOrderData({
    required final List<DashboardOrderItem> value,
  }) = _$DashboardOrderDataImpl;

  factory _DashboardOrderData.fromJson(Map<String, dynamic> json) =
      _$DashboardOrderDataImpl.fromJson;

  @override
  List<DashboardOrderItem> get value;

  /// Create a copy of DashboardOrderData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardOrderDataImplCopyWith<_$DashboardOrderDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardOrderItem _$DashboardOrderItemFromJson(Map<String, dynamic> json) {
  return _DashboardOrderItem.fromJson(json);
}

/// @nodoc
mixin _$DashboardOrderItem {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;

  /// Serializes this DashboardOrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardOrderItemCopyWith<DashboardOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardOrderItemCopyWith<$Res> {
  factory $DashboardOrderItemCopyWith(
    DashboardOrderItem value,
    $Res Function(DashboardOrderItem) then,
  ) = _$DashboardOrderItemCopyWithImpl<$Res, DashboardOrderItem>;
  @useResult
  $Res call({String id, String key});
}

/// @nodoc
class _$DashboardOrderItemCopyWithImpl<$Res, $Val extends DashboardOrderItem>
    implements $DashboardOrderItemCopyWith<$Res> {
  _$DashboardOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? key = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            key: null == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardOrderItemImplCopyWith<$Res>
    implements $DashboardOrderItemCopyWith<$Res> {
  factory _$$DashboardOrderItemImplCopyWith(
    _$DashboardOrderItemImpl value,
    $Res Function(_$DashboardOrderItemImpl) then,
  ) = __$$DashboardOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String key});
}

/// @nodoc
class __$$DashboardOrderItemImplCopyWithImpl<$Res>
    extends _$DashboardOrderItemCopyWithImpl<$Res, _$DashboardOrderItemImpl>
    implements _$$DashboardOrderItemImplCopyWith<$Res> {
  __$$DashboardOrderItemImplCopyWithImpl(
    _$DashboardOrderItemImpl _value,
    $Res Function(_$DashboardOrderItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? key = null}) {
    return _then(
      _$DashboardOrderItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        key: null == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardOrderItemImpl implements _DashboardOrderItem {
  const _$DashboardOrderItemImpl({required this.id, required this.key});

  factory _$DashboardOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardOrderItemImplFromJson(json);

  @override
  final String id;
  @override
  final String key;

  @override
  String toString() {
    return 'DashboardOrderItem(id: $id, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardOrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, key);

  /// Create a copy of DashboardOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardOrderItemImplCopyWith<_$DashboardOrderItemImpl> get copyWith =>
      __$$DashboardOrderItemImplCopyWithImpl<_$DashboardOrderItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardOrderItemImplToJson(this);
  }
}

abstract class _DashboardOrderItem implements DashboardOrderItem {
  const factory _DashboardOrderItem({
    required final String id,
    required final String key,
  }) = _$DashboardOrderItemImpl;

  factory _DashboardOrderItem.fromJson(Map<String, dynamic> json) =
      _$DashboardOrderItemImpl.fromJson;

  @override
  String get id;
  @override
  String get key;

  /// Create a copy of DashboardOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardOrderItemImplCopyWith<_$DashboardOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
