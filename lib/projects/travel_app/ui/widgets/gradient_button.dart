import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/extensions/text_theme_x.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';

class GradientTag extends StatelessWidget {
  const GradientTag({
    Key? key,
    required this.statusTag,
  }) : super(key: key);

  final StatusTag statusTag;

  @override
  Widget build(BuildContext context) {
    List<Color> colors;
    String text;
    switch (statusTag) {
      case StatusTag.popular:
        colors = [
          Colors.amber,
          Colors.orange.shade700,
        ];
        text = 'Popular places';
        break;
      case StatusTag.event:
        colors = [
          Colors.greenAccent.shade200,
          Colors.greenAccent.shade700,
        ];
        text = 'Events';
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: Text(
        text,
        style: context.subtitle1.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
