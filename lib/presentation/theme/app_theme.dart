import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontSize: 24,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontSize: 12,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText1: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontSize: 12,
      color: Colors.white,
    ),
  );

  static lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: lightTextTheme,
    );
  }

  static darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: darkTextTheme,
    );
  }
}
