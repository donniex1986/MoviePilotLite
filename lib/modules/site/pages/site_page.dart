import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_controller.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_statistic_controller.dart';
import 'package:moviepilot_mobile/modules/site/models/site_models.dart';
import 'package:moviepilot_mobile/modules/site/pages/site_statistic_page.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SitePage extends GetView<SiteController> {
  const SitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('站点管理'),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _openStatistic(context),
            child: const Icon(CupertinoIcons.chart_bar),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.items.isEmpty) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (controller.errorText.value != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.errorText.value ?? '',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CupertinoButton(
                  onPressed: controller.load,
                  child: const Text('重试'),
                ),
              ],
            ),
          );
        }
        return CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(onRefresh: controller.load),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: CupertinoSearchTextField(
                  placeholder: '搜索站点',
                  onSubmitted: (value) {
                    controller.search(value);
                  },
                ),
              ),
            ),

            Skeletonizer.sliver(
              enabled:
                  controller.isLoading.value && controller.items.isNotEmpty,
              child: SliverList.builder(
                itemBuilder: (context, index) {
                  final items = controller.items;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        _selectItem(items[index]);
                      },
                      child: _SiteItemCard(item: items[index]),
                    ),
                  );
                },
                itemCount: controller.items.length,
              ),
            ),
          ],
        );
      }),
    );
  }

  void _selectItem(SiteItem item) {
    Get.toNamed(
      '/site-detail',
      arguments: {
        'siteId': item.site.id,
        'siteName': item.site.name,
        'site': item.site.toJson(),
      },
    );
  }

  void _openStatistic(BuildContext context) {
    Get.put(SiteStatisticController(), permanent: false);
    showCupertinoModalBottomSheet<void>(
      context: context,
      expand: true,
      builder: (sheetContext) {
        return const SiteStatisticPage();
      },
    ).then((_) {
      Get.delete<SiteStatisticController>();
    });
  }
}

class _SiteItemCard extends StatelessWidget {
  const _SiteItemCard({this.item});

  final SiteItem? item;

  @override
  Widget build(BuildContext context) {
    final site = item?.site;
    final user = item?.userData;
    final theme = Theme.of(context);

    return Section(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 分区一：站点标识（icon + 站点名）+ 资源入口
          Row(
            children: [
              Hero(
                tag: 'site-icon-${item?.site.id}',
                child: item != null
                    ? _buildIcon(item!.iconBytes, item!.iconBase64)
                    : _placeholderIcon(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  site?.name ?? '',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (user != null) _buildUserInfo(context, user),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context, SiteUserDataModel? user) {
    if (user == null) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const Divider(height: 1),
        const SizedBox(height: 10),
        Wrap(
          children: [
            _buildRow(
              CupertinoIcons.person,
              Theme.of(context).colorScheme.primary,
              '${user.username} (ID: ${user.userid})',
            ),
            const SizedBox(width: 16),
            if (user.userLevel.isNotEmpty)
              _buildRow(
                Icons.star_border,
                Theme.of(context).colorScheme.primary,
                user.userLevel,
              ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(height: 1),
        const SizedBox(height: 10),
        _buildUploadDownload(
          context,
          user.upload.toDouble(),
          user.download.toDouble(),
        ),
        // 分区三：上传 / 下载 / 比例（按比例着色）
        const SizedBox(height: 10),
        const Divider(height: 1),
        const SizedBox(height: 10),
        // 分区四：做种 / 下载中 / 未读消息
        Row(
          children: [
            _buildChip('做种 ${user.seeding}', CupertinoColors.systemGreen),
            const SizedBox(width: 8),
            _buildChip('下载 ${user.leeching}', CupertinoColors.systemOrange),
            if (user.messageUnread > 0) ...[
              const SizedBox(width: 8),
              _buildChip('未读 ${user.messageUnread}', AppTheme.errorColor),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildUploadDownload(
    BuildContext context,
    double upload,
    double download,
  ) {
    final uploadProgress = upload != 0 ? max(upload / download, 0.05) : 0;
    final downloadProgress = download != 0 ? max(download / upload, 0.05) : 0;
    double dl = 0.0;
    double ul = 0.0;
    if (upload > download) {
      dl = downloadProgress.toDouble();
      ul = 1;
    } else {
      dl = 1;
      ul = uploadProgress.toDouble();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              CupertinoIcons.arrow_up,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 50, maxWidth: 200),
              child: Text(
                SizeFormatter.formatSize(upload),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LinearProgressIndicator(
                value: ul.toDouble(),
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.arrow_down,
              size: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 50, maxWidth: 200),
              child: Text(
                SizeFormatter.formatSize(download),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LinearProgressIndicator(
                value: dl,
                color: Theme.of(context).colorScheme.secondary,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 优先使用已解码的 iconBytes，避免在 build 时重复 base64 解码导致滑动卡顿；兼容带 data:image/xxx;base64, 前缀的 iconBase64
  Widget _buildIcon(List<int>? iconBytes, String? iconBase64) {
    Uint8List? bytes;
    if (iconBytes != null && iconBytes.isNotEmpty) {
      bytes = Uint8List.fromList(iconBytes);
    } else if (iconBase64 != null && iconBase64.isNotEmpty) {
      try {
        String base64 = iconBase64.trim();
        if (base64.contains(',')) {
          final comma = base64.indexOf(',');
          base64 = base64.substring(comma + 1).trim();
        }
        if (base64.isNotEmpty) {
          final decoded = base64Decode(base64);
          if (decoded.isNotEmpty) bytes = decoded;
        }
      } catch (_) {}
    }
    if (bytes != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.memory(
          bytes,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
          gaplessPlayback: true,
          errorBuilder: (_, __, ___) => _placeholderIcon(),
        ),
      );
    }
    return _placeholderIcon();
  }

  Widget _placeholderIcon() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        CupertinoIcons.globe,
        color: CupertinoColors.systemGrey,
        size: 22,
      ),
    );
  }

  Widget _buildRow(IconData icon, Color iconColors, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColors),
          Text(value, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Color _ratioColor(double ratio) {
    if (ratio >= 5) return AppTheme.successColor;
    if (ratio >= 1) return AppTheme.infoColor;
    return AppTheme.errorColor;
  }
}
