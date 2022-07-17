import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

/// Watch the full video to create this [SnakeButton] on diegoveloper's channel
/// https://www.youtube.com/watch?v=e-OPrZWowB4&ab_channel=diegoveloper
class SnakeButton extends StatefulWidget {
  const SnakeButton({
    super.key,
    this.onPressed,
    this.duration = const Duration(milliseconds: 2500),
    this.borderColor = Colors.white,
    this.snakeColor = Colors.pinkAccent,
    this.borderWidth = 3.0,
    this.child,
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final Duration duration;
  final Color borderColor;
  final Color snakeColor;
  final double borderWidth;

  @override
  SnakeButtonState createState() => SnakeButtonState();
}

class SnakeButtonState extends State<SnakeButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller!.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: CustomPaint(
        painter: _SnakePainter(
          animation: _controller,
        ),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .056,
          child: widget.child,
        ),
      ),
    );
  }
}

class _SnakePainter extends CustomPainter {
  _SnakePainter({required this.animation}) : super(repaint: animation);

  final Animation<double>? animation;

  @override
  void paint(Canvas canvas, Size size) {
    const borderWidth = 3.0;
    //-------------------------------
    // Draw border button
    //-------------------------------
    final rectBorder = Offset.zero & size;
    canvas.drawRect(
      rectBorder.deflate(borderWidth / 2),
      Paint()
        ..color = Colors.white
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke,
    );

    //-------------------------------
    // Snake draw
    //-------------------------------
    final snakePaint = Paint()
      ..shader = SweepGradient(
        colors: const [
          Colors.pinkAccent,
          Colors.transparent,
        ],
        stops: const [0.5, 0.5],
        endAngle: vector.radians(90),
        transform: GradientRotation(
          vector.radians(360 * animation!.value),
        ),
      ).createShader(rectBorder);

    canvas.drawPath(
      Path.combine(
        PathOperation.xor,
        Path()..addRect(rectBorder),
        Path()..addRect(rectBorder.deflate(borderWidth)),
      ),
      snakePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
