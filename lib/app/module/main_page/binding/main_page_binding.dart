import 'package:dokan/app/module/account/controller/account_controller.dart';
import 'package:dokan/app/module/home/controller/home_controller.dart';
import 'package:dokan/app/module/login/controller/login_controller.dart';
import 'package:dokan/app/module/main_page/controller/main_controller.dart';
import 'package:get/get.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find()));
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AccountController());
  }
}