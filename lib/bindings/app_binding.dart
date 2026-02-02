import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../modules/login/controllers/login_controller.dart';
import '../modules/login/repositories/auth_repository.dart';
import '../services/realm_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RealmService(), permanent: true);
    Get.put(
      AuthRepository(Get.find<RealmService>(), Get.find<Talker>()),
      permanent: true,
    );
    Get.put(LoginController(Get.find<AuthRepository>(), Get.find<Talker>()), permanent: true);
  }
}
