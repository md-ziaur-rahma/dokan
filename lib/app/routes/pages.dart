import 'package:dokan/app/module/home/screens/home_screen.dart';
import 'package:dokan/app/module/login/binding/login_binding.dart';
import 'package:dokan/app/module/login/screen/login_screen.dart';
import 'package:dokan/app/module/main_page/binding/main_page_binding.dart';
import 'package:dokan/app/module/main_page/main_screen.dart';
import 'package:dokan/app/module/signup/binding/signup_binding.dart';
import 'package:dokan/app/module/signup/screen/signup_screen.dart';
import 'package:dokan/app/module/splash/binding/splash_binding.dart';
import 'package:dokan/app/module/splash/screen/splash_screen.dart';
import 'package:dokan/app/routes/routes.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      // binding: HomeBinding(),
    ),
  ];
}