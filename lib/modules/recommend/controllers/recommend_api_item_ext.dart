import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/utils/http_path_builder_util.dart';

extension RecommendApiItemExt on RecommendApiItem {
  String get mediaKey => HttpPathBuilderUtil.buildMediaPath(this);
  String get subscribeKey =>
      '$mediaKey${season != null ? ':$season' : ''}${title != null ? ':$title' : ''}';
}
