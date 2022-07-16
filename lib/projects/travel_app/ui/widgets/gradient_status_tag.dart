import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/extensions/text_theme_x.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';

class GradientStatusTag extends StatelessWidget {
  const GradientStatusTag({
    super.key,
    required this.statusTag,
  });

  final StatusTag statusTag;

  @override
  Widget build(BuildContext context) {
    String text;
    List<Color> colors;
    switch (statusTag) {
      case StatusTag.popular:
        text = 'Popular places';
        colors = [Colors.amber, Colors.orange.shade600];
        break;
      case StatusTag.event:
        text = 'Event';
        colors = [Colors.cyan, Colors.blue.shade600];
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
        style: context.subtitle1.copyWith(color: Colors.white),
      ),
    );
  }
}
