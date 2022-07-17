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
    final fillStar = Icon(Icons.star, color: colorStars, size: size);

    final halfStar = Icon(Icons.star_half, color: colorStars, size: size);

    final voidStar =
        Icon(Icons.star, color: Colors.grey[300]!.withOpacity(.4), size: size);

    var fillStars = stars!.floor();
    final addHalfStar = (stars! - fillStars) >= 0.5;
    final listStars = List<Widget>.generate(fillStars, (i) => fillStar);
    if (addHalfStar) {
      listStars.add(halfStar);
      fillStars++;
    }
    listStars.addAll(List.generate(10 - fillStars, (i) => voidStar));
    return FittedBox(
      child: Row(children: listStars),
    );
  }
}
