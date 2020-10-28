import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SnakeButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Duration duration;
  final Color borderColor;
  final Color snakeColor;
  final double borderWidth;

  const SnakeButton(
      {Key key,
      this.onPressed,
      this.duration = const Duration(milliseconds: 2500),
      this.borderColor = Colors.white,
      this.snakeColor = Colors.pinkAccent,
      this.borderWidth = 3.0,
      this.child})
      : super(key: key);

  @override
  _SnakeButtonState createState() => _SnakeButtonState();
}

class _SnakeButtonState extends State<SnakeButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
  final Animation animation;
  final Color snakeColor;
  final Color borderColor;
  final double borderWidth;

  _SnakePainter({
    @required this.animation,
    this.snakeColor = Colors.pinkAccent,
    this.borderColor = Colors.white,
    this.borderWidth = 3.0,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    //==========================
    //===Draw border button=====
    //==========================

    final rectBorder = Offset.zero & size;
    canvas.drawRect(
      rectBorder.deflate(borderWidth / 2),
      Paint()
        ..color = Colors.white
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke,
    );

    //=======================
    //======Snake draw=======
    //=======================
    final snakePaint = Paint()
      ..shader = SweepGradient(
          colors: [Colors.pinkAccent, Colors.transparent],
          stops: [0.5, 0.5],
          startAngle: 0.0,
          endAngle: vector.radians(90),
          transform: GradientRotation(
            vector.radians(360 * animation.value),
          )).createShader(rectBorder);

    canvas.drawPath(
        Path.combine(
          PathOperation.xor,
          Path()..addRect(rectBorder),
          Path()..addRect(rectBorder.deflate(borderWidth)),
        ),
        snakePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
