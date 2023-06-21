import 'package:flutter/material.dart';

extension XBuildContext on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double screenWidthPercentage(double percentage) => screenWidth * percentage;
  double get screenHeight => mediaQuery.size.height;
  double screenHeightPercentage(double percentage) => screenHeight * percentage;
  ThemeData get theme => Theme.of(this);
}
