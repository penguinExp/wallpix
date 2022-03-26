import 'package:flutter/material.dart';
import 'package:wallpix/prev/designs/designs.dart';

class ThemeUtil {
  static ThemeData lightTheme() => ThemeData().copyWith(
        scaffoldBackgroundColor: LightColorUtil.bg,
        brightness: Brightness.light,
        textTheme: const TextTheme().apply(
          bodyColor: LightColorUtil.primery,
        ),
      );

  static ThemeData darkTheme() => ThemeData().copyWith(
        scaffoldBackgroundColor: DarkColorUtil.bg,
        brightness: Brightness.dark,
        textTheme: const TextTheme().apply(
          bodyColor: DarkColorUtil.primery,
        ),
      );
}