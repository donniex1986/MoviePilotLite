import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

/// 后台任务模型
@freezed
class ScheduleModel with _$ScheduleModel {
  /// 后台任务模型构造函数
  const factory ScheduleModel({
    /// 任务ID
    @Default('') String id,

    /// 任务名称
    @Default('') String name,

    /// 任务提供者
    @Default('') String provider,

    /// 任务状态
    @Default('') String status,

    /// 下次运行时间
    @Default('') String next_run,
  }) = _ScheduleModel;

  /// 从JSON创建后台任务模型
  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}
