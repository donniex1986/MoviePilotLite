import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 与 RxString 双向绑定的 TextField
class ReactiveTextField extends StatefulWidget {
  const ReactiveTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.icon,
    this.obscureText = false,
    this.hintText,
    this.enabled = true,
  });

  final RxString value;
  final ValueChanged<String> onChanged;
  final String? label;
  final IconData? icon;
  final bool obscureText;
  final String? hintText;
  final bool enabled;

  @override
  State<ReactiveTextField> createState() => _ReactiveTextFieldState();
}

class _ReactiveTextFieldState extends State<ReactiveTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.value);
  }

  @override
  void didUpdateWidget(ReactiveTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newVal = widget.value.value;
    if (_controller.text != newVal) {
      _controller.text = newVal;
      _controller.selection = TextSelection.collapsed(offset: newVal.length);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null) ...[
            Text(widget.label!, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).hintColor)),
            const SizedBox(height: 4),
          ],
          TextField(
            controller: _controller,
            onChanged: (v) {
              widget.value.value = v;
              widget.onChanged(v);
            },
            obscureText: widget.obscureText,
            enabled: widget.enabled,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.icon != null ? Icon(widget.icon, size: 20, color: Theme.of(context).hintColor) : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      );
  }
}
