import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:moviepilot_mobile/modules/search_result/controllers/search_result_controller.dart';
import 'package:moviepilot_mobile/modules/search_result/models/search_result_models.dart';
import 'package:moviepilot_mobile/modules/search_result/widgets/search_result_filter_sheet.dart'
    show
        SearchResultFilterSectionConfig,
        SearchResultFilterSheet,
        chipColorForType;
import 'package:moviepilot_mobile/modules/search_result/widgets/sort_pull_down_widget.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';

class SearchResultPage extends GetView<SearchResultController> {
  const SearchResultPage({super.key, this.scrollController});

  final ScrollController? scrollController;

  static const double _horizontalPadding = 16;
  static const double _cardSpacing = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildNavigationBar(context),
      body: Obx(() {
        final items = controller.visibleItems;
        final isLoading = controller.isLoading.value;
        final errorText = controller.errorText.value;
        final viewMode = controller.viewMode.value;

        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(child: _buildSearchBar(context)),
            SliverToBoxAdapter(child: _buildToolbar(context)),
            if (isLoading && items.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(color: context.primaryColor),
                ),
              )
            else if (errorText != null)
              SliverToBoxAdapter(child: _buildErrorState(context, errorText))
            else if (items.isEmpty)
              SliverToBoxAdapter(child: _buildEmptyState(context))
            else
              _buildResults(context, items, viewMode),
            SliverToBoxAdapter(child: SizedBox(height: _bottomSpacer(context))),
          ],
        );
      }),
    );
  }

  AppBar _buildNavigationBar(BuildContext context) {
    return AppBar(
      title: const Text('搜索结果'),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: controller.toggleViewMode,
          tooltip: '切换视图',
          icon: Obx(() {
            return Icon(
              color: context.primaryColor,
              controller.viewMode.value == SearchResultViewMode.list
                  ? Icons.grid_view_outlined
                  : Icons.view_agenda_outlined,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        _horizontalPadding,
        12,
        _horizontalPadding,
        8,
      ),
      child: CupertinoSearchTextField(
        onSubmitted: controller.updateKeyword,
        placeholder: '搜索标题、描述、站点…',
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        _horizontalPadding,
        0,
        _horizontalPadding,
        8,
      ),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Obx(
              () => SortPullDownWidget<SearchResultSortKey>(
                isAscending:
                    controller.sortDirection.value == SortDirection.asc,
                currentValue: controller.sortKey.value,
                options: SearchResultSortKey.values,
                labelBuilder: _sortLabel,
                onDirectionChanged: (asc) {
                  final want = asc ? SortDirection.asc : SortDirection.desc;
                  if (controller.sortDirection.value != want) {
                    controller.toggleSortDirection();
                  }
                },
                onValueChanged: controller.updateSortKey,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: _buildFilterBar(context)),
            const SizedBox(width: 6),
            _buildFilterButton(context),
          ],
        ),
      ),
    );
  }

  static String _sortLabel(SearchResultSortKey key) {
    switch (key) {
      case SearchResultSortKey.defaultSort:
        return '默认';
      case SearchResultSortKey.site:
        return '站点';
      case SearchResultSortKey.size:
        return '大小';
      case SearchResultSortKey.seeders:
        return '做种数';
      case SearchResultSortKey.pubdate:
        return '发布时间';
    }
  }

  Widget _buildFilterButton(BuildContext context) {
    return Obx(() {
      final hasFilters = controller.hasActiveFilters;
      final accent = context.primaryColor;
      return CupertinoButton(
        padding: const EdgeInsets.all(6),
        minSize: 0,
        pressedOpacity: 0.7,
        onPressed: () => _openFilterSheet(context),
        child: _buildLightChip(
          context,
          isActive: hasFilters,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Icon(
                CupertinoIcons.slider_horizontal_3,
                size: 16,
                color: hasFilters
                    ? accent
                    : CupertinoDynamicColor.resolve(
                        CupertinoColors.tertiaryLabel,
                        context,
                      ),
              ),
              if (hasFilters)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLightChip(
    BuildContext context, {
    required Widget child,
    bool isActive = false,
  }) {
    final baseColor = CupertinoDynamicColor.resolve(
      CupertinoColors.tertiarySystemFill,
      context,
    );
    final activeTint = context.primaryColor.withOpacity(isActive ? 0.2 : 0);
    final bgColor = Color.alphaBlend(activeTint, baseColor);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: isActive
            ? Border.all(color: context.primaryColor.withOpacity(0.3), width: 1)
            : null,
      ),
      child: child,
    );
  }

  Widget _buildCountBadge(BuildContext context, int count, [Color? color]) {
    final c = color ?? context.primaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          color: CupertinoColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
    );
  }

  static const Map<SearchResultFilterType, String> _filterSectionTitles = {
    SearchResultFilterType.site: '站点',
    SearchResultFilterType.season: '季',
    SearchResultFilterType.promotion: '促销状态',
    SearchResultFilterType.videoEncode: '视频编码',
    SearchResultFilterType.quality: '质量',
    SearchResultFilterType.resolution: '分辨率',
    SearchResultFilterType.team: '制作组',
  };

  List<SearchResultFilterSectionConfig> _buildFilterSections() {
    return [
      SearchResultFilterSectionConfig(
        filterType: SearchResultFilterType.site,
        title: _filterSectionTitles[SearchResultFilterType.site]!,
        options: controller.availableSites,
        selected: controller.selectedSites.toSet(),
        onToggle: (v) =>
            controller.toggleFilter(SearchResultFilterType.site, v),
      ),
      SearchResultFilterSectionConfig(
        filterType: SearchResultFilterType.season,
        title: _filterSectionTitles[SearchResultFilterType.season]!,
        options: controller.availableSeasons,
        selected: controller.selectedSeasons.toSet(),
        onToggle: (v) =>
            controller.toggleFilter(SearchResultFilterType.season, v),
      ),
      SearchResultFilterSectionConfig(
        filterType: SearchResultFilterType.promotion,
        title: _filterSectionTitles[SearchResultFilterType.promotion]!,
        options: controller.availablePromotions,
        selected: controller.selectedPromotions.toSet(),
        onToggle: (v) =>
            controller.toggleFilter(SearchResultFilterType.promotion, v),
      ),
      SearchResultFilterSectionConfig(
        filterType: SearchResultFilterType.videoEncode,
        title: _filterSectionTitles[SearchResultFilterType.videoEncode]!,
        options: controller.availableVideoEncodes,
        selected: controller.selectedVideoEncodes.toSet(),
        onToggle: (v) =>
            controller.toggleFilter(SearchResultFilterType.videoEncode, v),
      ),
      SearchResultFilterSectionConfig(
        filterType: SearchResultFilterType.quality,
        title: _filterSectionTitles[SearchResultFilterType.quality]!,
        options: controller.availableQualities,
        selected: controller.selectedQualities.toSet(),
        onToggle: (v) =>
            controller.toggleFilter(SearchResultFilterType.quality, v),
      ),
      SearchResultFilterSectionConfig(
        filterType: SearchResultFilterType.resolution,
        title: _filterSectionTitles[SearchResultFilterType.resolution]!,
        options: controller.availableResolutions,
        selected: controller.selectedResolutions.toSet(),
        onToggle: (v) =>
            controller.toggleFilter(SearchResultFilterType.resolution, v),
      ),
      SearchResultFilterSectionConfig(
        filterType: SearchResultFilterType.team,
        title: _filterSectionTitles[SearchResultFilterType.team]!,
        options: controller.availableTeams,
        selected: controller.selectedTeams.toSet(),
        onToggle: (v) =>
            controller.toggleFilter(SearchResultFilterType.team, v),
      ),
    ];
  }

  Widget _buildFilterBar(BuildContext context) {
    return Obx(() {
      final items = [
        _FilterChipItem(
          filterType: SearchResultFilterType.site,
          label: _filterSectionTitles[SearchResultFilterType.site]!,
          icon: CupertinoIcons.cube_box,
          count: controller.selectedSites.length,
        ),
        _FilterChipItem(
          filterType: SearchResultFilterType.season,
          label: _filterSectionTitles[SearchResultFilterType.season]!,
          icon: CupertinoIcons.tv,
          count: controller.selectedSeasons.length,
        ),
        _FilterChipItem(
          filterType: SearchResultFilterType.promotion,
          label: _filterSectionTitles[SearchResultFilterType.promotion]!,
          icon: CupertinoIcons.tag,
          count: controller.selectedPromotions.length,
        ),
        _FilterChipItem(
          filterType: SearchResultFilterType.videoEncode,
          label: _filterSectionTitles[SearchResultFilterType.videoEncode]!,
          icon: CupertinoIcons.film,
          count: controller.selectedVideoEncodes.length,
        ),
        _FilterChipItem(
          filterType: SearchResultFilterType.quality,
          label: _filterSectionTitles[SearchResultFilterType.quality]!,
          icon: CupertinoIcons.star,
          count: controller.selectedQualities.length,
        ),
        _FilterChipItem(
          filterType: SearchResultFilterType.resolution,
          label: _filterSectionTitles[SearchResultFilterType.resolution]!,
          icon: CupertinoIcons.rectangle,
          count: controller.selectedResolutions.length,
        ),
        _FilterChipItem(
          filterType: SearchResultFilterType.team,
          label: _filterSectionTitles[SearchResultFilterType.team]!,
          icon: CupertinoIcons.person_2,
          count: controller.selectedTeams.length,
        ),
      ];

      return SizedBox(
        height: 32,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildFilterPill(context, item);
          },
          separatorBuilder: (_, __) => const SizedBox(width: 6),
          itemCount: items.length,
        ),
      );
    });
  }

  Widget _buildFilterPill(BuildContext context, _FilterChipItem item) {
    final hasCount = item.count > 0;
    final chipColor = chipColorForType(item.filterType, selected: hasCount);
    final bgColor = hasCount ? chipColor : chipColor.withValues(alpha: 0.12);
    final borderColor = hasCount
        ? chipColor
        : chipColor.withValues(alpha: 0.35);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      pressedOpacity: 0.7,
      onPressed: () => _openFilterSheet(context, item.filterType),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item.icon,
              size: 14,
              color: hasCount ? Colors.white : chipColor,
            ),
            const SizedBox(width: 4),
            Text(
              item.label,
              style: TextStyle(
                color: hasCount ? Colors.white : chipColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (hasCount) ...[
              const SizedBox(width: 4),
              _buildCountBadge(context, item.count, chipColor),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildResults(
    BuildContext context,
    List<SearchResultItem> items,
    SearchResultViewMode mode,
  ) {
    if (mode == SearchResultViewMode.grid) {
      final crossAxisCount = MediaQuery.of(context).size.width >= 520 ? 3 : 2;
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildGridCard(context, items[index]),
            childCount: items.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: _cardSpacing,
            mainAxisSpacing: _cardSpacing,
            childAspectRatio: 0.86,
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: _cardSpacing),
            child: _buildListCard(context, items[index]),
          ),
          childCount: items.length,
        ),
      ),
    );
  }

  Widget _buildListCard(BuildContext context, SearchResultItem item) {
    final meta = item.meta_info;
    final torrent = item.torrent_info;
    final accent = context.primaryColor;
    final title = _displayTitle(item);
    final season = _seasonLabel(item);
    final tags = _buildTags(item);
    final promotion = _promotionBadgeLabel(item);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withOpacity(0.18)),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (season != null) _buildSeasonChip(season, accent: accent),
              if (promotion != null) ...[
                const SizedBox(width: 8),
                _buildPromotionBadge(promotion),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildSiteBadge(_siteName(item)),
              const SizedBox(width: 10),
              if ((torrent?.seeders ?? 0) > 0) ...[
                Icon(
                  Icons.arrow_upward,
                  size: 18,
                  color: Colors.green.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  '${torrent?.seeders ?? 0}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
              const Spacer(),
              _buildSizePill(context, item),
              const SizedBox(width: 6),
              Icon(Icons.info_outline, color: accent),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            torrent?.title ?? meta?.title ?? '',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if ((meta?.subtitle ?? torrent?.description)?.isNotEmpty ??
              false) ...[
            const SizedBox(height: 6),
            Text(
              meta?.subtitle ?? torrent?.description ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.schedule,
                size: 18,
                color: AppTheme.textSecondaryColor,
              ),
              const SizedBox(width: 6),
              Text(
                _timeLabel(item),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondaryColor,
                ),
              ),
            ],
          ),
          if (tags.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(spacing: 8, runSpacing: 8, children: tags),
          ],
        ],
      ),
    );
  }

  Widget _buildGridCard(BuildContext context, SearchResultItem item) {
    final accent = context.primaryColor;
    final title = _displayTitle(item);
    final season = _seasonLabel(item);
    final tags = _buildTags(item, maxCount: 3);
    final promotion = _promotionBadgeLabel(item);
    final torrent = item.torrent_info;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accent.withOpacity(0.18)),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (season != null)
                _buildSeasonChip(season, accent: accent, dense: true),
            ],
          ),
          if (promotion != null) ...[
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: _buildPromotionBadge(promotion, dense: true),
            ),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              _buildSiteBadge(_siteName(item), dense: true),
              const SizedBox(width: 6),
              if ((torrent?.seeders ?? 0) > 0) ...[
                Icon(
                  Icons.arrow_upward,
                  size: 14,
                  color: Colors.green.shade600,
                ),
                const SizedBox(width: 2),
                Text(
                  '${torrent?.seeders ?? 0}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _timeLabel(item),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondaryColor),
          ),
          const Spacer(),
          if (tags.isNotEmpty) Wrap(spacing: 6, runSpacing: 6, children: tags),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: _buildSizePill(context, item, dense: true),
          ),
        ],
      ),
    );
  }

  Widget _buildSiteBadge(String label, {bool dense = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 8 : 10,
        vertical: dense ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: AppTheme.textSecondaryColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: dense ? 11 : 12,
          fontWeight: FontWeight.w600,
          color: AppTheme.textSecondaryColor,
        ),
      ),
    );
  }

  Widget _buildSeasonChip(
    String text, {
    required Color accent,
    bool dense = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 8 : 12,
        vertical: dense ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: accent.withOpacity(0.16),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: accent,
          fontWeight: FontWeight.bold,
          fontSize: dense ? 11 : 12,
        ),
      ),
    );
  }

  Widget _buildSizePill(
    BuildContext context,
    SearchResultItem item, {
    bool dense = false,
  }) {
    final size = item.torrent_info?.size;
    final label = size == null ? '--' : SizeFormatter.formatSize(size, 2);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 10 : 12,
        vertical: dense ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: context.primaryColor.withOpacity(0.14),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: context.primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: dense ? 11 : 12,
        ),
      ),
    );
  }

  List<Widget> _buildTags(SearchResultItem item, {int? maxCount}) {
    final meta = item.meta_info;
    final torrent = item.torrent_info;
    final tags = <String>[
      if ((meta?.resource_type ?? '').isNotEmpty) meta!.resource_type!,
      if ((meta?.resource_pix ?? '').isNotEmpty) meta!.resource_pix!,
      if ((meta?.video_encode ?? '').isNotEmpty) meta!.video_encode!,
      if ((meta?.resource_team ?? '').isNotEmpty) meta!.resource_team!,
      ...?torrent?.labels,
    ];

    final unique = <String>{};
    final result = <Widget>[];
    for (final tag in tags) {
      final cleaned = tag.trim();
      if (cleaned.isEmpty || unique.contains(cleaned)) continue;
      unique.add(cleaned);
      result.add(_buildTagChip(cleaned));
      if (maxCount != null && result.length >= maxCount) break;
    }
    return result;
  }

  Widget _buildTagChip(String text) {
    final color = _tagColor(text);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.16),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPromotionBadge(String text, {bool dense = false}) {
    final color = _promotionColor(text);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 8 : 10,
        vertical: dense ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: dense ? 11 : 12,
        ),
      ),
    );
  }

  Color _tagColor(String text) {
    final palette = [
      const Color(0xFF7C3AED),
      const Color(0xFF2563EB),
      const Color(0xFF059669),
      const Color(0xFFF97316),
      const Color(0xFFDB2777),
      const Color(0xFF0EA5E9),
    ];
    final index = text.codeUnits.fold<int>(0, (a, b) => a + b);
    return palette[index % palette.length];
  }

  String? _promotionBadgeLabel(SearchResultItem item) {
    final torrent = item.torrent_info;
    if (torrent == null) return null;
    final downloadFactor = torrent.downloadvolumefactor;
    if (downloadFactor != null) {
      if (downloadFactor == 0) return '免费';
      if (downloadFactor > 0 && downloadFactor < 1) {
        return '${(downloadFactor * 100).round()}%';
      }
    }
    final volume = torrent.volume_factor ?? '';
    if (volume.contains('%')) return volume;
    if (volume.contains('免费')) return '免费';
    if (torrent.freedate != null && torrent.freedate!.isNotEmpty) return '免费';
    return null;
  }

  Color _promotionColor(String text) {
    if (text.contains('免费')) return const Color(0xFFEF4444);
    return const Color(0xFFF97316);
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(message, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: controller.loadLatest,
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text('暂无搜索结果', style: Theme.of(context).textTheme.bodyMedium),
    );
  }

  String _displayTitle(SearchResultItem item) {
    final meta = item.meta_info;
    return meta?.name?.trim().isNotEmpty == true
        ? meta!.name!.trim()
        : meta?.cn_name?.trim().isNotEmpty == true
        ? meta!.cn_name!.trim()
        : meta?.en_name?.trim().isNotEmpty == true
        ? meta!.en_name!.trim()
        : meta?.title?.trim().isNotEmpty == true
        ? meta!.title!.trim()
        : item.torrent_info?.title ?? '未知标题';
  }

  String? _seasonLabel(SearchResultItem item) {
    final season = item.meta_info?.season_episode?.trim();
    if (season != null && season.isNotEmpty) return season;
    final value = item.meta_info?.begin_season ?? item.meta_info?.total_season;
    if (value != null && value > 0) {
      return 'S${value.toString().padLeft(2, '0')}';
    }
    return null;
  }

  String _siteName(SearchResultItem item) {
    return item.torrent_info?.site_name ?? '未知站点';
  }

  String _timeLabel(SearchResultItem item) {
    final torrent = item.torrent_info;
    final elapsed = torrent?.date_elapsed?.replaceAll('\n', ' ').trim();
    if (elapsed != null && elapsed.isNotEmpty) {
      return elapsed;
    }
    final raw = torrent?.pubdate;
    if (raw == null || raw.isEmpty) return '未知时间';
    final parsed = _parseDate(raw);
    if (parsed == null) return raw;
    final diff = DateTime.now().difference(parsed);
    if (diff.inDays >= 1) return '${diff.inDays}天前';
    if (diff.inHours >= 1) return '${diff.inHours}小时前';
    if (diff.inMinutes >= 1) return '${diff.inMinutes}分钟前';
    return '刚刚';
  }

  DateTime? _parseDate(String raw) {
    final format = DateFormat('yyyy-MM-dd HH:mm:ss');
    try {
      return format.parseUtc(raw).toLocal();
    } catch (_) {
      try {
        return format.parse(raw);
      } catch (_) {
        return null;
      }
    }
  }

  double _bottomSpacer(BuildContext context) {
    return MediaQuery.of(context).padding.bottom + 70;
  }

  Future<void> _openFilterSheet(
    BuildContext context, [
    SearchResultFilterType? filterMode,
  ]) {
    final sheetTitle = '筛选';
    final clearLabel = '清空';
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SizedBox(
          height: MediaQuery.of(sheetContext).size.height * 0.78,
          child: Obx(
            () => SearchResultFilterSheet(
              title: sheetTitle,
              clearLabel: clearLabel,
              onClear: controller.clearFilters,
              sections: _buildFilterSections(),
              filterMode: filterMode,
            ),
          ),
        );
      },
    );
  }
}

class _FilterChipItem {
  const _FilterChipItem({
    required this.filterType,
    required this.label,
    required this.icon,
    required this.count,
  });

  final SearchResultFilterType filterType;
  final String label;
  final IconData icon;
  final int count;
}
