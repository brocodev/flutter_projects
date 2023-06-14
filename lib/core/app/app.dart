import 'package:flutter/material.dart';
import 'package:flutter_projects/core/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class BrocodevProjectsApp extends StatelessWidget {
  const BrocodevProjectsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brocodev Projects',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(background: Colors.grey[50]),
      ),
      initialRoute: '/',
      routes: ProjectRoutes.routes,
    );
  }
}