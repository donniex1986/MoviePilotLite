import 'package:freezed_annotation/freezed_annotation.dart';

part 'rule_models.freezed.dart';
part 'rule_models.g.dart';

String _stringFromJson(Object? value) {
  if (value == null) return '';
  return value.toString();
}

// ---------------------------------------------------------------------------
// 自定义规则 CustomFilterRules
// ---------------------------------------------------------------------------

/// 自定义过滤规则项
/// API: GET /api/v1/system/setting/CustomFilterRules
@freezed
class CustomFilterRule with _$CustomFilterRule {
  const factory CustomFilterRule({
    @JsonKey(fromJson: _stringFromJson) @Default('') String id,
    @JsonKey(fromJson: _stringFromJson) @Default('') String name,
    @JsonKey(fromJson: _stringFromJson) @Default('') String include,
    @JsonKey(fromJson: _stringFromJson) @Default('') String exclude,
    @JsonKey(fromJson: _stringFromJson, name: 'size_range')
    @Default('')
    String sizeRange,
    @JsonKey(fromJson: _stringFromJson, name: 'seeders')
    @Default('')
    String seeders,
    @JsonKey(fromJson: _stringFromJson, name: 'publish_time')
    @Default('')
    String publishTime,
  }) = _CustomFilterRule;

  factory CustomFilterRule.fromJson(Map<String, dynamic> json) =>
      _$CustomFilterRuleFromJson(json);
}

List<CustomFilterRule> _customFilterRuleListFromJson(Object? value) {
  if (value == null || value is! List) return [];
  return value
      .whereType<Map<String, dynamic>>()
      .map((e) => CustomFilterRule.fromJson(e))
      .toList();
}

@freezed
class CustomFilterRulesData with _$CustomFilterRulesData {
  const factory CustomFilterRulesData({
    @JsonKey(fromJson: _customFilterRuleListFromJson)
    @Default([])
    List<CustomFilterRule> value,
  }) = _CustomFilterRulesData;

  factory CustomFilterRulesData.fromJson(Map<String, dynamic> json) =>
      _$CustomFilterRulesDataFromJson(json);
}

@freezed
class CustomFilterRulesResponse with _$CustomFilterRulesResponse {
  const factory CustomFilterRulesResponse({
    @Default(false) bool success,
    String? message,
    CustomFilterRulesData? data,
  }) = _CustomFilterRulesResponse;

  factory CustomFilterRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomFilterRulesResponseFromJson(json);
}

// ---------------------------------------------------------------------------
// 优先级规则 UserFilterRuleGroups
// ---------------------------------------------------------------------------

/// 用户过滤规则组
/// API: GET /api/v1/system/setting/UserFilterRuleGroups
@freezed
class UserFilterRuleGroup with _$UserFilterRuleGroup {
  const factory UserFilterRuleGroup({
    @JsonKey(name: 'name', fromJson: _stringFromJson) @Default('') String name,
    @JsonKey(name: 'rule_string', fromJson: _stringFromJson)
    @Default('')
    String ruleString,
    @JsonKey(name: 'media_type', fromJson: _stringFromJson)
    @Default('')
    String mediaType,
    @JsonKey(fromJson: _stringFromJson) @Default('') String category,
  }) = _UserFilterRuleGroup;

  factory UserFilterRuleGroup.fromJson(Map<String, dynamic> json) =>
      _$UserFilterRuleGroupFromJson(json);
}

List<UserFilterRuleGroup> _userFilterRuleGroupListFromJson(Object? value) {
  if (value == null || value is! List) return [];
  return value
      .whereType<Map<String, dynamic>>()
      .map((e) => UserFilterRuleGroup.fromJson(e))
      .toList();
}

@freezed
class UserFilterRuleGroupsData with _$UserFilterRuleGroupsData {
  const factory UserFilterRuleGroupsData({
    @JsonKey(fromJson: _userFilterRuleGroupListFromJson)
    @Default([])
    List<UserFilterRuleGroup> value,
  }) = _UserFilterRuleGroupsData;

  factory UserFilterRuleGroupsData.fromJson(Map<String, dynamic> json) =>
      _$UserFilterRuleGroupsDataFromJson(json);
}

@freezed
class UserFilterRuleGroupsResponse with _$UserFilterRuleGroupsResponse {
  const factory UserFilterRuleGroupsResponse({
    @Default(false) bool success,
    String? message,
    UserFilterRuleGroupsData? data,
  }) = _UserFilterRuleGroupsResponse;

  factory UserFilterRuleGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserFilterRuleGroupsResponseFromJson(json);
}

// ---------------------------------------------------------------------------
// 下载规则 TorrentsPriority
// ---------------------------------------------------------------------------

List<String> _stringListFromJson(Object? value) {
  if (value == null || value is! List) return [];
  return value.map((e) => e?.toString() ?? '').toList();
}

@freezed
class TorrentsPriorityData with _$TorrentsPriorityData {
  const factory TorrentsPriorityData({
    @JsonKey(fromJson: _stringListFromJson) @Default([]) List<String> value,
  }) = _TorrentsPriorityData;

  factory TorrentsPriorityData.fromJson(Map<String, dynamic> json) =>
      _$TorrentsPriorityDataFromJson(json);
}

@freezed
class TorrentsPriorityResponse with _$TorrentsPriorityResponse {
  const factory TorrentsPriorityResponse({
    @Default(false) bool success,
    String? message,
    TorrentsPriorityData? data,
  }) = _TorrentsPriorityResponse;

  factory TorrentsPriorityResponse.fromJson(Map<String, dynamic> json) =>
      _$TorrentsPriorityResponseFromJson(json);
}
