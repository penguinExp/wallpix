import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/designs/designs.design.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              child: const DesignIcon.nightIcon(),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
