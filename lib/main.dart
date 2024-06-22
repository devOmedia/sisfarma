import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sisfarma/app/core/binding/initialBinding.dart';
import 'package:sisfarma/app/core/themes/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    GetMaterialApp(
      title: "Sisfarma",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: CMAppThemes.light,
      darkTheme: CMAppThemes.dark,
      themeMode: ThemeMode.dark,
      initialBinding: InitialBindings(),
    ),
  );
}
