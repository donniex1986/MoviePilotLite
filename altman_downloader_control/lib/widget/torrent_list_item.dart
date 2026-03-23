import 'dart:math';

import 'package:altman_downloader_control/controller/protocol.dart';
import 'package:altman_downloader_control/controller/qbittorrent/qb_controller.dart';
import 'package:altman_downloader_control/model/torrent_item_model.dart';
import 'package:altman_downloader_control/page/torrent_detail_sheet.dart';
import 'package:altman_downloader_control/utils/toast_utils.dart';
import 'package:altman_downloader_control/widget/input_dialog.dart'
    hide showMSInputDialog;
import 'package:altman_downloader_control/widget/qbittorrent/qb_category_picker.dart';
import 'package:altman_downloader_control/widget/qbittorrent/qb_tag_picker.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../utils/string_utils.dart';

/// 通用的种子列表项组件
/// 支持所有下载器类型（qBittorrent、Transmission 等），统一 UI 体验
class TorrentListItem extends StatelessWidget {
  final TorrentModel torrent;
  final DownloaderControllerProtocol controller;

  const TorrentListItem({
    super.key,
    required this.torrent,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // 统一使用一套 UI（整体风格与原 QbTorrentListItem 保持一致）
    return _buildUnifiedTorrentItem(context);
  }

  Widget _buildUnifiedTorrentItem(BuildContext context) {
    final progressPercent = (torrent.progress * 100);
    // 在方法开始处统一提取 Theme 数据，避免重复调用 Theme.of(context)
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;
    final stateColor = _getStateColor(colorScheme);
    _getStateBackgroundColor();

    return InkWell(
      onTap: () => _showTorrentDetails(context),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isDark
              ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.6)
              : colorScheme.surface,
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.15),
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: isDark ? 0.15 : 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============ 标题行 ============
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      torrent.name.trim().isEmpty ? '未命名任务' : torrent.name,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildActionMenu(context),
                ],
              ),

              // ============ 分类和标签 ============
              if (torrent.category.isNotEmpty || torrent.tags.isNotEmpty) ...[
                const SizedBox(height: 10),
                Row(
                  children: [
                    if (torrent.category.isNotEmpty) ...[
                      Icon(
                        Icons.folder_outlined,
                        size: 14,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        torrent.category,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                    if (torrent.category.isNotEmpty && torrent.tags.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '·',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    if (torrent.tags.isNotEmpty) ...[
                      Icon(
                        Icons.label_outline,
                        size: 14,
                        color: colorScheme.secondary,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          torrent.tags.join(' · '),
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.secondary,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 14),
              ] else
                const SizedBox(height: 12),

              // ============ 进度条 ============
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: max(progressPercent / 100, 0.01),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colorScheme.primary,
                            colorScheme.primary.withValues(alpha: 0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ============ 状态信息行 ============
              Row(
                children: [
                  // 进度百分比
                  Text(
                    '${progressPercent.toStringAsFixed(1)}%',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 14),
                  // 状态标签
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: stateColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      _getStateText(),
                      style: textTheme.labelSmall?.copyWith(
                        color: stateColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // 速度信息
                  if (torrent.dlspeed > 0) ...[
                    Icon(
                      Icons.arrow_downward,
                      size: 15,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${torrent.dlspeed.toHumanReadableFileSize(round: 1)}/s',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 14),
                  ],
                  if (torrent.upspeed > 0) ...[
                    Icon(
                      Icons.arrow_upward,
                      size: 15,
                      color: colorScheme.tertiary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${torrent.upspeed.toHumanReadableFileSize(round: 1)}/s',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),

              // ============ 详细信息行 ============
              const SizedBox(height: 12),
              Divider(
                height: 1,
                thickness: 0.3,
                color: colorScheme.outlineVariant.withValues(alpha: 0.15),
              ),
              const SizedBox(height: 12),

              // 基础信息：尺寸/上传量/比率
              Row(
                children: [
                  // 大小
                  Icon(
                    Icons.storage_outlined,
                    size: 14,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    (torrent.totalSize > 0 ? torrent.totalSize : torrent.size)
                        .toHumanReadableFileSize(),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 18),
                  // 上传量
                  Icon(
                    Icons.upload_outlined,
                    size: 14,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    torrent.uploaded.toHumanReadableFileSize(),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 18),
                  // 比率
                  Icon(
                    Icons.swap_horiz,
                    size: 14,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    torrent.ratio.toStringAsFixed(2),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  // ETA
                  if (torrent.eta > 0 && torrent.isDownloading) ...[
                    const SizedBox(width: 18),
                    Icon(
                      Icons.schedule_outlined,
                      size: 14,
                      color: colorScheme.primary.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '剩余 ${_formatETA(torrent.eta)}',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),

              // 次要信息（添加时间等）
              if (torrent.addedOn > 0 ||
                  torrent.popularity > 0 ||
                  torrent.availability >= 0) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (torrent.addedOn > 0) ...[
                      Icon(
                        Icons.access_time,
                        size: 13,
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.6,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatTimestamp(torrent.addedOn),
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.7,
                          ),
                          fontSize: 12,
                        ),
                      ),
                    ],
                    if (torrent.popularity > 0) ...[
                      if (torrent.addedOn > 0) const SizedBox(width: 14),
                      Icon(
                        Icons.local_fire_department,
                        size: 13,
                        color: colorScheme.error.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _getPopularityText(torrent.popularity),
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.error,
                          fontSize: 12,
                        ),
                      ),
                    ],
                    if (torrent.availability >= 0) ...[
                      if (torrent.addedOn > 0 || torrent.popularity > 0)
                        const SizedBox(width: 14),
                      Icon(
                        Icons.cloud_done_outlined,
                        size: 13,
                        color: colorScheme.tertiary.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _getAvailabilityText(torrent.availability),
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.tertiary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          Icons.more_vert,
          size: 16,
          color: Theme.of(
            context,
          ).colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
        ),
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) => _handleMenuAction(context, value),
      itemBuilder: (context) => [
        // 停止
        PopupMenuItem(
          value: 'pause',
          child: Row(
            children: [
              Icon(Icons.pause, size: 18, color: Colors.orange.shade600),
              const SizedBox(width: 12),
              const Text('停止'),
            ],
          ),
        ),
        // 启动
        PopupMenuItem(
          value: 'resume',
          child: Row(
            children: [
              Icon(Icons.play_arrow, size: 18, color: Colors.green.shade600),
              const SizedBox(width: 12),
              const Text('启动'),
            ],
          ),
        ),
        // 强制启动
        PopupMenuItem(
          value: 'forceResume',
          child: Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                size: 18,
                color: Colors.blue.shade600,
              ),
              const SizedBox(width: 12),
              const Text('强制启动'),
            ],
          ),
        ),
        // 强制重新校验
        PopupMenuItem(
          value: 'recheck',
          child: Row(
            children: [
              Icon(
                Icons.verified_outlined,
                size: 18,
                color: Colors.amber.shade700,
              ),
              const SizedBox(width: 12),
              const Text('强制重新校验'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        // 设置保存地址
        PopupMenuItem(
          value: 'setLocation',
          child: Row(
            children: [
              Icon(
                Icons.folder_outlined,
                size: 18,
                color: Colors.purple.shade600,
              ),
              const SizedBox(width: 12),
              const Text('设置保存地址'),
            ],
          ),
        ),
        // 重命名
        PopupMenuItem(
          value: 'rename',
          child: Row(
            children: [
              Icon(Icons.edit, size: 18, color: Colors.indigo.shade600),
              const SizedBox(width: 12),
              const Text('重命名'),
            ],
          ),
        ),
        // 设置分类
        PopupMenuItem(
          value: 'setCategory',
          child: Row(
            children: [
              Icon(Icons.category, size: 18, color: Colors.pink.shade600),
              const SizedBox(width: 12),
              const Text('设置分类'),
            ],
          ),
        ),
        // 设置标签
        PopupMenuItem(
          value: 'setTags',
          child: Row(
            children: [
              Icon(Icons.label, size: 18, color: Colors.purple.shade600),
              const SizedBox(width: 12),
              const Text('设置标签'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        // 限制下载速度
        PopupMenuItem(
          value: 'setDownloadLimit',
          child: Row(
            children: [
              Icon(Icons.download, size: 18, color: Colors.blue.shade600),
              const SizedBox(width: 12),
              const Text('限制下载速度'),
            ],
          ),
        ),
        // 限制上传速度
        PopupMenuItem(
          value: 'setUploadLimit',
          child: Row(
            children: [
              Icon(Icons.upload, size: 18, color: Colors.teal.shade600),
              const SizedBox(width: 12),
              const Text('限制上传速度'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        // 删除
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete_outline, size: 18, color: Colors.red.shade600),
              const SizedBox(width: 12),
              const Text('删除'),
            ],
          ),
        ),
        // 删除（包含文件）
        PopupMenuItem(
          value: 'deleteWithFiles',
          child: Row(
            children: [
              Icon(Icons.delete_forever, size: 18, color: Colors.red.shade700),
              const SizedBox(width: 12),
              const Text('删除（包含文件）'),
            ],
          ),
        ),
      ],
    );
  }

  void _handleMenuAction(BuildContext context, String action) {
    switch (action) {
      case 'pause':
        _pauseTorrent(context);
        break;
      case 'resume':
        _resumeTorrent(context);
        break;
      case 'forceResume':
        _forceResumeTorrent(context);
        break;
      case 'recheck':
        _recheckTorrent(context);
        break;
      case 'setLocation':
        _showSetLocationDialog(context);
        break;
      case 'rename':
        _showRenameDialog(context);
        break;
      case 'setCategory':
        _showSetCategoryDialog(context);
        break;
      case 'setTags':
        _showSetTagsDialog(context);
        break;
      case 'setDownloadLimit':
        _showSetDownloadLimitDialog(context);
        break;
      case 'setUploadLimit':
        _showSetUploadLimitDialog(context);
        break;
      case 'delete':
        _showDeleteConfirm(context, false);
        break;
      case 'deleteWithFiles':
        _showDeleteConfirm(context, true);
        break;
    }
  }

  Future<void> _pauseTorrent(BuildContext context) async {
    try {
      await controller.pauseTorrent(torrent.hash);
      showToast(message: '已暂停');
    } catch (e) {
      showToast(message: '暂停失败: ${e.toString()}');
    }
  }

  Future<void> _resumeTorrent(BuildContext context) async {
    try {
      await controller.resumeTorrent(torrent.hash);
      showToast(message: '已恢复');
    } catch (e) {
      showToast(message: '恢复失败: ${e.toString()}');
    }
  }

  Future<void> _forceResumeTorrent(BuildContext context) async {
    try {
      final success = await controller.forceStartTorrents([torrent.hash], true);
      if (success) {
        showToast(message: '已强制启动');
      } else {
        showToast(message: '强制启动失败');
      }
    } catch (e) {
      showToast(message: '强制启动失败: ${e.toString()}');
    }
  }

  Future<void> _recheckTorrent(BuildContext context) async {
    final confirmed = await showMSConfirmDialog(
      context,
      title: '确认重新校验',
      message: '确定要强制重新校验种子 "${torrent.name}" 吗？\n\n这将重新检查所有文件，可能需要较长时间。',
      confirmText: '确认',
      cancelText: '取消',
      icon: Icons.verified_outlined,
    );

    if (confirmed != true) return;

    try {
      final success = await controller.recheckTorrents([torrent.hash]);
      if (success) {
        showToast(message: '已开始重新校验');
      } else {
        showToast(message: '重新校验失败');
      }
    } catch (e) {
      showToast(message: '重新校验失败: ${e.toString()}');
    }
  }

  void _showSetLocationDialog(BuildContext context) async {
    final location = await showMSInputDialog(
      context,
      title: '设置保存地址',
      labelText: '保存路径',
      hintText: '请输入保存路径',
      initialValue: torrent.savePath,
      icon: Icons.folder_outlined,
    );

    if (location == null || location.isEmpty) return;

    final success = await controller.setTorrentLocation([
      torrent.hash,
    ], location);
    if (success) {
      showToast(message: '设置成功');
    } else {
      showToast(message: '设置失败');
    }
  }

  void _showRenameDialog(BuildContext context) async {
    final newName = await showMSInputDialog(
      context,
      title: '重命名',
      labelText: '名称',
      hintText: '请输入新名称',
      initialValue: torrent.name,
      icon: Icons.edit,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '请输入名称';
        }
        return null;
      },
    );

    if (newName == null || newName.trim().isEmpty) return;

    try {
      final success = await controller.renameTorrent(
        torrent.hash,
        newName.trim(),
      );
      if (success) {
        showToast(message: '重命名成功');
      } else {
        showToast(message: '重命名失败');
      }
    } catch (e) {
      showToast(message: '重命名失败: ${e.toString()}');
    }
  }

  Future<void> _showSetCategoryDialog(BuildContext context) async {
    String? category;

    if (controller is QBController) {
      // qBittorrent 使用分类选择器
      category = await showQBCategoryPicker(
        context,
        controller as QBController,
      );
    } else {
      // 其他下载器使用简单输入框
      category = await showMSInputDialog(
        context,
        title: '设置分类',
        labelText: '分类名称',
        hintText: '请输入分类名称（留空可清除分类）',
        icon: Icons.category,
      );
    }

    if (category == null) return;

    final success = await controller.setTorrentCategory([
      torrent.hash,
    ], category);
    if (success) {
      showToast(message: category.isEmpty ? '已清除分类' : '设置成功');
    } else {
      showToast(message: '设置失败');
    }
  }

  Future<void> _showSetTagsDialog(BuildContext context) async {
    List<String>? selectedTags;

    if (controller is QBController) {
      // qBittorrent 使用标签选择器
      selectedTags = await showQBTagPicker(
        context,
        initialSelectedTags: torrent.tags,
        controller: controller as QBController,
      );
    } else {
      // 其他下载器使用逗号分隔的简单输入
      final text = await showMSInputDialog(
        context,
        title: '设置标签',
        labelText: '标签',
        hintText: '多个标签使用逗号分隔，例如：电影,4K,动作',
        initialValue: torrent.tags.join(','),
        icon: Icons.label,
      );

      if (text == null) return;
      selectedTags = text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }

    if (selectedTags == null) return;

    final success = await controller.setTorrentTags([
      torrent.hash,
    ], selectedTags);
    if (success) {
      showToast(message: '设置成功');
    } else {
      showToast(message: '设置失败');
    }
  }

  void _showSetDownloadLimitDialog(BuildContext context) async {
    final limitText = await showMSInputDialog(
      context,
      title: '限制下载速度',
      labelText: '速度限制（KB/s）',
      hintText: '输入 0 表示无限制，留空保持当前设置',
      icon: Icons.download,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          final limitValue = int.tryParse(value);
          if (limitValue == null) {
            return '请输入有效的数字';
          }
        }
        return null;
      },
    );

    if (limitText == null) return;

    int limit = -1; // 默认无限制
    if (limitText.isNotEmpty) {
      final limitValue = int.tryParse(limitText);
      if (limitValue != null) {
        limit = limitValue > 0 ? limitValue * 1024 : -1; // 转换为字节/秒
      } else {
        showToast(message: '请输入有效的数字');
        return;
      }
    }

    final success = await controller.setTorrentDownloadLimit([
      torrent.hash,
    ], limit);
    if (success) {
      showToast(message: '设置成功');
    } else {
      showToast(message: '设置失败');
    }
  }

  void _showSetUploadLimitDialog(BuildContext context) async {
    final limitText = await showMSInputDialog(
      context,
      title: '限制上传速度',
      labelText: '速度限制（KB/s）',
      hintText: '输入 0 表示无限制，留空保持当前设置',
      icon: Icons.upload,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          final limitValue = int.tryParse(value);
          if (limitValue == null) {
            return '请输入有效的数字';
          }
        }
        return null;
      },
    );

    if (limitText == null) return;

    int limit = -1; // 默认无限制
    if (limitText.isNotEmpty) {
      final limitValue = int.tryParse(limitText);
      if (limitValue != null) {
        limit = limitValue > 0 ? limitValue * 1024 : -1; // 转换为字节/秒
      } else {
        showToast(message: '请输入有效的数字');
        return;
      }
    }

    final success = await controller.setTorrentUploadLimit([
      torrent.hash,
    ], limit);
    if (success) {
      showToast(message: '设置成功');
    } else {
      showToast(message: '设置失败');
    }
  }

  void _showDeleteConfirm(BuildContext context, bool deleteFiles) async {
    final confirmed = await showMSConfirmDialog(
      context,
      title: deleteFiles ? '删除种子和文件' : '删除种子',
      message: deleteFiles
          ? '确定要删除种子 "${torrent.name}" 及其所有文件吗？\n\n⚠️ 此操作不可撤销，所有文件将被永久删除。'
          : '确定要删除种子 "${torrent.name}" 吗？\n\n文件将保留在磁盘上，您可以稍后重新添加。',
      confirmText: deleteFiles ? '删除' : '仅删除种子',
      cancelText: '取消',
      icon: deleteFiles ? Icons.delete_forever : Icons.delete_outline,
      isDestructive: true,
    );

    if (confirmed != true) return;

    try {
      await controller.deleteTorrent(torrent.hash, deleteFiles: deleteFiles);
      showToast(message: deleteFiles ? '已删除种子和文件' : '已删除种子');
    } catch (e) {
      showToast(message: '删除失败: ${e.toString()}');
    }
  }

  String _formatETA(int eta) {
    if (eta <= 0) return '未知';
    if (eta < 60) return '$eta秒';
    if (eta < 3600) return '${eta ~/ 60}分钟';
    if (eta < 86400) return '${eta ~/ 3600}小时';
    return '${eta ~/ 86400}天';
  }

  String _formatTimestamp(int timestamp) {
    if (timestamp <= 0) return '未知';
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  String _getPopularityText(double popularity) {
    if (popularity <= 0) return '冷门';
    if (popularity < 0.1) return '普通';
    if (popularity < 0.3) return '热门';
    if (popularity < 0.5) return '🔥 很热';
    return '🔥🔥 超热';
  }

  String _getAvailabilityText(double availability) {
    if (availability < 0) return '不可用';
    if (availability < 0.5) return '可用性低';
    if (availability < 1.0) return '可用';
    return '高可用';
  }

  Color _getStateColor(ColorScheme colorScheme) {
    final state = torrent.state.toLowerCase();

    if (state.contains('error')) {
      // 错误状态使用主题错误色，避免刺眼的纯红
      return colorScheme.error;
    } else if (state.contains('stalled')) {
      // stalledDL / stalledUP：用稍微强一点的次要色，明显但不刺眼
      return colorScheme.secondary;
    } else if (state == 'downloading') {
      // 下载中使用主题主色
      return colorScheme.primary;
    } else if (state == 'seeding' || state == 'uploading') {
      // 做种 / 上传中 使用相同的辅助色
      return colorScheme.tertiary;
    } else if (state == 'paused' || state == 'stopped') {
      // 暂停/停止使用次要文字色
      return colorScheme.onSurfaceVariant;
    }
    // 其他状态统一使用偏弱的次要文字色
    return colorScheme.onSurfaceVariant;
  }

  Color _getStateBackgroundColor() {
    if (torrent.state.contains('error')) {
      return Colors.red.shade50;
    } else if (torrent.state == 'downloading') {
      return Colors.blue.shade50;
    } else if (torrent.state == 'seeding') {
      return Colors.green.shade50;
    } else if (torrent.state == 'paused' || torrent.state == 'stopped') {
      return Colors.orange.shade50;
    }
    return Colors.grey.shade50;
  }

  String _getStateText() {
    switch (torrent.state) {
      case 'downloading':
        return '下载中';
      case 'seeding':
        return '做种';
      case 'paused':
      case 'stopped':
        return '已暂停';
      case 'checking':
        return '检查中';
      default:
        return torrent.state;
    }
  }

  void _showTorrentDetails(BuildContext context) {
    // 如果是 qBittorrent，使用 QbTorrentDetailSheet
    if (controller is QBController) {
      final qbController = controller as QBController;
      // 尝试从 torrents 列表中找到对应的 QBTorrentModel
      final qbTorrent = qbController.torrents.toList().firstWhereOrNull(
        (t) => t.hash == torrent.hash,
      );

      showTorrentDetailSheet(
        context,
        torrent.hash,
        torrent.name,
        torrent: qbTorrent,
        controller: qbController,
      );
      return;
    }

    // 其他下载器类型，显示简化的详情（使用 Modal Bottom Sheet）
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 拖拽指示器
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // 标题栏
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      torrent.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // 详情内容
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('状态', _getStateText()),
                    _buildDetailRow(
                      '进度',
                      '${(torrent.progress * 100).toStringAsFixed(1)}%',
                    ),
                    _buildDetailRow(
                      '下载速度',
                      '${torrent.dlspeed.toHumanReadableFileSize()}/s',
                    ),
                    _buildDetailRow(
                      '上传速度',
                      '${torrent.upspeed.toHumanReadableFileSize()}/s',
                    ),
                    _buildDetailRow(
                      '大小',
                      torrent.size.toHumanReadableFileSize(),
                    ),
                    if (torrent.totalSize > 0)
                      _buildDetailRow(
                        '总大小',
                        torrent.totalSize.toHumanReadableFileSize(),
                      ),
                    if (torrent.eta > 0 && torrent.isDownloading)
                      _buildDetailRow('预计剩余时间', _formatETA(torrent.eta)),
                    _buildDetailRow('分享比率', torrent.ratio.toStringAsFixed(2)),
                    if (torrent.addedOn > 0)
                      _buildDetailRow(
                        '添加时间',
                        _formatTimestamp(torrent.addedOn),
                      ),
                    if (torrent.category.isNotEmpty)
                      _buildDetailRow('分类', torrent.category),
                    if (torrent.tags.isNotEmpty)
                      _buildDetailRow('标签', torrent.tags.join(', ')),
                    if (torrent.savePath.isNotEmpty)
                      _buildDetailRow('保存路径', torrent.savePath),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
