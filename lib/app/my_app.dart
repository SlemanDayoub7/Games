import 'package:games/core/translation/app_translation.dart';
import 'package:games/ui/shared/utils.dart';
import 'package:games/ui/views/xo_game/board_size_view/board_size_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.upToDown,
        debugShowCheckedModeBanner: false,
        locale: getLocal(),
        translations: AppTranslation(),
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'PermanentMarker',
          primarySwatch: Colors.blue,
        ),
        home: BoardSizeSelectionScreen());
  }
}

Locale getLocal() {
  String langCode = storage.getAppLanguage();
  return Locale('en', 'US');
  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else if (langCode == 'tr')
    return Locale('tr', 'TR');
  else
    return Locale('fr', 'FR');
}
