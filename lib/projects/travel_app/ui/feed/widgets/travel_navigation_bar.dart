import 'package:flutter/material.dart';

class TravelNavigationBar extends StatelessWidget {
  const TravelNavigationBar({
    super.key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
  }) : assert(items.length == 2, '');

  final List<TravelNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _NavPainter(),
      child: SizedBox(
        height: kToolbarHeight + MediaQuery.of(context).padding.bottom,
        child: Row(
          children: List.generate(
            items.length,
            (index) => Expanded(
              child: Icon(
                currentIndex == index
                    ? items[index].selectedIcon
                    : items[index].icon,
                color: currentIndex == index
                    ? Theme.of(context).primaryColor
                    : null,
              ),
            ),
          )..insert(1, const Spacer()),
        ),
      ),
    );
  }
}

class TravelNavigationBarItem {
  TravelNavigationBarItem({
    required this.icon,
    required this.selectedIcon,
  });

  final IconData icon;
  final IconData selectedIcon;
}

class _NavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final h5 = h * .55;
    final w5 = w * .5;
    final h6 = h * .6;

    final path = Path()
      ..lineTo(w5 - 75, 0)
      ..cubicTo((w5 - 50), 0, (w5 - 35), h5, w5, h6)
      ..cubicTo((w5 + 35), h5, (w5 + 50), 0, (w5 + 75), 0)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(0, h);

    canvas.drawShadow(path, Colors.black26, 10, false);
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
