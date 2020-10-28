import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeButton extends StatelessWidget {
  final int likes;
  final bool isLiked;
  final Color textColor;
  final VoidCallback onTap;
  final Color backgroundColor;

  const LikeButton({
    Key key,
    @required this.likes,
    @required this.isLiked,
    @required this.onTap,
    this.textColor = Colors.white,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 10.0),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            height: 45,
            color: isLiked
                ? Colors.redAccent[400]
                : backgroundColor ?? Colors.white12,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.white : textColor,
                ),
                const SizedBox(width: 5),
                Text(
                  _getFormatLikes(),
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    color: isLiked ? Colors.white : textColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFormatLikes() {
    if (likes >= 1000) {
      final textLikes = (likes / 1000).toString().split('.');
      return textLikes.first + "," + textLikes.last.split('').first + 'K';
    }
    return "$likes";
  }
}
