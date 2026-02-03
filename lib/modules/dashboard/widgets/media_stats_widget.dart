import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import '../controllers/dashboard_controller.dart';

/// 媒体统计组件
class MediaStatsWidget extends StatelessWidget {
  const MediaStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(CupertinoIcons.chart_bar, size: 20),
            const SizedBox(width: 8),
            const Text(
              '媒体统计',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Obx(() {
          final statisticData = controller.statisticData.value;

          // 构建统计项列表，添加颜色
          final stats = [
            {
              'label': '电影',
              'value': statisticData.movie_count,
              'icon': CupertinoIcons.film,
              'color': CupertinoColors.systemPurple,
            },
            {
              'label': '电视剧',
              'value': statisticData.tv_count,
              'icon': CupertinoIcons.tv,
              'color': CupertinoColors.systemGreen,
            },
            {
              'label': '剧集',
              'value': statisticData.episode_count,
              'icon': CupertinoIcons.collections,
              'color': CupertinoColors.systemOrange,
            },
            {
              'label': '用户',
              'value': statisticData.user_count,
              'icon': CupertinoIcons.person,
              'color': CupertinoColors.systemBlue,
            },
          ];

          return Section(
            child: Row(
              children: stats.map((stat) {
                return Expanded(
                  child: _buildStatItem(
                    stat['label'] as String,
                    (stat['value'] as int).toString(),
                    stat['icon'] as IconData,
                    stat['color'] as Color,
                  ),
                );
              }).toList(),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 24, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
