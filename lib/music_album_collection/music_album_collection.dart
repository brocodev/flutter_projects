import 'package:flutter/material.dart';
import 'package:flutter_projects/music_album_collection/pages/albums_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicAlbumList extends StatelessWidget {
  const MusicAlbumList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        primaryColor: Colors.white,
      ),
      home:const  AlbumsPage(),
    );
  }
}
