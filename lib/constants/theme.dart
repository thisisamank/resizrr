import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resizrr/constants/colors.dart';

class BrandTheme {
  static final lightTheme = ThemeData(
    primaryColor: BrandColors.green,
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: BrandColors.black,
      ),
      // actionsIconTheme: IconThemeData(color: BrandColors.green,),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: BrandColors.black,
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
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: BrandColors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: BrandColors.green,
    ),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.dark,
      backgroundColor: BrandColors.black,
      iconTheme: IconThemeData(
        color: BrandColors.green,
      ),
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
      bodyText2: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
      subtitle1: GoogleFonts.inter(fontSize: 14),
    ),
    brightness: Brightness.dark,
    backgroundColor: BrandColors.black,
    accentColor: BrandColors.green,
    accentIconTheme: const IconThemeData(
      color: BrandColors.green,
    ),
    iconTheme: const IconThemeData(
      color: BrandColors.green,
    ),
  );
}
