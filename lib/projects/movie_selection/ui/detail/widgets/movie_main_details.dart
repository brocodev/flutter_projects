import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:flutter_projects/projects/movie_selection/models/movie.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieMainDetails extends StatelessWidget {
  const MovieMainDetails({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .22,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              movie!.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildInfoText('Genre:', movie!.tags!.first, size),
                buildInfoText(
                  'Duration:',
                  '${movie!.duration!.inMinutes} min',
                  size,
                ),
                buildInfoText('Release year:', movie!.year, size),
                buildInfoText('Director:', movie!.director, size),
                buildInfoText('Writer:', movie!.writer, size),
                const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text buildInfoText(String title, String subtitle, Size size) {
    return Text.rich(
      TextSpan(
        text: title,
        children: [
          TextSpan(
            text: '  $subtitle',
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
      maxLines: 1,
      style: GoogleFonts.barlowCondensed(
        color: kPrimaryColorLight,
        fontWeight: FontWeight.w500,
        fontSize: size.height * .02,
      ),
    );
  }
}
