import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.colors,
  })  : assert(colors.length > 1, 'Colors must be more than one'),
        super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: colors,
          ),
        ),
        child: child,
      ),
    );
  }
}
