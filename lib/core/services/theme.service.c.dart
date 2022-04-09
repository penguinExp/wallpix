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

}

