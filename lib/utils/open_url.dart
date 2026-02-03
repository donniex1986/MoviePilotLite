import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:url_launcher/url_launcher.dart';

class WebUtil {
  /// 打开链接
  static Future<void> open({String? url}) async {
    if (url == null || url.isEmpty) ToastUtil.error('链接不能为空');
    if (url != null && !url.startsWith('http')) url = 'https://$url';
    final uri = Uri.parse(url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ToastUtil.error('无法打开链接: $url');
    }
  }
}
