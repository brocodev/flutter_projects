import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/ui/screens/home/movie_home.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieSelectionApp extends StatelessWidget {
  const MovieSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.barlowCondensedTextTheme()
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyText2: GoogleFonts.barlowCondensed(
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
      ),
      home: MovieHome(),
    );
  }
}
