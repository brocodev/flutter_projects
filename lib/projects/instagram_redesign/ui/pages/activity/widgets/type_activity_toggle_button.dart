import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeActivityToggleButton extends StatelessWidget {
  const TypeActivityToggleButton({
    super.key,
    required this.value,
    required this.selectValue,
    required this.labelButton,
    this.notifications,
  });

  final int value;
  final int selectValue;
  final String labelButton;
  final int? notifications;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const indicatorSize = 35.0;
    const indicatorColor = Colors.redAccent;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: value == selectValue
                  ? colorScheme.onBackground
                  : colorScheme.background,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
              labelButton,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                color: value == selectValue
                    ? colorScheme.onPrimary
                    : colorScheme.onBackground,
              ),
            ),
          ),
        ),
        if (notifications! > 0)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: indicatorSize,
              width: indicatorSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: indicatorColor.shade400,
                boxShadow: [
                  BoxShadow(color: indicatorColor.shade100, blurRadius: 3)
                ],
                borderRadius: BorderRadius.circular(indicatorSize * .4),
              ),
              child: Text(
                '$notifications',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
      ],
    );
  }
}
