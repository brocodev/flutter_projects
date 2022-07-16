import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IgTitleSubtitleText extends StatelessWidget {
  const IgTitleSubtitleText({
    super.key,
    required this.title,
    required this.subtitle,
    this.height = 1.5,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String title;
  final String subtitle;
  final double height;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w900,
              fontSize: 17,
            ),),
        Text(
          subtitle,
          style: GoogleFonts.lato(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
              height: height,
              fontWeight: FontWeight.bold,),
        ),
      ],
    );
  }
}
