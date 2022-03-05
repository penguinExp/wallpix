import 'package:flutter/material.dart';

import '../colors/dark.colors.util.dart';
import '../colors/light.colors.util.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        scaffoldBackgroundColor: LightColorUtil.primeryBg,
        // colorScheme: const ColorScheme(
        //   brightness: Brightness.light,
        //   primary: LightColorUtil.primery,
        //   onPrimary: LightColorUtil.primery,
        //   secondary: LightColorUtil.secBg,
        //   onSecondary: LightColorUtil.secBg,
        //   error: LightColorUtil.error,
        //   onError: LightColorUtil.error,
        //   background: LightColorUtil.primeryBg,
        //   onBackground: LightColorUtil.secBg,
        //   surface: LightColorUtil.secBg,
        //   onSurface: LightColorUtil.secBg,
        // ),
        textTheme: const TextTheme().apply(
          displayColor: LightColorUtil.primery,
          bodyColor: LightColorUtil.primery,
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        scaffoldBackgroundColor: DarkColorUtil.primeryBg,
        // colorScheme: const ColorScheme(
        //   brightness: Brightness.dark,
        //   primary: DarkColorUtil.primery,
        //   onPrimary: DarkColorUtil.primery,
        //   secondary: DarkColorUtil.secBg,
        //   onSecondary: DarkColorUtil.secBg,
        //   error: DarkColorUtil.error,
        //   onError: DarkColorUtil.error,
        //   background: DarkColorUtil.primeryBg,
        //   onBackground: DarkColorUtil.secBg,
        //   surface: DarkColorUtil.secBg,
        //   onSurface: DarkColorUtil.secBg,
        // ),
        textTheme: const TextTheme().apply(
          bodyColor: DarkColorUtil.primery,
          displayColor: DarkColorUtil.primery,
        ),
      );
}
