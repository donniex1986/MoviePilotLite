import 'package:moviepilot_mobile/utils/toast_util.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:url_launcher/url_launcher.dart';

class WebUtil {
  /// 打开链接
  static Future<void> open({
    String? url,
    String? cookie,
    bool? internal,
  }) async {
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
    final useExternal = Get.find<AppService>().useExternalBrowser.value;
    final openInternally = internal ?? !useExternal;
    if (openInternally) {
      Get.toNamed(
        '/web-view',
        parameters: {'url': uri.toString(), 'cookie': cookie ?? ''},
      );
      return;
    }

    if (!await canLaunchUrl(uri)) {
      ToastUtil.error('无法打开链接: ${uri.toString()}');
      return;
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
