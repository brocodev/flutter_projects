import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/medical_appointment/utils/app_colors.dart';

class TonguePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [MedicalAppColors.kBlue, MedicalAppColors.kDarkBlue],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromCenter(
          center: Offset(0, size.height * .6),
          width: size.width,
          height: size.height,
        ),
      );

    final path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(0, size.height - 30, 30, size.height - 30)
      ..lineTo(size.width * .3, size.height - 30)
      ..cubicTo(size.width * .42, size.height - 30, size.width * .41,
          size.height, size.width * .5, size.height)
      ..cubicTo(size.width * .59, size.height, size.width * .59,
          size.height - 30, size.width * .7, size.height - 30)
      ..lineTo(size.width - 35, size.height - 30)
      ..quadraticBezierTo(size.width, size.height - 30, size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
    canvas.drawShadow(path, Colors.black26, 10, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
