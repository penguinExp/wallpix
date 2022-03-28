import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpix/designs/designs.design.dart';

import '../core/core.dart';

class DesignTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintTxt;
  final Widget? suffixIcon;
  final void Function()? onIconTap;
  final void Function()? onFieldTap;
  final bool isFocused;

  const DesignTextField({
    Key? key,
    required this.textEditingController,
    required this.hintTxt,
    this.suffixIcon = const DesignIcon.searchIcon(),
    this.onIconTap,
    this.onFieldTap,
    this.isFocused = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: isFocused
              ? themeService.highLight()
              : themeService.secBackground(),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      height: 56.h,
      width: 315.w,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: textEditingController,
            autocorrect: true,
            onTap: onFieldTap,
            decoration: const InputDecoration(border: InputBorder.none),
          )),
          suffixIcon ?? Container()
        ],
      ),
    );
  }
}
