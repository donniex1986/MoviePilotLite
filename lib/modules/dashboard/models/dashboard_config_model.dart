import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_config_model.freezed.dart';
part 'dashboard_config_model.g.dart';

@freezed
class DashboardConfigModel with _$DashboardConfigModel {
  const factory DashboardConfigModel({
    required bool success,
    String? message,
    required DashboardConfigData data,
  }) = _DashboardConfigModel;

  factory DashboardConfigModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardConfigModelFromJson(json);
}

@freezed
class DashboardConfigData with _$DashboardConfigData {
  const factory DashboardConfigData({
    required DashboardConfigValue value,
  }) = _DashboardConfigData;

  factory DashboardConfigData.fromJson(Map<String, dynamic> json) =>
      _$DashboardConfigDataFromJson(json);
}

@freezed
class DashboardConfigValue with _$DashboardConfigValue {
  const factory DashboardConfigValue({
    @JsonKey(name: 'mediaStatistic') required bool mediaStatistic,
    @JsonKey(name: 'scheduler') required bool scheduler,
    @JsonKey(name: 'speed') required bool speed,
    @JsonKey(name: 'storage') required bool storage,
    @JsonKey(name: 'weeklyOverview') required bool weeklyOverview,
    @JsonKey(name: 'cpu') required bool cpu,
    @JsonKey(name: 'memory') required bool memory,
    @JsonKey(name: 'network') required bool network,
    @JsonKey(name: 'library') required bool library,
    @JsonKey(name: 'playing') required bool playing,
    @JsonKey(name: 'latest') required bool latest,
  }) = _DashboardConfigValue;

  factory DashboardConfigValue.fromJson(Map<String, dynamic> json) =>
      _$DashboardConfigValueFromJson(json);
}
