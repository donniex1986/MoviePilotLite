import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'bindings/app_binding.dart';
import 'modules/dashboard/controllers/dashboard_controller.dart';
import 'modules/dashboard/pages/dashboard_page.dart';
import 'modules/dashboard/pages/background_task_list_page.dart';
import 'modules/login/pages/login_page.dart';
import 'theme/app_theme.dart';

void main() {
  // 确保在运行应用之前初始化所有依赖
  Get.put(
    Talker(
      settings: TalkerSettings(
        useConsoleLogs: true,
        useHistory: true,
        maxHistoryItems: 100,
      ),
    ),
    permanent: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取Talker实例
    final talker = Get.find<Talker>();

    // 创建Talker路由观察器
    final routeObserver = TalkerRouteObserver(talker);

    return GetCupertinoApp(
      title: 'MoviePilot',
      theme: AppTheme.cupertinoTheme,
      initialBinding: AppBinding(),
      initialRoute: '/login',
      navigatorObservers: [
        // 添加Talker路由观察器
        routeObserver,
      ],
      getPages: [
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
      ],
      // 配置错误处理
      builder: (context, child) {
        return TalkerWrapper(talker: talker, child: child!);
      },
    );
  }
}
