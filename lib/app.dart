
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wallpix/views/home/home.view.dart';
import 'core/services/theme.service.dart';
import 'designs/designs.dart';


class WallPix extends StatelessWidget {
  const WallPix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
        theme: ThemeUtil.lightTheme(),
        darkTheme: ThemeUtil.darkTheme(),
        themeMode: ThemeService().theme,
        builder: ((context, child) {
          ScreenUtil.setContext(context);
          return MediaQuery(data: MediaQuery.of(context), child: child!);
        }),
      ),
    );
  }
}

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  bool _isDark = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DesignButton(
                title: 'Download',
                icon: _isDark ? SvgIcons.sunIcon : SvgIcons.nightIcon,
                onTap: () {
                  ThemeService().toggleTheme();
                  setState(() {
                    _isDark = Get.isDarkMode ? true : false;
                  });
                }),
            SizedBox(
              height: 25.h,
            ),
            const DesignIcon.backIcon(),
          ],
        ),
      ),
    );
  }
}
