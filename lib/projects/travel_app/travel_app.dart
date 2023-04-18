import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/theme/theme.dart';
import 'package:flutter_projects/projects/travel_app/ui/feed/feed_screen.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TravelTheme.theme,
      home: const FeedScreen(),
    );
  }
}
