import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_order_model.freezed.dart';
part 'dashboard_order_model.g.dart';

@freezed
class DashboardOrderModel with _$DashboardOrderModel {
  const factory DashboardOrderModel({
    required bool success,
    String? message,
    required DashboardOrderData data,
  }) = _DashboardOrderModel;

  factory DashboardOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardOrderModelFromJson(json);
}

@freezed
class DashboardOrderData with _$DashboardOrderData {
  const factory DashboardOrderData({
    required List<DashboardOrderItem> value,
  }) = _DashboardOrderData;

  factory DashboardOrderData.fromJson(Map<String, dynamic> json) =>
      _$DashboardOrderDataFromJson(json);
}

@freezed
class DashboardOrderItem with _$DashboardOrderItem {
  const factory DashboardOrderItem({
    required String id,
    required String key,
  }) = _DashboardOrderItem;

  factory DashboardOrderItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardOrderItemFromJson(json);
}
