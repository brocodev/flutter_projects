import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/superheroes/models/superhero.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperheroesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Superheroes App",
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: GoogleFonts.spartan(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        textTheme: TextTheme(
          headline2: GoogleFonts.spartan(
              fontWeight: FontWeight.w600, letterSpacing: -3.0, height: 1.0),
          headline5: GoogleFonts.spartan(
              letterSpacing: -1.0, fontWeight: FontWeight.w500),
        ).apply(displayColor: Colors.white, bodyColor: Colors.white),
      ),
      home: SuperheroSliderPage(),
    );
  }
}

class SuperheroSliderPage extends StatefulWidget {
  const SuperheroSliderPage({
    Key key,
  }) : super(key: key);

  @override
  _SuperheroSliderPageState createState() => _SuperheroSliderPageState();
}

class _SuperheroSliderPageState extends State<SuperheroSliderPage> {
  PageController _pageController;
  int _index;
  int _auxIndex;
  double _percent;
  double _auxPercent;
  bool _isScrolling;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _index = 0;
    _auxIndex = _index + 1;
    _percent = 0.0;
    _auxPercent = 1.0 - _percent;

    _pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    super.dispose();
  }

  // PAGE VIEW LISTENER
  void _pageListener() {
    _index = _pageController.page.floor();
    _auxIndex = _index + 1;
    _percent = (_pageController.page - _index).abs();
    _auxPercent = 1.0 - _percent;

    _isScrolling = (_pageController.page % 1.0 != 0);
    setState(() {}); // refresh values on the ui
  }

  @override
  Widget build(BuildContext context) {
    final heroes = Superhero.marvelHeroes;
    final angleRotate = (-pi * .5);
    return Scaffold(
      appBar: AppBar(
        title: Text("movies"),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          // SUPERHERO CARDS
          AnimatedPositioned(
            duration: kThemeAnimationDuration,
            top: 0,
            bottom: 0,
            right: _isScrolling ? 10 : 0,
            left: _isScrolling ? 10 : 0,
            child: Stack(
              children: [
                // BACK CARD
                Transform.translate(
                  offset: Offset(0, 50 * _auxPercent),
                  child: SuperheroCard(
                    superhero: heroes[_auxIndex.clamp(0, heroes.length - 1)],
                    factorChange: _auxPercent,
                  ),
                ),
                // FRONT CARD
                Transform.translate(
                  offset: Offset(-800 * _percent, 100 * _percent),
                  child: Transform.rotate(
                    angle: angleRotate * _percent,
                    child: SuperheroCard(
                      superhero: heroes[_index],
                      factorChange: _percent,
                    ),
                  ),
                )
              ],
            ),
          ),
          // VOID PAGE VIEW
          // This pageview is just for using the pagecontroller
          PageView.builder(
            controller: _pageController,
            itemCount: heroes.length,
            itemBuilder: (context, index) {
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}

class SuperheroCard extends StatelessWidget {
  final Superhero superhero;
  final double factorChange;

  const SuperheroCard({
    Key key,
    @required this.superhero,
    @required this.factorChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final separation = size.height * .24;
    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: size.height,
      child: Stack(
        children: [
          // COLOR BACKGROUND WITH ROUNDED CORNERS
          Positioned.fill(
            top: separation,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(superhero.rawColor),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          // SUPERHERO IMAGE
          Positioned(
            left: 20,
            right: 20,
            top: separation * factorChange,
            bottom: size.height * .35,
            child: Opacity(
              opacity: 1.0 - factorChange,
              child: Image.asset(superhero.pathImage),
            ),
          ),

          Positioned(
            left: 40,
            right: 100,
            top: size.height * .55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  superhero.heroName.toLowerCase(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  superhero.name.toLowerCase(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 25),
                Text.rich(
                  TextSpan(
                    text: 'learn more',
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.arrow_right_alt,
                          color: Colors.amber,
                        ),
                      )
                    ],
                  ),
                  style: GoogleFonts.spartan(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
