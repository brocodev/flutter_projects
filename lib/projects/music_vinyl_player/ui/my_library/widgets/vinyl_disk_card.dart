import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/music_vinyl_player/models/album.dart';
import 'package:flutter_projects/projects/music_vinyl_player/ui/widgets/vinyl_disk.dart';

class VinylAlbumCover extends StatelessWidget {
  const VinylAlbumCover({
    super.key,
    required this.album,
    required this.factorChange,
    this.height,
    this.currentIndex,
    this.index,
  });
  final Album album;
  final double factorChange;
  final double? height;
  final int? currentIndex;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final val = currentIndex! >= index!;
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        //-------------------------------
        // Vinyl Disk Animation
        //-------------------------------
        Positioned(
          right: (-screenWidth * .15) * (val ? (1 - factorChange) : 0.0),
          left: 10 * (1 - factorChange),
          child: Transform.rotate(
            angle: -factorChange * pi,
            child:
                VinylDisk(albumImagePath: album.pathImage, heightDisk: height),
          ),
        ),
        //-------------------------------
        // Cover Image Animation
        //-------------------------------
        Positioned(
          left: 20 * factorChange,
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
    required this.albumImageHeight,
    required this.album,
  });

  final double? albumImageHeight;
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: albumImageHeight,
      width: albumImageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
            image: AssetImage(album.pathImage!), fit: BoxFit.cover,),
      ),
    );
  }
}
//
