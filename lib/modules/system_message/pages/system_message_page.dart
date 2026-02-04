import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/widgets/cached_image.dart';
import 'package:moviepilot_mobile/utils/open_url.dart';

import '../controllers/system_message_controller.dart';
import '../models/system_message.dart';

class SystemMessagePage extends GetView<SystemMessageController> {
  const SystemMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('系统消息')),
      body: SafeArea(
        child: Obx(() {
          final items = controller.messages;
          if (items.isEmpty) {
            return Column(
              children: [
                Expanded(
                  child: CupertinoButton(
                    onPressed: controller.loadMore,
                    child: const Center(
                      child: Text(
                        '暂无系统消息, 点击刷新',
                        style: TextStyle(color: CupertinoColors.systemBlue),
                      ),
                    ),
                  ),
                ),
                _buildInputBar(controller),
              ],
            );
          }

          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: controller.scrollController,
                  slivers: [
                    CupertinoSliverRefreshControl(
                      onRefresh: controller.loadMore,
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(12),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final message = items[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _buildMessageCard(message),
                          );
                        }, childCount: items.length),
                      ),
                    ),
                    if (!controller.hasMore.value)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: Text(
                              '没有更多了',
                              style: TextStyle(
                                fontSize: 12,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              _buildInputBar(controller),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildMessageCard(SystemMessage message) {
    final hasImage = message.image.trim().length > 1;
    final isUserText = message.action == 0 && message.text.trim().isNotEmpty;
    if (isUserText) {
      return _buildUserTextCard(message);
    }
    if (hasImage) {
      return _buildPosterCard(message);
    }
    if (message.note.isNotEmpty) {
      return _buildNoteCard(message);
    }
    return _buildTextCard(message);
  }

  Widget _buildUserTextCard(SystemMessage message) {
    final time = DateFormat('MM-dd HH:mm').format(message.regTime);
    final text = message.text.trim();
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBlue,
                borderRadius: BorderRadius.circular(14),
              ),
              child: _buildSelectableText(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.45,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(
                fontSize: 11,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextCard(SystemMessage message) {
    final time = DateFormat('MM-dd HH:mm').format(message.regTime);
    final meta = _extractMeta(message.text);
    final body = message.text.trim();
    return Section(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBlue.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  CupertinoIcons.bell,
                  size: 18,
                  color: CupertinoColors.systemBlue,
                ),
              ),
              const SizedBox(width: 8),
              _buildTypeChip(message.mtype),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.systemBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildSelectableText(
            message.title.trim(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          if (meta.isNotEmpty) _buildMetaRow(meta),
          if (meta.isNotEmpty) const SizedBox(height: 8),
          if (body.isNotEmpty)
            _buildSelectableText(
              body,
              style: const TextStyle(
                fontSize: 13,
                height: 1.45,
                color: CupertinoColors.systemGrey,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPosterCard(SystemMessage message) {
    final time = DateFormat('MM-dd HH:mm').format(message.regTime);
    final meta = _extractMeta(message.text);
    final body = message.text.trim();
    return Section(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: SizedBox(
              height: 220,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildPosterCover(message.image),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xB3000000)],
                        stops: [0.4, 1],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSelectableText(
                          message.title.trim(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            _buildTypeChip(
                              message.mtype,
                              background: Colors.white.withOpacity(0.18),
                              textColor: Colors.white,
                              borderColor: Colors.white.withOpacity(0.35),
                            ),
                            const Spacer(),
                            Text(
                              time,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (meta.isNotEmpty) _buildMetaRow(meta),
                if (meta.isNotEmpty) const SizedBox(height: 8),
                if (body.isNotEmpty)
                  _buildSelectableText(
                    body,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.45,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteCard(SystemMessage message) {
    final time = DateFormat('MM-dd HH:mm').format(message.regTime);
    final items = message.note;
    final primary = items.isNotEmpty ? items.first : null;
    final endIndex = items.length > 3 ? 3 : items.length;
    final secondary = items.length > 1
        ? items.sublist(1, endIndex)
        : const <SystemMessageNote>[];
    final siteName = primary?.siteName ?? '';
    final title = primary?.title ?? '';
    final description = primary?.description ?? '';
    final size = _formatBytes(primary?.size ?? 0);
    final seeders = primary?.seeders ?? 0;
    final peers = primary?.peers ?? 0;
    final grabs = primary?.grabs ?? 0;
    final pubdate = primary?.pubdate ?? '';
    final labels = primary?.labels ?? const <String>[];
    final messageTitle = message.title.trim();
    final noteTitle = title.trim();
    final noteDescription = description.trim();
    return Section(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemPurple.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  CupertinoIcons.sparkles,
                  size: 18,
                  color: CupertinoColors.systemPurple,
                ),
              ),
              const SizedBox(width: 8),
              _buildTypeChip(
                message.mtype.isEmpty ? '搜索' : message.mtype,
                background: CupertinoColors.systemPurple.withOpacity(0.12),
                textColor: CupertinoColors.systemPurple,
              ),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (messageTitle.isNotEmpty)
            _buildSelectableText(
              messageTitle,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (noteTitle.isNotEmpty) const SizedBox(height: 10),
          if (noteTitle.isNotEmpty)
            _buildSelectableText(
              noteTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          if (noteDescription.isNotEmpty) const SizedBox(height: 8),
          if (noteDescription.isNotEmpty)
            _buildSelectableText(
              noteDescription,
              style: const TextStyle(
                fontSize: 12,
                height: 1.45,
                color: CupertinoColors.systemGrey,
              ),
            ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if (siteName.isNotEmpty)
                _buildMetaChip(
                  '站点：$siteName',
                  color: CupertinoColors.activeGreen,
                ),
              if (size.isNotEmpty) _buildMetaChip('大小：$size'),
              if (seeders > 0) _buildMetaChip('做种：$seeders'),
              if (peers > 0) _buildMetaChip('下载：$peers'),
              if (grabs > 0) _buildMetaChip('完成：$grabs'),
              if (pubdate.isNotEmpty) _buildMetaChip('发布：$pubdate'),
              ...labels.take(3).map(_buildMetaChip),
            ],
          ),
          if (secondary.isNotEmpty) const SizedBox(height: 10),
          if (secondary.isNotEmpty)
            Column(
              children: secondary
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            CupertinoIcons.circle_fill,
                            size: 6,
                            color: CupertinoColors.systemGrey2,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: _buildSelectableText(
                              item.title ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildPosterCover(String url) {
    if (url.isEmpty) {
      return Container(
        color: CupertinoColors.systemGrey4,
        child: const Icon(
          CupertinoIcons.photo,
          color: CupertinoColors.white,
          size: 42,
        ),
      );
    }
    return CachedImage(imageUrl: url, fit: BoxFit.cover);
  }

  Widget _buildTypeChip(
    String type, {
    Color? background,
    Color? textColor,
    Color? borderColor,
  }) {
    final baseColor = textColor ?? CupertinoColors.systemBlue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: background ?? baseColor.withOpacity(0.16),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor ?? baseColor.withOpacity(0.45)),
      ),
      child: Text(
        type.isEmpty ? '消息' : type,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: baseColor,
        ),
      ),
    );
  }

  Widget _buildMetaRow(List<String> meta) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: meta.asMap().entries.map((entry) {
        final text = entry.value;
        return _buildMetaChip(
          text,
          color: _pickMetaColor(text) ?? _pickChipColor(text, entry.key),
        );
      }).toList(),
    );
  }

  Widget _buildMetaChip(String text, {Color? color}) {
    final baseColor = color ?? CupertinoColors.systemBlue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(0.14),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: baseColor.withOpacity(0.35)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: baseColor,
        ),
      ),
    );
  }

  Widget _buildSelectableText(
    String text, {
    required TextStyle style,
    TextAlign? textAlign,
  }) {
    return SelectableText(
      text,
      style: style,
      textAlign: textAlign,
      contextMenuBuilder: (context, editableTextState) {
        final selection = editableTextState.currentTextEditingValue.selection;
        final selectedText =
            selection.textInside(editableTextState.textEditingValue.text);
        final url = _extractUrl(selectedText);
        final items = editableTextState.contextMenuButtonItems.toList();
        if (url != null) {
          items.add(
            ContextMenuButtonItem(
              label: '打开链接',
              onPressed: () {
                editableTextState.hideToolbar();
                WebUtil.open(url: url);
              },
            ),
          );
        }
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: editableTextState.contextMenuAnchors,
          buttonItems: items,
        );
      },
    );
  }

  Widget _buildInputBar(SystemMessageController controller) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              controller: controller.inputController,
              placeholder: '输入消息内容',
              minLines: 1,
              maxLines: 3,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CupertinoColors.systemGrey4),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Obx(
            () => CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              onPressed: controller.isSending.value
                  ? null
                  : controller.sendMessage,
              child: controller.isSending.value
                  ? const CupertinoActivityIndicator(radius: 8)
                  : const Icon(
                      CupertinoIcons.paperplane,
                      color: CupertinoColors.systemBlue,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _extractMeta(String text) {
    final meta = <String>[];
    final lines = text.split('\n');
    for (final line in lines) {
      final parts = line.split('：');
      if (parts.length < 2) continue;
      final key = parts.first.trim();
      final value = parts.sublist(1).join('：').trim();
      if (value.isEmpty) continue;
      if (['站点', '质量', '大小', '评分', '类型', '类别', '标签'].contains(key)) {
        meta.add('$key：$value');
      }
      if (meta.length >= 3) break;
    }
    return meta;
  }

  String _formatBytes(int bytes) {
    if (bytes <= 0) return '';
    const k = 1024;
    if (bytes < k) return '$bytes B';
    if (bytes < k * k) return '${(bytes / k).toStringAsFixed(1)} KB';
    if (bytes < k * k * k) {
      return '${(bytes / (k * k)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (k * k * k)).toStringAsFixed(2)} GB';
  }

  Color _pickChipColor(String text, int index) {
    const palette = [
      CupertinoColors.systemBlue,
      CupertinoColors.systemPurple,
      CupertinoColors.systemTeal,
      CupertinoColors.systemIndigo,
      CupertinoColors.systemGreen,
      CupertinoColors.systemOrange,
      CupertinoColors.systemPink,
    ];
    final hash = text.codeUnits.fold(0, (sum, unit) => sum + unit);
    return palette[(hash + index) % palette.length];
  }

  Color? _pickMetaColor(String text) {
    if (text.startsWith('站点')) return CupertinoColors.systemBlue;
    if (text.startsWith('大小')) return CupertinoColors.systemGreen;
    if (text.startsWith('做种')) return CupertinoColors.systemOrange;
    if (text.startsWith('下载')) return CupertinoColors.systemPurple;
    if (text.startsWith('完成')) return CupertinoColors.systemTeal;
    if (text.startsWith('发布')) return CupertinoColors.systemIndigo;
    if (text.startsWith('评分')) return CupertinoColors.systemPink;
    if (text.startsWith('类型')) return CupertinoColors.systemPurple;
    if (text.startsWith('类别')) return CupertinoColors.systemTeal;
    if (text.startsWith('标签')) return CupertinoColors.systemOrange;
    return null;
  }

  String? _extractUrl(String text) {
    final match = RegExp(
      r'(https?:\/\/\S+|www\.\S+)',
      caseSensitive: false,
    ).firstMatch(text);
    if (match == null) return null;
    var url = match.group(0) ?? '';
    url = url.replaceAll(RegExp(r'[)\],.;:]+$'), '');
    return url.isEmpty ? null : url;
  }
}
