import 'package:flutter/material.dart';

class TileClipper extends CustomClipper<Path> {
  TileClipper({this.inverted = false, this.curveSize = 30});

  final bool inverted;
  final double curveSize;

  @override
  Path getClip(Size size) {
    final path = Path();
    if (inverted) {
      path
        ..moveTo(0, curveSize)
        ..quadraticBezierTo(size.width * .5, 0, size.width, curveSize)
        ..lineTo(size.width, size.height - curveSize)
        ..quadraticBezierTo(size.width * .5, size.height - (curveSize * 2), 0,
            size.height - curveSize,);
    } else {
      path
        ..moveTo(0, curveSize + 3)
        ..quadraticBezierTo(
            size.width * .5, curveSize * 2, size.width, curveSize + 3,)
        ..lineTo(size.width, size.height - curveSize + 3)
        ..quadraticBezierTo(size.width * .5, size.height + curveSize, 0,
            size.height - curveSize + 3,);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
