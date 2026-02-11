import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/site/controllers/site_controller.dart';
import 'package:moviepilot_mobile/modules/site/models/site_models.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

class SearchMidSheet extends StatefulWidget {
  const SearchMidSheet({
    super.key,
    required this.searchKey,
    this.title,
    this.year,
    this.season,
    this.mtype,
  });
  final String searchKey;
  final String? title;
  final String? year;
  final String? season;
  final String? mtype;
  @override
  State<SearchMidSheet> createState() => _SearchMidSheetState();
}

class _SearchMidSheetState extends State<SearchMidSheet> {
  final siteController = Get.put(SiteController());
  final selectedSite = <int>[].obs;
  final area = 'title'.obs;

  void _performSearch() {
    if (selectedSite.isEmpty) {
      ToastUtil.error('请选择至少一个站点');
      return;
    }
    var params = {
      'mediaSearchKey': widget.searchKey,
      'area': area.value,
      'sites': selectedSite.join(','),
      'year': widget.year ?? '',

      'mtype': widget.mtype ?? 'movie',
      'title': widget.title ?? '',
    };
    if (widget.season != null && widget.season!.isNotEmpty) {
      params['season'] = widget.season!;
    }
    // 关闭 bottom sheet
    Get.offAndToNamed('/search-media-result', parameters: params);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      child: Column(
        children: [
          // 顶部操作栏
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  style: IconButton.styleFrom(
                    foregroundColor: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Obx(
                    () => Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: _buildSegmentTab(
                              theme,
                              'title',
                              '标题',
                              area.value == 'title',
                            ),
                          ),
                          Expanded(
                            child: _buildSegmentTab(
                              theme,
                              'imdb',
                              'IMDB',
                              area.value == 'imdb',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Obx(
                  () => FilledButton(
                    onPressed: selectedSite.isEmpty ? null : _performSearch,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      minimumSize: const Size(0, 36),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: selectedSite.isEmpty
                          ? null
                          : theme.colorScheme.primary,
                    ),
                    child: Text(
                      '搜索',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 轻量化的选择信息栏
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.4,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Obx(
                      () => Text(
                        '已选择 ${selectedSite.length}/${siteController.items.length} 个站点',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        if (selectedSite.length ==
                            siteController.items.length) {
                          selectedSite.clear();
                        } else {
                          selectedSite.assignAll(
                            siteController.items.map((e) => e.site.id),
                          );
                        }
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              selectedSite.length == siteController.items.length
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              size: 16,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              selectedSite.length == siteController.items.length
                                  ? '清空'
                                  : '全选',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Obx(
                () => GridView.builder(
                  itemCount: siteController.items.length,
                  itemBuilder: (context, index) {
                    final item = siteController.items[index];
                    return _buildSiteItem(context, item);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 44,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentTab(
    ThemeData theme,
    String value,
    String label,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          area.value = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSiteItem(BuildContext context, SiteItem item) {
    final theme = Theme.of(context);
    return Obx(() {
      final isSelected = selectedSite.contains(item.site.id);

      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (isSelected) {
              selectedSite.remove(item.site.id);
            } else {
              selectedSite.add(item.site.id);
            }
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.colorScheme.primary.withValues(alpha: 0.5)
                  : theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline.withValues(alpha: 0.2),
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  size: 18,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    item.site.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected
                          ? theme.colorScheme.onPrimaryContainer
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
