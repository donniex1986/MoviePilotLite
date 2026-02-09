import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';

/// Cron 表单项：标签 + 单行文本（value 优先于 block.value，用于受控）
class CronFieldWidget extends StatefulWidget {
  const CronFieldWidget({
    super.key,
    required this.block,
    this.value,
    this.onChanged,
  });

  final CronFieldBlock block;
  final String? value;
  final ValueChanged<String>? onChanged;

  @override
  State<CronFieldWidget> createState() => _CronFieldWidgetState();
}

class _CronFieldWidgetState extends State<CronFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.value ?? widget.block.value,
    );
  }

  @override
  void didUpdateWidget(CronFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final v = widget.value ?? widget.block.value;
    if (v != _controller.text) _controller.text = v;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.block.label,
            style: TextStyle(
              fontSize: 14,
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.secondaryLabel,
                context,
              ),
            ),
          ),
          const SizedBox(height: 8),
          CupertinoTextField(
            controller: _controller,
            placeholder: widget.block.hint ?? '0 0 * * *',
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.tertiarySystemFill,
                context,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
