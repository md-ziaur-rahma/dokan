import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: AppColors.appColor,
    hoverColor: AppColors.appColor,
    primaryColor: AppColors.appColor,
    textTheme: TextTheme(
        labelLarge: GoogleFonts.roboto(),
        bodyLarge: GoogleFonts.roboto(),
        bodyMedium: GoogleFonts.roboto()),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.appColor,
      textTheme: ButtonTextTheme.normal,
      disabledColor: AppColors.greyColor,
    ),
    fontFamily: "Roboto",
    dividerTheme: DividerThemeData(color: AppColors.greyColor),
    appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.biryani(
            color: Colors.black,
            textStyle: const TextStyle(fontWeight: FontWeight.w500))),
    dialogBackgroundColor: Colors.white,
    dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.deppBlue,
    ),
  );
}
