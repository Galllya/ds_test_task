import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: "SF-Pro-Display",
    scaffoldBackgroundColor: AppColors.firstBackgroundColor,
    appBarTheme: AppBarTheme(
      color: AppColors.secondBackgroundColor,
      scrolledUnderElevation: 0,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 20),
        ),
        minimumSize: const WidgetStatePropertyAll<Size>(
          Size(double.infinity, 0),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(AppColors.primary),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        foregroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
        textStyle: const WidgetStatePropertyAll<TextStyle>(
          TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}
