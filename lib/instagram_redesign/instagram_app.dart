import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.grey),
          brightness: Brightness.light,
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          textTheme: TextTheme(
            title: GoogleFonts.satisfy(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Feather.settings),
          title: Text('Instagram'),
          actions: [
            IconButton(
              icon: Icon(Feather.mail),
              onPressed: () {},
            )
          ],
        ),
        body: Center(
          child: Container(
            child: Text('Body'),
          ),
        ),
      ),
    );
  }
}
