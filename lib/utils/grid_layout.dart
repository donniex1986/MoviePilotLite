import 'package:flutter/material.dart';

class GridLayout {
  const GridLayout({required this.crossAxisCount, required this.cardWidth});

  final int crossAxisCount;
  final double cardWidth;
}

GridLayout gridLayout(BuildContext context, {double gridSpacing = 8, double gridPadding = 16}) {
  final width = MediaQuery.of(context).size.width;
  final crossAxisCount = width >= 520 ? 4 : 2;
  final available =
      width - (gridPadding * 2) - (gridSpacing * (crossAxisCount - 1));
  final cardWidth = available / crossAxisCount;
  return GridLayout(crossAxisCount: crossAxisCount, cardWidth: cardWidth);
}
