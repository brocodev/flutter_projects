import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/template_gallery/ui/contact_list_page.dart';

class TemplateGalleryApp extends StatelessWidget {
  const TemplateGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff23202a),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple[400],
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white70,
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.grey[800]),
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      home: const ContactListPage(),
    );
  }
}
