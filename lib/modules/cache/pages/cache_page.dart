import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/utils/open_url.dart';
import 'package:moviepilot_mobile/utils/size_formatter.dart';

import '../controllers/cache_controller.dart';
import '../models/cache_model.dart';
import '../widgets/site_filter_sheet.dart';

class CachePage extends GetView<CacheController> {
  const CachePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('缓存管理'),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => _buildBody(context, controller)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() => _buildFloatingBar(context, controller)),
    );
  }

  Widget _buildBody(BuildContext context, CacheController controller) {
    final items = controller.filteredItems;
    final hasData = controller.cacheResponse.value != null;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildFilterBar(context, controller)),
        if (controller.errorText.value != null)
          SliverToBoxAdapter(
            child: Text(
              controller.errorText.value!,
              style: const TextStyle(
                color: CupertinoColors.systemRed,
                fontSize: 12,
              ),
            ),
          ),
        if (controller.isLoading.value && !hasData)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CupertinoActivityIndicator()),
          )
        else if (items.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                controller.hasFilter ? '没有匹配的缓存' : '暂无缓存数据',
                style: const TextStyle(color: CupertinoColors.systemGrey),
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(8, 6, 8, 96),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final isFirst = index == 0;
                final isLast = index == items.length - 1;
                return _buildSectionItem(
                  context,
                  items[index],
                  isFirst: isFirst,
                  isLast: isLast,
                );
              }, childCount: items.length),
            ),
          ),
      ],
    );
  }

  Widget _buildFilterBar(BuildContext context, CacheController controller) {
    final fieldColor = CupertinoDynamicColor.resolve(
      CupertinoColors.systemGrey6,
      context,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoSearchTextField(
        controller: controller.keywordController,
        placeholder: '搜索标题、描述或资源信息',
        backgroundColor: fieldColor,
        onChanged: controller.updateKeyword,
      ),
    );
  }

  Widget _buildFloatingBar(BuildContext context, CacheController controller) {
    final sites = controller.siteOptions;
    final selectedSite = controller.selectedSiteLabel;
    final selectedCount = controller.selectedSites.length;
    final total = controller.totalCount;
    final siteCount = controller.siteCount;
    final filtered = controller.filteredItems.length;
    final siteActive = controller.hasSiteFilter;
    final siteColor = siteActive
        ? CupertinoColors.systemBlue
        : CupertinoColors.systemGrey;
    const pillHeight = 42.0;

    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Row(
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: sites.isEmpty
                  ? null
                  : () => _showSiteSelector(context, controller, sites),
              child: _buildFrostedPill(
                context,
                height: pillHeight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                isActive: siteActive,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.collections,
                      size: 16,
                      color: siteColor,
                    ),
                    const SizedBox(width: 6),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 90),
                      child: Text(
                        selectedSite,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11, color: siteColor),
                      ),
                    ),
                    if (selectedCount > 1) ...[
                      const SizedBox(width: 6),
                      _buildCountBadge(selectedCount),
                    ],
                    const SizedBox(width: 4),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 14,
                      color: siteColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildFrostedPill(
                context,
                height: pillHeight,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '总量 $total',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '站点 $siteCount'
                      '${controller.hasFilter ? ' · 筛选 $filtered' : ''}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            _buildActionGroup(context, controller, pillHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildFrostedPill(
    BuildContext context, {
    required Widget child,
    required EdgeInsets padding,
    double? height,
    bool isActive = false,
  }) {
    final baseColor = CupertinoDynamicColor.resolve(
      CupertinoColors.systemBackground,
      context,
    );
    final activeTint = Theme.of(context).colorScheme.primary.withOpacity(0.2);
    final glassColor = Color.alphaBlend(activeTint, baseColor);

    final pill = ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(padding: padding, color: glassColor, child: child),
      ),
    );
    if (height == null) return pill;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CupertinoColors.systemGrey.withOpacity(0.1)),
      ),
      child: SizedBox(height: height, child: pill),
    );
  }

  Widget _buildCountBadge(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBlue.withOpacity(0.18),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          fontSize: 10,
          color: CupertinoColors.systemBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildActionGroup(
    BuildContext context,
    CacheController controller,
    double pillHeight,
  ) {
    return Builder(
      builder: (buttonContext) {
        final isOpen = controller.showActions.value;
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            if (isOpen) {
              Navigator.of(buttonContext).maybePop();
              return;
            }
            _showActionMenu(buttonContext, controller);
          },
          child: _buildFrostedPill(
            context,
            height: pillHeight,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            isActive: isOpen,
            child: Icon(
              isOpen ? CupertinoIcons.xmark : CupertinoIcons.ellipsis,
              size: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
        );
      },
    );
  }

  Future<void> _showActionMenu(
    BuildContext buttonContext,
    CacheController controller,
  ) async {
    controller.showActions.value = true;
    final overlay = Overlay.of(buttonContext);
    if (overlay == null) return;
    final overlayBox = overlay.context.findRenderObject() as RenderBox?;
    final buttonBox = buttonContext.findRenderObject() as RenderBox?;
    if (overlayBox == null || buttonBox == null) return;

    const menuWidth = 170.0;
    const menuItemHeight = 44.0;
    const menuSpacing = 8.0;
    final menuHeight = menuItemHeight * 2 + 1;

    final position = buttonBox.localToGlobal(Offset.zero, ancestor: overlayBox);
    final size = buttonBox.size;
    final overlaySize = overlayBox.size;

    double left = position.dx + size.width - menuWidth;
    left = left.clamp(12.0, overlaySize.width - menuWidth - 12.0);
    final safeTop = MediaQuery.of(buttonContext).padding.top + 12;
    double top = position.dy - menuHeight - menuSpacing;
    if (top < safeTop) {
      top = position.dy + size.height + menuSpacing;
    }

    await showCupertinoModalPopup<void>(
      context: buttonContext,
      barrierDismissible: true,
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: Stack(
            children: [
              Positioned(
                left: left,
                top: top,
                child: _buildActionMenuCard(
                  context,
                  width: menuWidth,
                  itemHeight: menuItemHeight,
                  onRefresh: () {
                    Navigator.of(context).pop();
                    controller.fetchCache();
                  },
                  onClear: () {
                    Navigator.of(context).pop();
                    controller.clearFilters();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (buttonContext.mounted) {
      controller.closeActions();
    }
  }

  Widget _buildActionMenuCard(
    BuildContext context, {
    required double width,
    required double itemHeight,
    required VoidCallback onRefresh,
    required VoidCallback onClear,
  }) {
    final background = CupertinoDynamicColor.resolve(
      CupertinoColors.systemBackground,
      context,
    ).withOpacity(0.95);
    final dividerColor = CupertinoDynamicColor.resolve(
      CupertinoColors.separator,
      context,
    ).withOpacity(0.35);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: background,
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMenuItem(
                context,
                height: itemHeight,
                icon: CupertinoIcons.refresh,
                label: '刷新缓存',
                onTap: onRefresh,
              ),
              Container(height: 1, color: dividerColor),
              _buildMenuItem(
                context,
                height: itemHeight,
                icon: CupertinoIcons.clear,
                label: '清空筛选',
                onTap: onClear,
                isDestructive: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required double height,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    final color = CupertinoDynamicColor.resolve(
      isDestructive ? CupertinoColors.systemRed : CupertinoColors.label,
      context,
    );
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 10),
            Text(label, style: TextStyle(fontSize: 14, color: color)),
          ],
        ),
      ),
    );
  }

  void _showSiteSelector(
    BuildContext context,
    CacheController controller,
    List<String> sites,
  ) {
    controller.closeActions();
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return SiteFilterSheet(
          sites: sites,
          selected: Set<String>.from(controller.selectedSites),
          onApply: controller.updateSelectedSites,
        );
      },
    );
  }

  Widget _buildCacheItem(
    BuildContext context,
    CacheItem item, {
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 6,
      vertical: 10,
    ),
  }) {
    final title = _titleFor(item);
    final description = item.description?.trim() ?? '';
    final size = SizeFormatter.formatSize(item.size, 2);
    final date = _formatPubDate(item.pubdate);
    final site = _siteLabel(item) ?? '未知站点';
    final domain = item.domain?.trim();
    final siteLabel = domain != null && domain.isNotEmpty && domain != site
        ? '$site · $domain'
        : site;
    final accentColor = _siteColor(site);
    const posterWidth = 84.0;
    const posterHeight = 118.0;

    final tags = <_TagItem>[];
    if (item.mediaType != null && item.mediaType!.trim().isNotEmpty) {
      tags.add(_TagItem(item.mediaType!.trim(), _TagType.type));
    }
    if (item.mediaYear != null && item.mediaYear!.trim().isNotEmpty) {
      tags.add(_TagItem(item.mediaYear!.trim(), _TagType.year));
    }
    if (item.seasonEpisode != null && item.seasonEpisode!.trim().isNotEmpty) {
      tags.add(_TagItem(item.seasonEpisode!.trim(), _TagType.season));
    }
    if (item.resourceTerm != null && item.resourceTerm!.trim().isNotEmpty) {
      tags.add(_TagItem(item.resourceTerm!.trim(), _TagType.quality));
    }

    final link = (item.pageUrl?.trim().isNotEmpty ?? false)
        ? item.pageUrl
        : item.enclosure;

    return GestureDetector(
      onTap: link != null ? () => WebUtil.open(url: link) : null,
      child: Container(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 2,
              height: posterHeight,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            _buildPoster(
              item.posterPath ?? item.backdropPath,
              width: posterWidth,
              height: posterHeight,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _buildTagChip(context, site, _TagType.site),
                      if (domain != null &&
                          domain.isNotEmpty &&
                          domain != site) ...[
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            domain,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ),
                      ] else if (domain == null || domain.isEmpty) ...[
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            siteLabel,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (tags.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: tags
                          .map(
                            (tag) =>
                                _buildTagChip(context, tag.label, tag.type),
                          )
                          .toList(),
                    ),
                  ],
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.systemGrey2,
                      ),
                    ),
                  ],
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.time,
                        size: 12,
                        color: CupertinoColors.systemGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        CupertinoIcons.arrow_down_circle,
                        size: 12,
                        color: CupertinoColors.systemGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        size,
                        style: const TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.systemGrey,
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
    );
  }

  Widget _buildSectionItem(
    BuildContext context,
    CacheItem item, {
    required bool isFirst,
    required bool isLast,
  }) {
    final background = Theme.of(context).cardColor;
    final dividerColor = CupertinoDynamicColor.resolve(
      CupertinoColors.separator,
      context,
    ).withOpacity(0.35);

    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.vertical(
          top: isFirst ? const Radius.circular(12) : Radius.zero,
          bottom: isLast ? const Radius.circular(12) : Radius.zero,
        ),
      ),
      child: Column(
        children: [
          _buildCacheItem(context, item),
          if (!isLast)
            Container(
              height: 0.5,
              color: dividerColor,
              margin: const EdgeInsets.only(left: 12),
            ),
        ],
      ),
    );
  }

  Widget _buildPoster(String? url, {double width = 72, double height = 102}) {
    final placeholder = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        CupertinoIcons.photo,
        size: 22,
        color: CupertinoColors.systemGrey2,
      ),
    );

    if (url == null || url.isEmpty) {
      return placeholder;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => placeholder,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey5,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: CupertinoActivityIndicator(radius: 8)),
          );
        },
      ),
    );
  }

  Widget _buildTagChip(BuildContext context, String label, _TagType type) {
    final baseColor = _tagColor(context, type);
    final bgColor = baseColor.withOpacity(0.16);
    final textColor = baseColor.withOpacity(0.9);
    final borderColor = baseColor.withOpacity(0.35);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _tagColor(BuildContext context, _TagType type) {
    final map = <_TagType, Color>{
      _TagType.site: CupertinoColors.systemBlue,
      _TagType.type: CupertinoColors.systemTeal,
      _TagType.year: CupertinoColors.systemPurple,
      _TagType.season: CupertinoColors.systemOrange,
      _TagType.quality: CupertinoColors.systemGreen,
    };
    return CupertinoDynamicColor.resolve(map[type]!, context);
  }

  Color _siteColor(String label) {
    final palette = [
      CupertinoColors.systemBlue,
      CupertinoColors.systemTeal,
      CupertinoColors.systemGreen,
      CupertinoColors.systemOrange,
      CupertinoColors.systemPink,
      CupertinoColors.systemPurple,
    ];
    final hash = label.codeUnits.fold<int>(0, (p, c) => p + c);
    return palette[hash % palette.length];
  }

  String _formatPubDate(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '未知时间';
    final trimmed = raw.trim();
    final normalized = trimmed.contains('T')
        ? trimmed
        : trimmed.replaceFirst(' ', 'T');
    final parsed = DateTime.tryParse(normalized);
    if (parsed == null) return trimmed;
    return DateFormat('yyyy-MM-dd HH:mm').format(parsed);
  }

  String _titleFor(CacheItem item) {
    final title = item.title?.trim();
    if (title != null && title.isNotEmpty) return title;
    final media = item.mediaName?.trim();
    if (media != null && media.isNotEmpty) return media;
    return '未知标题';
  }

  String? _siteLabel(CacheItem item) {
    final site = item.siteName?.trim();
    if (site != null && site.isNotEmpty) return site;
    final domain = item.domain?.trim();
    if (domain != null && domain.isNotEmpty) return domain;
    return null;
  }
}

enum _TagType { site, type, year, season, quality }

class _TagItem {
  const _TagItem(this.label, this.type);

  final String label;
  final _TagType type;
}
