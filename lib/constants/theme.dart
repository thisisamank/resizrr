import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resizrr/constants/colors.dart';

class BrandTheme {
  static final lightTheme = ThemeData(
    primaryColor: BrandColors.green,
    textTheme: TextTheme(
      headline1: GoogleFonts.inter(fontSize: 20),
      bodyText1: GoogleFonts.inter(fontSize: 18),
      bodyText2: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
      subtitle1: GoogleFonts.inter(fontSize: 14),
    ),
  );
}
