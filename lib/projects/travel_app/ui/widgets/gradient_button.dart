import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientTag extends StatelessWidget {
  const GradientTag({
    Key? key,
    required this.child,
    required this.colors,
  })  : assert(colors.length > 1, 'Colors must be more than one'),
        super(key: key);

  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}
