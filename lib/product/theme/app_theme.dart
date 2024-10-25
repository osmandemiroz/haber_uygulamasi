import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/product/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// [AppTheme] is a class that provides theme data for the app.
class AppTheme {
  ///light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBlue,
      onPrimary: AppColors.greyWhite,
      onSecondary: AppColors.greyBlack,
      surface: AppColors.greyLight,
      onSurface: AppColors.greyBlack,
      error: AppColors.primaryOrange,
      onError: AppColors.greyWhite,
      tertiary: AppColors.primaryGreen,
      onTertiary: AppColors.greyBlack,
    ),
    scaffoldBackgroundColor: AppColors.greyWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.greyLight,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryGreen),
      titleTextStyle: TextStyle(
        color: AppColors.primaryBlue,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.greyLight,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.greyMedium,
      selectedColor: AppColors.primaryGreen,
      secondarySelectedColor: AppColors.primaryPink,
      labelStyle: const TextStyle(color: AppColors.greyBlack),
      secondaryLabelStyle: const TextStyle(color: AppColors.greyWhite),
      shape: const StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.greyWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.greyDark),
      contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16.sp, color: AppColors.greyBlack),
      bodyMedium: TextStyle(fontSize: 14.sp, color: AppColors.greyDark),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.greyBlack,
      ),
    ),
  );

  ///dark theme

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryGreen,
      onPrimary: AppColors.greyBlack,
      secondary: AppColors.primaryPink,
      onSecondary: AppColors.greyWhite,
      surface: AppColors.greyDark,
      onSurface: AppColors.greyWhite,
      error: AppColors.primaryOrange,
      onError: AppColors.greyWhite,
      tertiary: AppColors.primaryBlue,
      onTertiary: AppColors.greyBlack,
    ),
    scaffoldBackgroundColor: AppColors.greyBlack,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.greyDark,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryGreen),
      titleTextStyle: TextStyle(
        color: AppColors.primaryGreen,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.greyMedium,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: AppColors.greyDark,
      selectedColor: AppColors.primaryBlue,
      secondarySelectedColor: AppColors.primaryPink,
      labelStyle: TextStyle(color: AppColors.greyWhite),
      secondaryLabelStyle: TextStyle(color: AppColors.greyBlack),
      shape: StadiumBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryOrange,
        foregroundColor: AppColors.greyWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.greyMedium),
    ),
  );
}
