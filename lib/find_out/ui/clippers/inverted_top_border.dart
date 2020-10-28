import 'package:flutter/material.dart';

class InvertedTopBorder extends CustomClipper<Path> {
  final double circularRadius;

  InvertedTopBorder({@required this.circularRadius});

  @override
  Path getClip(Size size) {
    final path = Path();
    final curveMiddlePoint = circularRadius / 3;
    final widthCurve = circularRadius * 1.66;
    path.quadraticBezierTo(
        curveMiddlePoint, circularRadius, widthCurve, circularRadius);
    path.lineTo(size.width - widthCurve, circularRadius);
    path.quadraticBezierTo(
        size.width - curveMiddlePoint, circularRadius, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}