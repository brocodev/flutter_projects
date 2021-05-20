import 'package:flutter/material.dart';
import 'package:flutter_projects/superheroes/ui/superhero_slider_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperheroesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Superheroes App",
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        //-------------------
        // App Bar Theme
        //-------------------
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: GoogleFonts.spartan(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        //-------------------
        // Text Theme
        //-------------------
        textTheme: TextTheme(
          headline2: GoogleFonts.spartan(
            fontWeight: FontWeight.w600,
            letterSpacing: -3.0,
            height: 0.9,
            fontSize: 64,
          ),
          headline5: GoogleFonts.spartan(
            letterSpacing: -1.0,
            fontWeight: FontWeight.w500,
          ),
        ).apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        ),
      ),
      home: SuperheroSliderPage(),
    );
  }
}
