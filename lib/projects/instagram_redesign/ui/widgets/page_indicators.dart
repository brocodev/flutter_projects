import 'package:flutter/material.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    super.key,
    required this.currentIndex,
    required this.numberIndicators,
  });

  final int currentIndex;
  final int numberIndicators;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(numberIndicators, (index) {
        return AnimatedContainer(
          duration: kThemeAnimationDuration,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == currentIndex ? 24 : 8,
          height: 6,
          decoration: BoxDecoration(
            color: index == currentIndex ? Colors.white : Colors.white60,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
