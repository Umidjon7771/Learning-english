// theme.dart

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = FlexThemeData.light(
  scheme: FlexScheme.indigo, // siz xohlagan boshqa sxemani tanlashingiz mumkin
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 9,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: true,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
);

final ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.mandyRed,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: true,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
);
