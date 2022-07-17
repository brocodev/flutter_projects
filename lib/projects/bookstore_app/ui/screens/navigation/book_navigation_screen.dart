import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/bookstore_app/ui/screens/home/home_page.dart';

class BookNavigationScreen extends StatefulWidget {
  const BookNavigationScreen({super.key});

  @override
  BookNavigationScreenState createState() => BookNavigationScreenState();
}

class BookNavigationScreenState extends State<BookNavigationScreen> {
  PageController? _pageController;
  late int _indexPage;

  @override
  void initState() {
    _pageController = PageController();
    _indexPage = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
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
        height: kToolbarHeight + MediaQuery.of(context).padding.bottom,
        child: BottomNavigationBar(
          onTap: (value) => setState(() {
            _pageController!.animateToPage(
              value,
              duration: kThemeChangeDuration,
              curve: Curves.decelerate,
            );
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
