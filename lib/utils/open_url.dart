import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:url_launcher/url_launcher.dart';

class WebUtil {
  /// 打开链接
  static Future<void> open({String? url}) async {
    final raw = url?.trim() ?? '';
    if (raw.isEmpty) {
      ToastUtil.error('链接不能为空');
      return;
    }
    Uri uri;
    try {
      uri = Uri.parse(raw);
    } catch (_) {
      ToastUtil.error('无法解析链接: $raw');
      return;
    }
    if (uri.scheme.isEmpty) {
      uri = Uri.parse('https://$raw');
    }
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ToastUtil.error('无法打开链接: ${uri.toString()}');
    }
  }
}
