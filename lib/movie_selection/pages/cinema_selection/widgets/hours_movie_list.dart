import 'package:flutter/material.dart';
import 'package:flutter_projects/movie_selection/models/movie.dart';

import 'hour_container.dart';


class HoursMovieOptions extends StatelessWidget {
  const HoursMovieOptions({
    Key key,
    @required this.listHours,
    @required this.selectedHourNotifier,
    @required this.movie,
  }) : super(key: key);

  final List<String> listHours;
  final ValueNotifier<int> selectedHourNotifier;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 2 / 4,
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: List.generate(listHours.length, (i) {
        return HourContainer(
          hour: listHours[i],
          selectedHourNotifier: selectedHourNotifier,
          onTap: () => movie.billboardHour = listHours[i],
          id: i,
        );
      }),
    );
  }
}
