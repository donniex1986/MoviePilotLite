import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/multifunction/models/multifunction_config.dart';
import 'package:moviepilot_mobile/modules/multifunction/models/multifunction_models.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class MultifunctionController extends GetxController {
  List<MultifunctionSection> get sections => multifunctionSections;
  final _appService = Get.find<AppService>();

  void handleTap(MultifunctionItem item) {
    String? route = item.route;
    if (route == '/downloader' && _appService.enableDownloaderManager.value) {
      route = '/downloader-config';
    }
    if (route != null && route.isNotEmpty) {
      Get.toNamed(route);
      return;
    }
    ToastUtil.info('${item.title} 暂未开放');
  }
}
