import 'package:dokan/app/core/contants.dart';
import 'package:dokan/app/core/utils.dart';
import 'package:dokan/app/module/login/controller/login_controller.dart';
import 'package:dokan/app/module/login/repository/auth_repository.dart';
import 'package:dokan/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final AuthRepository _authRepository;
  SignupController(this._authRepository);

  var isLoading = false.obs;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var togglePassword = false.obs;
  var toggleConfirmPassword = false.obs;

  var selectedImage = "".obs;

  void chooseImage(){
    Utils.pickSingleImage().then((value){
      if(value != null){
        selectedImage(value);
      }
    });
  }

  void validationSignupForm(BuildContext context){
    if(nameController.text.isEmpty){
      Utils.showSnackBar(message: "Username is required!");
      return;
    } else if(emailController.text.isEmpty) {
      Utils.showSnackBar(message: "Email is required!");
      return;
    }  else if(!GetUtils.isEmail(emailController.text)) {
      Utils.showSnackBar(message: "The email is incorrect!");
      return;
    } else if(passwordController.text.isEmpty) {
      Utils.showSnackBar(message: "Password is required!");
      return;
    } else if(passwordController.text != confirmPasswordController.text) {
      Utils.showSnackBar(message: "Password doesn't match!");
      return;
    }
    register(username: nameController.text, email: emailController.text, password: passwordController.text);
  }


  void register({required String username, required String email, required String password}) async {
    final body = <String, String>{};
    body.addAll({"username": username.trim()});
    body.addAll({"email": email.trim()});
    body.addAll({"password": password.trim()});
    isLoading.value = true;
    final result = await _authRepository.userRegister(body);
    result.fold((error) {
      if (error.statusCode == 503) {
        register(username: username,email: email,  password: password);
      } else {
        isLoading.value = false;
        Constants.showSnackBar(message: error.message, title: "Error");
      }
    }, (data) async {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        nameController.text = "";
        emailController.text = "";
        passwordController.text = "";
        confirmPasswordController.text = "";
        login(username: username,password: password);
      });
    });
  }

  void login({required String username, required String password}) async {
    final body = <String, String>{};
    body.addAll({"username": username.trim()});
    body.addAll({"password": password.trim()});
    isLoading.value = true;
    final result = await _authRepository.login(body);
    result.fold((error) {
      if (error.statusCode == 503) {
        login(username: username, password: password);
      } else {
        isLoading.value = false;
        Constants.showSnackBar(message: error.message, title: "Error");
      }
    }, (data) async {
      Get.find<LoginController>().user = data;
      Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        Get.offAllNamed(Routes.mainScreen);
      });
    });
  }

}