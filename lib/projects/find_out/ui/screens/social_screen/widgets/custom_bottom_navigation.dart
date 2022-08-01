import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.grey[400];
    return CustomPaint(
      painter: BottomBarPainter(),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.search,
                color: color,
              ),
            ),
            Expanded(
              child: Icon(
                Icons.notifications_none,
                color: color,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Icon(
                Icons.favorite_border,
                color: color,
              ),
            ),
            Expanded(
              child: Icon(
                Icons.person_outline,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    // cambiar a lineas comentadas, para un recorte del dock fijo
    // final w2 = size.width * .5;
    final path = Path()
      ..lineTo(w * .32, 0)
      ..cubicTo(w * .42, 0, w * .4, h * .6, w * .5, h * .65)
      ..cubicTo(w * .6, h * .6, w * .58, 0, w * .68, 0)
      // ..lineTo(w2 - 55, 0)
      // ..cubicTo(w2 - 30, 0, w2 - 38, 35, w2, 37)
      // ..cubicTo(w2 + 38, 35, w2 + 30, 0, w2 + 55, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(0, h);

    canvas
      ..drawShadow(path, Colors.black, 40, false)
      ..drawShadow(path, Colors.black, 40, false)
      ..drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
