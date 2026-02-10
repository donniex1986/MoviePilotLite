import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_controller.dart';
import 'package:moviepilot_mobile/modules/site/models/site_models.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';

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
            onPressed: controller.load,
            child: const Icon(CupertinoIcons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
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
          final list = controller.items;
          if (list.isEmpty) {
            return Center(
              child: Text(
                '暂无站点',
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 15,
                ),
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              CupertinoSliverRefreshControl(onRefresh: controller.load),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final siteItem = list[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _SiteItemCard(
                          item: siteItem,
                          onTapDetail: () => Get.toNamed(
                            '/site-detail',
                            arguments: {
                              'siteId': siteItem.site.id,
                              'siteName': siteItem.site.name,
                              'site': siteItem.site.toJson(),
                            },
                          ),
                          onTapResource: () => Get.toNamed(
                            '/site-resource',
                            arguments: {
                              'siteId': siteItem.site.id,
                              'siteName': siteItem.site.name,
                            },
                          ),
                        ),
                      );
                    },
                    childCount: list.length,
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _SiteItemCard extends StatelessWidget {
  const _SiteItemCard({required this.item, this.onTapDetail, this.onTapResource});

  final SiteItem item;
  final VoidCallback? onTapDetail;
  final VoidCallback? onTapResource;

  @override
  Widget build(BuildContext context) {
    final site = item.site;
    final user = item.userData;
    final theme = Theme.of(context);

    return Section(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 分区一：站点标识（icon + 站点名）+ 资源入口
          Row(
            children: [
              _buildIcon(item.iconBytes, item.iconBase64),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  site.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (onTapDetail != null)
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  minSize: 0,
                  onPressed: onTapDetail,
                  child: Text(
                    '详情',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              if (onTapResource != null)
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  minSize: 0,
                  onPressed: onTapResource,
                  child: Text(
                    '资源',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
          if (user != null) ...[
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 10),
            // 分区二：用户信息（User Name、user id、user level）
            _buildRow('用户', '${user.username} (${user.userid})'),
            if (user.userLevel.isNotEmpty)
              _buildRow('等级', user.userLevel),
            const SizedBox(height: 10),
            const Divider(height: 1),
            const SizedBox(height: 10),
            // 分区三：上传 / 下载 / 比例（按比例着色）
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '上传 ',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  SizeFormatter.formatSize(user.upload),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '下载 ',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  SizeFormatter.formatSize(user.download),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '比例 ',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  user.ratio.toStringAsFixed(2),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _ratioColor(user.ratio),
                  ),
                ),
              ],
            ),
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
                  _buildChip(
                    '未读 ${user.messageUnread}',
                    AppTheme.errorColor,
                  ),
                ],
              ],
            ),
          ] else ...[
            const SizedBox(height: 8),
            Text(
              '暂无用户数据',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ],
      ),
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

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 56,
            child: Text(
              '$label：',
              style: TextStyle(
                fontSize: 13,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13),
            ),
          ),
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
