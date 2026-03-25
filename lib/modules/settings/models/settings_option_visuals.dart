import 'package:flutter/material.dart';

class SettingsOptionVisual {
  const SettingsOptionVisual({this.icon, this.asset, this.color});

  final IconData? icon;
  final String? asset;
  final Color? color;
}

const Map<String, Map<String, SettingsOptionVisual>> settingsOptionVisuals = {
  'WALLPAPER': {
    'tmdb': SettingsOptionVisual(icon: Icons.movie_outlined),
    'bing': SettingsOptionVisual(icon: Icons.image_outlined),
    'mediaserver': SettingsOptionVisual(icon: Icons.dns_outlined),
    'custom': SettingsOptionVisual(icon: Icons.link_outlined),
    'none': SettingsOptionVisual(icon: Icons.block_outlined),
  },
  'RECOGNIZE_SOURCE': {
    'themoviedb': SettingsOptionVisual(icon: Icons.public_outlined),
    'douban': SettingsOptionVisual(icon: Icons.local_movies_outlined),
  },
  'SEARCH_SOURCE': {
    'themoviedb': SettingsOptionVisual(icon: Icons.public_outlined),
    'douban': SettingsOptionVisual(icon: Icons.local_movies_outlined),
    'bangumi': SettingsOptionVisual(icon: Icons.tv_outlined),
  },
  'SCRAP_SOURCE': {
    'themoviedb': SettingsOptionVisual(icon: Icons.public_outlined),
    'douban': SettingsOptionVisual(icon: Icons.local_movies_outlined),
  },
  'LLM_PROVIDER': {
    'deepseek': SettingsOptionVisual(icon: Icons.psychology_alt_outlined),
    'openai': SettingsOptionVisual(icon: Icons.auto_awesome_outlined),
    'google': SettingsOptionVisual(icon: Icons.cloud_outlined),
  },
};

Widget? buildSettingsOptionLeading(
  BuildContext context,
  String enumKey,
  String value,
) {
  final visual = settingsOptionVisuals[enumKey]?[value.toLowerCase()];
  if (visual == null) return null;
  if (visual.asset != null) {
    return Image.asset(
      visual.asset!,
      width: 18,
      height: 18,
      fit: BoxFit.contain,
    );
  }
  if (visual.icon != null) {
    return Icon(
      visual.icon,
      size: 18,
      color: visual.color ?? Theme.of(context).colorScheme.primary,
    );
  }
  return null;
}
