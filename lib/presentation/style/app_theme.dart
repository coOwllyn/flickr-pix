import 'package:flutter/material.dart';
import 'package:mobile_challenge/presentation/style/app_colors.dart';
import 'package:mobile_challenge/presentation/style/app_text_style.dart';

class FlutterTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: AppColors.bgLight,
        elevation: 0,
        titleTextStyle:
            getHeaderStyle(color: AppColors.greenMain, fontSize: 20),
      ),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: AppColors.white),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.red,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
