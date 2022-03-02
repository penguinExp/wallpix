import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wallpix/imgview.dart';

import 'utils/theme/apptheme.util.dart';
import 'utils/theme/theme_service.util.dart';

class WallPix extends StatelessWidget {
  const WallPix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PageUI(),
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeService().theme,
        builder: ((context, child) {
          ScreenUtil.setContext(context);
          return MediaQuery(data: MediaQuery.of(context), child: child!);
        }),
      ),
    );
  }
}
