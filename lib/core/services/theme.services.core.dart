import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../designs/designs.design.dart';

ThemeService themeService = ThemeService();

class ThemeService {
  ThemeService._instance();
  static final ThemeService _themeService = ThemeService._instance();

  factory ThemeService() {
    return _themeService;
  }
  final _storageBox = Get.find<GetStorage>();
  final String _storageKey = 'isDarkMode';

  bool _isdarkMode() {
    final bool? _storedVal = _storageBox.read(_storageKey);
    if (_storedVal == null && ThemeMode.system == ThemeMode.dark) {
      return true;
    } else if (_storedVal != null && _storedVal == true) {
      return true;
    } else {
      return false;
    }
  }

  void _storeThemeMode({required bool isDark}) =>
      _storageBox.write(_storageKey, isDark);

  ThemeMode get _theme => _isdarkMode() ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    if (_theme == ThemeMode.dark) {
      Get.changeThemeMode(ThemeMode.light);
      _storeThemeMode(isDark: false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      _storeThemeMode(isDark: true);
    }
  }

  Color backGround() => _theme == ThemeMode.dark
      ? DarkThemeColors.background
      : LightThemeColors.background;

  Color secBackground() => _theme == ThemeMode.dark
      ? DarkThemeColors.secBackground
      : LightThemeColors.secBackground;

  Color tertBackground() => _theme == ThemeMode.dark
      ? DarkThemeColors.tertBackground
      : LightThemeColors.tertBackground;

  Color primery() => _theme == ThemeMode.dark
      ? DarkThemeColors.primery
      : LightThemeColors.primery;

  Color secPrimery() => _theme == ThemeMode.dark
      ? DarkThemeColors.secPrimery
      : LightThemeColors.secPrimery;

  Color highLight() => _theme == ThemeMode.dark
      ? DarkThemeColors.highLight
      : LightThemeColors.highLight;

  Color error() =>
      _theme == ThemeMode.dark ? DarkThemeColors.error : LightThemeColors.error;
}
