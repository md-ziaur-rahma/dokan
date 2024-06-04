import 'package:dartz/dartz.dart';
import 'package:dokan/app/core/contants.dart';
import 'package:dokan/app/core/utils.dart';
import 'package:dokan/app/data/error/failure.dart';
import 'package:dokan/app/module/login/model/user_login_response_model.dart';
import 'package:dokan/app/module/login/repository/auth_repository.dart';
import 'package:dokan/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;
  LoginController(this._authRepository);

  var isLoading = false.obs;

  var userNameController = TextEditingController(text: "Ziaur Rahman");
  var passwordController = TextEditingController(text: "123456");
  var toggle = false.obs;

  UserLoginResponseModel? _user;

  bool get isLoggedIn => _user != null && _user!.token.isNotEmpty;

  UserLoginResponseModel? get userInfo => _user;

  set user(UserLoginResponseModel? userData) {
    _user = userData;
    cacheUserData();
    update();
  }

  void cacheUserData() => _authRepository.saveCashedUserInfo(_user!);

  @override
  void onInit() {
    /// set user data if user already login
    final result = _authRepository.getCashedUserInfo();
    result.fold(
          (l) => _user = null,
          (r) {
        _user = r;
      },
    );
    super.onInit();
  }

  void validationForm(BuildContext context){
    if(userNameController.text.isEmpty){
      Utils.showSnackBar(message: "Username is required");
      return;
    } else if(passwordController.text.isEmpty) {
      Utils.showSnackBar(message: "Password is required");
      return;
    }
    login(username: userNameController.text, password: passwordController.text);
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
      user = data;
      Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        userNameController.text = "";
        passwordController.text = "";
        Get.offAndToNamed(Routes.mainScreen);
      });
    });
  }

  Future<Either<Failure, bool>> userLogout() async {
    final result = _authRepository.userLogout();
    _user = null;
    return result;
  }
}