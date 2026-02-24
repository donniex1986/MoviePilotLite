import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/theme/section.dart';

import '../controllers/search_index_controller.dart';
import '../models/search_history.dart';
import '../models/search_suggestion.dart';

class SearchIndexPage extends GetView<SearchIndexController> {
  const SearchIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: _buildBody(context)),
            _buildSearchBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Obx(() {
      final mediaSuggestions = controller.mediaSuggestionItems;
      final siteSuggestions = controller.siteSuggestionItems;
      final historyItems = controller.localHistorySuggestionItems;

      final sections = <Widget>[
        if (mediaSuggestions.isNotEmpty)
          Section(
            child: _buildSuggestionSection(
              context,
              title: '媒体推荐',
              items: mediaSuggestions,
            ),
          ),
        if (siteSuggestions.isNotEmpty)
          Section(
            child: _buildSuggestionSection(
              context,
              title: '站点资源',
              items: siteSuggestions,
            ),
          ),
        if (historyItems.isNotEmpty)
          Section(
            child: _buildSuggestionSection(
              context,
              title: '整理历史',
              items: historyItems,
            ),
          ),
        Section(child: _buildHistorySection(context, controller.histories)),
      ];

      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 200),
        itemCount: sections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, index) => sections[index],
      );
    });
  }

  Widget _buildHistoryChip(SearchHistoryEntry entry) {
    final theme = Get.theme;
    return GestureDetector(
      onTap: () {
        controller.fillKeyword(entry.keyword, focus: true);
        // controller.openMediaSearch(entry.keyword);
      },
      onLongPress: () => controller.removeHistory(entry),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceTint.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(entry.keyword, style: theme.textTheme.bodyMedium),
      ),
    );
  }

  Widget _buildSuggestionSection(
    BuildContext context, {
    required String title,
    required List<SearchSuggestionItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: title),
        const SizedBox(height: 12),
        if (items.isEmpty)
          const _EmptyState(title: '暂无内容', subtitle: '尝试输入其他关键字')
        else
          ...List.generate(items.length * 2 - 1, (index) {
            if (index.isOdd) {
              return const Divider(height: 1);
            }
            final item = items[index ~/ 2];
            return _SuggestionTile(
              item: item,
              onTap: () {
                controller.fillKeyword(item.keyword, focus: false);
                controller.openMediaSearch(item.keyword, suggestion: item);
              },
            );
          }),
      ],
    );
  }

  Widget _buildHistorySection(
    BuildContext context,
    List<SearchHistoryEntry> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: '最近搜索',
          actionLabel: items.isNotEmpty ? '清除' : null,
          onAction: items.isNotEmpty ? controller.clearHistories : null,
        ),
        const SizedBox(height: 12),
        if (items.isEmpty)
          const _EmptyState(title: '暂无搜索记录', subtitle: '开始搜索以建立最近记录')
        else
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: items.map(_buildHistoryChip).toList(),
          ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final viewInset = mediaQuery.viewInsets.bottom;
    final tabBarSpacing = 10.0; // 预留 tabbar 区域
    final bottomPadding = viewInset > 0 ? viewInset + 16 : tabBarSpacing;

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPadding),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: CupertinoSearchTextField(
                    controller: controller.textController,
                    backgroundColor: Colors.transparent,
                    onSubmitted: controller.submit,
                    placeholder: '搜索媒体 / 订阅 / 站点资源',
                    onChanged: (value) {
                      controller.keyword.value = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SuggestionTile extends StatelessWidget {
  const _SuggestionTile({required this.item, required this.onTap});

  final SearchSuggestionItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.bodyLarge!;
    final highlightStyle = titleStyle.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
    );
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _LeadingBadge(label: item.leading ?? ''),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: _highlightSpans(
                        item.title,
                        item.keyword,
                        titleStyle,
                        highlightStyle,
                      ),
                    ),
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              size: 16,
              color: theme.colorScheme.outline,
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _highlightSpans(
    String text,
    String keyword,
    TextStyle base,
    TextStyle highlight,
  ) {
    if (keyword.isEmpty) {
      return [TextSpan(text: text, style: base)];
    }
    final lowerText = text.toLowerCase();
    final lowerKey = keyword.toLowerCase();
    final spans = <TextSpan>[];
    var start = 0;
    var index = lowerText.indexOf(lowerKey);
    if (index == -1) {
      return [TextSpan(text: text, style: base)];
    }
    while (index != -1) {
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index), style: base));
      }
      final matchEnd = index + lowerKey.length;
      spans.add(
        TextSpan(text: text.substring(index, matchEnd), style: highlight),
      );
      start = matchEnd;
      index = lowerText.indexOf(lowerKey, start);
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start), style: base));
    }
    return spans;
  }
}

class _LeadingBadge extends StatelessWidget {
  const _LeadingBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.actionLabel, this.onAction});

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        if (actionLabel != null && onAction != null)
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
