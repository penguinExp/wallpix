import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FontUtil {
  static TextStyle nunito({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) =>
      GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
}
