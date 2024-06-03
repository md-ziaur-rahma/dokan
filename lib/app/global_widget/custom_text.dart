import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final double? fontHeight;
  final Color? color;
  final Color? underlineColor;
  final double? letterSpaching;
  final TextDecoration? textDecoration;

  const CustomText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      this.fontHeight,
      this.color = const Color(0xffFAFAFA),
      this.underlineColor,
      this.letterSpaching,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontFamily: "Nunito-Bold",
          letterSpacing: letterSpaching,
          decoration: textDecoration,
          decorationThickness: 2,
          decorationColor: underlineColor,
          height: fontHeight),
    );
  }
}
