import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/settings/models/settings_config.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class SettingsAdvancedListController extends GetxController {
  List<SettingsSubItem> get items => advancedSettingsSubItems;

  void onItemTap(SettingsSubItem item) {
    if (item.route != null && item.route!.isNotEmpty) {
      Get.toNamed(item.route!, arguments: {'title': item.title, 'categoryId': 'advanced', 'subId': item.id});
      return;
    }
    ToastUtil.info('${item.title} 详情页待接入');
  }
}
