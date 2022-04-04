import 'package:get/get.dart';
import 'package:wallpix/core/core.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = (Get.isDarkMode ? true : false).obs;

  void toggleTheme() {
    final bool isThemedark = themeService.toggleTheme();
    isDarkMode.value = isThemedark ? true : false;
  }
}
