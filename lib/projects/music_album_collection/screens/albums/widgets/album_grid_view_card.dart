import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/music_album_collection/models/album_model.dart';
import 'package:flutter_projects/projects/music_album_collection/screens/music_player/music_player_screen.dart';
import 'package:flutter_projects/projects/music_album_collection/screens/widgets/album_card_text.dart';

class AlbumGridViewCard extends StatelessWidget {
  const AlbumGridViewCard({
    super.key,
    required this.album,
    required this.hideDisk,
    this.textSize = 14.0,
  });

  final bool hideDisk;
  final AlbumModel album;
  final double textSize;

  void _onTapAlbum(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: MusicPlayerScreen(album: album),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              //----------------------------------------
              // Vinyl Disk
              //----------------------------------------
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: hideDisk ? 0.0 : 2.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.fastOutSlowIn,
                builder: (context, value, child) {
                  return Align(
                    alignment: Alignment(-1.0 + value, 0),
                    child: Transform.rotate(
                      angle: pi * value,
                      child: child,
                    ),
                  );
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Hero(
                      tag: '${album.title}vinyl',
                      child: Image.asset('assets/img/music/vinyl.png'),
                    ),
                  ),
                ),
              ),
              //----------------------------
              // Album Cover Image
              //----------------------------
              InkWell(
                onTap: () => _onTapAlbum(context),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: _AlbumImage(album: album),
                ),
              ),
            ],
          ),
        ),
        //---------------------------------
        // Main Song Text
        //---------------------------------

        const SizedBox(height: 5),

        AlbumCardText(
          heroTag: '${album.title}song',
          text: album.title,
          colorText: Colors.grey[800],
          textSize: textSize,
        ),
        //---------------------------------
        // Album Title Text
        //---------------------------------

        AlbumCardText(
          heroTag: '${album.title}title',
          text: 'By ${album.author}',
          colorText: const Color(0xfffc5b5b),
          textSize: textSize,
        ),
      ],
    );
  }
}

class _AlbumImage extends StatelessWidget {
  const _AlbumImage({
    Key? key,
    required this.album,
  }) : super(key: key);

  final AlbumModel album;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${album.title}cover',
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(-3, 5),
            )
          ],
          image: DecorationImage(
            image: AssetImage(album.pathImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
