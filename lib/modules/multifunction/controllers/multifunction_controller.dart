import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/multifunction/models/multifunction_config.dart';
import 'package:moviepilot_mobile/modules/multifunction/models/multifunction_models.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class MultifunctionController extends GetxController {
  List<MultifunctionSection> get sections => multifunctionSections;

  void handleTap(MultifunctionItem item) {
    ToastUtil.info('${item.title} 暂未开放');
  }
}
