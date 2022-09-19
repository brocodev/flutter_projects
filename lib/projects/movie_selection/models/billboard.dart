import 'package:flutter_projects/projects/movie_selection/models/movie.dart';

class Billboard {
  const Billboard(this.hour, this.movieList);

  final String hour;
  final List<Movie> movieList;

  static final billboardList = [
    Billboard('14:30', Movie.listMovie3),
    Billboard('16:15', Movie.listMovie),
    Billboard('18:00', Movie.listMovie2),
  ];
}
