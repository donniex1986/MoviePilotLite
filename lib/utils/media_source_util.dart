import 'package:moviepilot_mobile/gen/assets.gen.dart';

class MediaSourceUtil {
  static AssetGenImage? imageForSource(String source) {
    switch (source) {
      case 'tmdb':
      case 'themoviedb':
      case 'thetvdb':
        return Assets.images.logos.tmdb;
      case 'douban':
        return Assets.images.logos.doubanBlack;
      case 'bangumi':
        return Assets.images.logos.bangumi;
    }
    return null;
  }
}
