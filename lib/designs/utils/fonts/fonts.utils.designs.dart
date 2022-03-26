import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsUtil {
  static TextStyle nunito({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
  }) =>
      GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
      );
}
