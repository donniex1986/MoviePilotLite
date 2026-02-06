import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:realm/realm.dart';

import '../modules/login/models/login_profile.dart';
import '../modules/media_detail/models/media_detail_cache.dart';

class RealmService extends GetxService {
  RealmService() {
    final config = Configuration.local(
      [LoginProfile.schema, MediaDetailCache.schema],
      schemaVersion: 3, // 增加版本号
      migrationCallback: (migration, oldSchemaVersion) {
        // 处理版本迁移
        if (oldSchemaVersion < 2) {
          // 当从版本1迁移到版本2时，处理avatar字段变为可选的情况
          // Realm会自动处理字段从必填变为可选的情况，不需要特殊操作
        }
        if (oldSchemaVersion < 3) {
          // 新增媒体详情缓存表
        }
      },
    );
    _realm = Realm(config);
  }

  late final Realm _realm;

  Realm get realm => _realm;

  // void close() => _realm.close();
}
