import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderOption extends StatelessWidget {
  const HeaderOption({
    super.key,
    this.title,
    this.isSelected,
  });

  final String? title;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: const Alignment(0, .5),
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: isSelected!
              ? kGradientRedOrange
              : null,
        ),
        child: Text(
          title!.toUpperCase(),
          style: GoogleFonts.barlowCondensed(
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(.85),
            letterSpacing: 2,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
