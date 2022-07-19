
import 'package:flutter/material.dart';

class AlbumCardText extends StatelessWidget {
  const AlbumCardText({
    super.key,
    required this.textSize,
    required this.heroTag,
    this.text,
    this.colorText,
  });

  final double textSize;
  final String heroTag;
  final String? text;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: FittedBox(
        child: Material(
          color: Colors.transparent,
          child: Text(
            text!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
