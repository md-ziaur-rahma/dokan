import 'package:dokan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInitializer {
  Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    try {
      await _initHive();
      sharedPreferences = await SharedPreferences.getInstance();
    } catch (e) {
      debugPrint("Error to initilize ${e.toString()}");
    }
  }

  Future<void> _initHive() async {
    // await Hive.initFlutter();
    // // Registering the home adapters
    // Hive.registerAdapter(UnitModelAdapter());
    // Hive.registerAdapter(UnitBookmarkModelAdapter());
    // Hive.registerAdapter(ScanResultModelAdapter());

    // Opening the box
    // await Hive.openBox<HiveHomeModal>(AppHive.homeModalBox);
  }
}
