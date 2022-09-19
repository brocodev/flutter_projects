import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedPlayerControls extends StatelessWidget {
  const AnimatedPlayerControls({
    super.key,
    required this.animation1,
    required this.animation2,
  });

  final Animation<double> animation1;
  final Animation<double> animation2;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (i) {
            final listIcons = [
              Icons.replay,
              Icons.fast_rewind,
              Icons.play_arrow_rounded,
              Icons.fast_forward,
              Icons.volume_up
            ];
            return (i == 0 || i == 4)
                ? IconButton(
                    onPressed: () {},
                    color: Colors.grey,
                    icon: Icon(listIcons[i]),
                  )
                : Transform.scale(
                    scale: lerpDouble(
                      .5,
                      1,
                      animation2.value,
                    ),
                    child: FloatingActionButton(
                      mini: i != 2,
                      heroTag: i.toString(),
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      elevation: 1,
                      foregroundColor: const Color(0xffc21451),
                      child: Icon(listIcons[i]),
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
