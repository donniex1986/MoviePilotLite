import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/site/models/site_models.dart';

/// 订阅站点多选：以 Sheet 展示，支持仅可订阅站点可选（其余展示但禁止点选）
class SubscribeSitePickerSheet extends StatefulWidget {
  const SubscribeSitePickerSheet({
    super.key,
    required this.sites,
    required this.initialSelectedIds,
    this.selectableIds,
  });

  /// 要展示的站点列表（可为全部站点）
  final List<SiteModel> sites;

  /// 初始已选站点 ID
  final List<int> initialSelectedIds;

  /// 可点选的站点 ID 集合；为 null 表示全部可选
  final Set<int>? selectableIds;

  /// 以 Sheet 形式打开，返回用户确认的已选 ID 列表（取消返回 null）
  static Future<List<int>?> show(
    BuildContext context, {
    required List<SiteModel> sites,
    required List<int> initialSelectedIds,
    Set<int>? selectableIds,
  }) {
    return showModalBottomSheet<List<int>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SubscribeSitePickerSheet(
        sites: sites,
        initialSelectedIds: initialSelectedIds,
        selectableIds: selectableIds,
      ),
    );
  }

  @override
  State<SubscribeSitePickerSheet> createState() =>
      _SubscribeSitePickerSheetState();
}

class _SubscribeSitePickerSheetState extends State<SubscribeSitePickerSheet> {
  late Set<int> _selectedIds;

  bool _isSelectable(SiteModel site) {
    if (widget.selectableIds == null) return true;
    return widget.selectableIds!.contains(site.id);
  }

  List<SiteModel> get _selectableSites =>
      widget.sites.where((s) => _isSelectable(s)).toList();

  void _toggle(int id) {
    final site = widget.sites.where((s) => s.id == id).firstOrNull;
    if (site == null || !_isSelectable(site)) return;
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _selectAll() {
    setState(() {
      for (final s in _selectableSites) {
        _selectedIds.add(s.id);
      }
    });
  }

  void _deselectAll() {
    setState(() {
      for (final s in _selectableSites) {
        _selectedIds.remove(s.id);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIds = Set.from(widget.initialSelectedIds);
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = CupertinoColors.systemGroupedBackground.resolveFrom(
      context,
    );

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.72,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(context),
            _buildHeader(context),
            _buildSelectAllBar(context),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: widget.sites
                      .map((site) => _buildSiteChip(context, site))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: Container(
        width: 36,
        height: 4,
        decoration: BoxDecoration(
          color: CupertinoColors.tertiaryLabel
              .resolveFrom(context)
              .withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              '取消',
              style: TextStyle(
                fontSize: 16,
                color: CupertinoColors.activeBlue.resolveFrom(context),
              ),
            ),
          ),
          const Text(
            '订阅站点',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            onPressed: () =>
                Navigator.of(context).pop(List<int>.from(_selectedIds)),
            child: Text(
              '完成',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.activeBlue.resolveFrom(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectAllBar(BuildContext context) {
    final selectable = _selectableSites;
    if (selectable.isEmpty) return const SizedBox.shrink();
    final blue = CupertinoColors.activeBlue.resolveFrom(context);
    final secondary = CupertinoColors.secondaryLabel.resolveFrom(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            minSize: 0,
            onPressed: () => _selectAll(),
            child: Text('全选', style: TextStyle(fontSize: 15, color: blue)),
          ),
          Container(
            width: 0.5,
            height: 18,
            color: CupertinoColors.separator.resolveFrom(context),
          ),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            minSize: 0,
            onPressed: () => _deselectAll(),
            child: Text(
              '全不选',
              style: TextStyle(fontSize: 15, color: secondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSiteChip(BuildContext context, SiteModel site) {
    final isSelected = _selectedIds.contains(site.id);
    final selectable = _isSelectable(site);
    final blue = CupertinoColors.activeBlue.resolveFrom(context);
    final labelColor = CupertinoColors.label.resolveFrom(context);
    final tertiary = CupertinoColors.tertiaryLabel.resolveFrom(context);
    final separatorColor = CupertinoColors.separator
        .resolveFrom(context)
        .withValues(alpha: 0.6);

    return GestureDetector(
      onTap: selectable ? () => _toggle(site.id) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selectable
              ? (isSelected
                    ? blue.withValues(alpha: 0.12)
                    : CupertinoColors.tertiarySystemFill.resolveFrom(context))
              : CupertinoColors.tertiarySystemFill
                    .resolveFrom(context)
                    .withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selectable
                ? (isSelected ? blue.withValues(alpha: 0.5) : separatorColor)
                : separatorColor,
            width: 0.5,
          ),
        ),
        child: Text(
          site.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: selectable ? (isSelected ? blue : labelColor) : tertiary,
          ),
        ),
      ),
    );
  }
}
