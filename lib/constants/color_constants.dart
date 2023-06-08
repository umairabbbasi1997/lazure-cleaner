import 'package:flutter/material.dart';

abstract class ColorConstants {
  // static const Color primaryColor = Color(0XFF0E3C89);

  static const Color facebookColor = Color(0XFF1778F1);
  static const Color googleColor = Color(0XFFEF4235);
  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0XFFF3F3F3);
  static const Color greenColor = Color(0XFF20D4CB);
  static const Color purpleColor = Color(0XFF814AF7);
  static const Color darkPurpleColor = Color(0XFF1e003c);
  static const Color socialContainer = Color(0XFFebebeb);
  static const Color selectedPurpleColor = Color(0XFF120138);
  static const Color secoundaryColor = Color(0XFF120138);

  //used on notification tile
  static const Color primaryColorDarked = Color(0XFF8ec63f);

  static const Map<int, Color> primaryColorMap = {
    50: Color.fromRGBO(51, 49, 50, .1),
    100: Color.fromRGBO(51, 49, 50, .2),
    200: Color.fromRGBO(51, 49, 50, .3),
    300: Color.fromRGBO(51, 49, 50, .4),
    400: Color.fromRGBO(51, 49, 50, .5),
    500: Color.fromRGBO(51, 49, 50, .6),
    600: Color.fromRGBO(51, 49, 50, .7),
    700: Color.fromRGBO(51, 49, 50, .8),
    800: Color.fromRGBO(51, 49, 50, .9),
    900: Color.fromRGBO(51, 49, 50, 1),
  };
  static const MaterialColor primaryColorSwatch =
      MaterialColor(0XFF333132, primaryColorMap);
}
