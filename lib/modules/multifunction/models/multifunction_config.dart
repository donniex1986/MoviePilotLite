import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/multifunction/models/multifunction_models.dart';

const List<MultifunctionSection> multifunctionSections = [
  MultifunctionSection(
    title: '开始',
    items: [
      MultifunctionItem(
        title: '搜索结果',
        subtitle: '全库快速定位',
        icon: Icons.search,
        accent: Color(0xFF6D5DF6),
        style: MultifunctionCardStyle.hero,
        meta: '近期高频',
      ),
    ],
  ),
  MultifunctionSection(
    title: '订阅',
    items: [
      MultifunctionItem(
        title: '电影订阅',
        subtitle: '上映更新提醒',
        icon: Icons.movie_outlined,
        accent: Color(0xFF5C7CFA),
        style: MultifunctionCardStyle.tall,
        badge: '追更 12',
      ),
      MultifunctionItem(
        title: '电视剧订阅',
        subtitle: '本周新集',
        icon: Icons.tv,
        accent: Color(0xFF00B894),
        style: MultifunctionCardStyle.tall,
        badge: '待看 6',
      ),
      MultifunctionItem(
        title: '工作流',
        subtitle: '自动整理任务',
        icon: Icons.account_tree_outlined,
        accent: Color(0xFF0AA8A8),
        style: MultifunctionCardStyle.compact,
        meta: '运行中',
      ),
      MultifunctionItem(
        title: '日历',
        subtitle: '上映排期提醒',
        icon: Icons.event_outlined,
        accent: Color(0xFFFFA000),
        style: MultifunctionCardStyle.compact,
        meta: '今日 3',
      ),
    ],
  ),
  MultifunctionSection(
    title: '整理',
    items: [
      MultifunctionItem(
        title: '下载管理',
        subtitle: '任务队列与速度',
        icon: Icons.download_outlined,
        accent: Color(0xFF3B82F6),
        style: MultifunctionCardStyle.wide,
        meta: '进行中 3',
      ),
      MultifunctionItem(
        title: '媒体整理',
        subtitle: '命名、归档与去重',
        icon: Icons.folder_outlined,
        accent: Color(0xFF8E44AD),
        style: MultifunctionCardStyle.wide,
        meta: '待处理 12',
      ),
      MultifunctionItem(
        title: '文件管理',
        subtitle: '批量清理与归档',
        icon: Icons.snippet_folder_outlined,
        accent: Color(0xFF6D5DF6),
        style: MultifunctionCardStyle.wide,
        meta: '新增 4',
      ),
    ],
  ),
  MultifunctionSection(
    title: '系统',
    layout: MultifunctionSectionLayout.grouped,
    items: [
      MultifunctionItem(
        title: '插件',
        subtitle: '扩展能力管理',
        icon: Icons.grid_view_outlined,
        accent: Color(0xFF8F67FF),
        style: MultifunctionCardStyle.wide,
        meta: '已启用 6',
      ),
      MultifunctionItem(
        title: '站点管理',
        subtitle: '站点接入与连通性',
        icon: Icons.public_outlined,
        accent: Color(0xFF5C7CFA),
        style: MultifunctionCardStyle.wide,
        meta: '在线',
      ),
      MultifunctionItem(
        title: '用户管理',
        subtitle: '权限与访问控制',
        icon: Icons.people_outline,
        accent: Color(0xFF00B894),
        style: MultifunctionCardStyle.wide,
        meta: '成员 8',
      ),
      MultifunctionItem(
        title: '设定',
        subtitle: '系统参数配置',
        icon: Icons.settings_outlined,
        accent: Color(0xFFFFA000),
        style: MultifunctionCardStyle.wide,
        meta: '更新 2',
      ),
    ],
  ),
];
