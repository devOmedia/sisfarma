import 'package:flutter/material.dart';
import 'package:sisfarma/app/core/themes/app_color.dart';


class CMAppThemes {
  CMAppThemes._();
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: CMColors.customThemeColorSwatch,
      backgroundColor: CMColors.white,
    ),
    fontFamily: 'Poppins',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(CMColors.primaryColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ),
    cardTheme: const CardTheme(color: Colors.white, elevation: 0),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: CMColors.customThemeColorSwatch,
    ),
    brightness: Brightness.dark,
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Poppins',
          bodyColor: Colors.white,
        ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(Colors.orange),

      //shape: const CircleBorder(),
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      surfaceTintColor: Colors.black,
    ),
  );
}
