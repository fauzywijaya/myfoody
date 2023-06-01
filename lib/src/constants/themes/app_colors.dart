import 'package:flutter/material.dart';

class AppColors {
  /// [COLOR-WHITE]
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteShadow = Color(0xFFE6EAEE);
  static const Color whiteBackground = Color(0xFFF5F5F7);

  /// [COLOR-BLACK]
  static const Color black = Color(0xFF000000);
  static const Color blackDarker = Color(0xFF0D0D0D);

  /// [COLOR-PRIMARY]
  static const Color grey = Color(0xFF373737);
  static const Color red = Color(0xFFE50914);
  static const Color blue = Color(0xFF497BEA);
  static const Color yellow = Color(0xFFFBBC05);
  static const Color lightBlue = Color(0xff50C9FF);
  static const Color lightRed = Color(0xffFC698C);
  static const Color lightGrey = Color(0xFFF5F5F1);
  static const Color darkGrey = Color(0xFF252525);
  static const Color darkRed = Color(0xFFB81D24);

  /// Returns a shade of a [Color] from a double value
  ///
  /// The 'darker' boolean determines whether the shade
  /// should be .1 darker or lighter than the provided color
  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  /// Returns a [MaterialColor] from a [Color] object
  static MaterialColor getMaterialColorFromColor(Color color) {
    final colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}
