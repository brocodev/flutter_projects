import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
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
            )),
            Expanded(
                child: Icon(
              Icons.notifications_none,
              color: color,
            )),
            const Spacer(),
            Expanded(
                child: Icon(
              Icons.favorite_border,
              color: color,
            )),
            Expanded(
                child: Icon(
              Icons.person_outline,
              color: color,
            )),
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
    final path = Path()
      ..lineTo(w * .32, 0)
      ..cubicTo(w * .45, h * .0, w * .38, h * .55, w * .5, h * .7)
      ..lineTo(w * .5, h * .7)
      ..cubicTo(w * .6, h * .6, w * .55, 0, w * .7, h * 0)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(0, h);

    canvas.drawShadow(path, Colors.black, 40.0, false);
    canvas.drawShadow(path, Colors.black, 40.0, false);
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
