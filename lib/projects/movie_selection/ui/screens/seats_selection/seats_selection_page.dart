import 'package:flutter/material.dart';
import 'package:flutter_projects/core/shared/ui/animations/tween_animations.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:flutter_projects/projects/movie_selection/models/movie.dart';
import 'package:flutter_projects/projects/movie_selection/models/seats.dart';
import 'package:flutter_projects/projects/movie_selection/ui/screens/seats_selection/widgets/seats_selection_widgets.dart';
import 'package:flutter_projects/projects/movie_selection/ui/screens/summary/summary_page.dart';
import 'package:flutter_projects/projects/movie_selection/ui/widgets/gradient_animation_button.dart';

class SeatsSelectionPage extends StatelessWidget {
  const SeatsSelectionPage({super.key, this.movie});

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final hideWidgets = ValueNotifier(false);
    final seatsSelectedNotifier = ValueNotifier(0);

    return Scaffold(
      backgroundColor: kPrimaryColorDark,
      body: ValueListenableBuilder<bool>(
        valueListenable: hideWidgets,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: kDuration400ms,
            curve: Curves.fastOutSlowIn,
            margin: EdgeInsets.only(top: value ? 100 : 0),
            child: child,
          );
        },
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 20, bottom: 30, top: 10),
                    child: CustomAppBar(
                      title: movie!.title,
                      subtitle: 'Today ${movie!.billboardHour}',
                      onPressedBack: () {
                        hideWidgets.value = true;
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                TranslateAnimation(
                  duration: const Duration(milliseconds: 600),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TypeSeatInfo(
                          color: Color(0xFFB0BEC5),
                          quantity: 8,
                          label: 'Empty',
                        ),
                        const TypeSeatInfo(
                          color: kPrimaryColor,
                          quantity: 38,
                          label: 'Bought',
                        ),
                        ValueListenableBuilder<int>(
                          valueListenable: seatsSelectedNotifier,
                          builder: (context, value, _) {
                            return TypeSeatInfo(
                              color: kAccentColor,
                              quantity: value,
                              label: 'Selected',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                TranslateAnimation(
                  duration: const Duration(milliseconds: 700),
                  child: Column(
                    children: List.generate(SeatsRowData.seatsList.length, (i) {
                      return RowSeats(
                        seatsSelectedNotifier: seatsSelectedNotifier,
                        numSeats: SeatsRowData.seatsList[i].seats,
                        seatsOccupied: SeatsRowData.seatsList[i].occupiedSeats,
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 10),
                TranslateAnimation(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(SeatsRowData.firstSeatsList.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RowSeats(
                          numSeats: SeatsRowData.firstSeatsList[i].seats,
                          seatsOccupied:
                              SeatsRowData.firstSeatsList[i].occupiedSeats,
                          seatsSelectedNotifier: seatsSelectedNotifier,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            GradientAnimationButton(
              hideWidgets: hideWidgets,
              onPressed: () {
                _openSummary(context, movie);
              },
              label: 'CONTINUE',
            ),
          ],
        ),
      ),
    );
  }

  void _openSummary(BuildContext context, Movie? movie) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder<dynamic>(
        transitionDuration: kDuration400ms,
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: SummaryPage(movie: movie),
          );
        },
      ),
    );
  }
}
