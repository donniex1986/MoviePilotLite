import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:liquid_tabbar_minimize/liquid_tabbar_minimize.dart';
import 'package:moviepilot_mobile/applog/app_log.dart';
import 'package:moviepilot_mobile/modules/index.dart';
import 'package:moviepilot_mobile/modules/media_detail/controllers/media_detail_service.dart';
import 'package:moviepilot_mobile/modules/search/controllers/media_search_list_controller.dart';
import 'package:moviepilot_mobile/modules/search/controllers/search_controller.dart';
import 'package:moviepilot_mobile/modules/search/pages/media_search_list_page.dart';
import 'package:moviepilot_mobile/modules/search/pages/search_media_result_page.dart';
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
import 'modules/download/controllers/download_controller.dart';
import 'modules/downloader/controllers/downloader_controller.dart';
import 'modules/downloader/controllers/downloader_config_controller.dart';
import 'modules/downloader/pages/downloader_config_list_page.dart';
import 'modules/downloader/pages/downloader_config_page.dart';
import 'modules/downloader/pages/downloader_page.dart';
import 'modules/mediaserver/controllers/mediaserver_controller.dart';
import 'modules/mediaserver/pages/mediaserver_config_list_page.dart';
import 'modules/plugin/controllers/plugin_controller.dart';
import 'modules/plugin/controllers/plugin_list_controller.dart';
import 'modules/plugin/pages/plugin_page.dart';
import 'modules/plugin/pages/plugin_list_page.dart';
import 'modules/plugin/services/plugin_palette_cache.dart';
import 'modules/dynamic_form/controllers/dynamic_form_controller.dart';
import 'modules/dynamic_form/pages/dynamic_form_page.dart';
import 'modules/site/controllers/site_controller.dart';
import 'modules/site/controllers/site_detail_controller.dart';
import 'modules/site/controllers/site_resource_controller.dart';
import 'modules/site/pages/site_page.dart';
import 'modules/site/pages/site_detail_page.dart';
import 'modules/site/pages/site_resource_page.dart';
import 'modules/user_management/controllers/user_management_controller.dart';
import 'modules/user_management/pages/user_management_page.dart';
import 'modules/settings/controllers/settings_controller.dart';
import 'modules/settings/controllers/settings_sub_list_controller.dart';
import 'modules/settings/pages/settings_page.dart';
import 'modules/settings/pages/settings_sub_list_page.dart';
import 'modules/settings/pages/settings_detail_placeholder_page.dart';
import 'modules/settings/controllers/settings_advanced_detail_controller.dart';
import 'modules/settings/controllers/settings_basic_controller.dart';
import 'modules/settings/pages/settings_advanced_detail_page.dart';
import 'modules/settings/pages/settings_basic_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppLog());
  Get.put(AppService());
  Get.put(RealmService());
  Get.put(ApiClient());
  Get.put(MediaDetailService());
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
          name: '/search-media-result',
          page: () => const SearchMediaResultPage(),
          binding: BindingsBuilder(() {
            final args = Get.parameters;
            Get.lazyPut(() {
              final c = SearchMediaController();
              c.searchType = switch (args['type'] ?? 'title') {
                'media' => SearchType.media,
                'title' => SearchType.title,
                _ => SearchType.title,
              };
              c.mediaSearchKey = args['mediaSearchKey'] ?? '';
              c.area = args['area'] ?? 'title';
              c.sites = (args['sites'] ?? '')
                  .split(',')
                  .where((s) => s.trim().isNotEmpty)
                  .map(int.tryParse)
                  .whereType<int>()
                  .toList();
              c.year = args['year'] ?? '';
              c.season = args['season'];
              c.mtype = args['mtype'] ?? 'movie';
              c.searchText.value = args['title'] ?? '';
              return c;
            });
          }),
        ),
        GetPage(
          name: '/media-search-list',
          page: () => const MediaSearchListPage(),
          binding: BindingsBuilder(() {
            final args = Get.arguments;
            final params = Get.parameters;
            String? keyword;
            if (args is Map && args['keyword'] != null) {
              keyword = args['keyword']?.toString();
            } else if (params.containsKey('keyword')) {
              keyword = params['keyword'];
            }
            String? type = params['type'] ?? args['type'];
            Get.put(
              MediaSearchListController(
                initialKeyword: keyword,
                initialType: type,
              ),
            );
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
            final keyword = Get.parameters['keyword'];
            Get.put(
              SubscribeShareController()..keyword.value = keyword ?? '',
              permanent: false,
            );
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
            final keyword = Get.parameters['keyword'];
            Get.put(
              MediaOrganizeController()..searchController.text = keyword ?? '',
              permanent: false,
            );
          }),
        ),
        GetPage(
          name: '/downloader',
          page: () => const DownloaderPage(),
          binding: BindingsBuilder(() {
            Get.put(DownloaderController(), permanent: false);
          }),
        ),
        GetPage(
          name: '/downloader-config',
          page: () => const DownloaderConfigListPage(),
          binding: BindingsBuilder(() {
            if (!Get.isRegistered<DownloadController>()) {
              Get.put(DownloadController(), permanent: true);
            }
          }),
        ),
        GetPage(
          name: '/downloader-config/form',
          page: () => const DownloaderConfigPage(),
          binding: BindingsBuilder(() {
            if (!Get.isRegistered<DownloaderConfigController>()) {
              Get.put(DownloaderConfigController(), permanent: false);
            }
          }),
        ),
        GetPage(
          name: '/mediaserver-config',
          page: () => const MediaServerConfigListPage(),
          binding: BindingsBuilder(() {
            if (!Get.isRegistered<MediaServerController>()) {
              Get.put(MediaServerController(), permanent: true);
            }
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
          name: '/plugin/dynamic-form/log',
          page: () => const ServerLogPage(),
          binding: BindingsBuilder(() {
            final id = Get.arguments['id']?.toString() ?? '';
            final title = Get.arguments['title']?.toString() ?? '';
            final file = id.isEmpty
                ? 'moviepilot.log'
                : 'plugins/${id.toLowerCase()}.log';
            Get.lazyPut(
              () => ServerLogController()
                ..logFile = file
                ..title = title,
            );
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
          name: '/site',
          page: () => const SitePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SiteController());
          }),
        ),
        GetPage(
          name: '/site-resource',
          page: () => const SiteResourcePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SiteResourceController());
          }),
        ),
        GetPage(
          name: '/site-detail',
          page: () => const SiteDetailPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SiteDetailController());
          }),
        ),
        GetPage(
          name: '/user-management',
          page: () => const UserManagementPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => UserManagementController());
          }),
        ),
        GetPage(
          name: '/settings',
          page: () => const SettingsPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SettingsController());
          }),
        ),
        GetPage(
          name: '/settings/:category',
          page: () => const SettingsSubListPage(),
          binding: BindingsBuilder(() {
            final category = Get.parameters['category'] ?? '';
            final args = Get.arguments as Map<String, dynamic>?;
            final title = args?['title'] as String? ?? category;
            Get.lazyPut(() => SettingsSubListController(
                  categoryId: category,
                  pageTitle: title,
                ));
          }),
        ),
        GetPage(
          name: '/settings/detail',
          page: () => const SettingsDetailPlaceholderPage(),
        ),
        GetPage(
          name: '/settings/system/basic',
          page: () => const SettingsBasicPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SettingsBasicController());
          }),
        ),
        GetPage(
          name: '/settings/advanced/detail',
          page: () => const SettingsAdvancedDetailPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => SettingsAdvancedDetailController());
          }),
        ),
        GetPage(
          name: '/plugin/dynamic-form/page',
          page: () => const DynamicFormPage(controllerTag: 'page'),
          binding: BindingsBuilder(() {
            final args = Get.arguments;
            final id = args is Map ? args['id']?.toString() : null;
            final title = args is Map ? args['title']?.toString() : null;
            Get.lazyPut(
              () => DynamicFormController()
                ..init(
                  '/api/v1/plugin/page/$id',
                  title: title,
                  formMode: false,
                  pluginId: id,
                ),
              tag: 'page',
            );
          }),
        ),
        GetPage(
          name: '/plugin/dynamic-form/form',
          page: () => const DynamicFormPage(controllerTag: 'form'),
          binding: BindingsBuilder(() {
            final args = Get.arguments;
            final id = args is Map ? args['id']?.toString() : null;
            final title = args is Map ? args['title']?.toString() : null;
            Get.lazyPut(
              () => DynamicFormController()
                ..init(
                  '/api/v1/plugin/form/$id',
                  title: title,
                  formMode: true,
                  pluginId: id,
                )
                ..apiSavePath = '/api/v1/plugin/$id',
              tag: 'form',
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
