import 'package:flutter/material.dart';

class AppColors {
  static Color greenColor = const Color(0xFF289A3A);
  static Color yellowColor = const Color(0xFFFEF301);
  static Color redColor = const Color(0xFFE53317);
  static Color blueColor = const Color(0xFF0058A0);
  static Color orangeColor = const Color(0xFFFC7001);
  static Color pasteColor = const Color(0xFF00DDD8);
  static Color brownColor = const Color(0xFF3D010B);
  static Color profileHeaderColor = const Color(0xFFE6EBEF);
  static Color textColor = const Color(0xFF7E7E7E);
}

ThemeData primaryTheme = ThemeData(
  // scaffold color
  scaffoldBackgroundColor: Colors.white,

  // app bar theme colors
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.redColor,
    surfaceTintColor: Colors.transparent,
  ),
);
