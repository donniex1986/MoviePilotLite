// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardConfigModelImpl _$$DashboardConfigModelImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardConfigModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String?,
  data: DashboardConfigData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DashboardConfigModelImplToJson(
  _$DashboardConfigModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$DashboardConfigDataImpl _$$DashboardConfigDataImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardConfigDataImpl(
  value: DashboardConfigValue.fromJson(json['value'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DashboardConfigDataImplToJson(
  _$DashboardConfigDataImpl instance,
) => <String, dynamic>{'value': instance.value};

_$DashboardConfigValueImpl _$$DashboardConfigValueImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardConfigValueImpl(
  mediaStatistic: json['mediaStatistic'] as bool,
  scheduler: json['scheduler'] as bool,
  speed: json['speed'] as bool,
  storage: json['storage'] as bool,
  weeklyOverview: json['weeklyOverview'] as bool,
  cpu: json['cpu'] as bool,
  memory: json['memory'] as bool,
  network: json['network'] as bool,
  library: json['library'] as bool,
  playing: json['playing'] as bool,
  latest: json['latest'] as bool,
);

Map<String, dynamic> _$$DashboardConfigValueImplToJson(
  _$DashboardConfigValueImpl instance,
) => <String, dynamic>{
  'mediaStatistic': instance.mediaStatistic,
  'scheduler': instance.scheduler,
  'speed': instance.speed,
  'storage': instance.storage,
  'weeklyOverview': instance.weeklyOverview,
  'cpu': instance.cpu,
  'memory': instance.memory,
  'network': instance.network,
  'library': instance.library,
  'playing': instance.playing,
  'latest': instance.latest,
};
