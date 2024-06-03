import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/contants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color,
      this.fontWeight,
      this.fontSize = 18.0,
      this.titleColor,
      this.verticalPadding,
      this.fontFamily = Constants.quicksandFont,
      this.borderRadius = 10,
      this.child});
  final String title;
  final Function() onTap;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? verticalPadding;
  final Color? titleColor;
  final String? fontFamily;
  final Widget? child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          foregroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: color ?? AppColors.blue2nd),
      child: child ??
          Center(
              child: Text(
            title,
            style: TextStyle(
                color: titleColor ?? Colors.white,
                fontWeight: fontWeight ?? FontWeight.w600,
                fontFamily: fontFamily,
                fontSize: fontSize),
          )),
    );
  }
}
