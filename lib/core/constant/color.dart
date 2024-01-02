import 'package:flutter/material.dart';

class AppColor {
  static const Color kPrimaryColor = Color.fromRGBO(92, 225, 230, 1);
  static const Color kSeconderyColor = Color.fromRGBO(0, 74, 173, 1);
  static const Color kThirdColor = Color.fromRGBO(166, 166, 166, 1);
  static const Color kFourthColor = Colors.teal;

  static const Color eFirstColor = Color(0xff5CE1E6);
  static const Color eSecondColor = Color(0xff00A9AF);
  static const Color eThirdColor = Color(0xff95B0B1);
  static const Color eFourthColor = Color(0xff324B4C);
  static const Color eFifthColor = Color(0xff00B9E0);

  static const Color grey = Color(0xff888888);
  static const Color black = Color(0xff000000);
  static const Gradient gradientApp = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff9c9c9c),
      Color(0xffaaaaaa),
      Color(0xffbbbbbb),
      Color(0xffcccccc),
      Color(0xffdddddd),
      Color(0xffeeeeee),
      Color(0xffffffff)
    ],
  );
  static const Gradient egradientApp = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff00343B),
      Color(0xff005C62),
      Color(0xff00868C),
      Color(0xff13B3B8),
      Color(0xff5CE1E6),
      Color(0xffffffff),
    ],
  );
}
