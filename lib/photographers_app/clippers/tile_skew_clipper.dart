

import 'package:flutter/material.dart';

class TileSkewClipper extends CustomClipper<Path> {
  final bool inverted;

  TileSkewClipper({@required this.inverted});

  @override
  Path getClip(Size size) {
    final path = Path();
    final curvedSize = 35.0;
    if (inverted) {
      path.quadraticBezierTo(
          size.width * .5, curvedSize, size.width, curvedSize);
      path.lineTo(size.width, size.height);
      path.quadraticBezierTo(
          size.width * .5, size.height, 0, size.height - curvedSize);
    } else {
      path.moveTo(0, curvedSize);
      path.quadraticBezierTo(size.width * .5, curvedSize, size.width, 0);
      path.lineTo(size.width, size.height - curvedSize);
      path.quadraticBezierTo(size.width * .5, size.height, 0, size.height);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
