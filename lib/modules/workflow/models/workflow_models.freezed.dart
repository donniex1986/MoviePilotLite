// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SharedWorkflow _$SharedWorkflowFromJson(Map<String, dynamic> json) {
  return _SharedWorkflow.fromJson(json);
}

/// @nodoc
mixin _$SharedWorkflow {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_title')
  String get shareTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_comment')
  String? get shareComment => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_user')
  String get shareUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'share_uid')
  String get shareUid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get timer => throw _privateConstructorUsedError;
  @JsonKey(name: 'trigger_type')
  String? get triggerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_type')
  String? get eventType => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_conditions')
  dynamic get eventConditions => throw _privateConstructorUsedError;
  String get actions => throw _privateConstructorUsedError;
  String get flows => throw _privateConstructorUsedError;
  dynamic get context => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this SharedWorkflow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SharedWorkflow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SharedWorkflowCopyWith<SharedWorkflow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedWorkflowCopyWith<$Res> {
  factory $SharedWorkflowCopyWith(
    SharedWorkflow value,
    $Res Function(SharedWorkflow) then,
  ) = _$SharedWorkflowCopyWithImpl<$Res, SharedWorkflow>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'share_title') String shareTitle,
    @JsonKey(name: 'share_comment') String? shareComment,
    @JsonKey(name: 'share_user') String shareUser,
    @JsonKey(name: 'share_uid') String shareUid,
    String name,
    String description,
    String? timer,
    @JsonKey(name: 'trigger_type') String? triggerType,
    @JsonKey(name: 'event_type') String? eventType,
    @JsonKey(name: 'event_conditions') dynamic eventConditions,
    String actions,
    String flows,
    dynamic context,
    String date,
    int count,
  });
}

/// @nodoc
class _$SharedWorkflowCopyWithImpl<$Res, $Val extends SharedWorkflow>
    implements $SharedWorkflowCopyWith<$Res> {
  _$SharedWorkflowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SharedWorkflow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shareTitle = null,
    Object? shareComment = freezed,
    Object? shareUser = null,
    Object? shareUid = null,
    Object? name = null,
    Object? description = null,
    Object? timer = freezed,
    Object? triggerType = freezed,
    Object? eventType = freezed,
    Object? eventConditions = freezed,
    Object? actions = null,
    Object? flows = null,
    Object? context = freezed,
    Object? date = null,
    Object? count = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            shareTitle: null == shareTitle
                ? _value.shareTitle
                : shareTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            shareComment: freezed == shareComment
                ? _value.shareComment
                : shareComment // ignore: cast_nullable_to_non_nullable
                      as String?,
            shareUser: null == shareUser
                ? _value.shareUser
                : shareUser // ignore: cast_nullable_to_non_nullable
                      as String,
            shareUid: null == shareUid
                ? _value.shareUid
                : shareUid // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            timer: freezed == timer
                ? _value.timer
                : timer // ignore: cast_nullable_to_non_nullable
                      as String?,
            triggerType: freezed == triggerType
                ? _value.triggerType
                : triggerType // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventType: freezed == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventConditions: freezed == eventConditions
                ? _value.eventConditions
                : eventConditions // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            actions: null == actions
                ? _value.actions
                : actions // ignore: cast_nullable_to_non_nullable
                      as String,
            flows: null == flows
                ? _value.flows
                : flows // ignore: cast_nullable_to_non_nullable
                      as String,
            context: freezed == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SharedWorkflowImplCopyWith<$Res>
    implements $SharedWorkflowCopyWith<$Res> {
  factory _$$SharedWorkflowImplCopyWith(
    _$SharedWorkflowImpl value,
    $Res Function(_$SharedWorkflowImpl) then,
  ) = __$$SharedWorkflowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'share_title') String shareTitle,
    @JsonKey(name: 'share_comment') String? shareComment,
    @JsonKey(name: 'share_user') String shareUser,
    @JsonKey(name: 'share_uid') String shareUid,
    String name,
    String description,
    String? timer,
    @JsonKey(name: 'trigger_type') String? triggerType,
    @JsonKey(name: 'event_type') String? eventType,
    @JsonKey(name: 'event_conditions') dynamic eventConditions,
    String actions,
    String flows,
    dynamic context,
    String date,
    int count,
  });
}

/// @nodoc
class __$$SharedWorkflowImplCopyWithImpl<$Res>
    extends _$SharedWorkflowCopyWithImpl<$Res, _$SharedWorkflowImpl>
    implements _$$SharedWorkflowImplCopyWith<$Res> {
  __$$SharedWorkflowImplCopyWithImpl(
    _$SharedWorkflowImpl _value,
    $Res Function(_$SharedWorkflowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SharedWorkflow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shareTitle = null,
    Object? shareComment = freezed,
    Object? shareUser = null,
    Object? shareUid = null,
    Object? name = null,
    Object? description = null,
    Object? timer = freezed,
    Object? triggerType = freezed,
    Object? eventType = freezed,
    Object? eventConditions = freezed,
    Object? actions = null,
    Object? flows = null,
    Object? context = freezed,
    Object? date = null,
    Object? count = null,
  }) {
    return _then(
      _$SharedWorkflowImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        shareTitle: null == shareTitle
            ? _value.shareTitle
            : shareTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        shareComment: freezed == shareComment
            ? _value.shareComment
            : shareComment // ignore: cast_nullable_to_non_nullable
                  as String?,
        shareUser: null == shareUser
            ? _value.shareUser
            : shareUser // ignore: cast_nullable_to_non_nullable
                  as String,
        shareUid: null == shareUid
            ? _value.shareUid
            : shareUid // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        timer: freezed == timer
            ? _value.timer
            : timer // ignore: cast_nullable_to_non_nullable
                  as String?,
        triggerType: freezed == triggerType
            ? _value.triggerType
            : triggerType // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventType: freezed == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventConditions: freezed == eventConditions
            ? _value.eventConditions
            : eventConditions // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        actions: null == actions
            ? _value.actions
            : actions // ignore: cast_nullable_to_non_nullable
                  as String,
        flows: null == flows
            ? _value.flows
            : flows // ignore: cast_nullable_to_non_nullable
                  as String,
        context: freezed == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SharedWorkflowImpl implements _SharedWorkflow {
  const _$SharedWorkflowImpl({
    required this.id,
    @JsonKey(name: 'share_title') required this.shareTitle,
    @JsonKey(name: 'share_comment') this.shareComment,
    @JsonKey(name: 'share_user') required this.shareUser,
    @JsonKey(name: 'share_uid') required this.shareUid,
    required this.name,
    required this.description,
    this.timer,
    @JsonKey(name: 'trigger_type') this.triggerType,
    @JsonKey(name: 'event_type') this.eventType,
    @JsonKey(name: 'event_conditions') this.eventConditions,
    required this.actions,
    required this.flows,
    this.context,
    required this.date,
    required this.count,
  });

  factory _$SharedWorkflowImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedWorkflowImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'share_title')
  final String shareTitle;
  @override
  @JsonKey(name: 'share_comment')
  final String? shareComment;
  @override
  @JsonKey(name: 'share_user')
  final String shareUser;
  @override
  @JsonKey(name: 'share_uid')
  final String shareUid;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? timer;
  @override
  @JsonKey(name: 'trigger_type')
  final String? triggerType;
  @override
  @JsonKey(name: 'event_type')
  final String? eventType;
  @override
  @JsonKey(name: 'event_conditions')
  final dynamic eventConditions;
  @override
  final String actions;
  @override
  final String flows;
  @override
  final dynamic context;
  @override
  final String date;
  @override
  final int count;

  @override
  String toString() {
    return 'SharedWorkflow(id: $id, shareTitle: $shareTitle, shareComment: $shareComment, shareUser: $shareUser, shareUid: $shareUid, name: $name, description: $description, timer: $timer, triggerType: $triggerType, eventType: $eventType, eventConditions: $eventConditions, actions: $actions, flows: $flows, context: $context, date: $date, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedWorkflowImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shareTitle, shareTitle) ||
                other.shareTitle == shareTitle) &&
            (identical(other.shareComment, shareComment) ||
                other.shareComment == shareComment) &&
            (identical(other.shareUser, shareUser) ||
                other.shareUser == shareUser) &&
            (identical(other.shareUid, shareUid) ||
                other.shareUid == shareUid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.triggerType, triggerType) ||
                other.triggerType == triggerType) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            const DeepCollectionEquality().equals(
              other.eventConditions,
              eventConditions,
            ) &&
            (identical(other.actions, actions) || other.actions == actions) &&
            (identical(other.flows, flows) || other.flows == flows) &&
            const DeepCollectionEquality().equals(other.context, context) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    shareTitle,
    shareComment,
    shareUser,
    shareUid,
    name,
    description,
    timer,
    triggerType,
    eventType,
    const DeepCollectionEquality().hash(eventConditions),
    actions,
    flows,
    const DeepCollectionEquality().hash(context),
    date,
    count,
  );

  /// Create a copy of SharedWorkflow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedWorkflowImplCopyWith<_$SharedWorkflowImpl> get copyWith =>
      __$$SharedWorkflowImplCopyWithImpl<_$SharedWorkflowImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedWorkflowImplToJson(this);
  }
}

abstract class _SharedWorkflow implements SharedWorkflow {
  const factory _SharedWorkflow({
    required final int id,
    @JsonKey(name: 'share_title') required final String shareTitle,
    @JsonKey(name: 'share_comment') final String? shareComment,
    @JsonKey(name: 'share_user') required final String shareUser,
    @JsonKey(name: 'share_uid') required final String shareUid,
    required final String name,
    required final String description,
    final String? timer,
    @JsonKey(name: 'trigger_type') final String? triggerType,
    @JsonKey(name: 'event_type') final String? eventType,
    @JsonKey(name: 'event_conditions') final dynamic eventConditions,
    required final String actions,
    required final String flows,
    final dynamic context,
    required final String date,
    required final int count,
  }) = _$SharedWorkflowImpl;

  factory _SharedWorkflow.fromJson(Map<String, dynamic> json) =
      _$SharedWorkflowImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'share_title')
  String get shareTitle;
  @override
  @JsonKey(name: 'share_comment')
  String? get shareComment;
  @override
  @JsonKey(name: 'share_user')
  String get shareUser;
  @override
  @JsonKey(name: 'share_uid')
  String get shareUid;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get timer;
  @override
  @JsonKey(name: 'trigger_type')
  String? get triggerType;
  @override
  @JsonKey(name: 'event_type')
  String? get eventType;
  @override
  @JsonKey(name: 'event_conditions')
  dynamic get eventConditions;
  @override
  String get actions;
  @override
  String get flows;
  @override
  dynamic get context;
  @override
  String get date;
  @override
  int get count;

  /// Create a copy of SharedWorkflow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SharedWorkflowImplCopyWith<_$SharedWorkflowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
