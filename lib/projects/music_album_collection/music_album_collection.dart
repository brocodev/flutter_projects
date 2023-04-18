import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/music_album_collection/screens/albums/albums_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicAlbumList extends StatelessWidget {
  const MusicAlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        primaryColor: Colors.white,
      ),
      home: const AlbumsScreen(),
    );
  }
}
