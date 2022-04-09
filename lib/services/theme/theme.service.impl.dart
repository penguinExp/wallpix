import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/services/theme.service.c.dart';

final ThemeServiceImpl themeServiceImpl = ThemeServiceImpl();

class ThemeServiceImpl implements ThemeServiceContract {
  /// Singleton for theme service impl
  ThemeServiceImpl._();

  static final ThemeServiceImpl _themeServiceImpl = ThemeServiceImpl._();

  factory ThemeServiceImpl() {
    return _themeServiceImpl;
  }

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
      log(themeMode.toString());
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      storeThemeMode(isDarkMode: true);
      log(themeMode.toString());
    }
  }

  ThemeMode get themeMode =>
      getThemeModeFromMemory() ? ThemeMode.dark : ThemeMode.light;

 
}
