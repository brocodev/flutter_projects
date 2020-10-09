import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/models/post.dart';
import 'package:flutter_projects/photographers_app/utils/photo_app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  final bool isInverted;

  const PostContainer({
    Key key,
    @required this.post,
    @required this.isInverted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 40,
              right: 0,
              left: 0,
              child: ClipPath(
                clipper: _TileClipper(inverted: isInverted),
                child: CachedNetworkImage(
                  imageUrl: post.photoPost,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(pi * (isInverted ? -.03 : 0.03))
                      ..setTranslationRaw(10, isInverted ? -30 : -20, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              CachedNetworkImageProvider(post.user.photoUrl),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          post.user.name.split(" ").first,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(pi * (isInverted ? .02 : - 0.035))
                      ..setTranslationRaw(0, isInverted ? -45 : -10, 0),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.solidCommentDots, size: 18),
                        const SizedBox(width: 3),
                        Text(
                          post.comments.toString(),
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: PhotoAppColors.kDarkBlue,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(pi * (isInverted ? .035 : - 0.06))
                      ..setTranslationRaw(0, isInverted ? -40 : -20, 0),
                    child: Row(
                      children: [
                        Icon(
                            post.isLiked
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            size: 18,
                            color: post.isLiked
                                ? Colors.redAccent[700]
                                : PhotoAppColors.kDarkBlue),
                        const SizedBox(width: 3),
                        Text(
                          post.likes.toString(),
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: PhotoAppColors.kDarkBlue,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TileClipper extends CustomClipper<Path> {
  final bool inverted;

  _TileClipper({this.inverted = false});

  @override
  Path getClip(Size size) {
    final path = Path();
    final curveSize = 30.0;
    if (inverted) {
      path.moveTo(0, curveSize);
      path.quadraticBezierTo(size.width * .5, 0, size.width, curveSize);
      path.lineTo(size.width, size.height - curveSize);
      path.quadraticBezierTo(size.width * .5, size.height - (curveSize * 2), 0,
          size.height - curveSize);
    } else {
      path.moveTo(0, curveSize + 3);
      path.quadraticBezierTo(
          size.width * .5, curveSize * 2, size.width, curveSize + 3);
      path.lineTo(size.width, size.height - curveSize + 3);
      path.quadraticBezierTo(size.width * .5, size.height + curveSize, 0,
          size.height - curveSize + 3);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
