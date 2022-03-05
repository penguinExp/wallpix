import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../colors/dark.colors.util.dart';
import '../colors/light.colors.util.dart';

ThemeService theme = ThemeService();

class ThemeService {
  final _box = GetStorage();
  final String _key = 'isDarkMode';

  bool _isDarkTheme() => _box.read(_key) == true ? true : false;

  void _storeTheme({required bool isDark}) => _box.write(_key, isDark);

  ThemeMode get theme => _isDarkTheme() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    if (theme == ThemeMode.dark) {
      Get.changeThemeMode(ThemeMode.light);
      _storeTheme(isDark: false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      _storeTheme(isDark: true);
    }
  }

  Color primery() =>
      theme == ThemeMode.dark ? DarkColorUtil.primery : LightColorUtil.primery;
  Color primeryBg() => theme == ThemeMode.dark
      ? DarkColorUtil.primeryBg
      : LightColorUtil.primeryBg;
  Color secBg() =>
      theme == ThemeMode.dark ? DarkColorUtil.secBg : LightColorUtil.secBg;
  Color highLight() => theme == ThemeMode.dark
      ? DarkColorUtil.highLight
      : LightColorUtil.highLight;
  Color error() =>
      theme == ThemeMode.dark ? DarkColorUtil.error : LightColorUtil.error;
}
