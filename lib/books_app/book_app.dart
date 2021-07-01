import 'package:flutter/material.dart';
import 'package:flutter_projects/books_app/theme/theme.dart';
import 'package:flutter_projects/books_app/ui/home_page.dart';

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: BookAppTheme.themeData,
      home: const _BookNavigationPage(),
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
  PageController _pageController;
  int _indexPage;

  @override
  void initState() {
    _pageController = PageController();
    _indexPage = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) => setState(() {
          _indexPage = value;
        }),
        children: const [
          HomePage(),
          Scaffold(body: Center(child: Text('Discover'))),
          Scaffold(body: Center(child: Text('Profile'))),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: kToolbarHeight,
        child: BottomNavigationBar(
          onTap: (value) => setState(() {
            _pageController.animateToPage(value,
                duration: kThemeChangeDuration, curve: Curves.decelerate);
            _indexPage = value;
          }),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Colors.white,
          currentIndex: _indexPage,
          items: const [
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
