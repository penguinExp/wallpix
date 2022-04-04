import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/designs/designs.design.dart';
import 'package:wallpix/modules/images/presentation/controllers/controllers/theme.ctrl.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({Key? key}) : super(key: key);
  final ThemeController controller =
      Get.put<ThemeController>(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeService.backGround(),
      height: 125.h,
      width: 375.w,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30.w, 60.h, 30.w, 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                DesignText.headingTwo(text: 'WallPix'),
                DesignText.headingTwo(
                  text: '.',
                  color: themeService.highLight(),
                ),
              ],
            ),
            Expanded(child: Container()),
            InkWell(
              child: Obx(
                () => controller.isDarkMode.value
                    ? const DesignIcon.nightIcon()
                    : const DesignIcon.sunIcon(),
              ),
              onTap: () {
                controller.toggleTheme();
              },
            )
          ],
        ),
      ),
    );
  }
}
