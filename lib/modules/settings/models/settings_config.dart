import 'package:flutter/material.dart';

/// 设定主分类
class SettingsCategory {
  const SettingsCategory({
    required this.id,
    required this.title,
    required this.icon,
    this.subtitle,
    required this.items,
    this.directRoute,
  });

  final String id;
  final String title;
  final String? subtitle;
  final IconData icon;
  final List<SettingsSubItem> items;
  /// 若非空则主列表点击直接跳转此路由（如「服务」→ /background-task-list）
  final String? directRoute;
}

/// 设定子项（二级列表项）
class SettingsSubItem {
  const SettingsSubItem({
    required this.id,
    required this.title,
    this.subtitle,
    this.route,
  });

  final String id;
  final String title;
  final String? subtitle;
  /// 详情页路由，暂无则占位
  final String? route;
}

/// 主分类 ID 常量
class SettingsCategoryId {
  SettingsCategoryId._();
  static const String system = 'system';
  static const String storage = 'storage';
  static const String site = 'site';
  static const String rule = 'rule';
  static const String search = 'search';
  static const String subscribe = 'subscribe';
  static const String service = 'service';
  static const String notification = 'notification';
}

/// 静态配置：8 个主分类及子项
List<SettingsCategory> get settingsCategories => [
      SettingsCategory(
        id: SettingsCategoryId.system,
        title: '系统',
        subtitle: '基础、下载器、媒体服务器',
        icon: Icons.settings_suggest_outlined,
        items: const [
          SettingsSubItem(id: 'basic', title: '基础', subtitle: '应用、认证、数据库、缓存', route: '/settings/detail'),
          SettingsSubItem(id: 'downloader', title: '下载器', subtitle: '代理、DoH、传输', route: '/settings/detail'),
          SettingsSubItem(id: 'mediaserver', title: '媒体服务器', subtitle: '同步、扩展名、重命名', route: '/settings/detail'),
        ],
      ),
      SettingsCategory(
        id: SettingsCategoryId.storage,
        title: '存储&目录',
        subtitle: '存储、目录、整理&刮削',
        icon: Icons.folder_outlined,
        items: const [
          SettingsSubItem(id: 'storage', title: '存储', route: null),
          SettingsSubItem(id: 'directory', title: '目录', route: null),
          SettingsSubItem(id: 'organize', title: '整理&刮削', route: null),
        ],
      ),
      SettingsCategory(
        id: SettingsCategoryId.site,
        title: '站点',
        subtitle: '站点同步、站点选项、站点重置',
        icon: Icons.public_outlined,
        items: const [
          SettingsSubItem(id: 'sync', title: '站点同步', route: null),
          SettingsSubItem(id: 'options', title: '站点选项', route: null),
          SettingsSubItem(id: 'reset', title: '站点重置', route: null),
        ],
      ),
      SettingsCategory(
        id: SettingsCategoryId.rule,
        title: '规则',
        subtitle: '自定义规则、优先级规则、下载规则',
        icon: Icons.rule_outlined,
        items: const [
          SettingsSubItem(id: 'custom', title: '自定义规则', route: null),
          SettingsSubItem(id: 'priority', title: '优先级规则', route: null),
          SettingsSubItem(id: 'download', title: '下载规则', route: null),
        ],
      ),
      SettingsCategory(
        id: SettingsCategoryId.search,
        title: '搜索&下载',
        subtitle: '基础设置、搜索站点',
        icon: Icons.search,
        items: const [
          SettingsSubItem(id: 'basic', title: '基础设置', route: null),
          SettingsSubItem(id: 'sites', title: '搜索站点', route: null),
        ],
      ),
      SettingsCategory(
        id: SettingsCategoryId.subscribe,
        title: '订阅',
        subtitle: '基础设置、订阅站点',
        icon: Icons.subscriptions_outlined,
        items: const [
          SettingsSubItem(id: 'basic', title: '基础设置', route: null),
          SettingsSubItem(id: 'sites', title: '订阅站点', route: null),
        ],
      ),
      SettingsCategory(
        id: SettingsCategoryId.service,
        title: '服务',
        subtitle: '后台任务列表',
        icon: Icons.list_alt_outlined,
        items: const [],
        directRoute: '/background-task-list',
      ),
      SettingsCategory(
        id: SettingsCategoryId.notification,
        title: '通知',
        subtitle: '通知渠道、通知模块',
        icon: Icons.notifications_outlined,
        items: const [
          SettingsSubItem(id: 'channels', title: '通知渠道', route: null),
          SettingsSubItem(id: 'modules', title: '通知模块', route: null),
        ],
      ),
    ];
