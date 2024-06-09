import 'package:get/get.dart';

class CmDimensions {
  CmDimensions._();

  /// ======>Screen Full Width and Height<========///

  static final double _widthFull = Get.width;
  static final double _heightFull = Get.height;

  /// ======>Getting Screen Grid Breakpoints<======///
  static const double _sm = 576; // all mobile devices
  static const double _md = 768; // some pixel tablets, iPad 10th gen
  static const double _lg = 992;
  static const double _xl = 1200;
  static const double _xxl = 1400;

  /// ======>Getting Device Font Zoom Factor<========///
  static double textScaleFactor = Get.textScaleFactor;

  /// ======>Setting App Default Font Size
  static double fontSizeDefault = _widthFull < _sm
      ? 12
      : _widthFull >= _md
          ? 22
          : _widthFull >= _lg
              ? 28
              : _widthFull >= _xl
                  ? 32
                  : _widthFull >= _xxl
                      ? 36
                      : 12;

  /// ======>Setting Default Icon Size<========///
  static double defaultIcon = _widthFull < _sm
      ? 20
      : _widthFull >= _md
          ? 45
          : _widthFull >= _lg
              ? 65
              : _widthFull >= _xl
                  ? 85
                  : _widthFull >= _xxl
                      ? 105
                      : 20;

  /// ======>Setting Default Appbar Height<========///
  static double defaultAppbarHeight = _widthFull < _sm
      ? 80
      : _widthFull >= _md
          ? 150
          : _widthFull >= _lg
              ? 70
              : _widthFull >= _xl
                  ? 90
                  : _widthFull >= _xxl
                      ? 110
                      : 80;

  /// ======>Setting Default Appbar Logo Height
  static double defaultAppbarLogo = _widthFull < _sm
      ? 45
      : _widthFull >= _md
          ? 75
          : _widthFull >= _lg
              ? 105
              : _widthFull >= _xl
                  ? 135
                  : _widthFull >= _xxl
                      ? 165
                      : 45;

  /// ======>Setting App Default Padding AND Margin Size
  static double defaultPaddingMargin = _widthFull < _sm
      ? 12
      : _widthFull >= _md
          ? 20
          : _widthFull >= _lg
              ? 28
              : _widthFull >= _xl
                  ? 32
                  : _widthFull >= _xxl
                      ? 36
                      : 25;

  /// ======>Setting App Default Image Size<========///
  static double defaultImageSize = _widthFull < _sm
      ? 200
      : _widthFull >= _md
          ? 400
          : _widthFull >= _lg
              ? 500
              : _widthFull >= _xl
                  ? 600
                  : _widthFull >= _xxl
                      ? 700
                      : 200;

  /// ======>Setting App Default Circle Radius Size<========///
  static double defaultRadiusSize = _widthFull < _sm
      ? 110
      : _widthFull >= _md
          ? 190
          : _widthFull >= _lg
              ? 240
              : _widthFull >= _xl
                  ? 270
                  : _widthFull >= _xxl
                      ? 350
                      : 110;

  /// ======>Setting Default Border Radius Size<========///
  static double defaultBorderRadius = _widthFull < _sm
      ? 12
      : _widthFull >= _md
          ? 20
          : _widthFull >= _lg
              ? 28
              : _widthFull >= _xl
                  ? 36
                  : _widthFull >= _xxl
                      ? 44
                      : 12;

  /// ======>Setting App Default Line Thickness<========///
  static double thin = _widthFull >= 1200 ? 1 : .5;
  static double defaultThick = _widthFull >= 1200 ? 1.5 : 1;
  static double thickDouble = _widthFull >= 1200 ? 2 : 1.5;
  static double thickOver = _widthFull >= 1200 ? 4 : 3;

  /// ======>Setting App User Avatar Sizes<========///
  static double avatarSmall = _widthFull >= 1300 ? 60 : 30;
  static double avatarDefault = _widthFull >= 1300 ? 80 : 40;
  static double avatarLarge = _widthFull >= 1300 ? 120 : 60;
  static double avatarExtraLarge = _widthFull >= 1300 ? 160 : 80;
  static double avatarOverLarge = _widthFull >= 1300 ? 300 : 150;

  /// ======>Screen Sizes<========///
  static double fullWidth = _widthFull;
  static double widthHalf = _widthFull / 2;
  static double widthOneOfThree = _widthFull / 3;
  static double widthQuarter = _widthFull / 4;
  static double widthOneOfFive = _widthFull / 5;
  static double widthOneOfSix = _widthFull / 6;
  static double widthOneOfSeven = _widthFull / 7;
  static double widthOneOfEight = _widthFull / 8;
  static double widthOneOfNine = _widthFull / 9;
  static double widthOneOfTen = _widthFull / 10;

  /// Height
  static double fullHeight = _heightFull;
  static double heightHalf = _heightFull / 2;
  static double heightOneOfThree = _heightFull / 3;
  static double heightQuarter = _heightFull / 4;
  static double heightOneOfFive = _heightFull / 5;
  static double heightOneOfSix = _heightFull / 6;
  static double heightOneOfSeven = _heightFull / 7;
  static double heightOneOfEight = _heightFull / 8;
  static double heightOneOfNine = _heightFull / 9;
  static double heightOneOfTen = _heightFull / 10;
}
