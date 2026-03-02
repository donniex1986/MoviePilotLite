import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    this.child,
    this.header,
    this.scrollController,
    this.builder,
  });
  final Widget? child;
  final Widget? header;
  final DraggableScrollableController? scrollController;
  final Widget Function(
    BuildContext context,
    ScrollController scrollController,
  )?
  builder;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = theme.scaffoldBackgroundColor;
    return DraggableScrollableSheet(
      controller: scrollController,
      snap: true,
      snapSizes: const [0.5, 0.7, 0.8],
      initialChildSize: 0.7,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      expand: false,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(color: cardColor),
        child: Column(
          children: [
            if (header != null) header!,
            Divider(height: 1, color: theme.dividerColor),
            if (builder != null)
              Expanded(child: builder!(context, scrollController))
            else
              Expanded(child: child ?? const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
