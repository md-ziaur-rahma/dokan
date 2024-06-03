import 'package:dokan/app/core/app_colors.dart';
import 'package:dokan/app/core/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperText {
  headingText(String text,
      {TextAlign textAlign = TextAlign.start, double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.textColor,
          fontFamily: 'GlobalFonts',
          fontSize: fontSize ?? 22,
          fontWeight: FontWeight.w500),
      textAlign: textAlign,
    );
  }

  titleText(String text,
      {TextAlign textAlign = TextAlign.center,
      double? fontSize,
      Color color = const Color(0xff35424a)}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Nunito',
          fontSize: fontSize ?? getWidth(21),
          letterSpacing: -0.4,
          fontWeight: FontWeight.w700),
      textAlign: textAlign,
    );
  }

  headingColorText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.textColor,
          fontFamily: 'GlobalFonts',
          fontSize: 22,
          fontWeight: FontWeight.w500),
    );
  }

  normalText(String text, {TextAlign textAlign = TextAlign.start}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: AppColors.textColor,
          fontFamily: 'GlobalFonts',
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }

  customNormalText(
    String text, {
    TextAlign? textAlign,
    double? fontSize,
    FontWeight? fontWeight,
    Color? textColor,
  }) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        color: textColor ?? AppColors.textColor,
        fontFamily: 'GlobalFonts',
        fontSize: fontSize ?? getWidth(14),
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }

  boldText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.textColor,
          fontSize: 14,
          fontFamily: 'GlobalFonts',
          fontWeight: FontWeight.w500),
    );
  }

  boldText15(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.textColor,
          fontSize: 15,
          fontFamily: 'GlobalFonts',
          fontWeight: FontWeight.w600),
    );
  }

  boldText16(String text, {Color color = Colors.black87}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: 16,
          fontFamily: 'GlobalFonts',
          fontWeight: FontWeight.w600),
    );
  }

  boldAshText16(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: getWidth(16),
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w600),
    );
  }

  boldText18(String text,
      {Color color = Colors.black87,
      double size = 18,
      FontWeight fontWeight = FontWeight.w500}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Nunito',
          fontWeight: fontWeight),
    );
  }

  boldTextExtra(String text, {Color color = Colors.black87, double size = 22}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'GlobalFonts',
          fontWeight: FontWeight.w800),
    );
  }

  boldTextExtraWhite(String text,
      {Color color = Colors.white, double size = 22}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w800),
    );
  }

  ashNormalText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.greyTextColor,
          fontSize: 14,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w400),
    );
  }

  ashSmallText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.ashTextColor,
          fontFamily: 'GlobalFonts',
          fontSize: 12,
          fontWeight: FontWeight.w400),
    );
  }

  ashBoldText(String text, {double size = 14}) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.ashTextColor,
          fontSize: size,
          fontFamily: 'GlobalFonts',
          fontWeight: FontWeight.w500),
    );
  }

  ashNormalCenterText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.ashTextColor,
          fontFamily: 'GlobalFonts',
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }

  redNormalText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.mainColor,
          fontFamily: 'GlobalFonts',
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }

  redHeadingText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.mainColor,
          fontFamily: 'GlobalFonts',
          fontSize: 16,
          fontWeight: FontWeight.w500),
    );
  }

  headline(String text, {Color color = const Color(0xff35424a)}) {
    return Text(
      text,
      style: Theme.of(Get.context!).textTheme.titleLarge?.apply(color: color),
    );
  }

  customText(String text,
      {Color textColor = Colors.black,
      String fontFamily = 'GlobalFonts',
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.w500,
      TextAlign align = TextAlign.justify,
      int maxLines = 10,
      bool isUnderline = false}) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
      textAlign: align,
      maxLines: maxLines,
    );
  }

  //Weather banner Text
  weatherText(String text, {double size = 17}) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.white,
          fontSize: size,
          fontFamily: 'GlobalFonts',
          fontWeight: FontWeight.w600),
    );
  }
}
