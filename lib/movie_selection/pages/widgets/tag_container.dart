import 'package:flutter/material.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:google_fonts/google_fonts.dart';


class TagContainer extends StatelessWidget {
  const TagContainer({
    Key key,
    this.tag,
    this.gradient = kGradientRedOrange,
  }) : super(key: key);
  final String tag;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Text(
        tag.toUpperCase(),
        style: GoogleFonts.barlowCondensed(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), gradient: gradient),
    );
  }
}
