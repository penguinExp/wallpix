import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'designs/designs.e.dart';
import 'services/theme/theme.service.impl.dart';
import 'views/home/presentation/blocs/themeCubit/theme_cubit.dart';
import 'views/home/presentation/home.view.dart';

class WallPix extends StatelessWidget {
  const WallPix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(themeServiceImpl.themeMode.toString());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: LightThemeColors.primary,
          colorScheme: const ColorScheme.light().copyWith(
            background: LightThemeColors.background,
            onBackground: LightThemeColors.secondaryBackground,
            error: LightThemeColors.error,
            secondary: LightThemeColors.secPrimary,
            tertiaryContainer: LightThemeColors.tertiaryBackground,
            onPrimary: LightThemeColors.highLight,
          ),
        ),
        themeMode: themeServiceImpl.themeMode,
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: DarkThemeColors.primary,
          colorScheme: const ColorScheme.dark().copyWith(
            background: DarkThemeColors.background,
            onBackground: DarkThemeColors.secondaryBackground,
            error: DarkThemeColors.error,
            secondary: DarkThemeColors.secPrimary,
            tertiaryContainer: DarkThemeColors.tertiaryBackground,
            onPrimary: DarkThemeColors.highLight,
          ),
        ),
        home: BlocProvider(
          create: (_) => ThemeCubit(),
          child: const HomeView(),
        ),
        builder: ((context, child) {
          ScreenUtil.setContext(context);
          return MediaQuery(data: MediaQuery.of(context), child: child!);
        }),
      ),
    );
  }
}
