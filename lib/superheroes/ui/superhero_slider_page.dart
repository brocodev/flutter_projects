import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/superheroes/models/superhero.dart';
import 'package:flutter_projects/superheroes/ui/widgets/superhero_page_card.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperheroSliderPage extends StatefulWidget {
  @override
  _SuperheroSliderPageState createState() => _SuperheroSliderPageState();
}

class _SuperheroSliderPageState extends State<SuperheroSliderPage> {
  PageController pageController;
  double invertPercent = 1.0;
  double percent = 0.0;
  int index = 6;
  ScrollDirection scrollDirection;

  @override
  void initState() {
    pageController = PageController(initialPage: index);
    scrollDirection = ScrollDirection.reverse;
    pageController.addListener(() {
      scrollDirection = pageController.position.userScrollDirection;
      //PREVIOUS
      if (scrollDirection == ScrollDirection.forward) {
        index = pageController.page.ceil();
      }
      //NEXT
      if (scrollDirection == ScrollDirection.reverse) {
        index = pageController.page.floor();
      }
      percent = (pageController.page - index).abs();
      invertPercent = 1.0 - percent;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heroes = Superhero.marvelHeroes;
    print(scrollDirection);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "movies",
          style: GoogleFonts.spartan(fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            children: [
              Transform.translate(
                offset: scrollDirection == ScrollDirection.reverse
                    ? Offset(0, 50 * invertPercent)
                    : Offset(0, 50 * percent),
                child: SuperheroPageCard(
                  hero: scrollDirection == ScrollDirection.reverse
                      ? heroes[(index + 1).clamp(0, heroes.length - 1)]
                      : heroes[index],
                  percent: scrollDirection == ScrollDirection.reverse
                      ? invertPercent
                      : percent,
                ),
              ),
              Transform.translate(
                offset: scrollDirection == ScrollDirection.reverse
                    ? Offset((-size.width * 2) * percent,
                        (size.height * .6) * percent)
                    : Offset(-800 * invertPercent, 0),
                child: Transform.rotate(
                  angle: scrollDirection == ScrollDirection.reverse
                      ? (pi * -.5) * percent
                      : (pi * -.5) * invertPercent,
                  child: SuperheroPageCard(
                    hero: scrollDirection == ScrollDirection.reverse
                        ? heroes[index]
                        : heroes[(index - 1).clamp(0, heroes.length - 1)],
                    percent: scrollDirection == ScrollDirection.reverse
                        ? percent
                        : invertPercent,
                  ),
                ),
              ),
            ],
          ),
          PageView.builder(
            itemCount: heroes.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}

// Stack(
// children: [
// Transform.translate(
// offset: scrollDirection == ScrollDirection.reverse
// ? Offset(0, 50 * invertPercent)
// : Offset(0, 50 * percent),
// child: SuperheroPageCard(
// hero: scrollDirection == ScrollDirection.reverse
// ? heroes[(index + 1).clamp(0, heroes.length - 1)]
// : heroes[index],
// percent: scrollDirection == ScrollDirection.reverse
// ? invertPercent
//     : percent,
// ),
// ),
// Transform.translate(
// offset: scrollDirection == ScrollDirection.reverse
// ? Offset((-size.width * 2) * percent,
// (size.height * .6) * percent)
// : Offset(-800 * invertPercent, 0),
// child: Transform.rotate(
// angle: scrollDirection == ScrollDirection.reverse
// ? (pi * -.5) * percent
//     : (pi * -.5) * invertPercent,
// child: SuperheroPageCard(
// hero: scrollDirection == ScrollDirection.reverse
// ? heroes[index]
// : heroes[(index - 1).clamp(0, heroes.length - 1)],
// percent: scrollDirection == ScrollDirection.reverse
// ? percent
//     : invertPercent,
// ),
// ),
// ),
// ],
// ),

// Stack(
// children: [
// Transform.translate(
// offset: Offset(0, 50 * invertPercent),
// child: SuperheroPageCard(
// hero: heroes[(index + 1).clamp(0, heroes.length - 1)],
// percent: invertPercent,
// ),
// ),
// Transform.translate(
// offset: Offset(
// (-size.width * 2) * percent, (size.height * .6) * percent),
// child: Transform.rotate(
// angle: (pi * -.5) * percent,
// child: SuperheroPageCard(
// hero: heroes[index],
// percent: percent,
// ),
// ),
// )
// ],
// ),

// Stack(
// children: [
// Transform.translate(
// offset: Offset(0, 50 * percent),
// child: SuperheroPageCard(
// hero: heroes[index],
// percent: percent,
// ),
// ),
// Transform.translate(
// offset: Offset(-800 * invertPercent, 0),
// child: Transform.rotate(
// angle: (pi * -.5) * invertPercent,
// child: SuperheroPageCard(
// hero: heroes[(index - 1).clamp(0, heroes.length - 1)],
// percent: invertPercent,
// ),
// ),
// ),
// ],
// ),
