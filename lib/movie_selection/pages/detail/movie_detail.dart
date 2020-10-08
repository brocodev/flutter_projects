import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/animations/tween_animations.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:flutter_projects/movie_selection/models/movie.dart';
import 'package:flutter_projects/movie_selection/pages/cinema_selection/cinema_selection_page.dart';
import 'package:flutter_projects/movie_selection/pages/detail/widgets/actors_list.dart';
import 'package:flutter_projects/movie_selection/pages/detail/widgets/movie_main_details.dart';
import 'package:flutter_projects/movie_selection/pages/detail/widgets/synopsis.dart';
import 'package:flutter_projects/movie_selection/pages/widgets/tag_container.dart';
import 'package:flutter_projects/movie_selection/pages/widgets/top_bordered_container.dart';
import 'package:flutter_projects/movie_selection/pages/widgets/gradient_animation_button.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  const MovieDetail({
    Key key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightVisiblePoster = size.height * .32;
    final hideWidgets = ValueNotifier(false);
    return Scaffold(
      backgroundColor: kPrimaryColorDark,
      body: ValueListenableBuilder(
        valueListenable: hideWidgets,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: kDuration400ms,
            curve: Curves.fastOutSlowIn,
            padding: EdgeInsets.only(top: value ? 100 : 0),
            child: child,
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Hero(
                    flightShuttleBuilder: (_, __, ___, ____, _____) {
                      return MovieDetail(movie: movie);
                    },
                    tag: movie.uniqueId,
                    child: Image.asset(
                      movie.imageUrl,
                      fit: BoxFit.cover,
                      height: size.height,
                    ),
                  ),
                  TranslateAnimation(
                    duration: const Duration(milliseconds: 700),
                    child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              kPrimaryColorDark.withOpacity(.55),
                              kPrimaryColorDark.withOpacity(.95),
                              kPrimaryColorDark,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.25, 0.33, 0.45],
                          ),
                        ),
                        padding: EdgeInsets.only(top: heightVisiblePoster),
                        child: _BodyDetail(movie: movie)),
                  ),
                ],
              ),
            ),
            GradientAnimationButton(
              hideWidgets: hideWidgets,
              onPressed: () {
                _openCinemaSelection(context, movie);
              },
              label: 'CONTINUE',
            ),
            Positioned(
              top: 25,
              left: 0,
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  hideWidgets.value = true;
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openCinemaSelection(BuildContext context, Movie movie) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: CinemaSelectionPage(movie: movie),
            );
          },
        ));
  }
}

class _BodyDetail extends StatelessWidget {
  const _BodyDetail({
    Key key,
    @required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: ScaleAnimation(
            curve: Curves.fastOutSlowIn,
            finalScale: 1.2,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white38,
              foregroundColor: Colors.white,
              child: Icon(Icons.play_arrow, size: 30),
            ),
          ),
        ),
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TranslateAnimation(
            duration: const Duration(milliseconds: 700),
            child: Text(
              movie.title.toUpperCase(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.barlowCondensed(
                  fontSize: size.height * .04,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(.9)),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20, right: size.height * .12),
          child: TranslateAnimation(
            duration: const Duration(milliseconds: 800),
            child: Wrap(
              runSpacing: 10,
              children: List.generate(movie.tags.length, (i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TagContainer(
                    tag: movie.tags[i],
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TranslateAnimation(
          duration: const Duration(milliseconds: 900),
          child: TopBorderedContainer(movie: movie),
        ),
        const SizedBox(height: 40),
        TranslateAnimation(
          duration: const Duration(milliseconds: 1000),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MovieMainDetails(movie: movie),
          ),
        ),
        const SizedBox(height: 40),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Synopsis(description: movie.description)),
        const SizedBox(height: 40),
        ActorsList(
          listActors: movie.actors,
        ),
        SizedBox(height: size.height * .1),
      ],
    );
  }
}
