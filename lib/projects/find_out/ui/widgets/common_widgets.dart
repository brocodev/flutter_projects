import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/find_out/models/place.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class FindOutLogo extends StatelessWidget {
  const FindOutLogo({
    super.key,
    this.fontSize = 60.0,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fontSize * 2.7,
      child: Hero(
        tag: 'logo',
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'find',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                heightFactor: .3,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      FontAwesome.search,
                      size: fontSize * .7,
                      color: Colors.pinkAccent,
                    ),
                    Text(
                      'ut',
                      style: GoogleFonts.poppins(
                        height: .4,
                        fontWeight: FontWeight.w700,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FindOutHorizontalLogo extends StatelessWidget {
  const FindOutHorizontalLogo({
    super.key,
    this.fontSize = 28.0,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      shadows: const [
        Shadow(
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
    );
    return Hero(
      tag: 'horizontal_logo',
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Text('find', style: style),
            Icon(
              FontAwesome.search,
              size: fontSize * .8,
              color: Colors.pinkAccent,
            ),
            Text(
              'ut',
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}

class TitlePlace extends StatelessWidget {
  const TitlePlace({
    super.key,
    required this.place,
    this.baseFontSize = 40,
  });

  final Place place;
  final double baseFontSize;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: place.title!,
      child: Material(
        color: Colors.transparent,
        child: RichText(
          overflow: TextOverflow.fade,
          text: TextSpan(
            text: place.typePlace,
            style: GoogleFonts.poppins(
              fontSize: baseFontSize * .6,
            ),
            children: [
              TextSpan(
                text: '\n${place.title}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  fontSize: baseFontSize,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
