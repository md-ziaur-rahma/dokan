import 'package:dokan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInitializer {
  Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    try {
      sharedPreferences = await SharedPreferences.getInstance();
    } catch (e) {
      debugPrint("Error to initilize ${e.toString()}");
    }
  }
}
