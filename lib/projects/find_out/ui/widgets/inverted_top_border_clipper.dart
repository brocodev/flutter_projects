import 'package:flutter/material.dart';

class InvertedTopBorderClipper extends CustomClipper<Path> {
  InvertedTopBorderClipper({required this.circularRadius});

  final double circularRadius;

  @override
  Path getClip(Size size) {
    final path = Path();
    final curveMiddlePoint = circularRadius / 3;
    final widthCurve = circularRadius * 1.66;
    path
      ..quadraticBezierTo(
          curveMiddlePoint, circularRadius, widthCurve, circularRadius,)
      ..lineTo(size.width - widthCurve, circularRadius)
      ..quadraticBezierTo(
          size.width - curveMiddlePoint, circularRadius, size.width, 0,)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
