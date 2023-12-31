import 'package:flutter/material.dart';
import 'package:medicalista/core/constant/color.dart';

ThemeData englishTheme = ThemeData(
    // fontFamily: "PlayfairDisplay",
    textTheme: const TextTheme(
  displayLarge: TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
  bodyLarge:
      TextStyle(height: 2, color: AppColor.grey, fontWeight: FontWeight.bold),
));

ThemeData arabicTheme = ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2, color: AppColor.grey, fontWeight: FontWeight.bold),
    ));
