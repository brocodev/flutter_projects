import 'package:flutter/material.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:google_fonts/google_fonts.dart';


class Synopsis extends StatelessWidget {
  final String description;

  const Synopsis({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Synopsis",
          style: GoogleFonts.barlowCondensed(
            fontSize: size.height * .03,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: GoogleFonts.barlowCondensed(
              fontSize: size.height * .02,
              height: 1.5,
              fontWeight: FontWeight.w400,
              color: kPrimaryColorLight),
        ),
      ],
    );
  }
}