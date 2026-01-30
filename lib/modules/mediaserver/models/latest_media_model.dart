import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_media_model.freezed.dart';
part 'latest_media_model.g.dart';

/// 最新媒体模型
@freezed
class LatestMedia with _$LatestMedia {
  /// 最新媒体模型构造函数
  const factory LatestMedia({
    /// 媒体ID
    @Default('') String id,
    
    /// 媒体标题
    @Default('') String title,
    
    /// 媒体类型
    @Default('') String type,
    
    /// 媒体海报
    @Default('') String poster,
    
    /// 媒体简介
    @Default('') String overview,
    
    /// 媒体上映日期
    @Default('') String release_date,
    
    /// 媒体评分
    @Default(0.0) double vote_average,
    
    /// 媒体入库时间
    @Default('') String added_date,
  }) = _LatestMedia;

  /// 从JSON创建最新媒体模型
  factory LatestMedia.fromJson(Map<String, dynamic> json) =>
      _$LatestMediaFromJson(json);
}

/// 最新媒体响应模型
@freezed
class LatestMediaResponse with _$LatestMediaResponse {
  /// 最新媒体响应模型构造函数
  const factory LatestMediaResponse({
    /// 是否成功
    @Default(false) bool success,
    
    /// 消息
    String? message,
    
    /// 数据
    @Default([]) List<LatestMedia> data,
  }) = _LatestMediaResponse;

  /// 从JSON创建最新媒体响应模型
  factory LatestMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestMediaResponseFromJson(json);
}
