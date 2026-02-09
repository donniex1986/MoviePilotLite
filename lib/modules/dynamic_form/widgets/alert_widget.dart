import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';

/// 提示条：error / info 等类型 + 文案
class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key, required this.block});

  final AlertBlock block;

  @override
  Widget build(BuildContext context) {
    final isError = block.type.toLowerCase() == 'error';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isError
            ? CupertinoColors.destructiveRed.withValues(alpha: 0.12)
            : CupertinoColors.activeBlue.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isError
                ? CupertinoIcons.exclamationmark_circle_fill
                : CupertinoIcons.info_circle_fill,
            size: 20,
            color: isError
                ? CupertinoColors.destructiveRed
                : CupertinoColors.activeBlue,
          ),
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
}
