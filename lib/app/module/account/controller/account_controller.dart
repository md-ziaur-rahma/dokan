import 'package:dokan/app/module/login/controller/login_controller.dart';
import 'package:dokan/app/module/login/model/user_login_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  final loginController = Get.find<LoginController>();

  UserLoginResponseModel? get userInfo => loginController.userInfo;

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData(){
    fullNameController.text = "${userInfo?.userDisplayName}";
    emailController.text = "${userInfo?.userEmail}";
  }
}