import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sisfarma/app/core/binding/initialBinding.dart';
import 'package:sisfarma/app/core/themes/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "Sisfarma",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: CMAppThemes.light,
      darkTheme: CMAppThemes.dark,
      themeMode: ThemeMode.light,
      initialBinding: InitialBindings(),
    ),
  );
}
