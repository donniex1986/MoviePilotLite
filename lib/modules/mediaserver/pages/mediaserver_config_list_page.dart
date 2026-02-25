import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dashboard/models/statistic_model.dart';
import 'package:moviepilot_mobile/modules/mediaserver/controllers/mediaserver_controller.dart';
import 'package:moviepilot_mobile/modules/mediaserver/models/mediaserver_model.dart';

/// 媒体服务器配置列表：使用 MediaServerController 的服务器列表与统计，展示基本信息
class MediaServerConfigListPage extends GetView<MediaServerController> {
  const MediaServerConfigListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('媒体服务器'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.refreshMediaServers(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.mediaServers.value.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        final servers = controller.mediaServers.value;
        if (servers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.live_tv_outlined,
                  size: 64,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(height: 16),
                Text(
                  '暂无媒体服务器配置',
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
                const SizedBox(height: 24),
                Text(
                  '请在设定中配置 Emby / Jellyfin / Plex 等媒体服务器',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: controller.refreshMediaServers,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: servers.length,
            itemBuilder: (context, index) {
              final server = servers[index];
              return Obx(
                () => _MediaServerItemCard(
                  server: server,
                  stats: controller.statsFor(server.name),
                  onTap: () {
                    // 详情页待接入
                    Get.snackbar('提示', '${server.name} 详情页待接入');
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

class _MediaServerItemCard extends StatelessWidget {
  const _MediaServerItemCard({
    required this.server,
    required this.stats,
    required this.onTap,
  });

  final MediaServer server;
  final StatisticModel? stats;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardBg = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : theme.colorScheme.surface;
    final statsBg = isDark
        ? theme.colorScheme.surface.withValues(alpha: 0.5)
        : theme.colorScheme.surfaceContainerLow.withValues(alpha: 0.6);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: isDark ? 0 : 1,
      shadowColor: theme.colorScheme.shadow.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: cardBg,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            theme.colorScheme.primary.withValues(alpha: 0.85),
                            theme.colorScheme.primary.withValues(alpha: 0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary
                                .withValues(alpha: 0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.live_tv_rounded,
                        color: theme.colorScheme.onPrimary,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            server.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (server.type.isNotEmpty) ...[
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: server.enabled
                                        ? const Color(0xFF4CAF50)
                                            .withValues(alpha: 0.15)
                                        : theme.colorScheme.outline
                                            .withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    server.type,
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: server.enabled
                                          ? const Color(0xFF4CAF50)
                                          : theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                                if (!server.enabled) ...[
                                  const SizedBox(width: 6),
                                  Text(
                                    '未启用',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.error,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: theme.colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.7),
                      size: 22,
                    ),
                  ],
                ),
              ),
              if (stats != null) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: statsBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: theme.colorScheme.outline
                            .withValues(alpha: 0.08),
                        width: 1,
                      ),
                    ),
                    child: _MediaStatGrid(stats: stats!),
                  ),
                ),
              ] else
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: statsBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '获取统计中…',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MediaStatGrid extends StatelessWidget {
  const _MediaStatGrid({required this.stats});

  final StatisticModel stats;

  @override
  Widget build(BuildContext context) {
    final items = [
      _StatItem(
        icon: CupertinoIcons.film,
        label: '电影',
        value: stats.movie_count.toString(),
        color: CupertinoColors.systemPurple,
      ),
      _StatItem(
        icon: CupertinoIcons.tv,
        label: '剧集',
        value: stats.tv_count.toString(),
        color: CupertinoColors.systemGreen,
      ),
      _StatItem(
        icon: CupertinoIcons.collections,
        label: '集数',
        value: stats.episode_count.toString(),
        color: CupertinoColors.systemOrange,
      ),
      _StatItem(
        icon: CupertinoIcons.person,
        label: '用户',
        value: stats.user_count.toString(),
        color: CupertinoColors.systemBlue,
      ),
    ];
    return Row(
      children: items.asMap().entries.map((entry) {
        final i = entry.key;
        final e = entry.value;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < items.length - 1 ? 6 : 0),
            child: _StatTile(
              icon: e.icon,
              label: e.label,
              value: e.value,
              color: e.color,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _StatItem {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
  final IconData icon;
  final String label;
  final String value;
  final Color color;
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 13, color: color),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
