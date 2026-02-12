import 'package:get/get.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/services/app_service.dart';

import '../modules/login/controllers/login_controller.dart';
import '../modules/login/repositories/auth_repository.dart';
import '../modules/media_detail/controllers/media_detail_service.dart';
import '../services/realm_service.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppLog(), permanent: true);
    Get.put(AppService(), permanent: true);
    Get.put(RealmService(), permanent: true);
    Get.put(AuthRepository(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(MediaDetailService(), permanent: true);
    UmengCommonSdk.initCommon(
      '698d341f6f259537c758f6b4',
      '698d35d26f259537c758f839',
      'default',
    );
  }
}
