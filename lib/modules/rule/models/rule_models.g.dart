// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomFilterRuleImpl _$$CustomFilterRuleImplFromJson(
  Map<String, dynamic> json,
) => _$CustomFilterRuleImpl(
  id: json['id'] == null ? '' : _stringFromJson(json['id']),
  name: json['name'] == null ? '' : _stringFromJson(json['name']),
  include: json['include'] == null ? '' : _stringFromJson(json['include']),
  exclude: json['exclude'] == null ? '' : _stringFromJson(json['exclude']),
);

Map<String, dynamic> _$$CustomFilterRuleImplToJson(
  _$CustomFilterRuleImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'include': instance.include,
  'exclude': instance.exclude,
};

_$CustomFilterRulesDataImpl _$$CustomFilterRulesDataImplFromJson(
  Map<String, dynamic> json,
) => _$CustomFilterRulesDataImpl(
  value: json['value'] == null
      ? const []
      : _customFilterRuleListFromJson(json['value']),
);

Map<String, dynamic> _$$CustomFilterRulesDataImplToJson(
  _$CustomFilterRulesDataImpl instance,
) => <String, dynamic>{'value': instance.value};

_$CustomFilterRulesResponseImpl _$$CustomFilterRulesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CustomFilterRulesResponseImpl(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : CustomFilterRulesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CustomFilterRulesResponseImplToJson(
  _$CustomFilterRulesResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$UserFilterRuleGroupImpl _$$UserFilterRuleGroupImplFromJson(
  Map<String, dynamic> json,
) => _$UserFilterRuleGroupImpl(
  name: json['name'] == null ? '' : _stringFromJson(json['name']),
  ruleString: json['rule_string'] == null
      ? ''
      : _stringFromJson(json['rule_string']),
  mediaType: json['media_type'] == null
      ? ''
      : _stringFromJson(json['media_type']),
  category: json['category'] == null ? '' : _stringFromJson(json['category']),
);

Map<String, dynamic> _$$UserFilterRuleGroupImplToJson(
  _$UserFilterRuleGroupImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'rule_string': instance.ruleString,
  'media_type': instance.mediaType,
  'category': instance.category,
};

_$UserFilterRuleGroupsDataImpl _$$UserFilterRuleGroupsDataImplFromJson(
  Map<String, dynamic> json,
) => _$UserFilterRuleGroupsDataImpl(
  value: json['value'] == null
      ? const []
      : _userFilterRuleGroupListFromJson(json['value']),
);

Map<String, dynamic> _$$UserFilterRuleGroupsDataImplToJson(
  _$UserFilterRuleGroupsDataImpl instance,
) => <String, dynamic>{'value': instance.value};

_$UserFilterRuleGroupsResponseImpl _$$UserFilterRuleGroupsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UserFilterRuleGroupsResponseImpl(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : UserFilterRuleGroupsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserFilterRuleGroupsResponseImplToJson(
  _$UserFilterRuleGroupsResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$TorrentsPriorityDataImpl _$$TorrentsPriorityDataImplFromJson(
  Map<String, dynamic> json,
) => _$TorrentsPriorityDataImpl(
  value: json['value'] == null ? const [] : _stringListFromJson(json['value']),
);

Map<String, dynamic> _$$TorrentsPriorityDataImplToJson(
  _$TorrentsPriorityDataImpl instance,
) => <String, dynamic>{'value': instance.value};

_$TorrentsPriorityResponseImpl _$$TorrentsPriorityResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TorrentsPriorityResponseImpl(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : TorrentsPriorityData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$TorrentsPriorityResponseImplToJson(
  _$TorrentsPriorityResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
