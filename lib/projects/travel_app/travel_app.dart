import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: Scaffold(
        body: Center(
          child: Text('New York'),
        ),
      ),
    );
  }
}
