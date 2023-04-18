import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/orix_gaming/ui/home/orix_gaming_home_page.dart';
import 'package:flutter_projects/projects/orix_gaming/ui/widgets/orix_navigation_bar.dart';

class OrixGamingApp extends StatelessWidget {
  const OrixGamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorLight: Colors.orange[700],
        primaryColorDark: Colors.deepOrange[700],
      ),
      home: const _MainPage(),
    );
  }
}

class _MainPage extends StatefulWidget {
  const _MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: kThemeChangeDuration,
        child: const [
          OrixGamingHomePage(),
          Scaffold(body: Center(child: Text('Games'))),
          Scaffold(body: Center(child: Text('Favorites'))),
          Scaffold(body: Center(child: Text('Profile'))),
        ][index],
      ),
      bottomNavigationBar: OrixNavigationBar(
        currentIndex: index,
        onTapItem: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          OrixNavigationBarItem(
            label: 'Home',
            iconData: Icons.home,
            unselectedIconData: Icons.home_outlined,
          ),
          OrixNavigationBarItem(
            label: 'Games',
            iconData: Icons.videogame_asset,
            unselectedIconData: Icons.videogame_asset_outlined,
          ),
          OrixNavigationBarItem(
            label: 'Favorite',
            iconData: Icons.favorite,
            unselectedIconData: Icons.favorite_border,
          ),
          OrixNavigationBarItem(
            label: 'Profile',
            iconData: Icons.person,
            unselectedIconData: Icons.person_outline,
          ),
        ],
      ),
    );
  }
}
