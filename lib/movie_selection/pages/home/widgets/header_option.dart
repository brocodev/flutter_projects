import 'package:flutter/material.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderOption extends StatelessWidget {
  const HeaderOption({
    Key key,
    this.title,
    this.isSelected,
  }) : super(key: key);

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment(0, .5),
        height: double.infinity,
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.barlowCondensed(
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(.85),
            letterSpacing: 2,
            fontSize: 28,
          ),
        ),
        decoration: BoxDecoration(
          gradient: isSelected
              ? kGradientRedOrange
              : null,
        ),
      ),
    );
  }
}
