// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_submit_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscribeSubmitRespImpl _$$SubscribeSubmitRespImplFromJson(
  Map<String, dynamic> json,
) => _$SubscribeSubmitRespImpl(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : SubscribeSubmitData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SubscribeSubmitRespImplToJson(
  _$SubscribeSubmitRespImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$SubscribeSubmitDataImpl _$$SubscribeSubmitDataImplFromJson(
  Map<String, dynamic> json,
) => _$SubscribeSubmitDataImpl(id: _intFromJson(json['id']));

Map<String, dynamic> _$$SubscribeSubmitDataImplToJson(
  _$SubscribeSubmitDataImpl instance,
) => <String, dynamic>{'id': instance.id};
