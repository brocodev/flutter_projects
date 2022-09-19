import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.likes,
    required this.isLiked,
    required this.onTap,
    this.textColor = Colors.white,
    this.backgroundColor,
  });

  final int? likes;
  final bool? isLiked;
  final Color textColor;
  final VoidCallback onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 10),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            height: 45,
            color: isLiked!
                ? Colors.redAccent[400]
                : backgroundColor ?? Colors.white12,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: isLiked! ? Colors.white : textColor,
                ),
                const SizedBox(width: 5),
                Text(
                  _getFormatLikes(),
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    color: isLiked! ? Colors.white : textColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getFormatLikes() {
    if (likes! >= 1000) {
      final textLikes = (likes! / 1000).toString().split('.');
      return "${textLikes.first} , ${textLikes.last.split('').first} 'K'";
    }
    return '$likes';
  }
}
