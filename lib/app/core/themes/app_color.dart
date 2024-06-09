import 'package:flutter/material.dart';

class CMColors {
  CMColors._();

  static const MaterialColor customThemeColorSwatch = MaterialColor(
    0xff007df2,
    {
      50: Color(0xff0071da), //10%//
      100: Color(0xff0064c2), //20%//
      200: Color(0xff0058a9), //30%//
      300: Color(0xff004b91), //40%//
      400: Color(0xff003f79), //50%//
      500: Color(0xff003261), //60%//
      600: Color(0xff002549), //70%//
      700: Color(0xff001930), //80%//
      800: Color(0xff000c18), //90%//
      900: Color(0xff000000), //100%//
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
