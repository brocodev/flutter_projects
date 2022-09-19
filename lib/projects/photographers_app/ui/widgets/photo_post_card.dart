import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/photographers_app/models/post.dart';
import 'package:flutter_projects/projects/photographers_app/theme/photo_app_colors.dart';
import 'package:flutter_projects/projects/photographers_app/ui/widgets/tile_clipper.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoPostCard extends StatefulWidget {
  const PhotoPostCard({
    super.key,
    required this.post,
    required this.isInverted,
  });

  final PhotoPost post;
  final bool isInverted;

  @override
  PhotoPostCardState createState() => PhotoPostCardState();
}

class PhotoPostCardState extends State<PhotoPostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleHeart;
  late Animation<double> _downOpacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleHeart = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(curve: Curves.decelerate, parent: _controller),
    );
    _downOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        curve: const Interval(
          0.5,
          1,
          curve: Curves.decelerate,
        ),
        parent: _controller,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: Stack(
          children: [
            //------------------------------
            // Post image
            //------------------------------
            Positioned(
              top: 0,
              bottom: 40,
              right: 0,
              left: 0,
              child: GestureDetector(
                onDoubleTap: () {
                  _controller.forward();
                  setState(() {
                    widget.post.isLiked = true;
                  });
                },
                child: ClipPath(
                  clipper: TileClipper(inverted: widget.isInverted),
                  child: CachedNetworkImage(
                    imageUrl: widget.post.photoPost!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //------------------------------
            // User, likes and comments
            //------------------------------
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(pi * (widget.isInverted ? -.03 : 0.03))
                      ..setTranslationRaw(10, widget.isInverted ? -30 : -20, 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          backgroundImage: CachedNetworkImageProvider(
                            widget.post.user!.photoUrl!,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.post.user!.name!.split(' ').first,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(pi * (widget.isInverted ? .02 : -0.035))
                      ..setTranslationRaw(0, widget.isInverted ? -45 : -10, 0),
                    child: Row(
                      children: [
                        const Icon(FontAwesome.commenting, size: 18),
                        const SizedBox(width: 3),
                        Text(
                          widget.post.comments.toString(),
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
                      ..rotateZ(pi * (widget.isInverted ? .035 : -0.06))
                      ..setTranslationRaw(0, widget.isInverted ? -40 : -20, 0),
                    child: Row(
                      children: [
                        Icon(
                          widget.post.isLiked!
                              ? FontAwesome.heart
                              : FontAwesome.heart_o,
                          size: 18,
                          color: widget.post.isLiked!
                              ? Colors.redAccent[700]
                              : PhotoAppColors.kDarkBlue,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          widget.post.likes.toString(),
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
            //----------------------------------
            // Heart Animation
            //----------------------------------
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Center(
                  child: Transform.scale(
                    scale: 20 * _scaleHeart.value,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white.withOpacity(
                        1 *
                            (_scaleHeart.value.clamp(0.0, .5) *
                                _downOpacity.value),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
