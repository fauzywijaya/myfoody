import 'package:flutter/material.dart';
import 'package:myfoody/src/constants/constants.dart';

class AppThemes {
  static ThemeData get darkTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      fontFamily: AppTypography.fm.fontFamily,
      scaffoldBackgroundColor: AppColors.blackDarker,
      textTheme: TextThemes.darkTextTheme.apply(displayColor: AppColors.white),
      primaryTextTheme: TextThemes.primaryTextTheme,
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.darkGrey),
      shadowColor: AppColors.black,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: AppColors.darkGrey,
        titleTextStyle: AppTypography.titleMd,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGrey,
        selectedItemColor: AppColors.lightBlue,
        unselectedItemColor: AppColors.grey,
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: AppColors.darkGrey,
        onPrimary: AppColors.grey,
        secondary: AppColors.lightBlue,
        onSecondary: AppColors.blue,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.whiteBackground,
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.white),
      textTheme: TextThemes.textTheme
          .apply(bodyColor: AppColors.black, displayColor: AppColors.black),
      fontFamily: AppTypography.fm.fontFamily,
      shadowColor: AppColors.whiteShadow,
      primaryTextTheme: TextThemes.primaryTextTheme,
      iconTheme: const IconThemeData(color: AppColors.black),
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.white,
        onPrimary: Colors.grey[300],
        secondary: AppColors.lightBlue,
        onSecondary: AppColors.blue,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.white,
        titleTextStyle: AppTypography.titleMd,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.lightBlue,
        unselectedItemColor: Colors.grey[200],
      ),
    );
  }
}

class TextThemes {
  /// [INFO]
  /// Main Text Theme with Material Style
  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: AppTypography.displayLg,
      displayMedium: AppTypography.displayMd,
      displaySmall: AppTypography.displaySm,
      headlineLarge: AppTypography.headlineLg,
      headlineMedium: AppTypography.headlineMd,
      headlineSmall: AppTypography.headlineSm,
      titleLarge: AppTypography.titleLg,
      titleMedium: AppTypography.titleMd,
      titleSmall: AppTypography.titleSm,
      labelLarge: AppTypography.labelLg,
      labelMedium: AppTypography.labelMd,
      labelSmall: AppTypography.labelSm,
      bodyLarge: AppTypography.bodyLg,
      bodyMedium: AppTypography.bodyMd,
      bodySmall: AppTypography.bodySm,
    );
  }

  /// [INFO]
  /// Dark Text Theme with Material Style
  static TextTheme get darkTextTheme {
    return TextTheme(
      displayLarge: AppTypography.displayLg.copyWith(color: AppColors.white),
      displayMedium: AppTypography.displayMd.copyWith(color: AppColors.white),
      displaySmall: AppTypography.displaySm.copyWith(color: AppColors.white),
      headlineLarge: AppTypography.headlineLg.copyWith(color: AppColors.white),
      headlineMedium: AppTypography.headlineMd.copyWith(color: AppColors.white),
      headlineSmall: AppTypography.headlineSm.copyWith(color: AppColors.white),
      titleLarge: AppTypography.titleLg.copyWith(color: AppColors.white),
      titleMedium: AppTypography.titleMd.copyWith(color: AppColors.white),
      titleSmall: AppTypography.titleSm.copyWith(color: AppColors.white),
      labelLarge: AppTypography.labelLg.copyWith(color: AppColors.white),
      labelMedium: AppTypography.labelMd.copyWith(color: AppColors.white),
      labelSmall: AppTypography.labelSm.copyWith(color: AppColors.white),
      bodyLarge: AppTypography.bodyLg.copyWith(color: AppColors.white),
      bodyMedium: AppTypography.bodyMd.copyWith(color: AppColors.white),
      bodySmall: AppTypography.bodySm.copyWith(color: AppColors.white),
    );
  }

  /// [INFO]
  /// Text theme with [AppColors.blue]
  static TextTheme get primaryTextTheme {
    return TextTheme(
      displayLarge:
          AppTypography.displayLg.copyWith(color: AppColors.lightBlue),
      displayMedium:
          AppTypography.displayMd.copyWith(color: AppColors.lightBlue),
      displaySmall:
          AppTypography.displaySm.copyWith(color: AppColors.lightBlue),
      headlineLarge:
          AppTypography.headlineLg.copyWith(color: AppColors.lightBlue),
      headlineMedium:
          AppTypography.headlineMd.copyWith(color: AppColors.lightBlue),
      headlineSmall:
          AppTypography.headlineSm.copyWith(color: AppColors.lightBlue),
      titleLarge: AppTypography.titleLg.copyWith(color: AppColors.lightBlue),
      titleMedium: AppTypography.titleMd.copyWith(color: AppColors.lightBlue),
      titleSmall: AppTypography.titleSm.copyWith(color: AppColors.lightBlue),
      labelLarge: AppTypography.labelLg.copyWith(color: AppColors.lightBlue),
      labelMedium: AppTypography.labelMd.copyWith(color: AppColors.lightBlue),
      labelSmall: AppTypography.labelSm.copyWith(color: AppColors.lightBlue),
      bodyLarge: AppTypography.bodyLg.copyWith(color: AppColors.lightBlue),
      bodyMedium: AppTypography.bodyMd.copyWith(color: AppColors.lightBlue),
      bodySmall: AppTypography.bodySm.copyWith(color: AppColors.lightBlue),
    );
  }
}
