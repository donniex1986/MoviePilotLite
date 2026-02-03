// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_global_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserGlobalConfig _$UserGlobalConfigFromJson(Map<String, dynamic> json) {
  return _UserGlobalConfig.fromJson(json);
}

/// @nodoc
mixin _$UserGlobalConfig {
  @JsonKey(name: 'SEARCH_SOURCE')
  String get searchSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'RECOGNIZE_SOURCE')
  String get recognizeSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'AI_RECOMMEND_ENABLED')
  bool get aiRecommendEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'USER_UNIQUE_ID')
  String get userUniqueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUBSCRIBE_SHARE_MANAGE')
  bool get subscribeShareManage => throw _privateConstructorUsedError;
  @JsonKey(name: 'WORKFLOW_SHARE_MANAGE')
  bool get workflowShareManage => throw _privateConstructorUsedError;

  /// Serializes this UserGlobalConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserGlobalConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserGlobalConfigCopyWith<UserGlobalConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGlobalConfigCopyWith<$Res> {
  factory $UserGlobalConfigCopyWith(
    UserGlobalConfig value,
    $Res Function(UserGlobalConfig) then,
  ) = _$UserGlobalConfigCopyWithImpl<$Res, UserGlobalConfig>;
  @useResult
  $Res call({
    @JsonKey(name: 'SEARCH_SOURCE') String searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') String recognizeSource,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED') bool aiRecommendEnabled,
    @JsonKey(name: 'USER_UNIQUE_ID') String userUniqueId,
    @JsonKey(name: 'SUBSCRIBE_SHARE_MANAGE') bool subscribeShareManage,
    @JsonKey(name: 'WORKFLOW_SHARE_MANAGE') bool workflowShareManage,
  });
}

/// @nodoc
class _$UserGlobalConfigCopyWithImpl<$Res, $Val extends UserGlobalConfig>
    implements $UserGlobalConfigCopyWith<$Res> {
  _$UserGlobalConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserGlobalConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchSource = null,
    Object? recognizeSource = null,
    Object? aiRecommendEnabled = null,
    Object? userUniqueId = null,
    Object? subscribeShareManage = null,
    Object? workflowShareManage = null,
  }) {
    return _then(
      _value.copyWith(
            searchSource: null == searchSource
                ? _value.searchSource
                : searchSource // ignore: cast_nullable_to_non_nullable
                      as String,
            recognizeSource: null == recognizeSource
                ? _value.recognizeSource
                : recognizeSource // ignore: cast_nullable_to_non_nullable
                      as String,
            aiRecommendEnabled: null == aiRecommendEnabled
                ? _value.aiRecommendEnabled
                : aiRecommendEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            userUniqueId: null == userUniqueId
                ? _value.userUniqueId
                : userUniqueId // ignore: cast_nullable_to_non_nullable
                      as String,
            subscribeShareManage: null == subscribeShareManage
                ? _value.subscribeShareManage
                : subscribeShareManage // ignore: cast_nullable_to_non_nullable
                      as bool,
            workflowShareManage: null == workflowShareManage
                ? _value.workflowShareManage
                : workflowShareManage // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserGlobalConfigImplCopyWith<$Res>
    implements $UserGlobalConfigCopyWith<$Res> {
  factory _$$UserGlobalConfigImplCopyWith(
    _$UserGlobalConfigImpl value,
    $Res Function(_$UserGlobalConfigImpl) then,
  ) = __$$UserGlobalConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'SEARCH_SOURCE') String searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') String recognizeSource,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED') bool aiRecommendEnabled,
    @JsonKey(name: 'USER_UNIQUE_ID') String userUniqueId,
    @JsonKey(name: 'SUBSCRIBE_SHARE_MANAGE') bool subscribeShareManage,
    @JsonKey(name: 'WORKFLOW_SHARE_MANAGE') bool workflowShareManage,
  });
}

/// @nodoc
class __$$UserGlobalConfigImplCopyWithImpl<$Res>
    extends _$UserGlobalConfigCopyWithImpl<$Res, _$UserGlobalConfigImpl>
    implements _$$UserGlobalConfigImplCopyWith<$Res> {
  __$$UserGlobalConfigImplCopyWithImpl(
    _$UserGlobalConfigImpl _value,
    $Res Function(_$UserGlobalConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserGlobalConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchSource = null,
    Object? recognizeSource = null,
    Object? aiRecommendEnabled = null,
    Object? userUniqueId = null,
    Object? subscribeShareManage = null,
    Object? workflowShareManage = null,
  }) {
    return _then(
      _$UserGlobalConfigImpl(
        searchSource: null == searchSource
            ? _value.searchSource
            : searchSource // ignore: cast_nullable_to_non_nullable
                  as String,
        recognizeSource: null == recognizeSource
            ? _value.recognizeSource
            : recognizeSource // ignore: cast_nullable_to_non_nullable
                  as String,
        aiRecommendEnabled: null == aiRecommendEnabled
            ? _value.aiRecommendEnabled
            : aiRecommendEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        userUniqueId: null == userUniqueId
            ? _value.userUniqueId
            : userUniqueId // ignore: cast_nullable_to_non_nullable
                  as String,
        subscribeShareManage: null == subscribeShareManage
            ? _value.subscribeShareManage
            : subscribeShareManage // ignore: cast_nullable_to_non_nullable
                  as bool,
        workflowShareManage: null == workflowShareManage
            ? _value.workflowShareManage
            : workflowShareManage // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGlobalConfigImpl implements _UserGlobalConfig {
  const _$UserGlobalConfigImpl({
    @JsonKey(name: 'SEARCH_SOURCE') required this.searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') required this.recognizeSource,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED') required this.aiRecommendEnabled,
    @JsonKey(name: 'USER_UNIQUE_ID') required this.userUniqueId,
    @JsonKey(name: 'SUBSCRIBE_SHARE_MANAGE') required this.subscribeShareManage,
    @JsonKey(name: 'WORKFLOW_SHARE_MANAGE') required this.workflowShareManage,
  });

  factory _$UserGlobalConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGlobalConfigImplFromJson(json);

  @override
  @JsonKey(name: 'SEARCH_SOURCE')
  final String searchSource;
  @override
  @JsonKey(name: 'RECOGNIZE_SOURCE')
  final String recognizeSource;
  @override
  @JsonKey(name: 'AI_RECOMMEND_ENABLED')
  final bool aiRecommendEnabled;
  @override
  @JsonKey(name: 'USER_UNIQUE_ID')
  final String userUniqueId;
  @override
  @JsonKey(name: 'SUBSCRIBE_SHARE_MANAGE')
  final bool subscribeShareManage;
  @override
  @JsonKey(name: 'WORKFLOW_SHARE_MANAGE')
  final bool workflowShareManage;

  @override
  String toString() {
    return 'UserGlobalConfig(searchSource: $searchSource, recognizeSource: $recognizeSource, aiRecommendEnabled: $aiRecommendEnabled, userUniqueId: $userUniqueId, subscribeShareManage: $subscribeShareManage, workflowShareManage: $workflowShareManage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGlobalConfigImpl &&
            (identical(other.searchSource, searchSource) ||
                other.searchSource == searchSource) &&
            (identical(other.recognizeSource, recognizeSource) ||
                other.recognizeSource == recognizeSource) &&
            (identical(other.aiRecommendEnabled, aiRecommendEnabled) ||
                other.aiRecommendEnabled == aiRecommendEnabled) &&
            (identical(other.userUniqueId, userUniqueId) ||
                other.userUniqueId == userUniqueId) &&
            (identical(other.subscribeShareManage, subscribeShareManage) ||
                other.subscribeShareManage == subscribeShareManage) &&
            (identical(other.workflowShareManage, workflowShareManage) ||
                other.workflowShareManage == workflowShareManage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    searchSource,
    recognizeSource,
    aiRecommendEnabled,
    userUniqueId,
    subscribeShareManage,
    workflowShareManage,
  );

  /// Create a copy of UserGlobalConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGlobalConfigImplCopyWith<_$UserGlobalConfigImpl> get copyWith =>
      __$$UserGlobalConfigImplCopyWithImpl<_$UserGlobalConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGlobalConfigImplToJson(this);
  }
}

abstract class _UserGlobalConfig implements UserGlobalConfig {
  const factory _UserGlobalConfig({
    @JsonKey(name: 'SEARCH_SOURCE') required final String searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') required final String recognizeSource,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED')
    required final bool aiRecommendEnabled,
    @JsonKey(name: 'USER_UNIQUE_ID') required final String userUniqueId,
    @JsonKey(name: 'SUBSCRIBE_SHARE_MANAGE')
    required final bool subscribeShareManage,
    @JsonKey(name: 'WORKFLOW_SHARE_MANAGE')
    required final bool workflowShareManage,
  }) = _$UserGlobalConfigImpl;

  factory _UserGlobalConfig.fromJson(Map<String, dynamic> json) =
      _$UserGlobalConfigImpl.fromJson;

  @override
  @JsonKey(name: 'SEARCH_SOURCE')
  String get searchSource;
  @override
  @JsonKey(name: 'RECOGNIZE_SOURCE')
  String get recognizeSource;
  @override
  @JsonKey(name: 'AI_RECOMMEND_ENABLED')
  bool get aiRecommendEnabled;
  @override
  @JsonKey(name: 'USER_UNIQUE_ID')
  String get userUniqueId;
  @override
  @JsonKey(name: 'SUBSCRIBE_SHARE_MANAGE')
  bool get subscribeShareManage;
  @override
  @JsonKey(name: 'WORKFLOW_SHARE_MANAGE')
  bool get workflowShareManage;

  /// Create a copy of UserGlobalConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGlobalConfigImplCopyWith<_$UserGlobalConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserGlobalConfigResponse _$UserGlobalConfigResponseFromJson(
  Map<String, dynamic> json,
) {
  return _UserGlobalConfigResponse.fromJson(json);
}

/// @nodoc
mixin _$UserGlobalConfigResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserGlobalConfig get data => throw _privateConstructorUsedError;

  /// Serializes this UserGlobalConfigResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserGlobalConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserGlobalConfigResponseCopyWith<UserGlobalConfigResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGlobalConfigResponseCopyWith<$Res> {
  factory $UserGlobalConfigResponseCopyWith(
    UserGlobalConfigResponse value,
    $Res Function(UserGlobalConfigResponse) then,
  ) = _$UserGlobalConfigResponseCopyWithImpl<$Res, UserGlobalConfigResponse>;
  @useResult
  $Res call({bool success, String? message, UserGlobalConfig data});

  $UserGlobalConfigCopyWith<$Res> get data;
}

/// @nodoc
class _$UserGlobalConfigResponseCopyWithImpl<
  $Res,
  $Val extends UserGlobalConfigResponse
>
    implements $UserGlobalConfigResponseCopyWith<$Res> {
  _$UserGlobalConfigResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserGlobalConfigResponse
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
                      as UserGlobalConfig,
          )
          as $Val,
    );
  }

  /// Create a copy of UserGlobalConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserGlobalConfigCopyWith<$Res> get data {
    return $UserGlobalConfigCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserGlobalConfigResponseImplCopyWith<$Res>
    implements $UserGlobalConfigResponseCopyWith<$Res> {
  factory _$$UserGlobalConfigResponseImplCopyWith(
    _$UserGlobalConfigResponseImpl value,
    $Res Function(_$UserGlobalConfigResponseImpl) then,
  ) = __$$UserGlobalConfigResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, UserGlobalConfig data});

  @override
  $UserGlobalConfigCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserGlobalConfigResponseImplCopyWithImpl<$Res>
    extends
        _$UserGlobalConfigResponseCopyWithImpl<
          $Res,
          _$UserGlobalConfigResponseImpl
        >
    implements _$$UserGlobalConfigResponseImplCopyWith<$Res> {
  __$$UserGlobalConfigResponseImplCopyWithImpl(
    _$UserGlobalConfigResponseImpl _value,
    $Res Function(_$UserGlobalConfigResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserGlobalConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(
      _$UserGlobalConfigResponseImpl(
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
                  as UserGlobalConfig,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGlobalConfigResponseImpl implements _UserGlobalConfigResponse {
  const _$UserGlobalConfigResponseImpl({
    required this.success,
    this.message,
    required this.data,
  });

  factory _$UserGlobalConfigResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGlobalConfigResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final UserGlobalConfig data;

  @override
  String toString() {
    return 'UserGlobalConfigResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGlobalConfigResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of UserGlobalConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGlobalConfigResponseImplCopyWith<_$UserGlobalConfigResponseImpl>
  get copyWith =>
      __$$UserGlobalConfigResponseImplCopyWithImpl<
        _$UserGlobalConfigResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGlobalConfigResponseImplToJson(this);
  }
}

abstract class _UserGlobalConfigResponse implements UserGlobalConfigResponse {
  const factory _UserGlobalConfigResponse({
    required final bool success,
    final String? message,
    required final UserGlobalConfig data,
  }) = _$UserGlobalConfigResponseImpl;

  factory _UserGlobalConfigResponse.fromJson(Map<String, dynamic> json) =
      _$UserGlobalConfigResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  UserGlobalConfig get data;

  /// Create a copy of UserGlobalConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGlobalConfigResponseImplCopyWith<_$UserGlobalConfigResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
