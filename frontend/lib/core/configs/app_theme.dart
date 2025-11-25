import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    fontFamily: 'Nunito',
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white70),
      contentPadding: const EdgeInsets.all(20),

      filled: true,
      fillColor: Colors.white.withOpacity(0.25),

      errorStyle: TextStyle(
        color: Colors.red.shade800,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.white24),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.white24),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: AppColors.lightGreen,
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.red.shade800, width: 1),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.red.shade800, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightGreen,
        // minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(
        color: Colors.white24,
        width: 1.5,
      ), // рамка, когда unchecked
      visualDensity: VisualDensity.compact, // компактнее
      materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap, // меньше hitbox
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightGreen;
        }
        if (states.contains(WidgetState.hovered)) {
          return AppColors.lightGreen.withOpacity(0.2);
        }
        return Colors.white24;
      }),
      checkColor: WidgetStatePropertyAll(Colors.white),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    fontFamily: 'Nunito',
  );
}
