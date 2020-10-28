import 'package:flutter/material.dart';

class TileClipper extends CustomClipper<Path> {
  final bool inverted;
  final double curveSize;

  TileClipper({this.inverted = false, this.curveSize = 30});

  @override
  Path getClip(Size size) {
    final path = Path();
    if (inverted) {
      path.moveTo(0, curveSize);
      path.quadraticBezierTo(size.width * .5, 0, size.width, curveSize);
      path.lineTo(size.width, size.height - curveSize);
      path.quadraticBezierTo(size.width * .5, size.height - (curveSize * 2), 0,
          size.height - curveSize);
    } else {
      path.moveTo(0, curveSize + 3);
      path.quadraticBezierTo(
          size.width * .5, curveSize * 2, size.width, curveSize + 3);
      path.lineTo(size.width, size.height - curveSize + 3);
      path.quadraticBezierTo(size.width * .5, size.height + curveSize, 0,
          size.height - curveSize + 3);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
