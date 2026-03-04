import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/gen/assets.gen.dart';

class FileStorageUtils {
  /// 存储 type -> 图标资源映射
  static Widget storageIconWidget(String type, {double size = 24}) {
    final m = Assets.images.misc;
    switch (type.toLowerCase()) {
      case 'alist':
        return m.alist.svg(width: size, height: size);
      case 'openlist':
        return m.openlist.svg(width: size, height: size);
      case 'alipan':
        return m.alipan.image(width: size, height: size, fit: BoxFit.contain);
      case 'u115':
        return m.u115.image(width: size, height: size, fit: BoxFit.contain);
      case 'smb':
        return m.smb.image(width: size, height: size, fit: BoxFit.contain);
      case 'rclone':
        return m.rclone.image(width: size, height: size, fit: BoxFit.contain);
      case 'plex':
        return m.plex.image(width: size, height: size, fit: BoxFit.contain);
      case 'emby':
        return m.emby.image(width: size, height: size, fit: BoxFit.contain);
      case 'jellyfin':
        return m.jellyfin.image(width: size, height: size, fit: BoxFit.contain);
      case 'local':
      default:
        return m.storage.image(width: size, height: size, fit: BoxFit.contain);
    }
  }
}
