import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    Key key,
    @required this.likes,
    @required this.isLiked,
    @required this.onTap,
  }) : super(key: key);

  final int likes;
  final bool isLiked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 10.0),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            height: 45,
            color: isLiked ? Colors.redAccent[400] : Colors.white12,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Text(
                  _getFormatLikes(),
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
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
