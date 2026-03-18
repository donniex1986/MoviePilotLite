import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppSettingController extends GetxController {
  final themeMode = ThemeMode.system.obs;
  final primaryColor = Color(0xFF007AFF).obs;
  final service = Get.find<AppService>();
  final version = '1.0.0'.obs;
  final showSearchButton = true.obs;
  final enableDownloaderManager = false.obs;
  final useExternalBrowser = false.obs;
  @override
  void onInit() {
    super.onInit();
    themeMode.value = service.themeMode.value;
    primaryColor.value = service.primaryColor.value;
    showSearchButton.value = service.showSearchButton.value;
    enableDownloaderManager.value = service.enableDownloaderManager.value;
    useExternalBrowser.value = service.useExternalBrowser.value;
    loadAppVersion();
  }

  void updateThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    service.updateThemeMode(mode);
  }

  void updatePrimaryColor(Color color) {
    primaryColor.value = color;
    service.updatePrimaryColor(color);
  }

  void updateShowSearchButton(bool value) {
    showSearchButton.value = value;
    service.updateShowSearchButton(value);
  }

  void updateEnableDownloaderManager(bool value) {
    enableDownloaderManager.value = value;
    service.updateEnableDownloaderManager(value);
  }

  void updateUseExternalBrowser(bool value) {
    useExternalBrowser.value = value;
    service.updateUseExternalBrowser(value);
  }

  loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version.value = '${packageInfo.version}+${packageInfo.buildNumber}';
  }
}
