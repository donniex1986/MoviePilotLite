import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import '../controllers/dashboard_controller.dart';

/// 网络流量组件
class NetworkTrafficWidget extends StatelessWidget {
  const NetworkTrafficWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.wifi, size: 20),
              const SizedBox(width: 8),
              const Text(
                '网络流量',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() {
            final traffic = controller.networkTraffic;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTrafficItem(
                  '上行',
                  '${SizeFormatter.formatSize(traffic.first)}ps',
                  CupertinoIcons.arrow_up,
                  Theme.of(context).colorScheme.secondary,
                ),
                _buildTrafficItem(
                  '下行',
                  '${SizeFormatter.formatSize(traffic.last)}ps',
                  CupertinoIcons.arrow_down,
                  Theme.of(context).colorScheme.primary,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTrafficItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey),
        ),
      ],
    );
  }
}
