import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.caribbeanGreen,
    fontFamily: GoogleFonts.inter().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: AppColors.caribbeanGreen,
        foregroundColor: AppColors.honeydewGreen,
        textStyle: TextStyle(
          color: AppColors.textGreenColor,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        minimumSize: Size(200, 50),
        maximumSize: Size(220, 50),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          color: AppColors.textGreenColor,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        minimumSize: Size(200, 50),
        maximumSize: Size(220, 50),
      ),
    ),
    appBarTheme: AppBarTheme(
      leadingWidth: 40,
      iconTheme: IconThemeData(color: AppColors.honeydewGreen),
      backgroundColor: AppColors.caribbeanGreen,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textGreenColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.fenceGreen,
    fontFamily: GoogleFonts.inter().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: AppColors.caribbeanGreen,
        foregroundColor: AppColors.honeydewGreen,
        textStyle: TextStyle(
          color: AppColors.textGreenColor,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        minimumSize: Size(200, 50),
        maximumSize: Size(220, 50),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          color: AppColors.textGreenColor,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        minimumSize: Size(200, 50),
        maximumSize: Size(220, 50),
      ),
    ),
    appBarTheme: AppBarTheme(
      leadingWidth: 40,
      iconTheme: IconThemeData(color: AppColors.honeydewGreen),
      backgroundColor: AppColors.fenceGreen,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.lightGreen,
      ),
    ),
  );
}
