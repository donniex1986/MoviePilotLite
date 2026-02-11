import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscribe_submit_resp.freezed.dart';
part 'subscribe_submit_resp.g.dart';

/// 订阅项（用户订阅列表、热门订阅等）
@freezed
class SubscribeSubmitResp with _$SubscribeSubmitResp {
  const factory SubscribeSubmitResp({
    bool? success,
    String? message,
    SubscribeSubmitData? data,
  }) = _SubscribeSubmitResp;

  factory SubscribeSubmitResp.fromJson(Map<String, dynamic> json) =>
      _$SubscribeSubmitRespFromJson(json);
}

@freezed
class SubscribeSubmitData with _$SubscribeSubmitData {
  const factory SubscribeSubmitData({
    @JsonKey(fromJson: _intFromJson) int? id,
  }) = _SubscribeSubmitData;

  factory SubscribeSubmitData.fromJson(Map<String, dynamic> json) =>
      _$SubscribeSubmitDataFromJson(json);
}

int _intFromJson(Object? value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}
