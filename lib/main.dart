import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_tabbar_minimize/liquid_tabbar_minimize.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/index.dart';
import 'package:moviepilot_mobile/services/api_client.dart';
import 'package:moviepilot_mobile/services/app_service.dart';
import 'package:moviepilot_mobile/services/realm_service.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'bindings/app_binding.dart';
import 'modules/dashboard/controllers/dashboard_controller.dart';
import 'modules/dashboard/pages/dashboard_page.dart';
import 'modules/dashboard/pages/background_task_list_page.dart';
import 'modules/login/pages/login_page.dart';
import 'theme/app_theme.dart';
import 'modules/profile/controllers/profile_controller.dart';
import 'modules/profile/pages/profile_page.dart';
import 'modules/server_log/controllers/server_log_controller.dart';
import 'modules/server_log/pages/server_log_page.dart';
import 'modules/system_message/controllers/system_message_controller.dart';
import 'modules/system_message/pages/system_message_page.dart';

void main() {
  Get.put(AppLog());
  Get.put(AppService());
  Get.put(RealmService());
  Get.put(ApiClient());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取Talker实例
    final talker = Get.find<AppLog>();

    // 创建Talker路由观察器
    final routeObserver = TalkerRouteObserver(talker.talker);

    return GetMaterialApp(
      title: 'MoviePilot',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: AppBinding(),
      initialRoute: '/login',
      navigatorObservers: [
        LiquidRouteObserver.instance, // required for instant hide
        // 添加Talker路由观察器
        routeObserver,
      ],
      getPages: [
        GetPage(name: '/main', page: () => const Index()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(
          name: '/dashboard',
          page: () => const DashboardPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => DashboardController());
          }),
        ),
        GetPage(
          name: '/background-task-list',
          page: () => const BackgroundTaskListPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => DashboardController());
          }),
        ),
        GetPage(
          name: '/profile',
          page: () => const ProfilePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => ProfileController());
          }),
        ),
        GetPage(
          name: '/server-log',
          page: () => const ServerLogPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => ServerLogController());
          }),
        ),
        GetPage(
          name: '/system-message',
          page: () => const SystemMessagePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SystemMessageController());
          }),
        ),
      ],
      // 配置错误处理
      builder: (context, child) {
        return TalkerWrapper(talker: talker.talker, child: child!);
      },
    );
  }
}
