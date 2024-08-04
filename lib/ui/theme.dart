import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283456402),
      surfaceTint: Color(4283456402),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292796927),
      onPrimaryContainer: Color(4278785611),
      secondary: Color(4286731539),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294958520),
      onSecondaryContainer: Color(4280948480),
      tertiary: Color(4283128978),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292600319),
      onTertiaryContainer: Color(4278261579),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282795599),
      outline: Color(4285953664),
      outlineVariant: Color(4291216848),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290364415),
      primaryFixed: Color(4292796927),
      onPrimaryFixed: Color(4278785611),
      primaryFixedDim: Color(4290364415),
      onPrimaryFixedVariant: Color(4281877369),
      secondaryFixed: Color(4294958520),
      onSecondaryFixed: Color(4280948480),
      secondaryFixedDim: Color(4294490993),
      onSecondaryFixedVariant: Color(4284825088),
      tertiaryFixed: Color(4292600319),
      onTertiaryFixed: Color(4278261579),
      tertiaryFixedDim: Color(4290037247),
      onTertiaryFixedVariant: Color(4281549944),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293124585),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281614196),
      surfaceTint: Color(4283456402),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284969386),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284496640),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288440872),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281286772),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284576426),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282532427),
      outline: Color(4284374631),
      outlineVariant: Color(4286216835),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290364415),
      primaryFixed: Color(4284969386),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283324560),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4288440872),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4286534161),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284576426),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282997391),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293124585),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279311698),
      surfaceTint: Color(4283456402),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281614196),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281605376),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284496640),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278787666),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281286772),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280427307),
      outline: Color(4282532427),
      outlineVariant: Color(4282532427),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4293585663),
      primaryFixed: Color(4281614196),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280100957),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284496640),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282525440),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281286772),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279642717),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293124585),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290364415),
      surfaceTint: Color(4290364415),
      onPrimary: Color(4280364129),
      primaryContainer: Color(4281877369),
      onPrimaryContainer: Color(4292796927),
      secondary: Color(4294490993),
      onSecondary: Color(4282853888),
      secondaryContainer: Color(4284825088),
      onSecondaryContainer: Color(4294958520),
      tertiary: Color(4290037247),
      onTertiary: Color(4279971168),
      tertiaryContainer: Color(4281549944),
      onTertiaryContainer: Color(4292600319),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279374616),
      onSurface: Color(4293124585),
      onSurfaceVariant: Color(4291216848),
      outline: Color(4287664282),
      outlineVariant: Color(4282795599),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inversePrimary: Color(4283456402),
      primaryFixed: Color(4292796927),
      onPrimaryFixed: Color(4278785611),
      primaryFixedDim: Color(4290364415),
      onPrimaryFixedVariant: Color(4281877369),
      secondaryFixed: Color(4294958520),
      onSecondaryFixed: Color(4280948480),
      secondaryFixedDim: Color(4294490993),
      onSecondaryFixedVariant: Color(4284825088),
      tertiaryFixed: Color(4292600319),
      onTertiaryFixed: Color(4278261579),
      tertiaryFixedDim: Color(4290037247),
      onTertiaryFixedVariant: Color(4281549944),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290758911),
      surfaceTint: Color(4290364415),
      onPrimary: Color(4278390598),
      primaryContainer: Color(4286811592),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294819701),
      onSecondary: Color(4280488704),
      secondaryContainer: Color(4290545218),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290431487),
      onTertiary: Color(4278194752),
      tertiaryContainer: Color(4286484424),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294769407),
      onSurfaceVariant: Color(4291545812),
      outline: Color(4288848556),
      outlineVariant: Color(4286743180),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inversePrimary: Color(4282008698),
      primaryFixed: Color(4292796927),
      onPrimaryFixed: Color(4278192703),
      primaryFixedDim: Color(4290364415),
      onPrimaryFixedVariant: Color(4280758887),
      secondaryFixed: Color(4294958520),
      onSecondaryFixed: Color(4280028672),
      secondaryFixedDim: Color(4294490993),
      onSecondaryFixedVariant: Color(4283379456),
      tertiaryFixed: Color(4292600319),
      onTertiaryFixed: Color(4278193717),
      tertiaryFixedDim: Color(4290037247),
      onTertiaryFixedVariant: Color(4280365927),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294769407),
      surfaceTint: Color(4290364415),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290758911),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966007),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294819701),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294769407),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290431487),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294769407),
      outline: Color(4291545812),
      outlineVariant: Color(4291545812),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inversePrimary: Color(4279903578),
      primaryFixed: Color(4293125631),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290758911),
      onPrimaryFixedVariant: Color(4278390598),
      secondaryFixed: Color(4294959812),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294819701),
      onSecondaryFixedVariant: Color(4280488704),
      tertiaryFixed: Color(4292994815),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290431487),
      onTertiaryFixedVariant: Color(4278194752),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
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
