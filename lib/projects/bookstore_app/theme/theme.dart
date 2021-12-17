import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAppTheme {
  static final _appBarTheme = AppBarTheme(
    color: Colors.white,
    elevation: 0,
    toolbarTextStyle: GoogleFonts.workSans(
      color: Colors.grey[800],
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
  );

  static final _textTheme = GoogleFonts.workSansTextTheme().copyWith(
    headline6: GoogleFonts.workSans(
      color: Colors.white,
      fontSize: 18,
    ),
    headline5: GoogleFonts.workSans(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 22,
    ),
    headline4: GoogleFonts.workSans(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: GoogleFonts.workSans(
      fontSize: 16,
      color: Colors.grey[800],
      fontWeight: FontWeight.w500,
    ),
    subtitle2: GoogleFonts.workSans(
      fontSize: 15,
      color: Colors.grey[400],
      fontWeight: FontWeight.w400,
    ),
  );

  static final themeData = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      primaryColor: Colors.white,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,);
}
