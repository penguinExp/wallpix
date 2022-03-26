import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.core.dart';
import '../designs.design.dart';

class TextPresets {
  static TextStyle headingOne = FontsUtil.nunito(
    fontSize: 61.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headingOneHighLighted = FontsUtil.nunito(
    fontSize: 61.sp,
    fontWeight: FontWeight.w700,
    color: themeService.highLight(),
  );

  static TextStyle headingTwo = FontsUtil.nunito(
    fontSize: 40.5.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headingThree = FontsUtil.nunito(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headingFourRegular = FontsUtil.nunito(
    fontSize: 17.5.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headingFourSemiBold = FontsUtil.nunito(
    fontSize: 17.5.sp,
    fontWeight: FontWeight.w600,
  );
}
