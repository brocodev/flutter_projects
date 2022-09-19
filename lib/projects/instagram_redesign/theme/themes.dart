import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramTheme {
  static final kAppBarThemeLight = AppBarTheme(
    iconTheme: IconThemeData(color: Colors.grey.shade400),
    color: const Color(0xFFF2F6F9),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.satisfy(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );

  static final kAppBarThemeDark = kAppBarThemeLight.copyWith(
    iconTheme: const IconThemeData(color: Colors.white),
    color: Colors.black,
    titleTextStyle: GoogleFonts.satisfy(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: InstagramTheme.kAppBarThemeDark,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF2F6F9),
    backgroundColor: Colors.grey[100],
    colorScheme: const ColorScheme.light(),
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: InstagramTheme.kAppBarThemeLight,
  );
}
