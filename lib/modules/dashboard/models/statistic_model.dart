import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistic_model.freezed.dart';
part 'statistic_model.g.dart';

/// 媒体统计数据模型
@freezed
class StatisticModel with _$StatisticModel {
  /// 媒体统计数据模型构造函数
  const factory StatisticModel({
    /// 电影数量
    @Default(0) int movie_count,

    /// 剧集数量
    @Default(0) int tv_count,

    /// 集数
    @Default(0) int episode_count,

    /// 用户数量
    @Default(0) int user_count,
  }) = _StatisticModel;

  /// 从JSON创建媒体统计数据模型
  factory StatisticModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticModelFromJson(json);
}
