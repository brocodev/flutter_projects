import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/like_button.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class PostButtons extends StatelessWidget {
  const PostButtons({
    super.key,
    required this.post,
    required this.onTapLike,
    this.colorItems = Colors.white,
    this.likeBackgroundColor,
  });

  final IgPost post;
  final Color colorItems;
  final VoidCallback onTapLike;
  final Color? likeBackgroundColor;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LikeButton(
          likes: post.likes,
          isLiked: post.isLiked,
          onTap: onTapLike,
          backgroundColor: likeBackgroundColor,
          textColor: colorItems,
        ),
        const SizedBox(width: 20),
        Icon(FontAwesome5Solid.comment_dots, color: colorItems),
        const SizedBox(width: 5),
        Text(
          post.comments!.length.toString(),
          style: GoogleFonts.lato(
            color: colorItems,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 20),
        Icon(FontAwesome.send, color: colorItems),
        const Spacer(),
        Icon(FontAwesome.bookmark_o, color: colorItems),
      ],
    );
  }
}
