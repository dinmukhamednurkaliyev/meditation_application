import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
abstract final class ApplicationDesign {
  static const palettes = _ColorPalettes();
  static const themes = _ApplicationThemes();
}

@immutable
class _ColorPalettes {
  const _ColorPalettes();
  ColorPalette get light => _ApplicationColorSource.light;
  ColorPalette get dark => _ApplicationColorSource.dark;
}

@immutable
class _ApplicationThemes {
  const _ApplicationThemes();
  ThemeData get light => _ApplicationThemeFactory.light;
  ThemeData get dark => _ApplicationThemeFactory.dark;
}

@immutable
abstract final class _ApplicationColorSource {
  static const light = ColorPalette(
    primary: ColorPair(main: Color(0xFF8E97FD), on: Color(0xFFFFFFFF)),
    secondary: ColorPair(main: Color(0xFF3F414E), on: Color(0xFFFFFFFF)),
    tertiary: ColorPair(main: Color(0xFFEBEAEC), on: Color(0xFFFFFFFF)),
    surface: ColorPair(main: Color(0xFFF5F5F5), on: Color(0xFF1A1A1A)),
    error: ColorPair(main: Color(0xFFB00020), on: Color(0xFFFFFFFF)),
  );

  static const dark = ColorPalette(
    primary: ColorPair(main: Color(0xFF8E97FD), on: Color(0xFFFFFFFF)),
    secondary: ColorPair(main: Color(0xFF3F414E), on: Color(0xFFFFFFFF)),
    tertiary: ColorPair(main: Color(0xFFEBEAEC), on: Color(0xFFFFFFFF)),
    surface: ColorPair(main: Color(0xFF1E1E1E), on: Color(0xFFE0E0E0)),
    error: ColorPair(main: Color(0xFFCF6679), on: Color(0xFF000000)),
  );
}

@immutable
abstract final class _ApplicationThemeFactory {
  static final ThemeData light = _buildThemeData(
    brightness: Brightness.light,
    colors: _ApplicationColorSource.light,
  );

  static final ThemeData dark = _buildThemeData(
    brightness: Brightness.dark,
    colors: _ApplicationColorSource.dark,
  );

  static ThemeData _buildThemeData({
    required Brightness brightness,
    required ColorPalette colors,
  }) {
    final colorScheme = _buildColorSchemeFromPalette(brightness, colors);
    final textTheme = _buildTextThemeFromScheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      extensions: <ThemeExtension<dynamic>>[],
    );
  }

  static ColorScheme _buildColorSchemeFromPalette(
    Brightness brightness,
    ColorPalette colors,
  ) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: colors.primary.main,
      brightness: brightness,
    );
    return colorScheme.copyWith(
      primary: colors.primary.main,
      onPrimary: colors.primary.on,
      secondary: colors.secondary.main,
      onSecondary: colors.secondary.on,
      tertiary: colors.tertiary?.main,
      onTertiary: colors.tertiary?.on,
      surface: colors.surface.main,
      onSurface: colors.surface.on,
      error: colors.error.main,
      onError: colors.error.on,
    );
  }

  static TextTheme _buildTextThemeFromScheme(ColorScheme colorScheme) {
    return GoogleFonts.robotoTextTheme().apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }
}

@immutable
final class ColorPalette {
  final ColorPair primary;
  final ColorPair secondary;
  final ColorPair? tertiary;
  final ColorPair surface;
  final ColorPair error;

  const ColorPalette({
    required this.primary,
    required this.secondary,
    required this.surface,
    required this.error,
    this.tertiary,
  });
}

@immutable
final class ColorPair {
  final Color main;
  final Color on;

  const ColorPair({required this.main, required this.on});
}
