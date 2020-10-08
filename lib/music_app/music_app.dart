import 'package:flutter/material.dart';
import 'package:flutter_projects/music_app/pages/album_grid_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: AlbumGridPage(),
    );
  }
}
