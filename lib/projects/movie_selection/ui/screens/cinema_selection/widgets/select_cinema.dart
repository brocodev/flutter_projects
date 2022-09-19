import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectCinema extends StatelessWidget {
  const SelectCinema({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 30,
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'SELECT YOUR CINEMA',
                style: GoogleFonts.barlowCondensed(
                  color: kPrimaryColorLight,
                  fontSize: size.height * .018,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Gulliver',
                style: GoogleFonts.barlowCondensed(
                  height: 2,
                  fontSize: size.height * .025,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_downward,
            color: Colors.white,
            size: size.height * .03,
          )
        ],
      ),
    );
  }
}
