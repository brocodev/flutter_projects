import 'package:flutter/material.dart';
import 'package:flutter_projects/superheroes/models/superhero.dart';
import 'package:google_fonts/google_fonts.dart';


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
                FittedBox(
                  child: Text(
                    superhero.heroName.replaceAll(' ', '\n').toLowerCase(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
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
