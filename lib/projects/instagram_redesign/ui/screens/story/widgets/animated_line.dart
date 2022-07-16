import 'package:flutter/material.dart';


class AnimatedLine extends StatelessWidget {
  const AnimatedLine({
    super.key,
    required this.index,
    required this.selectedIndex,
    this.animationController,
  });

  final int index;
  final int selectedIndex;
  final AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: AnimatedBuilder(
          animation: animationController!,
          builder: (context, _) {
            return LinearProgressIndicator(
              value: index < selectedIndex
                  ? 1.0
                  : index == selectedIndex
                  ? animationController!.value
                  : 0.0,
              minHeight: 4,
              backgroundColor: Colors.white54,
              valueColor: const AlwaysStoppedAnimation(Colors.white),
            );
          },),
    );
  }
}
