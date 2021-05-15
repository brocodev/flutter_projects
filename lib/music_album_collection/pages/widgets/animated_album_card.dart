import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/music_album_collection/models/album_model.dart';
import 'package:flutter_projects/music_album_collection/pages/music_player_page.dart';

class AlbumListViewCard extends StatelessWidget {
  const AlbumListViewCard({
    Key key,
    @required this.album,
    @required this.hideDisk,
    this.textSize = 14.0,
  }) : super(key: key);

  final bool hideDisk;
  final AlbumModel album;
  final double textSize;

  void _onTapAlbum(BuildContext context) {
    Navigator.push(context, PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: MusicPlayerPage(album: album),
        );
      },
    ));
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
              TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: hideDisk ? 0.0 : 2.0),
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
                        tag: album.title + 'vinyl',
                        child: Image.asset('assets/img/music/vinyl.png')),
                  ),
                ),
              ),
              InkWell(
                onTap: () => _onTapAlbum(context),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Hero(
                        tag: album.title + 'cover',
                        child: Stack(
                          children: [
                            //----------------------------
                            // Album Cover Image
                            //----------------------------
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(-3, 5))
                                ],
                                image: DecorationImage(
                                  image: AssetImage(album.pathImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: AnimatedContainer(
                                duration: kThemeAnimationDuration,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black12,
                                        Colors.black12,
                                        Colors.black54,
                                      ],
                                      stops: hideDisk ? [1, 0, 0] : null),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(-.3, .9),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _AlbumCardText(
                              heroTag: album.title + 'song',
                              text: album.title,
                              colorText: Colors.white,
                              textSize: textSize,
                            ),
                            _AlbumCardText(
                              heroTag: album.title + 'title',
                              text: 'By ${album.author}',
                              colorText: Color(0xfffc5b5b),
                              textSize: textSize,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class AlbumGridViewCard extends StatelessWidget {
  const AlbumGridViewCard({
    Key key,
    @required this.album,
    @required this.hideDisk,
    this.textSize = 14.0,
  }) : super(key: key);

  final bool hideDisk;
  final AlbumModel album;
  final double textSize;

  void _onTapAlbum(BuildContext context) {
    Navigator.push(context, PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: MusicPlayerPage(album: album),
        );
      },
    ));
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
              TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: hideDisk ? 0.0 : 2.0),
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
                        tag: album.title + 'vinyl',
                        child: Image.asset('assets/img/music/vinyl.png')),
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
                  child: Hero(
                    tag: album.title + 'cover',
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(-3, 5))
                        ],
                        image: DecorationImage(
                          image: AssetImage(album.pathImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //---------------------------------
        // Main Song Text
        //---------------------------------

        const SizedBox(height: 5),

        _AlbumCardText(
          heroTag: album.title + 'song',
          text: album.title,
          colorText: Colors.grey[800],
          textSize: textSize,
        ),
        //---------------------------------
        // Album Title Text
        //---------------------------------

        _AlbumCardText(
          heroTag: album.title + 'title',
          text: 'By ${album.author}',
          colorText: Color(0xfffc5b5b),
          textSize: textSize,
        ),
      ],
    );
  }
}

class _AlbumCardText extends StatelessWidget {
  const _AlbumCardText({
    Key key,
    @required this.textSize,
    @required this.heroTag,
    this.text,
    this.colorText,
  }) : super(key: key);

  final double textSize;
  final String heroTag;
  final String text;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: FittedBox(
        child: Material(
          color: Colors.transparent,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
