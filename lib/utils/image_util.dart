import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:get/get.dart';

/// 图片工具类
class ImageUtil {
  /// 将内网图片地址转换为可访问的外部地址
  ///
  /// [imageUrl] 内网图片地址，例如：http://192.168.31.173:8096/Items/6100/Images/Primary
  /// [baseUrl] 基础URL，例如：https://xx.x.ddnsto.com
  ///
  /// 返回拼接后的外部访问地址，例如：https://xx.x.ddnsto.com/api/v1/system/img/0?imgurl=http%3A%2F%2F192.168.31.173%3A8096%2FItems%2F6100%2FImages%2FPrimary
  static String convertInternalImageUrl(String imageUrl, {String? baseUrl}) {
    if (imageUrl.isEmpty) return '';
    final apiClient = Get.find<ApiClient>();

    // 如果没有提供baseUrl，则从AppService读取
    baseUrl ??= apiClient.baseUrl ?? '';

    // 编码图片地址
    final encodedImageUrl = Uri.encodeComponent(imageUrl);

    // 拼接外部访问地址
    return '$baseUrl/api/v1/system/img/0?imgurl=$encodedImageUrl';
  }
}
