import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/services/app_service.dart';

class AppSettingController extends GetxController {
  final themeMode = ThemeMode.system.obs;
  final primaryColor = Color(0xFF007AFF).obs;
  final service = Get.find<AppService>();

  @override
  void onInit() {
    super.onInit();
    themeMode.value = service.themeMode.value;
    primaryColor.value = service.primaryColor.value;
  }

  void updateThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    service.updateThemeMode(mode);
  }

  void updatePrimaryColor(Color color) {
    primaryColor.value = color;
    service.updatePrimaryColor(color);
  }
}
