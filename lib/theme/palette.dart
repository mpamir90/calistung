import 'package:flutter/material.dart';

import 'dark_palette.dart';
import 'light_palette.dart';

class Palette {
  final Color primary;
  final Color secondary;
  final Color error;
  final Color surface;
  final Color background;
  final Color divider;
  final Color lightGrey;
  final Color grey;
  final Color lightGreen;
  final Color onPrimary;
  final Color onSecondary;
  final Color onError;
  final Color onSurface;
  final Color onBackground;
  final Brightness brightness;

  const Palette({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.surface,
    required this.background,
    required this.divider,
    required this.lightGrey,
    required this.grey,
    required this.lightGreen,
    required this.onPrimary,
    required this.onSecondary,
    required this.onError,
    required this.onSurface,
    required this.onBackground,
    required this.brightness,
  });

  ColorScheme toColorScheme() {
    return ColorScheme(
      primary: primary,
      primaryContainer: primary,
      secondary: primary,
      secondaryContainer: primary,
      surface: surface,
      background: background,
      error: error,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      brightness: brightness,
    );
  }

  static Palette of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightPalette
        : darkPalette;
  }
}
