import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/music_app/models/album_model.dart';

class SmallAlbumCard extends StatelessWidget {
  const SmallAlbumCard({
    Key key,
    @required this.album,
    @required this.widthImage,
    @required this.animationController,
    @required this.rotateDisk,
  }) : super(key: key);

  final AlbumModel album;
  final double widthImage;
  final AnimationController animationController;
  final Animation<double> rotateDisk;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Positioned(
              bottom: 100,
              right: 60 * rotateDisk.value,
              top: 0,
              child: Transform.rotate(
                angle: (1 - rotateDisk.value) * (1 * pi),
                child: child,
              ),
            );
          },
          child: Hero(
            tag: album.title + 'vinyl',
            child: Image.asset(
              'assets/img/music/vinyl.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Hero(
              tag: album.title + 'shadow',
              child: Container(
                width: widthImage,
                height: widthImage,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5))
                ]),
              ),
            ),
            Hero(
              tag: album.title + 'image',
              child: Image.asset(
                album.pathImage,
                width: widthImage,
                height: widthImage,
                fit: BoxFit.cover,
              ),
            ),
            Hero(
              tag: album.title + 'gradient',
              child: Container(
                width: widthImage,
                height: widthImage,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: album.title + 'title',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    album.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                        fontWeight: FontWeight.w700,
                        height: 2,
                        color: Colors.redAccent[400]),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


