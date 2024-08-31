import 'dart:io';
import 'package:games/app/my_app.dart';
import 'package:games/app/my_app_controller.dart';
import 'package:games/core/data/repository/shared_prefrence_repository.dart';

import 'package:games/ui/views/xo_game/xo_view/xo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  HttpOverrides.global = MyHttpOverrides();
  Get.lazyPut(
    () => SharedPrefrenceRepository(),
  );

  await Get.putAsync<SharedPreferences>(
    () async {
      return await SharedPreferences.getInstance();
    },
  );

  await Get.putAsync<MyAppController>(
    () async {
      return await MyAppController();
    },
  );
  Get.put(XoGameController());
  runApp(MyApp());
}
