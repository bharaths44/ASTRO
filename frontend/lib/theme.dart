import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff004063),
      surfaceTint: Color(0xff29638d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2a648e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4e6072),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd2e6fb),
      onSecondaryContainer: Color(0xff384b5c),
      tertiary: Color(0xff522d60),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff785086),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfff8f9fd),
      onBackground: Color(0xff191c1f),
      surface: Color(0xfff8f9fd),
      onSurface: Color(0xff191c1f),
      surfaceVariant: Color(0xffdde3eb),
      onSurfaceVariant: Color(0xff41474e),
      outline: Color(0xff71787f),
      outlineVariant: Color(0xffc1c7cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3134),
      inverseOnSurface: Color(0xfff0f0f4),
      inversePrimary: Color(0xff97ccfb),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001d31),
      primaryFixedDim: Color(0xff97ccfb),
      onPrimaryFixedVariant: Color(0xff004b73),
      secondaryFixed: Color(0xffd1e5fa),
      onSecondaryFixed: Color(0xff091d2c),
      secondaryFixedDim: Color(0xffb5c9dd),
      onSecondaryFixedVariant: Color(0xff36495a),
      tertiaryFixed: Color(0xfff9d8ff),
      onTertiaryFixed: Color(0xff2e093d),
      tertiaryFixedDim: Color(0xffe6b6f4),
      onTertiaryFixedVariant: Color(0xff5e386c),
      surfaceDim: Color(0xffd9dade),
      surfaceBright: Color(0xfff8f9fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3f7),
      surfaceContainer: Color(0xffedeef1),
      surfaceContainerHigh: Color(0xffe7e8ec),
      surfaceContainerHighest: Color(0xffe1e2e6),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff004063),
      surfaceTint: Color(0xff29638d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2a648e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff324556),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff647789),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff522d60),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff785086),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff8f9fd),
      onBackground: Color(0xff191c1f),
      surface: Color(0xfff8f9fd),
      onSurface: Color(0xff191c1f),
      surfaceVariant: Color(0xffdde3eb),
      onSurfaceVariant: Color(0xff3d434a),
      outline: Color(0xff596067),
      outlineVariant: Color(0xff757b83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3134),
      inverseOnSurface: Color(0xfff0f0f4),
      inversePrimary: Color(0xff97ccfb),
      primaryFixed: Color(0xff4379a4),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff26608a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff647789),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4b5e70),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8f659d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff754d83),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd9dade),
      surfaceBright: Color(0xfff8f9fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3f7),
      surfaceContainer: Color(0xffedeef1),
      surfaceContainerHigh: Color(0xffe7e8ec),
      surfaceContainerHighest: Color(0xffe1e2e6),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff00243b),
      surfaceTint: Color(0xff29638d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00476d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff102433),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff324556),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff361144),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5a3468),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff8f9fd),
      onBackground: Color(0xff191c1f),
      surface: Color(0xfff8f9fd),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdde3eb),
      onSurfaceVariant: Color(0xff1e252b),
      outline: Color(0xff3d434a),
      outlineVariant: Color(0xff3d434a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3134),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffdeeeff),
      primaryFixed: Color(0xff00476d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002f4b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff324556),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1b2e3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5a3468),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff411d50),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd9dade),
      surfaceBright: Color(0xfff8f9fd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3f7),
      surfaceContainer: Color(0xffedeef1),
      surfaceContainerHigh: Color(0xffe7e8ec),
      surfaceContainerHighest: Color(0xffe1e2e6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xff97ccfb),
      surfaceTint: Color(0xff97ccfb),
      onPrimary: Color(0xff003351),
      primaryContainer: Color(0xff004a73),
      onPrimaryContainer: Color(0xffc7e3ff),
      secondary: Color(0xffb5c9dd),
      onSecondary: Color(0xff1f3242),
      secondaryContainer: Color(0xff2d3f50),
      onSecondaryContainer: Color(0xffc0d3e8),
      tertiary: Color(0xffe6b6f4),
      onTertiary: Color(0xff452154),
      tertiaryContainer: Color(0xff5e386c),
      onTertiaryContainer: Color(0xfff8d5ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff111416),
      onBackground: Color(0xffe1e2e6),
      surface: Color(0xff111416),
      onSurface: Color(0xffe1e2e6),
      surfaceVariant: Color(0xff41474e),
      onSurfaceVariant: Color(0xffc1c7cf),
      outline: Color(0xff8b9199),
      outlineVariant: Color(0xff41474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e6),
      inverseOnSurface: Color(0xff2e3134),
      inversePrimary: Color(0xff29638d),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001d31),
      primaryFixedDim: Color(0xff97ccfb),
      onPrimaryFixedVariant: Color(0xff004b73),
      secondaryFixed: Color(0xffd1e5fa),
      onSecondaryFixed: Color(0xff091d2c),
      secondaryFixedDim: Color(0xffb5c9dd),
      onSecondaryFixedVariant: Color(0xff36495a),
      tertiaryFixed: Color(0xfff9d8ff),
      onTertiaryFixed: Color(0xff2e093d),
      tertiaryFixedDim: Color(0xffe6b6f4),
      onTertiaryFixedVariant: Color(0xff5e386c),
      surfaceDim: Color(0xff111416),
      surfaceBright: Color(0xff37393c),
      surfaceContainerLowest: Color(0xff0c0e11),
      surfaceContainerLow: Color(0xff191c1f),
      surfaceContainer: Color(0xff1d2023),
      surfaceContainerHigh: Color(0xff282a2d),
      surfaceContainerHighest: Color(0xff323538),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9cd0ff),
      surfaceTint: Color(0xff97ccfb),
      onPrimary: Color(0xff001829),
      primaryContainer: Color(0xff6196c2),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb9cde2),
      onSecondary: Color(0xff031827),
      secondaryContainer: Color(0xff8093a6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeabaf8),
      onTertiary: Color(0xff280338),
      tertiaryContainer: Color(0xffad81bb),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111416),
      onBackground: Color(0xffe1e2e6),
      surface: Color(0xff111416),
      onSurface: Color(0xfffafafe),
      surfaceVariant: Color(0xff41474e),
      onSurfaceVariant: Color(0xffc5cbd4),
      outline: Color(0xff9da3ab),
      outlineVariant: Color(0xff7d848b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e6),
      inverseOnSurface: Color(0xff282a2d),
      inversePrimary: Color(0xff034c75),
      primaryFixed: Color(0xffcce5ff),
      onPrimaryFixed: Color(0xff001321),
      primaryFixedDim: Color(0xff97ccfb),
      onPrimaryFixedVariant: Color(0xff00395a),
      secondaryFixed: Color(0xffd1e5fa),
      onSecondaryFixed: Color(0xff001321),
      secondaryFixedDim: Color(0xffb5c9dd),
      onSecondaryFixedVariant: Color(0xff253848),
      tertiaryFixed: Color(0xfff9d8ff),
      onTertiaryFixed: Color(0xff220031),
      tertiaryFixedDim: Color(0xffe6b6f4),
      onTertiaryFixedVariant: Color(0xff4c275a),
      surfaceDim: Color(0xff111416),
      surfaceBright: Color(0xff37393c),
      surfaceContainerLowest: Color(0xff0c0e11),
      surfaceContainerLow: Color(0xff191c1f),
      surfaceContainer: Color(0xff1d2023),
      surfaceContainerHigh: Color(0xff282a2d),
      surfaceContainerHighest: Color(0xff323538),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9fbff),
      surfaceTint: Color(0xff97ccfb),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9cd0ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff9fbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb9cde2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeabaf8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111416),
      onBackground: Color(0xffe1e2e6),
      surface: Color(0xff111416),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff41474e),
      onSurfaceVariant: Color(0xfff9fbff),
      outline: Color(0xffc5cbd4),
      outlineVariant: Color(0xffc5cbd4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e6),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002d47),
      primaryFixed: Color(0xffd5e9ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9cd0ff),
      onPrimaryFixedVariant: Color(0xff001829),
      secondaryFixed: Color(0xffd5e9fe),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb9cde2),
      onSecondaryFixedVariant: Color(0xff031827),
      tertiaryFixed: Color(0xfffadeff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffeabaf8),
      onTertiaryFixedVariant: Color(0xff280338),
      surfaceDim: Color(0xff111416),
      surfaceBright: Color(0xff37393c),
      surfaceContainerLowest: Color(0xff0c0e11),
      surfaceContainerLow: Color(0xff191c1f),
      surfaceContainer: Color(0xff1d2023),
      surfaceContainerHigh: Color(0xff282a2d),
      surfaceContainerHighest: Color(0xff323538),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  /// Custom Color
  static const customColor = ExtendedColor(
    seed: Color(0xff3f7ec7),
    value: Color(0xff3f7ec7),
    light: ColorFamily(
      color: Color(0xff005193),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff3676bf),
      onColorContainer: Color(0xffffffff),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff005193),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff3676bf),
      onColorContainer: Color(0xffffffff),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff005193),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff3676bf),
      onColorContainer: Color(0xffffffff),
    ),
    dark: ColorFamily(
      color: Color(0xffa3c9ff),
      onColor: Color(0xff00315d),
      colorContainer: Color(0xff3475bd),
      onColorContainer: Color(0xffffffff),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffa3c9ff),
      onColor: Color(0xff00315d),
      colorContainer: Color(0xff3475bd),
      onColorContainer: Color(0xffffffff),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffa3c9ff),
      onColor: Color(0xff00315d),
      colorContainer: Color(0xff3475bd),
      onColorContainer: Color(0xffffffff),
    ),
  );

  List<ExtendedColor> get extendedColors => [
        customColor,
      ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
