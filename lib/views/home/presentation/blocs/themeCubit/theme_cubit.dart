import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../../../../services/services.e.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(Get.isDarkMode ? DarkThemeState() : LightThemeState());

  void toggleThemeMode() {
    if (Get.isDarkMode) {
      themeServiceImpl.toggleThemeMode();
      emit(LightThemeState());
    } else {
      themeServiceImpl.toggleThemeMode();
      emit(DarkThemeState());
    }
  }
}
