import 'package:flutter/material.dart';

class RowStars extends StatelessWidget {
  const RowStars({
    super.key,
    this.stars,
    this.size,
    this.color = Colors.cyan,
  });

  final double? stars;
  final double? size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorStars = color;
    final fillStar = Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Icon(Icons.star, color: colorStars, size: size),
    );

    final halfStar = Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Icon(Icons.star_half, color: colorStars, size: size),
    );

    final voidStar = Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Icon(Icons.star, color: Colors.grey[300], size: size),
    );

    var fillStars = stars!.floor();
    final addHalfStar = (stars! - fillStars) >= 0.5;
    final listStars = List<Widget>.generate(fillStars, (i) => fillStar);
    if (addHalfStar) {
      listStars.add(halfStar);
      fillStars++;
    }
    listStars.addAll(List.generate(5 - fillStars, (i) => voidStar));
    return Row(children: listStars);
  }
}
