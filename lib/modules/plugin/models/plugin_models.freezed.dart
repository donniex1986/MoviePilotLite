// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plugin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PluginItem _$PluginItemFromJson(Map<String, dynamic> json) {
  return _PluginItem.fromJson(json);
}

/// @nodoc
mixin _$PluginItem {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_name')
  String get pluginName => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_desc')
  String? get pluginDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_icon')
  String? get pluginIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_version')
  String? get pluginVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_label')
  String? get pluginLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_author')
  String? get pluginAuthor => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_url')
  String? get authorUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_config_prefix')
  String? get pluginConfigPrefix => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_order', fromJson: _intFromJson)
  int get pluginOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_level', fromJson: _intFromJson)
  int get authLevel => throw _privateConstructorUsedError;
  bool get installed => throw _privateConstructorUsedError;
  bool get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_page')
  bool get hasPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_update')
  bool get hasUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_local')
  bool get isLocal => throw _privateConstructorUsedError;
  @JsonKey(name: 'repo_url')
  String? get repoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'install_count', fromJson: _intFromJson)
  int get installCount => throw _privateConstructorUsedError;
  Map<String, dynamic> get history => throw _privateConstructorUsedError;
  @JsonKey(name: 'add_time', fromJson: _intFromJson)
  int get addTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'plugin_public_key')
  String? get pluginPublicKey => throw _privateConstructorUsedError;

  /// Serializes this PluginItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PluginItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PluginItemCopyWith<PluginItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PluginItemCopyWith<$Res> {
  factory $PluginItemCopyWith(
    PluginItem value,
    $Res Function(PluginItem) then,
  ) = _$PluginItemCopyWithImpl<$Res, PluginItem>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'plugin_name') String pluginName,
    @JsonKey(name: 'plugin_desc') String? pluginDesc,
    @JsonKey(name: 'plugin_icon') String? pluginIcon,
    @JsonKey(name: 'plugin_version') String? pluginVersion,
    @JsonKey(name: 'plugin_label') String? pluginLabel,
    @JsonKey(name: 'plugin_author') String? pluginAuthor,
    @JsonKey(name: 'author_url') String? authorUrl,
    @JsonKey(name: 'plugin_config_prefix') String? pluginConfigPrefix,
    @JsonKey(name: 'plugin_order', fromJson: _intFromJson) int pluginOrder,
    @JsonKey(name: 'auth_level', fromJson: _intFromJson) int authLevel,
    bool installed,
    bool state,
    @JsonKey(name: 'has_page') bool hasPage,
    @JsonKey(name: 'has_update') bool hasUpdate,
    @JsonKey(name: 'is_local') bool isLocal,
    @JsonKey(name: 'repo_url') String? repoUrl,
    @JsonKey(name: 'install_count', fromJson: _intFromJson) int installCount,
    Map<String, dynamic> history,
    @JsonKey(name: 'add_time', fromJson: _intFromJson) int addTime,
    @JsonKey(name: 'plugin_public_key') String? pluginPublicKey,
  });
}

/// @nodoc
class _$PluginItemCopyWithImpl<$Res, $Val extends PluginItem>
    implements $PluginItemCopyWith<$Res> {
  _$PluginItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PluginItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pluginName = null,
    Object? pluginDesc = freezed,
    Object? pluginIcon = freezed,
    Object? pluginVersion = freezed,
    Object? pluginLabel = freezed,
    Object? pluginAuthor = freezed,
    Object? authorUrl = freezed,
    Object? pluginConfigPrefix = freezed,
    Object? pluginOrder = null,
    Object? authLevel = null,
    Object? installed = null,
    Object? state = null,
    Object? hasPage = null,
    Object? hasUpdate = null,
    Object? isLocal = null,
    Object? repoUrl = freezed,
    Object? installCount = null,
    Object? history = null,
    Object? addTime = null,
    Object? pluginPublicKey = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            pluginName: null == pluginName
                ? _value.pluginName
                : pluginName // ignore: cast_nullable_to_non_nullable
                      as String,
            pluginDesc: freezed == pluginDesc
                ? _value.pluginDesc
                : pluginDesc // ignore: cast_nullable_to_non_nullable
                      as String?,
            pluginIcon: freezed == pluginIcon
                ? _value.pluginIcon
                : pluginIcon // ignore: cast_nullable_to_non_nullable
                      as String?,
            pluginVersion: freezed == pluginVersion
                ? _value.pluginVersion
                : pluginVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            pluginLabel: freezed == pluginLabel
                ? _value.pluginLabel
                : pluginLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            pluginAuthor: freezed == pluginAuthor
                ? _value.pluginAuthor
                : pluginAuthor // ignore: cast_nullable_to_non_nullable
                      as String?,
            authorUrl: freezed == authorUrl
                ? _value.authorUrl
                : authorUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            pluginConfigPrefix: freezed == pluginConfigPrefix
                ? _value.pluginConfigPrefix
                : pluginConfigPrefix // ignore: cast_nullable_to_non_nullable
                      as String?,
            pluginOrder: null == pluginOrder
                ? _value.pluginOrder
                : pluginOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            authLevel: null == authLevel
                ? _value.authLevel
                : authLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            installed: null == installed
                ? _value.installed
                : installed // ignore: cast_nullable_to_non_nullable
                      as bool,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasPage: null == hasPage
                ? _value.hasPage
                : hasPage // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasUpdate: null == hasUpdate
                ? _value.hasUpdate
                : hasUpdate // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLocal: null == isLocal
                ? _value.isLocal
                : isLocal // ignore: cast_nullable_to_non_nullable
                      as bool,
            repoUrl: freezed == repoUrl
                ? _value.repoUrl
                : repoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            installCount: null == installCount
                ? _value.installCount
                : installCount // ignore: cast_nullable_to_non_nullable
                      as int,
            history: null == history
                ? _value.history
                : history // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            addTime: null == addTime
                ? _value.addTime
                : addTime // ignore: cast_nullable_to_non_nullable
                      as int,
            pluginPublicKey: freezed == pluginPublicKey
                ? _value.pluginPublicKey
                : pluginPublicKey // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PluginItemImplCopyWith<$Res>
    implements $PluginItemCopyWith<$Res> {
  factory _$$PluginItemImplCopyWith(
    _$PluginItemImpl value,
    $Res Function(_$PluginItemImpl) then,
  ) = __$$PluginItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'plugin_name') String pluginName,
    @JsonKey(name: 'plugin_desc') String? pluginDesc,
    @JsonKey(name: 'plugin_icon') String? pluginIcon,
    @JsonKey(name: 'plugin_version') String? pluginVersion,
    @JsonKey(name: 'plugin_label') String? pluginLabel,
    @JsonKey(name: 'plugin_author') String? pluginAuthor,
    @JsonKey(name: 'author_url') String? authorUrl,
    @JsonKey(name: 'plugin_config_prefix') String? pluginConfigPrefix,
    @JsonKey(name: 'plugin_order', fromJson: _intFromJson) int pluginOrder,
    @JsonKey(name: 'auth_level', fromJson: _intFromJson) int authLevel,
    bool installed,
    bool state,
    @JsonKey(name: 'has_page') bool hasPage,
    @JsonKey(name: 'has_update') bool hasUpdate,
    @JsonKey(name: 'is_local') bool isLocal,
    @JsonKey(name: 'repo_url') String? repoUrl,
    @JsonKey(name: 'install_count', fromJson: _intFromJson) int installCount,
    Map<String, dynamic> history,
    @JsonKey(name: 'add_time', fromJson: _intFromJson) int addTime,
    @JsonKey(name: 'plugin_public_key') String? pluginPublicKey,
  });
}

/// @nodoc
class __$$PluginItemImplCopyWithImpl<$Res>
    extends _$PluginItemCopyWithImpl<$Res, _$PluginItemImpl>
    implements _$$PluginItemImplCopyWith<$Res> {
  __$$PluginItemImplCopyWithImpl(
    _$PluginItemImpl _value,
    $Res Function(_$PluginItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PluginItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pluginName = null,
    Object? pluginDesc = freezed,
    Object? pluginIcon = freezed,
    Object? pluginVersion = freezed,
    Object? pluginLabel = freezed,
    Object? pluginAuthor = freezed,
    Object? authorUrl = freezed,
    Object? pluginConfigPrefix = freezed,
    Object? pluginOrder = null,
    Object? authLevel = null,
    Object? installed = null,
    Object? state = null,
    Object? hasPage = null,
    Object? hasUpdate = null,
    Object? isLocal = null,
    Object? repoUrl = freezed,
    Object? installCount = null,
    Object? history = null,
    Object? addTime = null,
    Object? pluginPublicKey = freezed,
  }) {
    return _then(
      _$PluginItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        pluginName: null == pluginName
            ? _value.pluginName
            : pluginName // ignore: cast_nullable_to_non_nullable
                  as String,
        pluginDesc: freezed == pluginDesc
            ? _value.pluginDesc
            : pluginDesc // ignore: cast_nullable_to_non_nullable
                  as String?,
        pluginIcon: freezed == pluginIcon
            ? _value.pluginIcon
            : pluginIcon // ignore: cast_nullable_to_non_nullable
                  as String?,
        pluginVersion: freezed == pluginVersion
            ? _value.pluginVersion
            : pluginVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        pluginLabel: freezed == pluginLabel
            ? _value.pluginLabel
            : pluginLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        pluginAuthor: freezed == pluginAuthor
            ? _value.pluginAuthor
            : pluginAuthor // ignore: cast_nullable_to_non_nullable
                  as String?,
        authorUrl: freezed == authorUrl
            ? _value.authorUrl
            : authorUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        pluginConfigPrefix: freezed == pluginConfigPrefix
            ? _value.pluginConfigPrefix
            : pluginConfigPrefix // ignore: cast_nullable_to_non_nullable
                  as String?,
        pluginOrder: null == pluginOrder
            ? _value.pluginOrder
            : pluginOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        authLevel: null == authLevel
            ? _value.authLevel
            : authLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        installed: null == installed
            ? _value.installed
            : installed // ignore: cast_nullable_to_non_nullable
                  as bool,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasPage: null == hasPage
            ? _value.hasPage
            : hasPage // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasUpdate: null == hasUpdate
            ? _value.hasUpdate
            : hasUpdate // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLocal: null == isLocal
            ? _value.isLocal
            : isLocal // ignore: cast_nullable_to_non_nullable
                  as bool,
        repoUrl: freezed == repoUrl
            ? _value.repoUrl
            : repoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        installCount: null == installCount
            ? _value.installCount
            : installCount // ignore: cast_nullable_to_non_nullable
                  as int,
        history: null == history
            ? _value._history
            : history // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        addTime: null == addTime
            ? _value.addTime
            : addTime // ignore: cast_nullable_to_non_nullable
                  as int,
        pluginPublicKey: freezed == pluginPublicKey
            ? _value.pluginPublicKey
            : pluginPublicKey // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PluginItemImpl implements _PluginItem {
  const _$PluginItemImpl({
    required this.id,
    @JsonKey(name: 'plugin_name') required this.pluginName,
    @JsonKey(name: 'plugin_desc') this.pluginDesc,
    @JsonKey(name: 'plugin_icon') this.pluginIcon,
    @JsonKey(name: 'plugin_version') this.pluginVersion,
    @JsonKey(name: 'plugin_label') this.pluginLabel,
    @JsonKey(name: 'plugin_author') this.pluginAuthor,
    @JsonKey(name: 'author_url') this.authorUrl,
    @JsonKey(name: 'plugin_config_prefix') this.pluginConfigPrefix,
    @JsonKey(name: 'plugin_order', fromJson: _intFromJson) this.pluginOrder = 0,
    @JsonKey(name: 'auth_level', fromJson: _intFromJson) this.authLevel = 1,
    this.installed = true,
    this.state = false,
    @JsonKey(name: 'has_page') this.hasPage = false,
    @JsonKey(name: 'has_update') this.hasUpdate = false,
    @JsonKey(name: 'is_local') this.isLocal = false,
    @JsonKey(name: 'repo_url') this.repoUrl,
    @JsonKey(name: 'install_count', fromJson: _intFromJson)
    this.installCount = 0,
    final Map<String, dynamic> history = const {},
    @JsonKey(name: 'add_time', fromJson: _intFromJson) this.addTime = 0,
    @JsonKey(name: 'plugin_public_key') this.pluginPublicKey,
  }) : _history = history;

  factory _$PluginItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PluginItemImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'plugin_name')
  final String pluginName;
  @override
  @JsonKey(name: 'plugin_desc')
  final String? pluginDesc;
  @override
  @JsonKey(name: 'plugin_icon')
  final String? pluginIcon;
  @override
  @JsonKey(name: 'plugin_version')
  final String? pluginVersion;
  @override
  @JsonKey(name: 'plugin_label')
  final String? pluginLabel;
  @override
  @JsonKey(name: 'plugin_author')
  final String? pluginAuthor;
  @override
  @JsonKey(name: 'author_url')
  final String? authorUrl;
  @override
  @JsonKey(name: 'plugin_config_prefix')
  final String? pluginConfigPrefix;
  @override
  @JsonKey(name: 'plugin_order', fromJson: _intFromJson)
  final int pluginOrder;
  @override
  @JsonKey(name: 'auth_level', fromJson: _intFromJson)
  final int authLevel;
  @override
  @JsonKey()
  final bool installed;
  @override
  @JsonKey()
  final bool state;
  @override
  @JsonKey(name: 'has_page')
  final bool hasPage;
  @override
  @JsonKey(name: 'has_update')
  final bool hasUpdate;
  @override
  @JsonKey(name: 'is_local')
  final bool isLocal;
  @override
  @JsonKey(name: 'repo_url')
  final String? repoUrl;
  @override
  @JsonKey(name: 'install_count', fromJson: _intFromJson)
  final int installCount;
  final Map<String, dynamic> _history;
  @override
  @JsonKey()
  Map<String, dynamic> get history {
    if (_history is EqualUnmodifiableMapView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_history);
  }

  @override
  @JsonKey(name: 'add_time', fromJson: _intFromJson)
  final int addTime;
  @override
  @JsonKey(name: 'plugin_public_key')
  final String? pluginPublicKey;

  @override
  String toString() {
    return 'PluginItem(id: $id, pluginName: $pluginName, pluginDesc: $pluginDesc, pluginIcon: $pluginIcon, pluginVersion: $pluginVersion, pluginLabel: $pluginLabel, pluginAuthor: $pluginAuthor, authorUrl: $authorUrl, pluginConfigPrefix: $pluginConfigPrefix, pluginOrder: $pluginOrder, authLevel: $authLevel, installed: $installed, state: $state, hasPage: $hasPage, hasUpdate: $hasUpdate, isLocal: $isLocal, repoUrl: $repoUrl, installCount: $installCount, history: $history, addTime: $addTime, pluginPublicKey: $pluginPublicKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PluginItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pluginName, pluginName) ||
                other.pluginName == pluginName) &&
            (identical(other.pluginDesc, pluginDesc) ||
                other.pluginDesc == pluginDesc) &&
            (identical(other.pluginIcon, pluginIcon) ||
                other.pluginIcon == pluginIcon) &&
            (identical(other.pluginVersion, pluginVersion) ||
                other.pluginVersion == pluginVersion) &&
            (identical(other.pluginLabel, pluginLabel) ||
                other.pluginLabel == pluginLabel) &&
            (identical(other.pluginAuthor, pluginAuthor) ||
                other.pluginAuthor == pluginAuthor) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            (identical(other.pluginConfigPrefix, pluginConfigPrefix) ||
                other.pluginConfigPrefix == pluginConfigPrefix) &&
            (identical(other.pluginOrder, pluginOrder) ||
                other.pluginOrder == pluginOrder) &&
            (identical(other.authLevel, authLevel) ||
                other.authLevel == authLevel) &&
            (identical(other.installed, installed) ||
                other.installed == installed) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.hasPage, hasPage) || other.hasPage == hasPage) &&
            (identical(other.hasUpdate, hasUpdate) ||
                other.hasUpdate == hasUpdate) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal) &&
            (identical(other.repoUrl, repoUrl) || other.repoUrl == repoUrl) &&
            (identical(other.installCount, installCount) ||
                other.installCount == installCount) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.addTime, addTime) || other.addTime == addTime) &&
            (identical(other.pluginPublicKey, pluginPublicKey) ||
                other.pluginPublicKey == pluginPublicKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    pluginName,
    pluginDesc,
    pluginIcon,
    pluginVersion,
    pluginLabel,
    pluginAuthor,
    authorUrl,
    pluginConfigPrefix,
    pluginOrder,
    authLevel,
    installed,
    state,
    hasPage,
    hasUpdate,
    isLocal,
    repoUrl,
    installCount,
    const DeepCollectionEquality().hash(_history),
    addTime,
    pluginPublicKey,
  ]);

  /// Create a copy of PluginItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PluginItemImplCopyWith<_$PluginItemImpl> get copyWith =>
      __$$PluginItemImplCopyWithImpl<_$PluginItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PluginItemImplToJson(this);
  }
}

abstract class _PluginItem implements PluginItem {
  const factory _PluginItem({
    required final String id,
    @JsonKey(name: 'plugin_name') required final String pluginName,
    @JsonKey(name: 'plugin_desc') final String? pluginDesc,
    @JsonKey(name: 'plugin_icon') final String? pluginIcon,
    @JsonKey(name: 'plugin_version') final String? pluginVersion,
    @JsonKey(name: 'plugin_label') final String? pluginLabel,
    @JsonKey(name: 'plugin_author') final String? pluginAuthor,
    @JsonKey(name: 'author_url') final String? authorUrl,
    @JsonKey(name: 'plugin_config_prefix') final String? pluginConfigPrefix,
    @JsonKey(name: 'plugin_order', fromJson: _intFromJson)
    final int pluginOrder,
    @JsonKey(name: 'auth_level', fromJson: _intFromJson) final int authLevel,
    final bool installed,
    final bool state,
    @JsonKey(name: 'has_page') final bool hasPage,
    @JsonKey(name: 'has_update') final bool hasUpdate,
    @JsonKey(name: 'is_local') final bool isLocal,
    @JsonKey(name: 'repo_url') final String? repoUrl,
    @JsonKey(name: 'install_count', fromJson: _intFromJson)
    final int installCount,
    final Map<String, dynamic> history,
    @JsonKey(name: 'add_time', fromJson: _intFromJson) final int addTime,
    @JsonKey(name: 'plugin_public_key') final String? pluginPublicKey,
  }) = _$PluginItemImpl;

  factory _PluginItem.fromJson(Map<String, dynamic> json) =
      _$PluginItemImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'plugin_name')
  String get pluginName;
  @override
  @JsonKey(name: 'plugin_desc')
  String? get pluginDesc;
  @override
  @JsonKey(name: 'plugin_icon')
  String? get pluginIcon;
  @override
  @JsonKey(name: 'plugin_version')
  String? get pluginVersion;
  @override
  @JsonKey(name: 'plugin_label')
  String? get pluginLabel;
  @override
  @JsonKey(name: 'plugin_author')
  String? get pluginAuthor;
  @override
  @JsonKey(name: 'author_url')
  String? get authorUrl;
  @override
  @JsonKey(name: 'plugin_config_prefix')
  String? get pluginConfigPrefix;
  @override
  @JsonKey(name: 'plugin_order', fromJson: _intFromJson)
  int get pluginOrder;
  @override
  @JsonKey(name: 'auth_level', fromJson: _intFromJson)
  int get authLevel;
  @override
  bool get installed;
  @override
  bool get state;
  @override
  @JsonKey(name: 'has_page')
  bool get hasPage;
  @override
  @JsonKey(name: 'has_update')
  bool get hasUpdate;
  @override
  @JsonKey(name: 'is_local')
  bool get isLocal;
  @override
  @JsonKey(name: 'repo_url')
  String? get repoUrl;
  @override
  @JsonKey(name: 'install_count', fromJson: _intFromJson)
  int get installCount;
  @override
  Map<String, dynamic> get history;
  @override
  @JsonKey(name: 'add_time', fromJson: _intFromJson)
  int get addTime;
  @override
  @JsonKey(name: 'plugin_public_key')
  String? get pluginPublicKey;

  /// Create a copy of PluginItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PluginItemImplCopyWith<_$PluginItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
