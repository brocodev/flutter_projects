import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramTheme {
  static final kAppBarThemeLight = AppBarTheme(
      iconTheme: IconThemeData(color: Colors.grey.shade400),
      brightness: Brightness.light,
      color: const Color(0xFFF2F6F9),
      elevation: 0,
      centerTitle: true,
      textTheme: TextTheme(
        headline6: GoogleFonts.satisfy(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ));

  static final kAppBarThemeDark = kAppBarThemeLight.copyWith(
      iconTheme: const IconThemeData(color: Colors.white),
      brightness: Brightness.dark,
      color: Colors.black,
      textTheme: TextTheme(
        headline6: GoogleFonts.satisfy(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ));

  static final kDarkTheme = ThemeData.dark().copyWith(
      primaryColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      colorScheme:
          ColorScheme.dark(primaryVariant: Colors.white.withOpacity(.06)),
      textTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: InstagramTheme.kAppBarThemeDark);

  static final kLightTheme = ThemeData(
    primaryColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFFF2F6F9),
    backgroundColor: Colors.grey[100],
    colorScheme: const ColorScheme.light(primaryVariant: Colors.white),
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: InstagramTheme.kAppBarThemeLight,
  );
}
