import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/music_vinyl_player/ui/my_library/my_library_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicVinylPlayer extends StatelessWidget {
  const MusicVinylPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.black),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.spectralTextTheme(),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.poppins(),
          iconTheme: const IconThemeData(color: Colors.black),
          color: Colors.transparent,
          elevation: 0,
          actionsIconTheme: const IconThemeData(color: Colors.black),
        ),
      ),
      home: const MyLibraryPage(),
    );
  }
}
