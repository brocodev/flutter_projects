import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:flutter_projects/projects/movie_selection/models/billboard.dart';
import 'package:flutter_projects/projects/movie_selection/models/movie.dart';
import 'package:flutter_projects/projects/movie_selection/ui/screens/detail/movie_detail.dart';
import 'package:flutter_projects/projects/movie_selection/ui/widgets/row_stars.dart';
import 'package:google_fonts/google_fonts.dart';

class BillboardList extends StatelessWidget {
  const BillboardList({
    super.key,
    required this.billboard,
  });

  final Billboard billboard;

  @override
  Widget build(BuildContext context) {
    final heightBillboard = MediaQuery.of(context).size.height * .55;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            billboard.hour,
            style: GoogleFonts.barlowCondensed(
              letterSpacing: 2,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: heightBillboard,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            physics: const BouncingScrollPhysics(),
            itemExtent: heightBillboard * .65,
            itemCount: billboard.movieList.length,
            itemBuilder: (context, index) {
              final movie = billboard.movieList[index];

              movie
                ..uniqueId = movie.title! + billboard.hour
                ..billboardHour = billboard.hour;

              return MovieBillboardCard(
                movie: movie,
              );
            },
          ),
        ),
      ],
    );
  }
}

class MovieBillboardCard extends StatelessWidget {
  const MovieBillboardCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  void _openMovieDetail(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return MovieDetail(movie: movie);
        },
        transitionsBuilder: (__, animation, _, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => _openMovieDetail(context, movie),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: movie.uniqueId!,
                  flightShuttleBuilder: (_, __, ___, ____, _____) {
                    return Image.asset(
                      movie.imageUrl!,
                      fit: BoxFit.cover,
                    );
                  },
                  child: Image.asset(
                    movie.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Text(
            movie.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.barlowCondensed(
              letterSpacing: 2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 2,
            ),
          ),
          const SizedBox(
            height: 5,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: RowStars(
                  color: kAccentColor,
                  stars: movie.rate,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${movie.reviews} Reviews',
                style: GoogleFonts.barlowCondensed(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3,
                  color: Colors.white38,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
