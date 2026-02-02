import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_model.freezed.dart';
part 'library_model.g.dart';

/// 媒体库模型
@freezed
class MediaLibrary with _$MediaLibrary {
  /// 媒体库模型构造函数
  const factory MediaLibrary({
    /// 服务器类型
    @Default('') String server,
    
    /// 库ID
    @Default('') String id,
    
    /// 库名称
    @Default('') String name,
    
    /// 库路径
    String? path,
    
    /// 库类型
    @Default('') String type,
    
    /// 库图片
    String? image,
    
    /// 库图片列表
    List<String>? image_list,
    
    /// 库链接
    String? link,
    
    /// 服务器类型
    @Default('') String server_type,
    
    /// 是否使用 cookies
    bool? use_cookies,
  }) = _MediaLibrary;

  /// 从JSON创建媒体库模型
  factory MediaLibrary.fromJson(Map<String, dynamic> json) =>
      _$MediaLibraryFromJson(json);
}

/// 媒体库响应模型
@freezed
class MediaLibraryResponse with _$MediaLibraryResponse {
  /// 媒体库响应模型构造函数
  const factory MediaLibraryResponse({
    /// 是否成功
    @Default(false) bool success,
    
    /// 消息
    String? message,
    
    /// 数据
    @Default([]) List<MediaLibrary> data,
  }) = _MediaLibraryResponse;

  /// 从JSON创建媒体库响应模型
  factory MediaLibraryResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaLibraryResponseFromJson(json);
}
