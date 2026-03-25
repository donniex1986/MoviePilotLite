import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SettingsSwitchRow extends StatelessWidget {
  const SettingsSwitchRow({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    this.compact = false,
    this.editMode = false,
    required this.value,
    this.onChanged,
  });

  final String title;
  final String? description;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final bool compact;
  final bool editMode;

  final bool value;
  final ValueChanged<bool>? onChanged;

  Widget? _buildLeading(BuildContext context) {
    if (compact || icon == null || editMode) return null;
    final fg = iconColor ?? CupertinoColors.activeBlue;
    final bg = iconBackgroundColor ?? fg.withValues(alpha: 0.15);
    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 14, color: fg),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final showDesc =
        !compact && description != null && description!.isNotEmpty && !editMode;
    final style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: CupertinoColors.secondaryLabel.resolveFrom(context),
    );
    if (showDesc) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 1),
          Text(
            description!,
            style: TextStyle(
              fontSize: 12,
              color: CupertinoColors.tertiaryLabel.resolveFrom(context),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    }
    return Text(
      title,
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    final leading = _buildLeading(context);
    return CupertinoListTile.notched(
      leading: leading,
      title: _buildTitle(context),
      additionalInfo: CupertinoSwitch(
        value: value,
        onChanged: (v) {
          HapticFeedback.lightImpact();
          onChanged?.call(v);
        },
      ),
      leadingToTitle: leading != null ? 8 : 0,
      padding: const EdgeInsetsDirectional.only(
        start: 12,
        end: 16,
        top: 10,
        bottom: 10,
      ),
    );
  }
}
