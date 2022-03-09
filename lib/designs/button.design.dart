import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/theme.service.dart';
import 'icons.design.dart';
import 'text.design.dart';

class DesignButton extends StatelessWidget {
  final double width = 195.w;
  final double height = 56.h;
  final String title;
  final String? icon;
  final bool isfaint;
  final bool isBusy;
  final bool outline;
  final void Function() onTap;
  DesignButton({
    Key? key,
    required this.title,
    this.isfaint = false,
    required this.onTap,
    this.isBusy = false,
    this.icon,
  })  : outline = false,
        super(key: key);

  DesignButton.outline({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon,
  })  : isBusy = false,
        isfaint = false,
        outline = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isfaint
                ? themeService.primery().withOpacity(.5)
                : themeService.secBg(),
            borderRadius: BorderRadius.circular(10)),
        height: height,
        width: width,
        child: isBusy
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: themeService.primery(),
                ),
              )
            : isfaint
                ? Center(child: DesignText.headingThreeSB(title))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DesignText.headingThreeSB(title),
                      SizedBox(
                        width: 15.w,
                      ),
                      const DesignIcon.downloadIcon(),
                    ],
                  ),
      ),
    );
  }
}
