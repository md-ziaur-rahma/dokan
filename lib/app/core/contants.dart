import 'package:dokan/app/core/app_sizes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Constants {
  static Duration kDuration = const Duration(seconds: 3);
  static const delayTime = Duration(seconds: 3);
  static const splashDelay = Duration(milliseconds: 2500);
  static const quicksandFont = "Quicksand";
  static const nunito = "Nunito";
  static DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  static DateFormat dateFormat24 = DateFormat("yyyy-MM-dd HH:mm:ss");
  static DateFormat timeFormat = DateFormat("HH:mm:ss");

  static showSnackBar({String? title, required String message, Color? color}) {
    Get.snackbar(title ?? "Warning", message,
        maxWidth: AppSizes.width * 0.7,
        backgroundColor: Colors.black.withOpacity(0.7),
        duration: const Duration(milliseconds: 1500),
        colorText: color ?? Colors.white,
        snackPosition: SnackPosition.TOP);
  }
}

//for shop card
Gradient fixedGradient = const RadialGradient(
    radius: 1,
    focalRadius: 1,
    stops: [0.5, 0.7],
    center: Alignment.topLeft,
    tileMode: TileMode.mirror,
    colors: [
      Color(0xffE5E5E5),
      Color(0xffA3A3A3),
    ]
);
// for 2 button in one line
Gradient buttonRadialGradient = const RadialGradient(
    radius: 1.4,
    focalRadius: 0.4,
    focal: Alignment.centerLeft,
    stops: [0.1, 1],
    center: Alignment.topLeft,
    tileMode: TileMode.mirror,
    colors: [
      Color(0xffA3A3A3),
      Color(0xffE5E5E5),
    ]
);

// for button and textField
Gradient buttonTextFieldRadialGradient = const RadialGradient(
    radius: 2.0,
    focalRadius: 0,
    focal: Alignment.centerLeft,
    stops: [0.1, 0.8],
    center: Alignment.topLeft,
    tileMode: TileMode.mirror,
    colors: [
      Color(0xffA3A3A3),
      Color(0xffE5E5E5),
    ]
);

/// Box Shadow...
defaultBoxShadow(double value) => <BoxShadow>[
  BoxShadow(
    color: Colors.grey.withOpacity(0.05),
    blurRadius: 6,
    offset: Offset(value, value),
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    blurRadius: 6,
    offset: Offset(-value, -value),
  ),
];
zeroPxBoxShadow({double value = 0}) => <BoxShadow>[
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    blurRadius: 4,
    offset: Offset(value, value),
  ),
];
zeroPxBoxShadowWithDark({double value = 0}) => <BoxShadow>[
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    blurRadius: 4,
    offset: Offset(value, value),
  ),
];
/// Default box decoration...
BoxDecoration defaultBoxDecoration() {
  return BoxDecoration(
    boxShadow: defaultBoxShadow(3),
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  );
}
