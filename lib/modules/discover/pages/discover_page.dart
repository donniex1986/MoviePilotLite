import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/discover/controllers/discover_controller.dart';
import 'package:moviepilot_mobile/modules/discover/defines/discover_filter_defines.dart';
import 'package:moviepilot_mobile/modules/discover/models/discover_filters.dart';
import 'package:moviepilot_mobile/modules/discover/widgets/discover_filter_sheet.dart';
import 'package:moviepilot_mobile/modules/recommend/models/recommend_api_item.dart';
import 'package:moviepilot_mobile/modules/recommend/widgets/recommend_item_card.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({super.key, this.scrollController});

  final ScrollController? scrollController;

  static const double _gridSpacing = 12;
  static const double _gridPadding = 16;
  static const double _cardAspectRatio = 1 / 1.4;

  Color _accentColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.ensureUserCookieRefreshed();
    });
    return Scaffold(
      appBar: _buildNavigationBar(context),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(child: Obx(() => _buildFilterSummary(context))),
          SliverToBoxAdapter(child: Obx(() => _buildSection(context))),
          SliverToBoxAdapter(child: SizedBox(height: _bottomSpacer(context))),
        ],
      ),
    );
  }

  double _bottomSpacer(BuildContext context) {
    return 100;
  }

  AppBar _buildNavigationBar(BuildContext context) {
    return AppBar(
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: const Icon(Icons.explore_outlined),
      ),
      title: const Text(
        'Discover',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
    );
  }

  Widget _buildFilterSummary(BuildContext context) {
    final source = controller.selectedSource.value;
    final filters = controller.filters.value;
    final summary = _buildSummaryText(source, filters);
    final parts = _summaryParts(summary);
    final accent = _accentColor(context);
    final visibleParts = parts.take(4).toList();
    final remaining = parts.length - visibleParts.length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: InkWell(
        onTap: () => _openFilterSheet(context),
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppTheme.borderColor.withOpacity(0.4)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.tune, size: 18, color: accent),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      if (visibleParts.isEmpty)
                        _buildSummaryChip(context, summary)
                      else ...[
                        for (final part in visibleParts)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: _buildSummaryChip(context, part),
                          ),
                        if (remaining > 0)
                          _buildSummaryChip(context, '+$remaining'),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right, size: 18, color: accent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context) {
    final items = controller.currentItems();
    final isLoading = controller.isLoading();
    final errorText = controller.errorText();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, title: '探索结果'),
        if (items.isEmpty && isLoading)
          _buildLoadingGrid(context)
        else if (items.isEmpty && errorText != null)
          _buildEmptyRail(context, errorText)
        else if (items.isEmpty)
          _buildEmptyRail(context, '暂无数据')
        else
          _buildItemsGrid(context, items),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, {required String title}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: _accentColor(context),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: () => controller.loadCurrent(forceRefresh: true),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                children: [
                  Text(
                    '刷新',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: _accentColor(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.refresh, size: 18, color: _accentColor(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsGrid(BuildContext context, List<RecommendApiItem> items) {
    final layout = _gridLayout(context);
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: _gridPadding),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: layout.crossAxisCount,
        crossAxisSpacing: _gridSpacing,
        mainAxisSpacing: 16,
        childAspectRatio: _cardAspectRatio,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return RecommendItemCard(
          item: item,
          width: layout.cardWidth,
          onTap: () => _openDetail(item),
        );
      },
    );
  }

  Widget _buildLoadingGrid(BuildContext context) {
    final layout = _gridLayout(context);
    final placeholderCount = layout.crossAxisCount * 3;
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: _gridPadding),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: placeholderCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: layout.crossAxisCount,
        crossAxisSpacing: _gridSpacing,
        mainAxisSpacing: 16,
        childAspectRatio: _cardAspectRatio,
      ),
      itemBuilder: (context, index) =>
          RecommendItemCard.placeholder(width: layout.cardWidth),
    );
  }

  Widget _buildEmptyRail(BuildContext context, String message) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 120,
      child: Center(
        child: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppTheme.textSecondaryColor,
          ),
        ),
      ),
    );
  }

  Future<void> _openFilterSheet(BuildContext context) async {
    final result = await showModalBottomSheet<DiscoverFilterSelection>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => DiscoverFilterSheet(
        initialSource: controller.selectedSource.value,
        filtersBySource: controller.snapshotFiltersBySource(),
      ),
    );
    if (result == null) return;
    controller.applySelection(result.selectedSource, result.filtersBySource);
  }

  String _buildSummaryText(DiscoverSource source, DiscoverFilters filters) {
    switch (source) {
      case DiscoverSource.tmdb:
        return _joinSummary([
          source.label,
          _fallbackText(filters.mediaType, '全部类型'),
          _labelForSort(_tmdbSortLabels(filters.mediaType), filters.sortBy),
          _formatListWithOptions(
            filters.selectedGenres,
            _tmdbGenreOptions(filters.mediaType),
            '全部风格',
          ),
          _formatListWithOptions(
            filters.selectedLanguages,
            DiscoverFilterDefines.tmdbLanguageOptions,
            '全部语言',
          ),
          _formatRating(filters.voteAverage),
        ]);
      case DiscoverSource.douban:
        return _joinSummary([
          source.label,
          _fallbackText(filters.mediaType, '全部类型'),
          _labelForSort(DiscoverFilterDefines.doubanSortLabels, filters.sortBy),
          _formatListWithOptions(
            filters.selectedGenres,
            DiscoverFilterDefines.doubanGenreOptions,
            '全部风格',
          ),
          _formatListWithOptions(
            filters.selectedRegions,
            DiscoverFilterDefines.regionOptions,
            '全部地区',
          ),
          _labelForOptionValue(
            filters.selectedDecade,
            DiscoverFilterDefines.decadeOptions,
            '全部年代',
          ),
        ]);
      case DiscoverSource.bangumi:
        return _joinSummary([
          source.label,
          _fallbackText(filters.bangumiCategory, '全部类别'),
          _labelForSort(
            DiscoverFilterDefines.bangumiSortLabels,
            filters.sortBy,
          ),
          _fallbackText(filters.bangumiYear, '全部年份'),
        ]);
    }
  }

  String _labelForSort(Map<String, String> labels, String value) {
    return labels[value] ?? value;
  }

  Map<String, String> _tmdbSortLabels(String mediaType) {
    return _isTvType(mediaType)
        ? DiscoverFilterDefines.tmdbTvSortLabels
        : DiscoverFilterDefines.tmdbMovieSortLabels;
  }

  List<DiscoverFilterOption> _tmdbGenreOptions(String mediaType) {
    return _isTvType(mediaType)
        ? DiscoverFilterDefines.tmdbTvGenreOptions
        : DiscoverFilterDefines.tmdbMovieGenreOptions;
  }

  bool _isTvType(String mediaType) {
    final normalized = mediaType.trim();
    if (normalized.isEmpty) return false;
    return normalized == '电视剧';
  }

  String _formatListWithOptions(
    List<String> values,
    List<DiscoverFilterOption> options,
    String emptyLabel,
  ) {
    if (values.isEmpty) return emptyLabel;
    final labels = _labelsForValues(values, options);
    if (labels.length <= 2) return labels.join('、');
    return '${labels.take(2).join('、')}等${labels.length}项';
  }

  List<String> _labelsForValues(
    List<String> values,
    List<DiscoverFilterOption> options,
  ) {
    final map = {for (final option in options) option.value: option.label};
    return values.map((value) => map[value] ?? value).toList();
  }

  String _labelForOptionValue(
    String value,
    List<DiscoverFilterOption> options,
    String emptyLabel,
  ) {
    if (value.isEmpty) return emptyLabel;
    for (final option in options) {
      if (option.value == value) return option.label;
    }
    return value;
  }

  String _formatRating(int value) {
    if (value <= 0) return '评分不限';
    return '${value}分+';
  }

  String _fallbackText(String value, String fallback) {
    return value.isEmpty ? fallback : value;
  }

  String _joinSummary(List<String> parts) {
    return parts.where((part) => part.isNotEmpty).join(' · ');
  }

  List<String> _summaryParts(String summary) {
    return summary
        .split(' · ')
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .toList();
  }

  Widget _buildSummaryChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.4),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppTheme.textSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _openDetail(RecommendApiItem item) {
    final path = _buildMediaPath(item);
    if (path == null) {
      ToastUtil.info('暂无可用详情信息');
      return;
    }
    final title = _bestTitle(item);
    final params = <String, String>{
      'path': path,
      if (title != null && title.isNotEmpty) 'title': title,
      if (item.year != null && item.year!.isNotEmpty) 'year': item.year!,
      if (item.type != null && item.type!.isNotEmpty) 'type_name': item.type!,
    };
    Get.toNamed('/media-detail', parameters: params);
  }

  String? _bestTitle(RecommendApiItem item) {
    final title = item.title;
    if (title != null && title.trim().isNotEmpty) return title.trim();
    final enTitle = item.en_title;
    if (enTitle != null && enTitle.trim().isNotEmpty) return enTitle.trim();
    final original = item.original_title ?? item.original_name;
    if (original != null && original.trim().isNotEmpty) {
      return original.trim();
    }
    return null;
  }

  String? _buildMediaPath(RecommendApiItem item) {
    final prefix = item.mediaid_prefix;
    final mediaId = item.media_id;
    if (prefix != null &&
        prefix.isNotEmpty &&
        mediaId != null &&
        mediaId.isNotEmpty) {
      return '$prefix:$mediaId';
    }
    final tmdbId = item.tmdb_id;
    if (tmdbId != null && tmdbId.isNotEmpty) {
      return 'tmdb:$tmdbId';
    }
    final doubanId = item.douban_id;
    if (doubanId != null && doubanId.isNotEmpty) {
      return 'douban:$doubanId';
    }
    final bangumiId = item.bangumi_id;
    if (bangumiId != null && bangumiId.isNotEmpty) {
      return 'bangumi:$bangumiId';
    }
    return null;
  }

  _GridLayout _gridLayout(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width >= 520 ? 4 : 2;
    final available =
        width - (_gridPadding * 2) - (_gridSpacing * (crossAxisCount - 1));
    final cardWidth = available / crossAxisCount;
    return _GridLayout(crossAxisCount: crossAxisCount, cardWidth: cardWidth);
  }
}

class _GridLayout {
  const _GridLayout({required this.crossAxisCount, required this.cardWidth});

  final int crossAxisCount;
  final double cardWidth;
}
