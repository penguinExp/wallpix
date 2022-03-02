import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final GetStorage _box = GetStorage();
  final String _key = 'isDarkMode';

  bool _readFromBox() => _box.read(_key) ?? false;
  _saveToStorage() => _box.write(_key, _readFromBox());

  ThemeMode get theme => _readFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_readFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveToStorage();
  }
}
