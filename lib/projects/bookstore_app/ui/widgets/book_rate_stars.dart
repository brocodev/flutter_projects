import 'package:flutter/material.dart';

class BookRateStars extends StatelessWidget {
  const BookRateStars({
    super.key,
    required this.rate,
    required this.heroTag,
    this.starsColor = Colors.yellow,
    this.voidStarsColor = const Color(0xFFFFDAAE),
    this.iconSize = 18,
    this.fontSize = 14,
  }) : assert(
          rate >= 0.0 && rate <= 5.0,
          'The rate value must be between 0 to 5',
        );

  final double rate;
  final Color starsColor;
  final Color voidStarsColor;
  final double iconSize;
  final double fontSize;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final showHalfStar = rate - rate.floor() >= .4;
    final listStars = List<Widget>.generate(
      rate.floor(),
      (index) => Hero(
        tag: 'star$index$heroTag',
        child: Icon(
          Icons.star_rounded,
          color: starsColor,
          size: 18,
        ),
      ),
    );

    if (showHalfStar) {
      listStars.add(
        Hero(
          tag: 'star${rate.floor()}$heroTag',
          child: Icon(
            Icons.star_half_rounded,
            color: starsColor,
            size: 18,
          ),
        ),
      );
    }

    listStars.addAll(
      List.generate(5 - rate.floor() - (showHalfStar ? 1 : 0), (index) {
        return Hero(
          tag: 'star${rate.ceil() + index}$heroTag',
          child: Icon(
            Icons.star_rounded,
            color: voidStarsColor,
            size: 18,
          ),
        );
      }),
    );

    return Row(
      children: listStars
        ..add(
          Hero(
            tag: 'rate$heroTag',
            child: Material(
              color: Colors.transparent,
              child: Text(
                ' $rate',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: starsColor,
                ),
              ),
            ),
          ),
        ),
    );
  }
}
