import 'package:flutter/material.dart';
import 'package:flutter_projects/core/shared/ui/animations/tween_animations.dart';
import 'package:flutter_projects/projects/movie_selection/constants/constants.dart';
import 'package:flutter_projects/projects/movie_selection/ui/screens/detail/widgets/gradient_button.dart';

class GradientAnimationButton extends StatelessWidget {
  const GradientAnimationButton({
    super.key,
    required this.hideWidgets,
    this.label,
    this.onPressed,
  });

  final ValueNotifier<bool> hideWidgets;
  final String? label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: hideWidgets,
      builder: (context, value, child) {
        return AnimatedPositioned(
          curve: Curves.fastOutSlowIn,
          duration: kDuration400ms,
          bottom: value ? -150 : 20,
          left: 20,
          right: 20,
          child: child!,
        );
      },
      child: TranslateAnimation(
        child: ScaleAnimation(
          child: OpacityAnimation(
            child: GradientButton(
              onTap: () {
                hideWidgets.value = true;
                onPressed!();
              },
              text: label,
            ),
          ),
        ),
      ),
    );
  }
}
