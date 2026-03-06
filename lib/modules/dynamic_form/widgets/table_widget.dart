import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/utils/vuetify_mappings.dart';
import 'package:moviepilot_mobile/theme/section.dart';
import 'package:moviepilot_mobile/widgets/section_header.dart';

/// 表格区块：移动端以卡片列表展示，每行一条卡片
class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.block, this.actionLoading});

  final TableBlock block;

  /// 行内操作 loading 状态，有则展示 loading 指示器
  final RxBool? actionLoading;

  @override
  Widget build(BuildContext context) {
    final headers = block.headers;
    final rows = block.rows;
    final actions = block.actions;
    final onMoreTap = block.onAction;
    if (headers.isEmpty && rows.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...rows.asMap().entries.map((entry) {
          final row = entry.value;
          return _TableRowCard(
            headers: headers,
            row: row,
            isHeaderRow: false,
            actions: actions,
            onMoreTap: (actionType) => onMoreTap?.call(actionType, entry.key),
            actionLoading: actionLoading,
          );
        }),
      ],
    );
  }
}

class _TableRowCard extends StatelessWidget {
  const _TableRowCard({
    required this.headers,
    required this.row,
    this.isHeaderRow = false,
    this.actions,
    this.onMoreTap,
    this.actionLoading,
  });

  final List<String> headers;
  final List<dynamic> row;
  final bool isHeaderRow;
  final List<InfoCardRowMenuItem>? actions;
  final void Function(String type)? onMoreTap;
  final RxBool? actionLoading;
  Widget _buildItem(
    BuildContext context,
    String? header,
    dynamic value,
    ThemeData theme,
    bool isHeaderRow,
  ) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (header != null)
            Text(
              header,
              style: TextStyle(
                fontSize: 13,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel,
                  context,
                ),
              ),
            )
          else
            Container(
              height: 20,
              width: 5,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildCellContent(context, value, theme, isHeaderRow),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxCol = headers.length > row.length ? headers.length : row.length;
    final value = row.first;
    final realHeaders = headers.sublist(1, maxCol);
    final realValues = row.sublist(1, maxCol);

    return Section(
      separatorBuilder: (context) => Divider(),
      margin: EdgeInsets.zero,
      header: SectionHeader(
        title: value,
        trailing: _buildActions(
          context,
          actions,
          onMoreTap,
          actionLoading: actionLoading,
        ),
      ),
      children: realHeaders.asMap().entries.map((entry) {
        final index = entry.key;
        final header = entry.value;
        final value = realValues[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: _buildItem(context, header, value, theme, isHeaderRow),
        );
      }).toList(),
    );
  }

  Widget _buildActions(
    BuildContext context,
    List<InfoCardRowMenuItem>? actions,
    void Function(String type)? onMoreTap, {
    RxBool? actionLoading,
  }) {
    if (actions == null || actions.isEmpty) {
      return const SizedBox.shrink();
    }
    Widget buildButton({required bool enabled}) => PopupMenuButton<String>(
      onSelected: onMoreTap,
      enabled: enabled,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.zero,
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      offset: const Offset(0, 10),
      itemBuilder: (context) => actions
          .map(
            (e) => PopupMenuItem<String>(
              value: e.events?['type'],
              child: Row(
                children: [
                  Icon(
                    VuetifyMappings.iconFromMdi(e.iconName),
                    size: 16,
                    color: VuetifyMappings.colorFromVuetify(e.iconColor),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    e.label,
                    style: TextStyle(
                      fontSize: 14,
                      color: VuetifyMappings.colorFromVuetify(e.iconColor),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      child: SizedBox(
        width: 24,
        height: 24,
        child: actionLoading != null
            ? Obx(() {
                final loading = actionLoading.value;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.more_vert,
                      color: loading
                          ? Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.5)
                          : Theme.of(context).colorScheme.primary,
                    ),
                    if (loading)
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CupertinoActivityIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                  ],
                );
              })
            : Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.primary,
              ),
      ),
    );

    if (actionLoading != null) {
      return Obx(() => buildButton(enabled: !actionLoading.value));
    }
    return buildButton(enabled: true);
  }

  Widget _buildCellContent(
    BuildContext context,
    dynamic value,
    ThemeData theme,
    bool isHeaderRow,
  ) {
    if (value == null) {
      return Text(
        '—',
        style: TextStyle(
          fontSize: 14,
          fontWeight: isHeaderRow ? FontWeight.w600 : FontWeight.normal,
          color: theme.colorScheme.onSurface,
        ),
      );
    }
    if (value is Map<String, dynamic>) {
      final iconName = value['icon']?.toString();
      final colorName = value['color']?.toString();
      final label = value['label']?.toString();
      final iconData = iconName != null
          ? VuetifyMappings.iconFromMdi(iconName)
          : null;
      final color = colorName != null
          ? VuetifyMappings.colorFromVuetify(colorName)
          : null;
      final effectiveColor = color ?? theme.colorScheme.onSurface;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconData != null) ...[
            Icon(iconData, size: 18, color: effectiveColor),
            const SizedBox(width: 6),
          ],
          if (label != null && label.isNotEmpty)
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isHeaderRow ? FontWeight.w600 : FontWeight.normal,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            )
          else if (iconData == null)
            Text(
              '—',
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
            ),
        ],
      );
    }
    final valueStr = value.toString();
    return Text(
      valueStr.isEmpty ? '—' : valueStr,
      style: TextStyle(
        fontSize: 14,
        fontWeight: isHeaderRow ? FontWeight.w600 : FontWeight.normal,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}
