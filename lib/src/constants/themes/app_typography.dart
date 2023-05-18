import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle fm = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
  );

  static TextStyle displayLg = TextStyle(
    fontSize: ScreenUtil().setSp(57),
    fontWeight: FontWeight.w400,
  );

  static TextStyle displayMd = TextStyle(
    fontSize: ScreenUtil().setSp(45),
    fontWeight: FontWeight.w400,
  );

  static TextStyle displaySm = TextStyle(
    fontSize: ScreenUtil().setSp(36),
    fontWeight: FontWeight.w400,
  );

  static TextStyle headlineLg = TextStyle(
    fontSize: ScreenUtil().setSp(32),
    fontWeight: FontWeight.w400,
  );

  static TextStyle headlineMd = TextStyle(
    fontSize: ScreenUtil().setSp(28),
    fontWeight: FontWeight.w400,
  );

  static TextStyle headlineSm = TextStyle(
    fontSize: ScreenUtil().setSp(24),
    fontWeight: FontWeight.w400,
  );

  static TextStyle titleLg = TextStyle(
    fontSize: ScreenUtil().setSp(22),
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleMd = TextStyle(
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static TextStyle titleSm = TextStyle(
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle labelLg = TextStyle(
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle labelMd = TextStyle(
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static TextStyle labelSm = TextStyle(
    fontSize: ScreenUtil().setSp(11),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static TextStyle bodyLg = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static TextStyle bodyMd = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static TextStyle bodySm = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );
}
