import 'package:flutter/material.dart';

import 'colors/colors.dart';
import 'colors/hex_colors.dart';
import 'font_styles/font_styles.dart';

class AppTheme {
  static generate(String fontFamily) {
    return ThemeData(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.scaffoldBackground,
        iconTheme: IconThemeData(color: AppColors.primary, size: 30),
        titleTextStyle: FontStyles.h3.copyWith(
          color: Colors.black,
          fontFamily: fontFamily,
        ),
        elevation: 0,
      ),
      dividerTheme: DividerThemeData(
        space: 1,
        color: HexColor("#CFCFCF"),
      ),
      textTheme: TextTheme(
        bodyText1: FontStyles.b1.copyWith(
          fontWeight: FontWeight.normal,
        ),
        bodyText2: FontStyles.b2.copyWith(
          fontWeight: FontWeight.normal,
        ),
        button: FontStyles.buttons,
        headline6: FontStyles.h1,
        headline5: FontStyles.h2,
      ).apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          AppColors.primary.value,
          {
            50: AppColors.primary.withOpacity(0.1),
            100: AppColors.primary.withOpacity(0.2),
            200: AppColors.primary.withOpacity(0.3),
            300: AppColors.primary.withOpacity(0.4),
            400: AppColors.primary.withOpacity(0.5),
            500: AppColors.primary.withOpacity(0.6),
            600: AppColors.primary.withOpacity(0.7),
            700: AppColors.primary.withOpacity(0.8),
            800: AppColors.primary.withOpacity(0.9),
            900: AppColors.primary.withOpacity(1),
          },
        ),
        accentColor: Colors.red,
      ),
    );
  }
}
