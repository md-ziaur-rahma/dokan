import 'package:dokan/app/core/app_colors.dart';
import 'package:dokan/app/core/app_icons.dart';
import 'package:dokan/app/core/app_sizes.dart';
import 'package:dokan/app/global_widget/custom_image.dart';
import 'package:dokan/app/module/main_page/components/main_bottom_nav.dart';
import 'package:dokan/app/module/main_page/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.pageBackground2,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.screenList,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(20))),
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0,-10)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(getWidth(20))),
          child: BottomAppBar(
            notchMargin: 8,
            clipBehavior: Clip.none,
            color: Colors.white,
            padding: EdgeInsets.zero,
            shape: const CircularNotchedRectangle(),
            child: Obx(() {
              return Row(
                children: [
                  MainBottomNav(
                      icon: AppIcons.home,
                      onPressed: (){
                        controller.onPageChange(0);},
                      isActive: controller.currentIndex.value == 0
                  ),
                  MainBottomNav(
                      icon: AppIcons.category,
                      onPressed: (){
                        controller.onPageChange(1);},
                      isActive: controller.currentIndex.value == 1
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  MainBottomNav(
                      icon: AppIcons.cart,
                      onPressed: (){
                        controller.onPageChange(3);},
                      isActive: controller.currentIndex.value == 3
                  ),
                  MainBottomNav(
                      icon: AppIcons.account,
                      onPressed: (){
                        controller.onPageChange(4);},
                      isActive: controller.currentIndex.value == 4
                  ),
                ],
              );
            }
            )
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                blurRadius: 14,
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(10, 10),
            ),
            BoxShadow(
                blurRadius: 14,
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(-10, -10),
            ),
          ],
          gradient: const LinearGradient(
            colors: [
              Color(0xffFF679B),
              Color(0xffFF7B51),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Material(
          shape: const CircleBorder(),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: (){},
            child: const ClipRRect(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomImage(path: AppIcons.search,color: Colors.white,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
