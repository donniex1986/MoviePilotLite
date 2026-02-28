// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      superUser: json['super_user'] as bool?,
      userId: (json['user_id'] as num).toInt(),
      userName: json['user_name'] as String,
      avatar: json['avatar'] as String?,
      level: (json['level'] as num).toInt(),
      permissions: json['permissions'] as Map<String, dynamic>? ?? {},
      wizard: json['wizard'] as bool?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'super_user': instance.superUser,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'avatar': instance.avatar,
      'level': instance.level,
      'permissions': instance.permissions,
      'wizard': instance.wizard,
    };
