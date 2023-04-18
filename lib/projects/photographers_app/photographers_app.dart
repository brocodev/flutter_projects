import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/photographers_app/models/users.dart';
import 'package:flutter_projects/projects/photographers_app/theme/photo_app_colors.dart';
import 'package:flutter_projects/projects/photographers_app/ui/home/photo_home_page.dart';
import 'package:flutter_projects/projects/photographers_app/ui/profile/photo_profile_page.dart';
import 'package:flutter_projects/projects/photographers_app/ui/widgets/curved_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotographersApp extends StatelessWidget {
  const PhotographersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF4F3F3),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle:
              GoogleFonts.philosopher(color: PhotoAppColors.kDarkBlue),
          iconTheme: const IconThemeData(color: PhotoAppColors.kDarkBlue),
        ),
        textTheme: GoogleFonts.philosopherTextTheme().apply(
          bodyColor: PhotoAppColors.kDarkBlue,
          displayColor: PhotoAppColors.kDarkBlue,
        ),
        iconTheme: const IconThemeData(color: PhotoAppColors.kDarkBlue),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _NavigationPage(),
    );
  }
}

class _NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<_NavigationPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverflowBox(
        maxHeight: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: [
            const PhotoHomePage(),
            const Scaffold(body: Center(child: Text('Messages'))),
            const Scaffold(body: Center(child: Text('Favorites'))),
            PhotoProfilePage(user: PhotoUser.liliana),
          ][index],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (val) => setState(() {
          index = val;
        }),
        currentIndex: index,
        items: const [
          CurvedNavigationBarItem(iconData: Icons.widgets),
          CurvedNavigationBarItem(iconData: FontAwesome.commenting),
          CurvedNavigationBarItem(iconData: Icons.favorite),
          CurvedNavigationBarItem(iconData: Icons.person),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
