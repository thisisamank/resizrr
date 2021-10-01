import 'package:flutter/material.dart';

class BrandColors {
  static const green = Color(0xFF61FA70);
  static const green55 = Color(0x8C61FA70);
  static const green70 = Color(0xB361FA70);
  static const lightGreen = Color(0xFFE3F3E5);
  static const lightGrey = Color(0xFFE8E8E8);
  static const black = Color(0xFF0C0C0D);

  static Color adaptiveBorder(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.dark
          ? BrandColors.lightGrey
          : Colors.black;
}
