import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelNavigationBar extends StatelessWidget {
  const TravelNavigationBar({
    Key? key,
    required this.items,
    required this.onPressed,
    this.currentIndex = 0,
  })  : assert(items.length == 2, ''),
        super(key: key);

  final List<TravelNavigationBarItem> items;
  final ValueChanged<int> onPressed;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _NavPainter(),
      child: SizedBox(
        height: kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              items.length,
              (index) {
                return IconButton(
                  onPressed: () => onPressed(index),
                  icon: Icon(items[index].icon),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TravelNavigationBarItem {
  TravelNavigationBarItem({
    required this.icon,
    this.selectedIcon,
  });

  final IconData icon;
  final IconData? selectedIcon;
}

class _NavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final w5 = w * .5;
    final h5 = h * .5;
    final h7 = h * .7;

    final path = Path()
      ..lineTo(w5 - 100, 0)
      ..cubicTo((w5 - 50), 0, (w5 - 60), h5, w5 - 10, h7)
      ..cubicTo((w5 + 60), (h7 + 3), (w5 + 40), 5, (w5 + 100), 0)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(0, h);
    canvas.drawShadow(path, Colors.black26, 10, false);
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
