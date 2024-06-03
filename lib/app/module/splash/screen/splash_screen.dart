import 'dart:ffi';

import 'package:dokan/app/core/app_sizes.dart';
import 'package:dokan/app/module/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if(controller.isLoading.value){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
          return Center(
            child: FlutterLogo(size: getWidth(160),curve: Curves.easeIn,duration: const Duration(seconds: 1),),
          );
        }
      ),
    );
  }
}
