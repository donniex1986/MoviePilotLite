import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';

/// 页面标题行
class PageHeaderWidget extends StatelessWidget {
  const PageHeaderWidget({super.key, required this.block});

  final PageHeaderBlock block;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            block.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.label,
                context,
              ),
            ),
          ),
          if (block.subtitle != null && block.subtitle!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              block.subtitle!,
              style: TextStyle(
                fontSize: 14,
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel,
                  context,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
