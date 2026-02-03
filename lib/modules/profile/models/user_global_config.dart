import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_global_config.freezed.dart';
part 'user_global_config.g.dart';

@freezed
class UserGlobalConfig with _$UserGlobalConfig {
  const factory UserGlobalConfig({
    @JsonKey(name: 'SEARCH_SOURCE') required String searchSource,
    @JsonKey(name: 'RECOGNIZE_SOURCE') required String recognizeSource,
    @JsonKey(name: 'AI_RECOMMEND_ENABLED') required bool aiRecommendEnabled,
    @JsonKey(name: 'USER_UNIQUE_ID') required String userUniqueId,
    @JsonKey(name: 'SUBSCRIBE_SHARE_MANAGE')
    required bool subscribeShareManage,
    @JsonKey(name: 'WORKFLOW_SHARE_MANAGE')
    required bool workflowShareManage,
  }) = _UserGlobalConfig;

  factory UserGlobalConfig.fromJson(Map<String, dynamic> json) =>
      _$UserGlobalConfigFromJson(json);
}

@freezed
class UserGlobalConfigResponse with _$UserGlobalConfigResponse {
  const factory UserGlobalConfigResponse({
    required bool success,
    String? message,
    required UserGlobalConfig data,
  }) = _UserGlobalConfigResponse;

  factory UserGlobalConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$UserGlobalConfigResponseFromJson(json);
}

