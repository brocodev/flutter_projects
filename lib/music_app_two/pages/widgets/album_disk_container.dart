import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_projects/music_app_two/models/album.dart';

import 'vinyl_disk.dart';

class AlbumDiskContainer extends StatelessWidget {
  final Album album;
  final double factorChange;

  const AlbumDiskContainer({
    Key key,
    @required this.album,
    @required this.factorChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumImageHeight = MediaQuery.of(context).size.height*.2;
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        // Align(
        //   alignment: Alignment(1 * (1 - factorChange), 0),
        //   child: Transform.rotate(
        //     angle: -factorChange * (pi),
        //     child: _VinylDisk(
        //         albumImagePath: album.pathImage,
        //         heightDisk: albumImageHeight),
        //   ),
        // ),
        // Align(
        //   alignment: Alignment(-1 * (1 - factorChange), 0),
        //   child: _AlbumImage(
        //     albumImageHeight: albumImageHeight,
        //     album: album,
        //   ),
        // ),
        Positioned(
          right: -90 * (1 - factorChange),
          left: 20.0 * factorChange,
          child: Transform.rotate(
            angle: -factorChange * (pi),
            child: VinylDisk(
                albumImagePath: album.pathImage,
                heightDisk: albumImageHeight),
          ),
        ),
        Positioned(
          left: 45 * factorChange,
          child: _AlbumImage(
            albumImageHeight: albumImageHeight,
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
