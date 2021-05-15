import 'package:flutter/material.dart';
import 'package:flutter_projects/music_album_collection/models/album_model.dart';
import 'package:flutter_projects/music_album_collection/pages/painters/wave_painter.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({
    Key key,
    @required this.album,
  }) : super(key: key);
  final AlbumModel album;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //--------------------------------
      // Animated Background
      //--------------------------------
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.blueGrey],
              stops: [0, 0]),
        ),
        child: Column(
          children: [
            //-------------------------
            // Custom App Bar
            //-------------------------
            SafeArea(
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    icon: Icon(Icons.arrow_back_ios),
                    label: Text('Back'),
                  )
                ],
              ),
            ),
            //--------------------------
            // Player Card
            //--------------------------
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 20,
                    bottom: 0,
                    left: size.width * .12,
                    right: size.width * .12,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  Positioned.fill(
                    top: 20,
                    bottom: 15,
                    left: size.width * .09,
                    right: size.width * .09,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          //------------------------------
                          // Album Cover Image
                          //------------------------------
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0,8)
                                  )
                                ],
                                image: DecorationImage(
                                  image: AssetImage(album.pathImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          //----------------------------
                          // Song Info Text
                          //----------------------------
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  '${album.songs.first} by ${album.author} - ${album.title}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //-----------------------------
                          // Playback indicator
                          //-----------------------------
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: CustomPaint(
                                  painter: WavePainter(), child: Container()),
                            ),
                          ),
                          //-----------------------------
                          // Music Player Controls
                          //-----------------------------
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(5, (i) {
                                  final listIcons = [
                                    Icons.replay,
                                    Icons.fast_rewind,
                                    Icons.play_arrow_rounded,
                                    Icons.fast_forward,
                                    Icons.volume_up
                                  ];
                                  return (i == 0 || i == 4)
                                      ? IconButton(
                                          onPressed: () {},
                                          color: Colors.grey,
                                          icon: Icon(listIcons[i]),
                                        )
                                      : FloatingActionButton(
                                          mini: i != 2,
                                          onPressed: () {},
                                          backgroundColor: Colors.white,
                                          elevation: 1,
                                          foregroundColor: Color(0xffc21451),
                                          child: Icon(listIcons[i]),
                                        );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width * .2,
              height: size.width * .15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Icon(
                Icons.tv,
                size: 30,
                color: Colors.blueGrey[800],
              ),
            )
          ],
        ),
      ),
    );
  }
}
