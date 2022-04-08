import 'package:flutter/material.dart';

import '../../designs.design.dart';

class ThemeUtil {
  static ThemeData lightTheme() => ThemeData().copyWith(
        scaffoldBackgroundColor: LightThemeColors.background,
        brightness: Brightness.light,
        textTheme: const TextTheme().apply(
          bodyColor: LightThemeColors.primary,
        ),
      );

  static ThemeData darkTheme() => ThemeData().copyWith(
        scaffoldBackgroundColor: DarkThemeColors.background,
        brightness: Brightness.dark,
        textTheme: const TextTheme().apply(
          bodyColor: DarkThemeColors.primary,
        ),
      );
}
