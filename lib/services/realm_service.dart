import 'package:realm/realm.dart';

import '../modules/login/models/login_profile.dart';

class RealmService {
  RealmService() {
    final config = Configuration.local([LoginProfile.schema]);
    _realm = Realm(config);
  }

  late final Realm _realm;

  Realm get realm => _realm;

  void close() => _realm.close();
}
