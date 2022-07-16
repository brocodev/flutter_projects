import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/find_out/ui/welcome_page/welcome_page.dart';
import 'package:google_fonts/google_fonts.dart';

class FindOutApp extends StatelessWidget {
  const FindOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'find Out',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFFF256C),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
    );
  }
}
