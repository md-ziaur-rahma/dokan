import 'package:dokan/app/module/signup/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController(Get.find()));
  }
}