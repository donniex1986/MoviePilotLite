import 'package:freezed_annotation/freezed_annotation.dart';

part 'mediaserver_model.freezed.dart';
part 'mediaserver_model.g.dart';

/// 媒体服务器配置模型
@freezed
class MediaServerConfig with _$MediaServerConfig {
  /// 媒体服务器配置模型构造函数
  const factory MediaServerConfig({
    /// 主机地址
    @Default('') String host,
    
    /// 播放地址
    @Default('') String play_host,
    
    /// 用户名
    @Default('') String username,
    
    /// API密钥
    @Default('') String apikey,
  }) = _MediaServerConfig;

  /// 从JSON创建媒体服务器配置模型
  factory MediaServerConfig.fromJson(Map<String, dynamic> json) =>
      _$MediaServerConfigFromJson(json);
}

/// 媒体服务器模型
@freezed
class MediaServer with _$MediaServer {
  /// 媒体服务器模型构造函数
  const factory MediaServer({
    /// 名称
    @Default('') String name,
    
    /// 类型
    @Default('') String type,
    
    /// 是否启用
    @Default(false) bool enabled,
    
    /// 配置
    @Default(MediaServerConfig()) MediaServerConfig config,
    
    /// 同步的库
    @Default([]) List<String> sync_libraries,
  }) = _MediaServer;

  /// 从JSON创建媒体服务器模型
  factory MediaServer.fromJson(Map<String, dynamic> json) =>
      _$MediaServerFromJson(json);
}

/// 媒体服务器响应模型
@freezed
class MediaServerResponse with _$MediaServerResponse {
  /// 媒体服务器响应模型构造函数
  const factory MediaServerResponse({
    /// 是否成功
    @Default(false) bool success,
    
    /// 消息
    String? message,
    
    /// 数据
    @Default({}) Map<String, dynamic> data,
  }) = _MediaServerResponse;

  /// 从JSON创建媒体服务器响应模型
  factory MediaServerResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaServerResponseFromJson(json);
}
