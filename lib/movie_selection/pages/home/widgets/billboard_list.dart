import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:flutter_projects/movie_selection/models/billboard.dart';
import 'package:flutter_projects/movie_selection/models/movie.dart';
import 'package:flutter_projects/movie_selection/pages/detail/movie_detail.dart';
import 'package:flutter_projects/movie_selection/pages/widgets/row_stars.dart';
import 'package:google_fonts/google_fonts.dart';

class BillboardList extends StatelessWidget {
  const BillboardList({
    Key key,
    @required this.billboard,
  }) : super(key: key);

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
              fontSize: heightBillboard * .05,
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
            physics: BouncingScrollPhysics(),
            itemExtent: heightBillboard * .65,
            itemCount: billboard.movieList.length,
            itemBuilder: (context, index) {
              final movie = billboard.movieList[index];
              movie.uniqueId = movie.title + billboard.hour;
              movie.billboardHour = billboard.hour;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () => _openMovieDetail(context, movie),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Hero(
                            flightShuttleBuilder: (_, __, ___, ____, _____) {
                              return Image.asset(
                                movie.imageUrl,
                                fit: BoxFit.cover,
                              );
                            },
                            tag: movie.uniqueId,
                            child: Image.asset(
                              movie.imageUrl,
                              height: heightBillboard * .88,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.barlowCondensed(
                          fontSize: heightBillboard * .036,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                        width: double.infinity,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RowStars(
                            color: kAccentColor,
                            size: heightBillboard * .022,
                            stars: movie.rate,
                          ),
                          Text(
                            "${movie.reviews} Reviews",
                            style: GoogleFonts.barlowCondensed(
                                fontSize: heightBillboard * .03,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 3,
                                color: Colors.white38),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _openMovieDetail(BuildContext context, Movie movie) {
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return MovieDetail(movie: movie);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
  }
}
