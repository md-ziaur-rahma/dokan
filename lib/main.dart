import 'package:dokan/app/app_binding/app_binding.dart';
import 'package:dokan/app/core/app_colors.dart';
import 'package:dokan/app/core/app_sizes.dart';
import 'package:dokan/app/core/theme.dart';
import 'package:dokan/app/core/utils.dart';
import 'package:dokan/app/module/home/screens/home_screen.dart';
import 'package:dokan/app/module/login/screen/login_screen.dart';
import 'package:dokan/app/module/main_page/main_screen.dart';
import 'package:dokan/app/module/splash/screen/splash_screen.dart';
import 'package:dokan/app/routes/pages.dart';
import 'package:dokan/app/routes/routes.dart';
import 'package:dokan/app/services/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
late final SharedPreferences sharedPreferences;
void main() async {
  await AppInitializer().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GestureDetector(
      onTap: () {
        Utils.unFocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        title: 'Dokan',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          primarySwatch: AppColors.appColor,
          hoverColor: AppColors.appColor,
          primaryColor: AppColors.appColor,
          textTheme: TextTheme(
              labelLarge: GoogleFonts.roboto(),
              bodyLarge: GoogleFonts.roboto(),
              bodyMedium: GoogleFonts.roboto()),
          buttonTheme: ButtonThemeData(
            buttonColor: AppColors.appColor,
            textTheme: ButtonTextTheme.normal,
            disabledColor: AppColors.greyColor,
          ),
          fontFamily: "Roboto",
          dividerTheme: DividerThemeData(color: AppColors.greyColor),
          appBarTheme: AppBarTheme(
              titleTextStyle: GoogleFonts.biryani(
                  color: Colors.black,
                  textStyle: const TextStyle(fontWeight: FontWeight.w500))),
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          datePickerTheme: const DatePickerThemeData(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: AppColors.deppBlue,
          ),
        ),
        initialBinding: AppBinding(),
        home: const HomeScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        defaultTransition: Transition.cupertino,
        getPages: Pages.pages,
      ),
    );
  }
}