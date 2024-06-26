import 'dart:async';

import 'package:dokan/app/core/contants.dart';
import 'package:dokan/app/module/login/controller/login_controller.dart';
import 'package:dokan/app/routes/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  var isLoading = false.obs;

  @override
  void onInit() {
    FlutterNativeSplash.remove();
    super.onInit();
    startTime();
  }

  Future startTime() async {
    final loginController = Get.find<LoginController>();
    bool isLoggedIn = loginController.isLoggedIn;
    if(isLoggedIn){
      return Timer(Constants.splashDelay, jumpToHome);
    } else {
      return Timer(Constants.splashDelay, jumpToLogin);
    }
  }

  void jumpToHome() {
    Get.offAllNamed(Routes.mainScreen);
  }
  void jumpToLogin() {
    Get.offAllNamed(Routes.login);
  }
}