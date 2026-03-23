import 'package:altman_downloader_control/controller/downloader_config.dart';
import 'package:altman_downloader_control/controller/protocol.dart';
import 'package:altman_downloader_control/model/torrent_item_model.dart';
import 'package:altman_downloader_control/page/qbittorrent/qb_log_page.dart';
import 'package:altman_downloader_control/page/qbittorrent/qb_preferences_settings_page.dart';
import 'package:altman_downloader_control/page/qbittorrent/qb_rss_list_page.dart';
import 'package:altman_downloader_control/widget/donwloader_state_widget.dart';
import 'package:altman_downloader_control/widget/filter_widget.dart';
import 'package:altman_downloader_control/widget/torrent_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:altman_downloader_control/controller/qbittorrent/qb_controller.dart';
import 'package:altman_downloader_control/model/qb_preferences_model.dart';
import 'package:altman_downloader_control/model/qb_sort_type.dart';
import 'package:altman_downloader_control/utils/string_utils.dart';

class DownloaderTorrentListPage extends GetView<DownloaderControllerProtocol> {
  const DownloaderTorrentListPage({super.key});

  /// 判断是否为 qBittorrent
  bool get isQBittorrent =>
      controller.config?.type == DownloaderType.qbittorrent;

  /// 判断是否为 Transmission
  bool get isTransmission =>
      controller.config?.type == DownloaderType.transmission;

  Future<void> _refreshData() async {
    // 如果是 qBittorrent，使用扩展方法；否则使用协议方法
    if (controller is QBController) {
      await (controller as QBController).refreshTorrentsWithMainData();
    } else {
      await controller.refreshTorrents();
    }
  }

  void _openCreateDownload(BuildContext context) {
    showTorrentDownloadScreen(context, controller: controller);
  }

  // 辅助方法：获取通用格式的种子列表
  List<TorrentModel> get torrentsList {
    return controller.torrentsUniversal;
  }

  // 辅助方法：获取筛选后的种子列表（仅 qBittorrent 支持）
  List<TorrentModel> get filteredTorrentsList {
    if (controller is QBController) {
      final qbController = controller as QBController;
      if (qbController.filter.value.hasFilters) {
        return qbController.filteredTorrents
            .map((t) => t.toTorrentModel())
            .toList();
      }
      return qbController.torrentsUniversal;
    }
    // Transmission 等其他下载器直接返回全部
    return controller.torrentsUniversal;
  }

  // 辅助方法：是否支持筛选功能（仅 qBittorrent 支持）
  bool get supportsFilter => isQBittorrent;

  // 辅助方法：是否支持 RSS 功能（仅 qBittorrent 支持）
  bool get supportsRSS => isQBittorrent;

  // 辅助方法：是否支持偏好设置（仅 qBittorrent 支持）
  bool get supportsPreferences => isQBittorrent;

  // 辅助方法：是否支持排序功能（仅 qBittorrent 支持）
  bool get supportsSort => isQBittorrent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _refreshData,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _buildErrorMessage(context)),
                if (supportsFilter && controller is QBController)
                  QBFilterWidget(
                    key: const ValueKey('qb_filter_widget'),
                    controller: controller as QBController,
                  )
                else if (supportsFilter)
                  DownloaderFilterWidget(
                    key: const ValueKey('downloader_filter_widget'),
                    controller: controller,
                  ),
                SliverToBoxAdapter(
                  child: Obx(() {
                    final torrentsList = this.torrentsList;
                    if (torrentsList.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    final displayTorrents = filteredTorrentsList;

                    // 计算总尺寸
                    int totalSize = 0;
                    for (var torrent in displayTorrents) {
                      final size = torrent.totalSize > 0
                          ? torrent.totalSize
                          : torrent.size;
                      totalSize += size;
                    }

                    final hasFilters =
                        supportsFilter &&
                        controller is QBController &&
                        (controller as QBController).filter.value.hasFilters;

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(
                              context,
                            ).colorScheme.outline.withValues(alpha: 0.1),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 标题行：标题 + 排序按钮
                          Row(
                            children: [
                              Text(
                                '种子列表',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      letterSpacing: -0.4,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                              ),
                              const Spacer(),
                              // 排序按钮（iOS 风格）
                              if (supportsSort) _buildIOSSortButton(context),
                              // 清除筛选按钮
                              if (hasFilters) ...[
                                const SizedBox(width: 8),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  minSize: 0,
                                  onPressed: () {
                                    (controller as QBController).clearFilter();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Theme.of(context)
                                              .colorScheme
                                              .errorContainer
                                              .withValues(alpha: 0.4),
                                          Theme.of(context)
                                              .colorScheme
                                              .errorContainer
                                              .withValues(alpha: 0.2),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error
                                            .withValues(alpha: 0.2),
                                        width: 0.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error
                                              .withValues(alpha: 0.15),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.clear_rounded,
                                          size: 14,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '清除',
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.error,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 8),
                          // 信息行：种子数量和体积
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline_rounded,
                                size: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant
                                    .withValues(alpha: 0.6),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${displayTorrents.length} 个种子',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant
                                          .withValues(alpha: 0.7),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.storage_rounded,
                                size: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant
                                    .withValues(alpha: 0.6),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                totalSize.toHumanReadableFileSize(),
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant
                                          .withValues(alpha: 0.7),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                _buildTorrentList(context),
                // 尾部填充，避免浮窗遮挡
                SliverToBoxAdapter(
                  child: SizedBox(height: isQBittorrent ? 160 : 32),
                ),
              ],
            ),
          ),
          _buildDownloaderStateOverlay(context),
        ],
      ),
    );
  }

  Widget _buildDownloaderStateOverlay(BuildContext context) {
    return Obx(() {
      double totalTorrentSize = 0;
      for (var torrent in torrentsList) {
        totalTorrentSize += torrent.size.toDouble();
      }

      // 获取通用的服务器状态（支持所有下载器类型）
      final serverState = controller.serverStateUniversal;

      // 如果是 qBittorrent，尝试获取 preferences
      QBPreferencesModel? preferences;
      if (controller is QBController) {
        preferences = (controller as QBController).preferences.value;
      }

      return SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: DownloaderStateWidget(
                errorMessage: '',
                isConnected: controller.isConnected.value,
                serverState: serverState,
                preferences: preferences,
                totalTorrentSize: totalTorrentSize,
                onAddPressed: () => _openCreateDownload(context),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildErrorMessage(BuildContext context) {
    return Obx(() {
      final errorMessage = controller.errorMessage.value;

      // 使用 AnimatedSize 实现平滑的显示/隐藏动画，避免布局闪烁
      return AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: errorMessage.isEmpty
            ? const SizedBox.shrink()
            : Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.errorContainer.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.error.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.error,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        errorMessage,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }

  Widget _buildTorrentList(BuildContext context) {
    return Obx(() {
      // 使用通用格式的种子列表
      final displayTorrents = filteredTorrentsList;

      if (displayTorrents.isEmpty) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_download_outlined,
                  size: 64,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  '暂无种子',
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return SliverList.builder(
        itemCount: displayTorrents.length,
        itemBuilder: (context, index) {
          final torrent = displayTorrents[index];
          return TorrentListItem(torrent: torrent, controller: controller);
        },
      );
    });
  }

  Widget _buildIOSSortButton(BuildContext context) {
    // 仅 qBittorrent 支持排序
    if (!supportsSort || controller is! QBController) {
      return const SizedBox.shrink();
    }

    return Obx(() {
      final qbController = controller as QBController;
      final currentSortType = qbController.torrentSortType.value;

      final theme = Theme.of(context);

      return PopupMenuButton<QBTorrentSortType>(
        offset: const Offset(0, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onSelected: (QBTorrentSortType sortType) {
          (controller as QBController).sortTorrents(sortType);
        },
        itemBuilder: (BuildContext context) =>
            QBTorrentSortType.sortTypes.map((sortType) {
              // 为每个排序类型分配图标
              IconData getSortIcon(QBTorrentSortType type) {
                switch (type) {
                  case QBTorrentSortType.size:
                    return Icons.storage_rounded;
                  case QBTorrentSortType.progress:
                    return Icons.percent_rounded;
                  case QBTorrentSortType.dateAdded:
                    return Icons.calendar_today_rounded;
                  case QBTorrentSortType.speed:
                    return Icons.speed_rounded;
                  case QBTorrentSortType.seeds:
                    return Icons.people_rounded;
                  case QBTorrentSortType.ratio:
                    return Icons.compare_arrows_rounded;
                  default:
                    return Icons.sort_rounded;
                }
              }

              final isSelected = sortType == currentSortType;
              final iconColor = isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant;

              return PopupMenuItem<QBTorrentSortType>(
                value: sortType,
                child: Row(
                  children: [
                    // 排序类型图标
                    Icon(getSortIcon(sortType), size: 18, color: iconColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        sortType.label,
                        style: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    // 选中标记
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      Icon(
                        Icons.check_circle_rounded,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ],
                ),
              );
            }).toList(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.6,
                ),
                theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.4,
                ),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.15),
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sort_rounded,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 6),
              Text(
                currentSortType.label,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 16,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        ),
      );
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDark
          ? colorScheme.surface.withValues(alpha: 0.95)
          : colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 80,
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        onPressed: () => Get.back(),
        child: Container(
          margin: const EdgeInsets.only(left: 8),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          decoration: BoxDecoration(
            color: isDark
                ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.2)
                : colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.08),
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: colorScheme.primary,
                size: 13,
              ),
              const SizedBox(width: 4),
              Text(
                '返回',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      title: Text(
        controller.config?.name ?? '',
        style: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 17,
          letterSpacing: -0.4,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      actions: [
        // RSS 和 Log 整合为一个整体（降低视觉重量）
        if (isQBittorrent && controller is QBController)
          Container(
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            decoration: BoxDecoration(
              color: isDark
                  ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.1)
                  : colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.05),
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 日志按钮
                _buildIOSActionButton(
                  context: context,
                  icon: Icons.description_outlined,
                  tooltip: '日志',
                  onPressed: () {
                    Get.to(
                      () => QBLogPage(controller: controller as QBController),
                    );
                  },
                  showContainer: false, // 不显示独立容器
                ),
                // 分隔线（降低视觉重量）
                Container(
                  width: 0.5,
                  height: 14,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  color: colorScheme.outline.withValues(alpha: 0.08),
                ),
                // RSS 按钮
                if (supportsRSS && controller is QBController)
                  _buildIOSActionButton(
                    context: context,
                    icon: Icons.rss_feed_outlined,
                    tooltip: 'RSS订阅',
                    onPressed: () {
                      Get.to(
                        () => QBRssListPage(
                          controller: controller as QBController,
                        ),
                      );
                    },
                    showContainer: false, // 不显示独立容器
                  ),
              ],
            ),
          ),
        // 仅 qBittorrent 支持偏好设置（独立显示）
        if (supportsPreferences && controller is QBController)
          _buildIOSActionButton(
            context: context,
            icon: Icons.settings_outlined,
            tooltip: '设置',
            onPressed: () {
              Get.to(
                () => QBPreferencesSettingsScreen(controller: controller),
                arguments: {'id': controller.config?.id ?? ''},
              );
            },
          ),
        const SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.5),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? colorScheme.outline.withValues(alpha: 0.2)
                    : colorScheme.outline.withValues(alpha: 0.1),
                width: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 构建 iOS 风格的操作按钮
  Widget _buildIOSActionButton({
    required BuildContext context,
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
    bool showContainer = true, // 是否显示独立容器
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    if (!showContainer) {
      // 不显示容器，直接返回按钮（用于 RSS 和 Log，降低视觉重量）
      return CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        minSize: 0,
        onPressed: onPressed,
        child: Icon(
          icon,
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
          size: 16, // 进一步减小图标尺寸
        ),
      );
    }

    // 显示独立容器（用于 Setting，增强视觉重量）
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isDark
                  ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.4)
                  : colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
              isDark
                  ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.3)
                  : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colorScheme.primary.withValues(alpha: 0.2),
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.15),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: colorScheme.primary,
          size: 20, // 增大图标尺寸以突出显示
        ),
      ),
    );
  }

  void showTorrentDownloadScreen(
    BuildContext context, {
    required DownloaderControllerProtocol controller,
  }) {}
}
