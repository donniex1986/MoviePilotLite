import 'package:flutter/cupertino.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';

/// 多行文本表单项（value 优先于 block.value，用于受控）
class TextAreaFieldWidget extends StatefulWidget {
  const TextAreaFieldWidget({
    super.key,
    required this.block,
    this.value,
    this.onChanged,
  });

  final TextAreaBlock block;
  final String? value;
  final ValueChanged<String>? onChanged;

  @override
  State<TextAreaFieldWidget> createState() => _TextAreaFieldWidgetState();
}

class _TextAreaFieldWidgetState extends State<TextAreaFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.value ?? widget.block.value,
    );
  }

  @override
  void didUpdateWidget(TextAreaFieldWidget oldWidget) {
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
            placeholder: widget.block.hint,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.tertiarySystemFill,
                context,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            maxLines: widget.block.rows.clamp(2, 10),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
