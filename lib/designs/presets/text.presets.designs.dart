import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../designs.e.dart';

class TextPresets {
  static TextStyle headingOne(Color? color) => FontsUtil.nunito(
        fontSize: 61.sp,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle headingTwo(Color? color) => FontsUtil.nunito(
        fontSize: 40.5.sp,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle headingThree(Color? color) => FontsUtil.nunito(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle headingFourRegular(Color? color) => FontsUtil.nunito(
        fontSize: 17.5.sp,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle headingFourSemiBold(Color? color) => FontsUtil.nunito(
        fontSize: 17.5.sp,
        fontWeight: FontWeight.w600,
        color: color,
      );
}
