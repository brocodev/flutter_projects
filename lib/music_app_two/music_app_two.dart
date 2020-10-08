import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/select_album_page.dart';

class MusicAppTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.spectralTextTheme(),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.transparent,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: SelectAlbumPage(),
    );
  }
}
