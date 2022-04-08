import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallpix/designs/designs.design.dart';

import '../../core/services/theme.service.c.dart';

class ThemeServiceImpl implements ThemeServiceContract {
  String themeModeKey = 'isDarkMode';

  @override
  GetStorage storage() {
    return Get.find<GetStorage>();
  }

  @override
  bool getThemeModeFromMemory() {
    final _storedVal = storage().read(themeModeKey);
    if (_storedVal == null && ThemeMode.system == ThemeMode.dark) {
      return true;
    } else if (_storedVal == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  storeThemeMode({required bool isDarkMode}) {
    storage().write(themeModeKey, isDarkMode);
  }

  @override
  toggleThemeMode() {
    if (themeMode == ThemeMode.dark) {
      Get.changeThemeMode(ThemeMode.light);
      // Get opposite of the current theme mode
      storeThemeMode(isDarkMode: false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      storeThemeMode(isDarkMode: true);
    }
  }

  ThemeMode get themeMode =>
      getThemeModeFromMemory() ? ThemeMode.dark : ThemeMode.light;

  @override
  Color backGround() => themeMode == ThemeMode.dark
      ? DarkThemeColors.background
      : LightThemeColors.background;

  @override
  Color error() => themeMode == ThemeMode.dark
      ? DarkThemeColors.error
      : LightThemeColors.error;

  @override
  Color highLight() => themeMode == ThemeMode.dark
      ? DarkThemeColors.highLight
      : LightThemeColors.highLight;

  @override
  Color primery() => themeMode == ThemeMode.dark
      ? DarkThemeColors.primery
      : LightThemeColors.primery;

  @override
  Color secBackground() => themeMode == ThemeMode.dark
      ? DarkThemeColors.secBackground
      : LightThemeColors.secBackground;

  @override
  Color secPrimery() => themeMode == ThemeMode.dark
      ? DarkThemeColors.secPrimery
      : LightThemeColors.secPrimery;

  @override
  Color tertBackground() => themeMode == ThemeMode.dark
      ? DarkThemeColors.tertBackground
      : LightThemeColors.tertBackground;
}
