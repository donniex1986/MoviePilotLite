import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';

/// 提示条：error / info 等类型 + 文案
class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key, required this.block});

  final AlertBlock block;

  @override
  Widget build(BuildContext context) {
    final (bgColor, fgColor, icon) = _resolveStyle();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: fgColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              block.text,
              style: TextStyle(
                fontSize: 14,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.label,
                  context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  (Color bg, Color fg, IconData icon) _resolveStyle() {
    switch (block.type.toLowerCase()) {
      case 'error':
        return (
          CupertinoColors.destructiveRed.withValues(alpha: 0.12),
          CupertinoColors.destructiveRed,
          CupertinoIcons.exclamationmark_circle_fill,
        );
      case 'success':
        return (
          const Color(0xFF4CAF50).withValues(alpha: 0.12),
          const Color(0xFF4CAF50),
          CupertinoIcons.checkmark_circle_fill,
        );
      case 'warning':
        return (
          const Color(0xFFFF9800).withValues(alpha: 0.12),
          const Color(0xFFFF9800),
          CupertinoIcons.exclamationmark_triangle_fill,
        );
      default:
        return (
          CupertinoColors.activeBlue.withValues(alpha: 0.12),
          CupertinoColors.activeBlue,
          CupertinoIcons.info_circle_fill,
        );
    }
  }
}
