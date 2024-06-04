import 'package:dokan/app/core/app_colors.dart';
import 'package:dokan/app/core/app_icons.dart';
import 'package:dokan/app/global_widget/custom_image.dart';
import 'package:dokan/app/module/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground2,
      body: Obx(() {
        if(controller.isLoading.value){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
          return Center(
            child: AnimatedContainer(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 1500),
                child: const CustomImage(path: AppIcons.logoText,)),
          );
        }
      ),
    );
  }
}
