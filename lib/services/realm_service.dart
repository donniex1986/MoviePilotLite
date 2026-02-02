import 'package:realm/realm.dart';

import '../modules/login/models/login_profile.dart';

class RealmService {
  RealmService() {
    final config = Configuration.local(
      [LoginProfile.schema],
      schemaVersion: 2, // 增加版本号
      migrationCallback: (migration, oldSchemaVersion) {
        // 处理版本迁移
        if (oldSchemaVersion < 2) {
          // 当从版本1迁移到版本2时，处理avatar字段变为可选的情况
          // Realm会自动处理字段从必填变为可选的情况，不需要特殊操作
        }
      },
    );
    _realm = Realm(config);
  }

  late final Realm _realm;

  Realm get realm => _realm;

  void close() => _realm.close();
}
