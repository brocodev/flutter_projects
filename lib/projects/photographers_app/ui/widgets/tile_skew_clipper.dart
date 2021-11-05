import 'package:flutter/material.dart';

class TileSkewClipper extends CustomClipper<Path> {
  TileSkewClipper({required this.inverted, this.curveSize = 35.0});

  final bool inverted;
  final double curveSize;

  @override
  Path getClip(Size size) {
    final path = Path();
    if (inverted) {
      path
        ..quadraticBezierTo(size.width * .5, curveSize, size.width, curveSize)
        ..lineTo(size.width, size.height)
        ..quadraticBezierTo(
          size.width * .5,
          size.height,
          0,
          size.height - curveSize,
        );
    } else {
      path
        ..moveTo(0, curveSize)
        ..quadraticBezierTo(size.width * .5, curveSize, size.width, 0)
        ..lineTo(size.width, size.height - curveSize)
        ..quadraticBezierTo(size.width * .5, size.height, 0, size.height);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
