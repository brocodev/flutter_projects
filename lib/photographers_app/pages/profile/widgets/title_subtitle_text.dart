import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSubtitleText extends StatelessWidget {
  final String title;
  final String subtitle;
  final double height;
  final CrossAxisAlignment crossAxisAlignment;

  const TitleSubtitleText({
    Key key,
    @required this.title,
    @required this.subtitle,
    this.height = 1.5,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: PhotoAppColors.kDarkBlue,
              fontSize: 17,
            )),
        Text(
          subtitle,
          style: GoogleFonts.lato(
              height: height,
              color: PhotoAppColors.kGrey,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
