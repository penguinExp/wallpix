import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontUtil {
  static TextStyle bold({double? fonSize}) {
    return GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      fontSize: fonSize ?? 40.5.sp
    );
  }

  static TextStyle light({double? fonSize}) {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w300, fontSize: fonSize ?? 17.5.sp);
  }
}
