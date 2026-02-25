import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 下载规则项
/// 兼容正常模式（只读）与编辑模式（可拖拽、可开关）
class DownloadRuleEditItem extends StatelessWidget {
  const DownloadRuleEditItem({
    super.key,
    required this.order,
    required this.icon,
    required this.keyValue,
    required this.label,
    this.isEditMode = false,
    this.enabled = true,
    this.onChanged,
  });

  final int order;
  final IconData icon;
  final String keyValue;
  final String label;
  final bool isEditMode;
  final bool enabled;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: isEditMode ? const EdgeInsets.only(bottom: 8) : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: isEditMode
            ? BoxDecoration(
                color: CupertinoColors.secondarySystemGroupedBackground
                    .resolveFrom(context),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: CupertinoColors.separator.resolveFrom(context),
                  width: 0.5,
                ),
              )
            : null,
        child: Row(
          children: [
            if (isEditMode) ...[
              Icon(
                CupertinoIcons.bars,
                size: 20,
                color: CupertinoColors.tertiaryLabel.resolveFrom(context),
              ),
              const SizedBox(width: 12),
            ],
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CupertinoColors.activeBlue.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 18, color: CupertinoColors.activeBlue),
                  Text(
                    '#$order',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: enabled
                          ? CupertinoColors.label.resolveFrom(context)
                          : CupertinoColors.tertiaryLabel.resolveFrom(context),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.tertiarySystemFill.resolveFrom(
                        context,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      keyValue,
                      style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.tertiaryLabel.resolveFrom(
                          context,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isEditMode) ...[
              const SizedBox(width: 12),
              CupertinoSwitch(value: enabled, onChanged: onChanged),
            ],
          ],
        ),
      ),
    );
  }
}
