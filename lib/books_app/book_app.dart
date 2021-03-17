import 'package:flutter/material.dart';
import 'package:flutter_projects/books_app/theme/theme.dart';
import 'package:flutter_projects/books_app/ui/home_page.dart';

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: BookAppTheme.themeData,
        home: _BookNavigationPage(),

    );
  }
}

class _BookNavigationPage extends StatefulWidget {
  const _BookNavigationPage({
    Key key,
  }) : super(key: key);

  @override
  _BookNavigationPageState createState() => _BookNavigationPageState();
}

class _BookNavigationPageState extends State<_BookNavigationPage> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: kThemeChangeDuration,
        child: [
          const HomePage(),
          Scaffold(key: UniqueKey(), body: Center(child: Text('Discover'))),
          Scaffold(key: UniqueKey(), body: Center(child: Text('Profile'))),
        ][indexPage],
      ),
      bottomNavigationBar: SizedBox(
        height: kToolbarHeight + 10,
        child: BottomNavigationBar(
          onTap: (value) {
            if (value != indexPage) setState(() => indexPage = value);
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Colors.white,
          currentIndex: indexPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_on),
              label: 'For you',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
