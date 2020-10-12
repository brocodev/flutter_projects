import 'package:flutter/material.dart';

class TileSkewClipper extends CustomClipper<Path> {
  final bool inverted;
  final double curveSize;

  TileSkewClipper({@required this.inverted, this.curveSize = 35.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    if (inverted) {
      path.quadraticBezierTo(size.width * .5, curveSize, size.width, curveSize);
      path.lineTo(size.width, size.height);
      path.quadraticBezierTo(
          size.width * .5, size.height, 0, size.height - curveSize);
    } else {
      path.moveTo(0, curveSize);
      path.quadraticBezierTo(size.width * .5, curveSize, size.width, 0);
      path.lineTo(size.width, size.height - curveSize);
      path.quadraticBezierTo(size.width * .5, size.height, 0, size.height);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
