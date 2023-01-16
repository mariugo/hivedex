import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
    ),
    headline3: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
    ),
    bodyText1: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    subtitle1: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
    ),
    headline5: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headline4: GoogleFonts.montserrat(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
    ),
    headline3: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
    ),
    bodyText1: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
    ),
    headline5: GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headline4: GoogleFonts.montserrat(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.white70,
    ),
  );

  static lightTheme() {
    return ThemeData(
      primaryColor: Colors.white,
      indicatorColor: Colors.grey,
      brightness: Brightness.light,
      tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          labelStyle: lightTextTheme.bodyText1,
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: lightTextTheme.bodyText1),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: lightTextTheme,
    );
  }

  static darkTheme() {
    return ThemeData(
      primaryColor: Colors.black,
      indicatorColor: Colors.grey,
      brightness: Brightness.dark,
      tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          labelStyle: darkTextTheme.bodyText1,
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle: darkTextTheme.bodyText1),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: darkTextTheme,
    );
  }
}
