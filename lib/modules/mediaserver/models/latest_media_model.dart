import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_media_model.freezed.dart';
part 'latest_media_model.g.dart';

/// 最新添加媒体模型
@freezed
class LatestMedia with _$LatestMedia {
  /// 媒体服务器配置模型构造函数
  const factory LatestMedia({
    /// 媒体ID
    @Default('') String id,

    /// 媒体标题
    @Default('') String title,

    /// 媒体副标题
    @Default('') String subtitle,

    /// 媒体类型
    @Default('') String type,

    /// 媒体封面
    @Default('') String image,

    /// 媒体链接
    @Default('') String link,

    /// 百分比
    double? percent,

    /// 背景图片标签
    @Default([])
    @JsonKey(name: 'BackdropImageTags')
    List<String> backdropImageTags,

    /// 服务器类型
    @Default('') @JsonKey(name: 'server_type') String serverType,

    /// 是否使用cookie
    @JsonKey(name: 'use_cookies') bool? useCookies,

    /// 媒体库名称
    @Default('') String libraryName,
  }) = _LatestMedia;

  /// 从JSON创建媒体服务器配置模型
  factory LatestMedia.fromJson(Map<String, dynamic> json) =>
      _$LatestMediaFromJson(json);
}

/// 最新媒体响应模型
@freezed
class LatestMediaResponse with _$LatestMediaResponse {
  /// 媒体服务器响应模型构造函数
  const factory LatestMediaResponse({
    /// 是否成功
    @Default(false) bool success,

    /// 消息
    String? message,

    /// 数据
    @Default([]) List<LatestMedia> data,
  }) = _LatestMediaResponse;

  /// 从JSON创建媒体服务器响应模型
  factory LatestMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestMediaResponseFromJson(json);
}
