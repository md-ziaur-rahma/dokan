import 'dart:async';

import 'package:dokan/app/core/contants.dart';
import 'package:dokan/app/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  var isLoading = false.obs;

  @override
  void onInit() {
    print("xxxxxxxxxxxxxxxxxxx");
    super.onInit();
    startTime();
  }

  Future startTime() async {
    return Timer(Constants.splashDelay, jumpToHome);
  }

  void jumpToHome() {
    Get.offAllNamed(Routes.mainScreen);
  }
}