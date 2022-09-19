import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =  Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final paint2 =  Paint()
      ..color = const Color(0xffc21451)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    var path2 = Path();
    path..moveTo(0, size.height * 0.4960000)
      ..quadraticBezierTo(size.width * 0.0393750, size.height * 0.2635000,
        size.width * 0.0950000, size.height * 0.3360000,)
    ..cubicTo(
        size.width * 0.1500000,
        size.height * 0.4140000,
        size.width * 0.1259375,
        size.height * 0.5950000,
        size.width * 0.1362500,
        size.height * 0.6540000,)
    ..cubicTo(
        size.width * 0.1562500,
        size.height * 0.7430000,
        size.width * 0.1712500,
        size.height * 0.3310000,
        size.width * 0.2137500,
        size.height * 0.3200000,)
    ..cubicTo(
        size.width * 0.2459375,
        size.height * 0.3230000,
        size.width * 0.2390625,
        size.height * 0.5130000,
        size.width * 0.2475000,
        size.height * 0.5400000,)
    ..cubicTo(
        size.width * 0.2653125,
        size.height * 0.5625000,
        size.width * 0.2921875,
        size.height * 0.3785000,
        size.width * 0.3150000,
        size.height * 0.3960000,)
    ..cubicTo(
        size.width * 0.3465625,
        size.height * 0.4165000,
        size.width * 0.3087500,
        size.height * 0.6240000,
        size.width * 0.3500000,
        size.height * 0.6280000,)
    ..cubicTo(
        size.width * 0.3665625,
        size.height * 0.6385000,
        size.width * 0.3696875,
        size.height * 0.4555000,
        size.width * 0.3762500,
        size.height * 0.3980000,);

    path2 = path.shift(Offset.zero);

    path..cubicTo(
        size.width * 0.3915625,
        size.height * 0.3310000,
        size.width * 0.3884375,
        size.height * 0.5050000,
        size.width * 0.4075000,
        size.height * 0.4900000,)
    ..cubicTo(
        size.width * 0.4384375,
        size.height * 0.4535000,
        size.width * 0.4353125,
        size.height * 0.1825000,
        size.width * 0.4712500,
        size.height * 0.2000000,)
    ..cubicTo(
        size.width * 0.5253125,
        size.height * 0.1925000,
        size.width * 0.5021875,
        size.height * 0.4175000,
        size.width * 0.5125000,
        size.height * 0.4900000,)
    ..cubicTo(
        size.width * 0.5265625,
        size.height * 0.5495000,
        size.width * 0.5396875,
        size.height * 0.3110000,
        size.width * 0.5587500,
        size.height * 0.2940000,)
    ..cubicTo(
        size.width * 0.5906250,
        size.height * 0.2960000,
        size.width * 0.5537500,
        size.height * 0.4830000,
        size.width * 0.5837500,
        size.height * 0.4980000,)
    ..cubicTo(
        size.width * 0.6512500,
        size.height * 0.4810000,
        size.width * 0.5800000,
        size.height * 0.6870000,
        size.width * 0.6300000,
        size.height * 0.6760000,)
    ..quadraticBezierTo(size.width * 0.7003125, size.height * 0.7015000,
        size.width * 0.6687500, size.height * 0.5000000,)
    ..quadraticBezierTo(size.width * 0.6496875, size.height * 0.3340000,
        size.width * 0.7150000, size.height * 0.3080000,)
    ..cubicTo(
        size.width * 0.7887500,
        size.height * 0.3005000,
        size.width * 0.7350000,
        size.height * 0.3795000,
        size.width * 0.7400000,
        size.height * 0.4380000,)
    ..cubicTo(
        size.width * 0.7459375,
        size.height * 0.4745000,
        size.width * 0.7590625,
        size.height * 0.4955000,
        size.width * 0.7837500,
        size.height * 0.4960000,)
    ..cubicTo(
        size.width * 0.8100000,
        size.height * 0.5110000,
        size.width * 0.7787500,
        size.height * 0.4070000,
        size.width * 0.7950000,
        size.height * 0.3900000,)
    ..cubicTo(
        size.width * 0.8178125,
        size.height * 0.3790000,
        size.width * 0.8284375,
        size.height * 0.6170000,
        size.width * 0.8575000,
        size.height * 0.5980000,)
    ..cubicTo(
        size.width * 0.9084375,
        size.height * 0.6005000,
        size.width * 0.8687500,
        size.height * 0.4705000,
        size.width * 0.8725000,
        size.height * 0.4280000,)
    ..cubicTo(
        size.width * 0.8643750,
        size.height * 0.3255000,
        size.width * 0.9118750,
        size.height * 0.5730000,
        size.width * 0.9287500,
        size.height * 0.6400000,)
    ..cubicTo(
        size.width * 0.9496875,
        size.height * 0.7185000,
        size.width * 0.9300000,
        size.height * 0.5135000,
        size.width * 0.9337500,
        size.height * 0.4760000,)
    ..cubicTo(
        size.width * 0.9315625,
        size.height * 0.4425000,
        size.width * 0.9343750,
        size.height * 0.3800000,
        size.width * 0.9412500,
        size.height * 0.3720000,)
    ..cubicTo(
        size.width * 0.9715625,
        size.height * 0.3450000,
        size.width * 0.9559375,
        size.height * 0.4570000,
        size.width * 0.9662500,
        size.height * 0.4840000,)
    ..quadraticBezierTo(size.width * 0.9834375, size.height * 0.5285000,
        size.width * 0.9962500, size.height * 0.4900000,);

    canvas..drawPath(path, paint)..drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
