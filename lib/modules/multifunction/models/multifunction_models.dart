import 'package:flutter/material.dart';

enum MultifunctionCardStyle { hero, tall, compact, wide }

enum MultifunctionSectionLayout { mosaic, grouped }

class MultifunctionItem {
  const MultifunctionItem({
    required this.title,
    required this.icon,
    required this.accent,
    required this.style,
    this.subtitle,
    this.badge,
    this.meta,
    this.route,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final Color accent;
  final MultifunctionCardStyle style;
  final String? badge;
  final String? meta;
  final String? route;
}

class MultifunctionSection {
  const MultifunctionSection({
    required this.title,
    required this.items,
    this.layout = MultifunctionSectionLayout.mosaic,
  });

  final String title;
  final List<MultifunctionItem> items;
  final MultifunctionSectionLayout layout;
}
