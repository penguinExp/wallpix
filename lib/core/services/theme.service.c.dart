import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';


abstract class ThemeServiceContract {
  /// Reads the theme mode value from the stored memory location
  /// NOTE: It returns [True] for DarkMode and [False] for LightMode
  bool getThemeModeFromMemory();

  /// It stores the value of current theme mode selected by the user
  /// in the specified location,
  /// NOTE: It stores [True] for darkMode and [False] for lightMode
  storeThemeMode({required bool isDarkMode});

  /// It's a reference of getStorage controller which is currently
  /// used to store the value of user selected theme mode in {isDarkMode} key
  GetStorage storage();

  /// It's used for toggling between the theme mode
  /// It creates the functionality for the user to change the theme mode
  /// Dependency: Uses Get.changeThemeMode to toggle between themes
  toggleThemeMode();

  /// sets the value for [background] color used in DesignSystem
  Color backGround();

  /// sets the value for [secBackground] color used in DesignSystem
  Color secBackground();

  /// sets the value for [tertBackground] color used in DesignSystem
  Color tertBackground();

  /// sets the value for [primery] color used in DesignSystem
  Color primery();

  /// sets the value for [secPrimery] color used in DesignSystem
  Color secPrimery();

  /// sets the value for [highLight] color used in DesignSystem
  Color highLight();

  /// sets the value for [error] color used in DesignSystem
  Color error();
}

