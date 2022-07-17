import 'package:flutter/material.dart';
import 'package:flutter_projects/core/shared/ui/animations/tween_animations.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:flutter_projects/projects/movie_selection/models/movie.dart';
import 'package:flutter_projects/projects/movie_selection/ui/screens/payment/payment_page.dart';
import 'package:flutter_projects/projects/movie_selection/ui/widgets/gradient_animation_button.dart';
import 'package:flutter_projects/projects/movie_selection/ui/widgets/tag_container.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key, this.movie});

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final hideWidgets = ValueNotifier(false);
    return Scaffold(
      backgroundColor: kPrimaryColorDark,
      body: ValueListenableBuilder<bool>(
        valueListenable: hideWidgets,
        builder: (context, value, child) {
          return AnimatedContainer(
              duration: kDuration400ms,
              padding: EdgeInsets.only(top: value ? 100 : 0),
              curve: Curves.fastOutSlowIn,
              child: child,);
        },
        child: _BodySummary(movie: movie, hideWidgets: hideWidgets),
      ),
    );
  }
}

class _BodySummary extends StatelessWidget {
  const _BodySummary({
    required this.movie,
    required this.hideWidgets,
  });

  final Movie? movie;
  final ValueNotifier<bool> hideWidgets;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ScaleAnimation(
          initScale: .95,
          child: Image.asset(
            movie!.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        TranslateAnimation(
          child: OpacityAnimation(
            begin: 0.5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kPrimaryColorDark.withOpacity(.1),
                    kPrimaryColorDark.withOpacity(.6),
                    kPrimaryColorDark.withOpacity(.7),
                    kPrimaryColorDark,
                  ],
                  stops: const [0.08, 0.28, 0.33, 0.48],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * .35,
          left: 20,
          right: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TranslateAnimation(
                duration: const Duration(milliseconds: 400),
                child: Text(movie!.title!.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.barlowCondensed(
                        fontSize: size.height * .04,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,),),
              ),
              const SizedBox(height: 20),
              TranslateAnimation(
                duration: const Duration(milliseconds: 500),
                child: Wrap(
                  runSpacing: 10,
                  children: List.generate(movie!.tags!.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TagContainer(
                        tag: movie!.tags![i],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const TranslateAnimation(
                    duration: Duration(milliseconds: 600),
                    child: _TileInfo(
                        title: 'Cinema',
                        subtitle: 'Gulliver',
                        crossAxisAlignment: CrossAxisAlignment.start,),
                  ),
                  TranslateAnimation(
                    duration: const Duration(milliseconds: 700),
                    child: _TileInfo(
                      title: 'Start time',
                      subtitle: movie!.billboardHour,
                    ),
                  ),
                  TranslateAnimation(
                    child: _TileInfo(
                        title: 'Duration',
                        subtitle: '${movie!.duration!.inMinutes} min',
                        crossAxisAlignment: CrossAxisAlignment.end,),
                  ),
                ],
              ),
              const SizedBox(height: 90),
              TranslateAnimation(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: List.generate(50, (i) {
                      return const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
        GradientAnimationButton(
          hideWidgets: hideWidgets,
          label: 'CONTINUE',
          onPressed: () {
            hideWidgets.value = true;
            Navigator.pushReplacement(
                context,
                PageRouteBuilder<dynamic>(
                  transitionDuration: kDuration400ms,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: PaymentPage(movie: movie),
                    );
                  },
                ),);
          },
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
        )
      ],
    );
  }
}

class _TileInfo extends StatelessWidget {
  const _TileInfo({
    this.title,
    this.subtitle,
    this.crossAxisAlignment,
  });
  final String? title;
  final String? subtitle;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title!,
          style: GoogleFonts.barlowCondensed(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          subtitle!,
          style: GoogleFonts.barlowCondensed(
            color: kPrimaryColorLight,
            height: 1.5,
            fontWeight: FontWeight.w500,
            fontSize: 26,
          ),
        ),
      ],
    );
  }
}
