import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Synopsis extends StatelessWidget {
  const Synopsis({super.key, this.description});

  final String? description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Synopsis',
          style: GoogleFonts.barlowCondensed(
            fontSize: size.height * .03,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description!,
          textAlign: TextAlign.justify,
          style: GoogleFonts.barlowCondensed(
            fontSize: size.height * .02,
            height: 1.5,
            fontWeight: FontWeight.w400,
            color: kPrimaryColorLight,
          ),
        ),
      ],
    );
  }
}
