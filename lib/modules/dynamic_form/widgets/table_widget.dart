import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';

/// 表格区块：移动端以卡片列表展示，每行一条卡片
class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.block});

  final TableBlock block;

  @override
  Widget build(BuildContext context) {
    final headers = block.headers;
    final rows = block.rows;
    if (headers.isEmpty && rows.isEmpty) {
      return const SizedBox.shrink();
    }
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...rows.asMap().entries.map((entry) {
            final index = entry.key;
            final row = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < rows.length - 1 ? 12 : 0,
              ),
              child: _TableRowCard(
                headers: headers,
                row: row,
                isHeaderRow: false,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TableRowCard extends StatelessWidget {
  const _TableRowCard({
    required this.headers,
    required this.row,
    this.isHeaderRow = false,
  });

  final List<String> headers;
  final List<dynamic> row;
  final bool isHeaderRow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = <Widget>[];
    final maxCol = headers.length > row.length ? headers.length : row.length;

    for (var i = 0; i < maxCol; i++) {
      final header = i < headers.length ? headers[i] : '列 ${i + 1}';
      final value = i < row.length ? row[i] : '—';
      final valueStr = value == null ? '—' : value.toString();
      items.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  header,
                  style: TextStyle(
                    fontSize: 13,
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.secondaryLabel,
                      context,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  valueStr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isHeaderRow
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }
}
