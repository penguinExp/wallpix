import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/colors/dark.color.util.dart';
import '../../utils/colors/light.color.util.dart';

class ThemeService {
  final _themeBox = GetStorage('themeMode');
  final String _key = 'isDark';

  bool _isDark() =>
      _themeBox.read(_key) == true || ThemeMode.system == ThemeMode.dark
          ? true
          : false;

  void _storeTheme({required bool isdark}) => _themeBox.write(_key, isdark);

  ThemeMode get theme => _isDark() ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    if (theme == ThemeMode.dark) {
      Get.changeThemeMode(ThemeMode.light);
      _storeTheme(isdark: false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      _storeTheme(isdark: true);
    }
    log(theme.name);
  }

  Color bg() => theme == ThemeMode.dark ? DarkColorUtil.bg : LightColorUtil.bg;
  Color secBg() =>
      theme == ThemeMode.dark ? DarkColorUtil.secBg : LightColorUtil.secBg;
  Color tertBg() =>
      theme == ThemeMode.dark ? DarkColorUtil.tertBg : LightColorUtil.tertBg;
  Color primery() =>
      theme == ThemeMode.dark ? DarkColorUtil.primery : LightColorUtil.primery;
  Color secPrimery() => theme == ThemeMode.dark
      ? DarkColorUtil.secPrimery
      : LightColorUtil.secPrimery;
  Color highLight() => theme == ThemeMode.dark
      ? DarkColorUtil.highLight
      : LightColorUtil.highLight;
  Color error() =>
      theme == ThemeMode.dark ? DarkColorUtil.error : LightColorUtil.error;
}
