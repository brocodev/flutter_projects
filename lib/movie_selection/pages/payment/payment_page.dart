import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/animations/tween_animations.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:flutter_projects/movie_selection/models/movie.dart';
import 'package:flutter_projects/movie_selection/pages/seats_selection/widgets/seats_selection_widgets.dart';
import 'package:flutter_projects/movie_selection/pages/ticket/ticket_page.dart';
import 'package:flutter_projects/movie_selection/pages/widgets/credit_card_slide.dart';
import 'package:flutter_projects/movie_selection/pages/widgets/gradient_animation_button.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  final Movie movie;

  const PaymentPage({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hideWidgets = ValueNotifier(false);
    return Scaffold(
      backgroundColor: kPrimaryColorDark,
      body: ValueListenableBuilder(
        valueListenable: hideWidgets,
        builder: (context, value, child) {
          return AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: kDuration400ms,
            margin: EdgeInsets.only(
              top: value ? 100 : 0,
            ),
            child: child,
          );
        },
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: CustomAppBar(
                      title: 'Payment details',
                      subtitle: 'Amount to be paid : 60 MXN',
                    )),
                const SizedBox(height: 20),
                TranslateAnimation(
                    duration: const Duration(milliseconds: 550),
                    child: CreditCardSlide()),
                const SizedBox(height: 70),
                TranslateAnimation(
                  duration: const Duration(milliseconds: 550),
                  child: Text(
                    'Do you want to add a new card?'.toUpperCase(),
                    style: GoogleFonts.barlowCondensed(
                        fontSize: size.height * .016,
                        color: kPrimaryColorLight,
                        letterSpacing: 0),
                  ),
                )
              ],
            ),
            GradientAnimationButton(
              hideWidgets: hideWidgets,
              label: 'PAY',
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: kDuration400ms,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: TicketPage(movie: movie),
                        );
                      },
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
