import 'package:flutter/material.dart';

class CMColors {
  CMColors._();

  static const MaterialColor customThemeColorSwatch = MaterialColor(
    0xFF000000,
    {
      50: Color.fromRGBO(0, 0, 0, .1),
      100: Color.fromRGBO(0, 0, 0, .2),
      200: Color.fromRGBO(0, 0, 0, .3),
      300: Color.fromRGBO(0, 0, 0, .4),
      400: Color.fromRGBO(0, 0, 0, .5),
      500: Color.fromRGBO(0, 0, 0, .6),
      600: Color.fromRGBO(0, 0, 0, .7),
      700: Color.fromRGBO(0, 0, 0, .8),
      800: Color.fromRGBO(0, 0, 0, .9),
      900: Color.fromRGBO(0, 0, 0, 1.0),
    },
  );

  ///====>Basic Colors<=====///
  static const Color transparent = Color(0x00ffffff);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xff808080);
  static const Color red = Color(0xffff0000);
  static const Color whiteE5 = Color(0xffe5e5e5);

  /// App Colors
  static const primaryColor = Color(0xff007df2);
  static const Color secondaryColor = Color(0xffd7a017);
  static const Color actionBtnBgColor = Color(0xffE4E6EB);

  /// BackGround Color
  static const Color bgColor = Color(0xfff1f1f1);
}
