import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/multifunction/models/multifunction_config.dart';
import 'package:moviepilot_mobile/modules/multifunction/models/multifunction_models.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class MultifunctionController extends GetxController {
  List<MultifunctionSection> get sections => multifunctionSections;

  void handleTap(MultifunctionItem item) {
    final route = item.route;
    if (route != null && route.isNotEmpty) {
      Get.toNamed(route);
      return;
    }
    ToastUtil.info('${item.title} 暂未开放');
  }
}
