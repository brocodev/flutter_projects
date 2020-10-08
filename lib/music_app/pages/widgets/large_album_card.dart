import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/music_app/models/album_model.dart';

class LargeAlbumCard extends StatelessWidget {
  const LargeAlbumCard({
    Key key,
    @required this.album,
    @required this.animationController,
    @required this.rotateDisk,
  }) : super(key: key);

  final AlbumModel album;
  final AnimationController animationController;
  final Animation<double> rotateDisk;

  @override
  Widget build(BuildContext context) {
    final heightImage = 240.0;
    return Stack(
      alignment: Alignment(-.8, 0),
      children: <Widget>[
        AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Positioned(
                top: 35,
                bottom: 35,
                right: -20,
                left: -180 * rotateDisk.value,
                child: Transform.rotate(
                  angle: (1 - rotateDisk.value) * (pi),
                  child: Hero(
                    flightShuttleBuilder: (flightContext, animation,
                            flightDirection, fromHeroContext, toHeroContext) =>
                        const SizedBox(),
                    tag: album.title + 'vinyl',
                    child: Image.asset(
                      'assets/img/music/vinyl.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            }),
        Hero(
          tag: album.title + 'shadow',
          child: Container(
            height: heightImage,
            width: heightImage,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 15, offset: Offset(0, 10))
            ]),
          ),
        ),
        Hero(
          tag: album.title + 'image',
          child: Image.asset(
            album.pathImage,
            height: heightImage,
            width: heightImage,
            fit: BoxFit.cover,
          ),
        ),
        Hero(
          tag: album.title + 'gradient',
          child: Container(
            width: heightImage,
            height: heightImage,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            )),
          ),
        ),
        Align(
          alignment: Alignment(-.75,.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                tag: album.title + 'title',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    album.title,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.9),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Hero(
                tag: album.title + 'author',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    "by ${album.author}",
                    style: TextStyle(
                      height: 2,
                      fontSize: 16,
                      color: Colors.redAccent[200].withOpacity(.9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
