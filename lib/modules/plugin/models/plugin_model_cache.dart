import 'package:realm/realm.dart';

part 'plugin_model_cache.realm.dart';

@RealmModel()
class _PluginModelCache {
  @PrimaryKey()
  late String id;
  late String pluginName;
  late String pluginDesc;
  late String pluginIcon;
  late String pluginVersion;
  late String pluginLabel;
  late String pluginAuthor;
  late String authorUrl;
  late String pluginConfigPrefix;
  late int pluginOrder;
  late int authLevel;
  late bool installed;
  late bool state;
  late bool hasPage;
  late bool hasUpdate;
  late bool isLocal;
  late String repoUrl;
  late int installCount;
  late int addTime;
  late String pluginPublicKey;
}
