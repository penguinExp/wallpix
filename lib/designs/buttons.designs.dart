import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/services.e.dart';

import 'designs.e.dart';

class DesignButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String btnText;
  final Color bgColor;
  final Color? textcolor;
  final bool isLoading;
  final void Function() onTap;
  final Widget? icon;

  DesignButton.defaultBtn({
    Key? key,
    this.width,
    this.height,
    required this.onTap,
    required this.btnText,
    this.isLoading = false,
    this.icon,
    this.textcolor,
  })  : bgColor = themeServiceImpl.secBackground(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 195.w,
        height: height ?? 56.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: bgColor,
        ),
        child: Center(
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DesignText.headingFourSemiBold(
                      text: btnText,
                      color: textcolor,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    icon ?? Container()
                  ],
                )
              : DesignText.headingFourRegular(
                  text: btnText,
                  color: textcolor,
                ),
        ),
      ),
    );
  }
}
