// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_global_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserGlobalConfigImpl _$$UserGlobalConfigImplFromJson(
  Map<String, dynamic> json,
) => _$UserGlobalConfigImpl(
  searchSource: json['SEARCH_SOURCE'] as String,
  recognizeSource: json['RECOGNIZE_SOURCE'] as String,
  aiRecommendEnabled: json['AI_RECOMMEND_ENABLED'] as bool,
  userUniqueId: json['USER_UNIQUE_ID'] as String,
  subscribeShareManage: json['SUBSCRIBE_SHARE_MANAGE'] as bool,
  workflowShareManage: json['WORKFLOW_SHARE_MANAGE'] as bool,
);

Map<String, dynamic> _$$UserGlobalConfigImplToJson(
  _$UserGlobalConfigImpl instance,
) => <String, dynamic>{
  'SEARCH_SOURCE': instance.searchSource,
  'RECOGNIZE_SOURCE': instance.recognizeSource,
  'AI_RECOMMEND_ENABLED': instance.aiRecommendEnabled,
  'USER_UNIQUE_ID': instance.userUniqueId,
  'SUBSCRIBE_SHARE_MANAGE': instance.subscribeShareManage,
  'WORKFLOW_SHARE_MANAGE': instance.workflowShareManage,
};

_$UserGlobalConfigResponseImpl _$$UserGlobalConfigResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UserGlobalConfigResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String?,
  data: UserGlobalConfig.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserGlobalConfigResponseImplToJson(
  _$UserGlobalConfigResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
