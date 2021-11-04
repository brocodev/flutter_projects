import 'package:flutter/material.dart';

class RowStars extends StatelessWidget {
  const RowStars({
    Key? key,
    this.stars,
    this.size,
    this.color = Colors.cyan,
  }) : super(key: key);

  final double? stars;
  final double? size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorStars = color;
    final _fillStar = Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Icon(Icons.star, color: colorStars, size: size),
    );

    final _halfStar = Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Icon(Icons.star_half, color: colorStars, size: size),
    );

    final _voidStar = Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Icon(Icons.star, color: Colors.grey[300], size: size),
    );

    var fillStars = stars!.floor();
    final addHalfStar = (stars! - fillStars) >= 0.5;
    final listStars = List<Widget>.generate(fillStars, (i) => _fillStar);
    if (addHalfStar) {
      listStars.add(_halfStar);
      fillStars++;
    }
    listStars.addAll(List.generate(5 - fillStars, (i) => _voidStar));
    return Row(children: listStars);
  }
}
