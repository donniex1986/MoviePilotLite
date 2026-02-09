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
import 'modules/network_test/controllers/network_test_controller.dart';
import 'modules/network_test/pages/network_test_page.dart';
import 'modules/system_health/controllers/system_health_controller.dart';
import 'modules/system_health/pages/system_health_page.dart';
import 'modules/cache/controllers/cache_controller.dart';
import 'modules/cache/pages/cache_page.dart';
import 'modules/server_log/controllers/server_log_controller.dart';
import 'modules/server_log/pages/server_log_page.dart';
import 'modules/system_message/controllers/system_message_controller.dart';
import 'modules/system_message/pages/system_message_page.dart';
import 'modules/media_detail/controllers/media_detail_controller.dart';
import 'modules/media_detail/pages/media_detail_page.dart';
import 'modules/search_result/controllers/search_result_controller.dart';
import 'modules/search_result/pages/search_result_page.dart';
import 'modules/subscribe/controllers/subscribe_controller.dart';
import 'modules/subscribe/controllers/subscribe_popular_controller.dart';
import 'modules/subscribe/controllers/subscribe_share_controller.dart';
import 'modules/subscribe/controllers/subscribe_calendar_controller.dart';
import 'modules/subscribe/controllers/subscribe_share_statistics_controller.dart';
import 'modules/subscribe/pages/subscribe_calendar_page.dart';
import 'modules/subscribe/pages/subscribe_page.dart';
import 'modules/subscribe/pages/subscribe_popular_page.dart';
import 'modules/subscribe/pages/subscribe_share_page.dart';
import 'modules/subscribe/pages/subscribe_share_statistics_page.dart';
import 'modules/media_organize/controllers/media_organize_controller.dart';
import 'modules/media_organize/pages/media_organize_page.dart';
import 'modules/plugin/controllers/plugin_controller.dart';
import 'modules/plugin/controllers/plugin_list_controller.dart';
import 'modules/plugin/pages/plugin_page.dart';
import 'modules/plugin/pages/plugin_list_page.dart';
import 'modules/plugin/services/plugin_palette_cache.dart';
import 'modules/dynamic_form/controllers/dynamic_form_controller.dart';
import 'modules/dynamic_form/pages/dynamic_form_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        GetPage(
          name: '/main',
          page: () {
            final args = Get.arguments;
            int? initialIndex;
            if (args is Map && args['initialIndex'] is int) {
              initialIndex = args['initialIndex'] as int;
            }
            return Index(initialIndex: initialIndex);
          },
        ),
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
          name: '/network-test',
          page: () => const NetworkTestPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => NetworkTestController());
          }),
        ),
        GetPage(
          name: '/system-health',
          page: () => const SystemHealthPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SystemHealthController());
          }),
        ),
        GetPage(
          name: '/system-message',
          page: () => const SystemMessagePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SystemMessageController());
          }),
        ),
        GetPage(
          name: '/cache',
          page: () => const CachePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => CacheController());
          }),
        ),
        GetPage(
          name: '/search-result',
          page: () => const SearchResultPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SearchResultController());
          }),
        ),
        GetPage(
          name: '/subscribe-tv',
          page: () => const SubscribePage(),
          binding: BindingsBuilder(() {
            Get.put(SubscribeController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/subscribe-movie',
          page: () => const SubscribePage(),
          binding: BindingsBuilder(() {
            Get.put(SubscribeController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/subscribe-popular',
          page: () => const SubscribePopularPage(),
          binding: BindingsBuilder(() {
            Get.put(SubscribePopularController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/subscribe-share',
          page: () => const SubscribeSharePage(),
          binding: BindingsBuilder(() {
            Get.put(SubscribeShareController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/subscribe-share-statistics',
          page: () => const SubscribeShareStatisticsPage(),
          binding: BindingsBuilder(() {
            Get.put(SubscribeShareStatisticsController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/subscribe-calendar',
          page: () => const SubscribeCalendarPage(),
          binding: BindingsBuilder(() {
            Get.put(SubscribeCalendarController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/media-organize',
          page: () => const MediaOrganizePage(),
          binding: BindingsBuilder(() {
            Get.put(MediaOrganizeController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/plugin',
          page: () => const PluginPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<PluginPaletteCache>(
              () => PluginPaletteCache(),
              fenix: true,
            );
            Get.put(PluginController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/plugin-list',
          page: () => const PluginListPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<PluginPaletteCache>(
              () => PluginPaletteCache(),
              fenix: true,
            );
            Get.put(PluginListController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/media-detail',
          page: () => const MediaDetailPage(),
          binding: BindingsBuilder(() {
            Get.create(() => MediaDetailController());
          }),
        ),
        GetPage(
          name: '/plugin/dynamic-form/page',
          page: () => const DynamicFormPage(),
          binding: BindingsBuilder(() {
            final args = Get.arguments;
            final apiPath = args is Map ? args['apiPath']?.toString() : null;
            final title = args is Map ? args['title']?.toString() : null;
            Get.put(
              DynamicFormController()
                ..init('/api/v1/plugin/page/$apiPath', title: title),
              permanent: false,
            );
          }),
        ),
        GetPage(
          name: '/plugin/dynamic-form/form',
          page: () => const DynamicFormPage(),
          binding: BindingsBuilder(() {
            final args = Get.arguments;
            final apiPath = args is Map ? args['apiPath']?.toString() : null;
            final title = args is Map ? args['title']?.toString() : null;
            Get.put(
              DynamicFormController()
                ..init('/api/v1/plugin/form/$apiPath', title: title)
                ..apiSavePath = '/api/v1/plugin/$apiPath',
              permanent: false,
            );
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
