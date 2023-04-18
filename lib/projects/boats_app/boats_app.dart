import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/boats_app/ui/screens/boat_list_screen.dart';

class BoatsApp extends StatelessWidget {
  const BoatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 32,
            color: Colors.grey[800],
          ),
          bodyText2: const TextStyle(fontSize: 16),
        ),
      ),
      home: const BoatListPage(),
    );
  }
}
