import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfoody/src/constants/constants.dart';

extension XTextStyle on TextStyle {
  /// [INFO]
  /// Extension for change weight of text
  ///
  /// Example:
  /// TypographyApp.headline1.bold;
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get extraBlack => copyWith(fontWeight: FontWeight.w900);

  /// [INFO]
  ///
  TextStyle get family => copyWith(fontFamily: GoogleFonts.nunito().fontFamily);

  /// [INFO]
  /// Extension for change color
  ///
  /// Example:
  /// TypographyTheme.subtitle1.darkGrey;
  TextStyle get darkGrey => copyWith(color: AppColors.darkGrey);
  TextStyle get grey => copyWith(color: AppColors.grey);
  TextStyle get lightGrey => copyWith(color: AppColors.lightGrey);
  TextStyle get lightBlue => copyWith(color: AppColors.lightBlue);
  TextStyle get lightRed => copyWith(color: AppColors.lightRed);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get red => copyWith(color: AppColors.red);
  TextStyle get darkRed => copyWith(color: AppColors.darkRed);
  TextStyle get green => copyWith(color: Colors.green);

  /// [INFO]
  /// Extension for change font size
  ///
  /// Example:
  /// TypographyTheme.subtitle1.fontSize(20);
  TextStyle fontSizeCustom(double size) => copyWith(fontSize: size.sp);

  /// [INFO]
  /// Extension for change font color
  ///
  /// Example:
  /// TypographyTheme.subtitle1.fontColor(ColorApp.black);
  TextStyle fontColor(Color color) => copyWith(color: color);

  /// [INFO]
  /// Extension for change font style and decoration
  ///
  /// Example:
  /// TypographyTheme.subtitle1.underline;
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// [INFO]
  /// Extension for change font height and letter spacing
  ///
  /// Example
  /// TypographyTheme.customHeight(2);
  /// or
  /// TypographyTheme.customLetterSpacing(2);
  TextStyle customHeight(double value) => copyWith(height: value.h);
  TextStyle customSpacing(double value) => copyWith(letterSpacing: value.w);
}
