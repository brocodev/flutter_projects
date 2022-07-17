import 'package:flutter/material.dart';
import 'package:flutter_projects/core/shared/ui/animations/tween_animations.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:flutter_projects/projects/movie_selection/models/movie.dart';
import 'package:flutter_projects/projects/movie_selection/ui/screens/seats_selection/widgets/seats_selection_widgets.dart';
import 'package:flutter_projects/projects/movie_selection/ui/screens/ticket/ticket_page.dart';
import 'package:flutter_projects/projects/movie_selection/ui/widgets/credit_card_slide.dart';
import 'package:flutter_projects/projects/movie_selection/ui/widgets/gradient_animation_button.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, this.movie});

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hideWidgets = ValueNotifier(false);
    return Scaffold(
      backgroundColor: kPrimaryColorDark,
      body: ValueListenableBuilder<bool>(
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
                const Padding(
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: CustomAppBar(
                    title: 'Payment details',
                    subtitle: 'Amount to be paid : 60 MXN',
                  ),
                ),
                const SizedBox(height: 20),
                const TranslateAnimation(
                  duration: Duration(milliseconds: 550),
                  child: CreditCardSlide(),
                ),
                const SizedBox(height: 70),
                TranslateAnimation(
                  duration: const Duration(milliseconds: 550),
                  child: Text(
                    'Do you want to add a new card?'.toUpperCase(),
                    style: GoogleFonts.barlowCondensed(
                      fontSize: size.height * .016,
                      color: kPrimaryColorLight,
                      letterSpacing: 0,
                    ),
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
                    PageRouteBuilder<dynamic>(
                      transitionDuration: kDuration400ms,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: TicketPage(movie: movie),
                        );
                      },
                    ),);
              },
            )
          ],
        ),
      ),
    );
  }
}
