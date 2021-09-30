import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resizrr/constants/colors.dart';

class BrandTheme {
  static final lightTheme = ThemeData(
    primaryColor: BrandColors.green,
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      backgroundColor: BrandColors.lightGrey,
      iconTheme: IconThemeData(
        color: BrandColors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: BrandColors.lightGrey,
          statusBarBrightness: Brightness.dark),
      // actionsIconTheme: IconThemeData(color: BrandColors.green,),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: BrandColors.black,
      unselectedItemColor: BrandColors.black
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: BrandColors.black,
      inactiveTrackColor: BrandColors.lightGrey,
      thumbColor: BrandColors.black,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.inter(fontSize: 20),
      bodyText1: GoogleFonts.inter(fontSize: 18),
      bodyText2: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
      subtitle1: GoogleFonts.inter(fontSize: 14),
    ),
    brightness: Brightness.light,
    backgroundColor: BrandColors.lightGrey,
    scaffoldBackgroundColor: BrandColors.lightGrey,
    accentColor: BrandColors.green,
    accentIconTheme: const IconThemeData(
      color: BrandColors.green,
    ),
    iconTheme: const IconThemeData(
      color: BrandColors.black,
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.green,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: BrandColors.lightGrey,
        unselectedItemColor: BrandColors.lightGrey,
        backgroundColor: BrandColors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: BrandColors.black,
      iconTheme: IconThemeData(
        color: BrandColors.green,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: BrandColors.black,
          statusBarBrightness: Brightness.light),
      actionsIconTheme: IconThemeData(
        color: BrandColors.green,
      ),
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: BrandColors.green,
      inactiveTrackColor: BrandColors.lightGreen,
      thumbColor: BrandColors.green,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.inter(fontSize: 20),
      bodyText1: GoogleFonts.inter(fontSize: 18),
      bodyText2: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: BrandColors.lightGrey),
      subtitle1: GoogleFonts.inter(fontSize: 14),
    ),
    brightness: Brightness.dark,
    backgroundColor: BrandColors.black,
    scaffoldBackgroundColor: BrandColors.black,
    accentColor: BrandColors.green,
    accentIconTheme: const IconThemeData(
      color: BrandColors.green,
    ),
    iconTheme: const IconThemeData(
      color: BrandColors.lightGrey,
    ),
  );
}
