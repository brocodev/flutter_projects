import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/superheroes/models/superhero.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperheroCard extends StatelessWidget {
  const SuperheroCard({
    super.key,
    required this.superhero,
    required this.factorChange,
  });

  final Superhero superhero;
  final double? factorChange;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final separation = size.height * .24;
    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: size.height,
      child: Stack(
        children: [
          //--------------------------------------------
          // Color bg with rounded corners
          //--------------------------------------------
          Positioned.fill(
            top: separation,
            child: Hero(
              tag: '${superhero.heroName}background',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(superhero.rawColor!),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          //-----------------------------------
          // Superhero image
          //-----------------------------------
          Positioned(
            left: 20,
            right: 20,
            top: separation * factorChange!,
            bottom: size.height * .35,
            child: Opacity(
              opacity: 1.0 - factorChange!,
              child: Transform.scale(
                scale: lerpDouble(1, .4, factorChange!),
                child: Hero(
                  tag: superhero.pathImage!,
                  child: Image.asset(superhero.pathImage!),
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            right: 100,
            top: size.height * .55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----------------------------------
                // Superhero Name
                //----------------------------------
                FittedBox(
                  child: Hero(
                    tag: superhero.heroName!,
                    child: Text(
                      superhero.heroName!.replaceAll(' ', '\n').toLowerCase(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
                //----------------------------------
                // Superhero Secret Identity Name
                //----------------------------------
                Hero(
                  tag: superhero.name!,
                  child: Text(
                    superhero.name!.toLowerCase(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const SizedBox(height: 25),
                Text.rich(
                  const TextSpan(
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
                  style: GoogleFonts.leagueSpartan(
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
