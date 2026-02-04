import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/system_health_controller.dart';

class SystemHealthPage extends GetView<SystemHealthController> {
  const SystemHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Icon(CupertinoIcons.gear_alt_fill, size: 20),
            SizedBox(width: 8),
            Text('健康检查'),
          ],
        ),
        actions: [
          Obx(() {
            if (controller.isLoading.value) {
              return const Padding(
                padding: EdgeInsets.only(right: 12),
                child: CupertinoActivityIndicator(radius: 8),
              );
            }
            return IconButton(
              icon: const Icon(CupertinoIcons.refresh),
              onPressed: controller.fetchHealth,
            );
          }),
          IconButton(
            icon: const Icon(CupertinoIcons.xmark),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: SafeArea(child: Obx(() => _buildBody(context, controller))),
    );
  }

  Widget _buildBody(BuildContext context, SystemHealthController controller) {
    final items = controller.items;
    final children = <Widget>[
      _buildSummary(context, controller),
      if (controller.errorMessage.value != null)
        _buildErrorBanner(controller.errorMessage.value!),
      if (items.isEmpty && !controller.isLoading.value)
        _buildEmptyState(controller.errorMessage.value),
      if (items.isNotEmpty) ...items.map((item) => _buildItem(context, item)),
    ];

    return RefreshIndicator(
      onRefresh: controller.fetchHealth,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: children.length,
      ),
    );
  }

  Widget _buildSummary(
    BuildContext context,
    SystemHealthController controller,
  ) {
    final items = controller.items;
    final total = items.length;
    final okCount = items
        .where((item) => item.status == SystemHealthStatus.ok)
        .length;
    final errorCount = items
        .where((item) => item.status == SystemHealthStatus.error)
        .length;
    final finishedCount = items
        .where(
          (item) =>
              item.status != SystemHealthStatus.checking &&
              item.status != SystemHealthStatus.idle,
        )
        .length;
    final progress = total == 0 ? 0.0 : finishedCount / total;
    final percentLabel = '${(progress * 100).round()}%';
    final isChecking = controller.isLoading.value;
    final hasError = errorCount > 0;

    final headline = isChecking
        ? '检测中'
        : hasError
        ? '存在异常'
        : '检查完成';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5C6CFF), Color(0xFF5A36B3)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                hasError
                    ? CupertinoIcons.exclamationmark_circle_fill
                    : CupertinoIcons.checkmark_circle_fill,
                color: Colors.white,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                headline,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildProgressBar(progress, percentLabel),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCountBlock('总模块数', total, Colors.white),
              _buildCountBlock('正常', okCount, const Color(0xFF33D17A)),
              _buildCountBlock('错误', errorCount, const Color(0xFFFF6B6B)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double progress, String percentLabel) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            minHeight: 8,
            value: progress,
            backgroundColor: Colors.white.withOpacity(0.2),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF3DDC84)),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              percentLabel,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCountBlock(String label, int value, Color valueColor) {
    return Column(
      children: [
        Text(
          '$value',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8)),
        ),
      ],
    );
  }

  Widget _buildErrorBanner(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFEF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFC5C5)),
      ),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle_fill,
            size: 16,
            color: Color(0xFFFF6B6B),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 12, color: Color(0xFFB54444)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String? message) {
    final text = message ?? '暂无健康检查数据';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, color: CupertinoColors.systemGrey),
      ),
    );
  }

  Widget _buildItem(BuildContext context, SystemHealthItem item) {
    final statusText = _statusLabel(item.status);
    final statusColor = _statusColor(item.status);
    final backgroundColor = _backgroundColor(item.status);
    final detail = _detailText(item);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusIcon(item.status, statusColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.title} - $statusText',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (detail.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    detail,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildStatusChip(statusText, statusColor),
        ],
      ),
    );
  }

  Widget _buildStatusIcon(SystemHealthStatus status, Color color) {
    if (status == SystemHealthStatus.checking) {
      return const CupertinoActivityIndicator(radius: 10);
    }
    IconData iconData = CupertinoIcons.question_circle_fill;
    switch (status) {
      case SystemHealthStatus.ok:
        iconData = CupertinoIcons.checkmark_circle_fill;
        break;
      case SystemHealthStatus.warning:
        iconData = CupertinoIcons.exclamationmark_triangle_fill;
        break;
      case SystemHealthStatus.error:
        iconData = CupertinoIcons.xmark_circle_fill;
        break;
      case SystemHealthStatus.disabled:
        iconData = CupertinoIcons.minus_circle_fill;
        break;
      case SystemHealthStatus.idle:
      case SystemHealthStatus.unknown:
      case SystemHealthStatus.checking:
        iconData = CupertinoIcons.question_circle_fill;
        break;
    }
    return Icon(iconData, color: color, size: 22);
  }

  Widget _buildStatusChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.18),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _statusColor(SystemHealthStatus status) {
    switch (status) {
      case SystemHealthStatus.ok:
        return const Color(0xFF25C26E);
      case SystemHealthStatus.warning:
        return CupertinoColors.systemOrange;
      case SystemHealthStatus.error:
        return CupertinoColors.systemRed;
      case SystemHealthStatus.disabled:
        return CupertinoColors.systemGrey;
      case SystemHealthStatus.checking:
        return CupertinoColors.systemBlue;
      case SystemHealthStatus.idle:
      case SystemHealthStatus.unknown:
        return CupertinoColors.systemGrey2;
    }
  }

  Color _backgroundColor(SystemHealthStatus status) {
    switch (status) {
      case SystemHealthStatus.ok:
        return const Color(0xFFEAF8EE);
      case SystemHealthStatus.warning:
        return const Color(0xFFFFF4E5);
      case SystemHealthStatus.error:
        return const Color(0xFFFFEFEF);
      case SystemHealthStatus.disabled:
        return const Color(0xFFF1F1F4);
      case SystemHealthStatus.checking:
      case SystemHealthStatus.idle:
      case SystemHealthStatus.unknown:
        return const Color(0xFFF5F6F8);
    }
  }

  String _statusLabel(SystemHealthStatus status) {
    switch (status) {
      case SystemHealthStatus.ok:
        return '正常';
      case SystemHealthStatus.warning:
        return '警告';
      case SystemHealthStatus.error:
        return '错误';
      case SystemHealthStatus.disabled:
        return '未启用';
      case SystemHealthStatus.checking:
        return '检测中';
      case SystemHealthStatus.idle:
        return '未检测';
      case SystemHealthStatus.unknown:
        return '未知';
    }
  }

  String _detailText(SystemHealthItem item) {
    if (item.detail != null && item.detail!.trim().isNotEmpty) {
      return item.detail!.trim();
    }
    if (item.message != null && item.message!.trim().isNotEmpty) {
      return item.message!.trim();
    }
    return '';
  }
}
