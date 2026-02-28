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
    @JsonKey(fromJson: _stringFromJson) String? path,

    /// 库类型
    @Default('') String type,

    /// 库图片
    String? image,

    /// 库图片列表
    @JsonKey(fromJson: _stringListFromJson) List<String>? image_list,

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

List<String> _stringListFromJson(Object? value) {
  if (value is List) {
    return value
        .map((item) => _stringFromJson(item))
        .whereType<String>()
        .toList();
  }
  return const [];
}

String? _stringFromJson(Object? value) {
  if (value == null) return null;
  if (value is String) return value;
  return value.toString();
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
