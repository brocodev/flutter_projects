import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_projects/music_vinyl_player/models/album.dart';
import 'vinyl_disk.dart';

class AlbumDiskCard extends StatelessWidget {
  final Album album;
  final double factorChange;
  final double height;

  const AlbumDiskCard({
    Key key,
    @required this.album,
    @required this.factorChange,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          right: (-screenWidth * .15) * (1 - factorChange),
          left: 10 * (1 - factorChange),
          child: Transform.rotate(
            angle: -factorChange * (pi),
            child:
                VinylDisk(albumImagePath: album.pathImage, heightDisk: height),
          ),
        ),
        Positioned(
          left: 25 * factorChange,
          child: _AlbumImage(
            albumImageHeight: height,
            album: album,
          ),
        ),
      ],
    );
  }
}

class _AlbumImage extends StatelessWidget {
  const _AlbumImage({
    Key key,
    @required this.albumImageHeight,
    @required this.album,
  }) : super(key: key);

  final double albumImageHeight;
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: albumImageHeight,
      width: albumImageHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
              image: AssetImage(album.pathImage), fit: BoxFit.cover)),
    );
  }
}
//
