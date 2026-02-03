// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardOrderModelImpl _$$DashboardOrderModelImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardOrderModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String?,
  data: DashboardOrderData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DashboardOrderModelImplToJson(
  _$DashboardOrderModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$DashboardOrderDataImpl _$$DashboardOrderDataImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardOrderDataImpl(
  value: (json['value'] as List<dynamic>)
      .map((e) => DashboardOrderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$DashboardOrderDataImplToJson(
  _$DashboardOrderDataImpl instance,
) => <String, dynamic>{'value': instance.value};

_$DashboardOrderItemImpl _$$DashboardOrderItemImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardOrderItemImpl(
  id: json['id'] as String,
  key: json['key'] as String,
);

Map<String, dynamic> _$$DashboardOrderItemImplToJson(
  _$DashboardOrderItemImpl instance,
) => <String, dynamic>{'id': instance.id, 'key': instance.key};
