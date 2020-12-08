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
        textTheme: GoogleFonts.spartanTextTheme(),
      ),
      home: SuperheroSliderPage(),
    );
  }
}
