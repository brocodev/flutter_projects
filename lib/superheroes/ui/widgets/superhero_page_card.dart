import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/superheroes/models/superhero.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperheroPageCard extends StatelessWidget {
  const SuperheroPageCard({
    Key key,
    @required this.hero,
    this.percent = 0,
  }) : super(key: key);

  final Superhero hero;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final sizeSeparation = MediaQuery.of(context).size.height * .25;
    final size = MediaQuery.of(context).size;
    return OverflowBox(
      maxHeight: size.height,
      alignment: Alignment.topCenter,
      child: Stack(
        fit: StackFit.expand,
        children: [
          //------------------------------
          //-----COLOR BACKGROUND
          //------------------------------
          Positioned(
            top: sizeSeparation,
            bottom: 0,
            left: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(hero.rawColor),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                  bottom: Radius.circular(40),
                ),
              ),
            ),
          ),
          //------------------------------
          //-----SUPERHERO IMAGE
          //------------------------------
          Positioned(
              top: (sizeSeparation) * percent,
              left: 20,
              right: 20,
              bottom: size.height * .3,
              child: Opacity(
                opacity: 1 - percent,
                child: Transform.scale(
                  scale: 1 - percent,
                  child: Image.asset(hero.pathImage),
                ),
              )),
          //------------------------------------
          //----SUPERHERO NAME
          //------------------------------------
          Positioned(
            top: size.height * .55,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * .6,
                  child: AutoSizeText(
                    hero.heroName.toLowerCase(),
                    maxLines: 2,
                    style: GoogleFonts.spartan(
                        fontWeight: FontWeight.bold,
                        fontSize: 68,
                        letterSpacing: -3.0,
                        color: Colors.white,
                        height: 1),
                  ),
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(text: "learn more  ", children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.amber,
                      ),
                      alignment: PlaceholderAlignment.middle,
                    )
                  ]),
                  style: GoogleFonts.spartan(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
