import 'package:dokan/app/data/data_source/remote_data_source.dart';
import 'package:dokan/app/module/account/controller/account_controller.dart';
import 'package:dokan/app/module/home/controller/home_controller.dart';
import 'package:dokan/app/module/login/controller/login_controller.dart';
import 'package:dokan/app/module/login/repository/auth_repository.dart';
import 'package:dokan/app/module/main_page/controller/main_controller.dart';
import 'package:dokan/app/module/splash/controller/splash_controller.dart';
import 'package:dokan/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Client>(() => Client());
    Get.lazyPut<SharedPreferences>(() => sharedPreferences);
    Get.lazyPut<RemoteDataSource>(
            () => RemoteDataSourceImpl(client: Get.find()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: Get.find(),));
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => LoginController(Get.find()));
  }
}