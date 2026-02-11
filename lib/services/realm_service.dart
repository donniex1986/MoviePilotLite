import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:moviepilot_mobile/modules/plugin/models/installed_plugin_model_cache.dart';
import 'package:moviepilot_mobile/modules/plugin/models/plugin_model_cache.dart';
import 'package:moviepilot_mobile/modules/site/models/site_icon_cache.dart';
import 'package:moviepilot_mobile/modules/site/models/site_model_cache.dart';
import 'package:moviepilot_mobile/modules/site/models/site_userdata_cache.dart';
import 'package:realm/realm.dart';

import '../modules/login/models/login_profile.dart';
import '../modules/media_detail/models/media_detail_cache.dart';
import '../modules/search/models/search_history.dart';

class RealmService extends GetxService {
  RealmService() {
    final config = Configuration.local(
      [
        LoginProfile.schema,
        MediaDetailCache.schema,
        PluginModelCache.schema,
        InstalledPluginModelCache.schema,
        SiteIconCache.schema,
        SiteModelCache.schema,
        SiteUserDataCache.schema,
        SearchHistoryEntry.schema,
      ],
      schemaVersion: 5, // 新增搜索历史缓存
      migrationCallback: (migration, oldSchemaVersion) {
        if (oldSchemaVersion < 2) {}
        if (oldSchemaVersion < 3) {}
        if (oldSchemaVersion < 4) {
          // 新增站点相关缓存表
        }
        if (oldSchemaVersion < 5) {
          // 新增本地搜索历史
        }
      },
    );
    _realm = Realm(config);
  }

  late final Realm _realm;

  Realm get realm => _realm;

  // void close() => _realm.close();
}
