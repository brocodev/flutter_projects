import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/music_album_collection/models/album_model.dart';
import 'package:flutter_projects/music_album_collection/pages/painters/wave_painter.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({
    Key key,
    @required this.album,
  }) : super(key: key);
  final AlbumModel album;

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _sizeAnimation;
  Animation _itemsAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _sizeAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
    ));

    _itemsAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.6, 1.0, curve: Curves.decelerate),
    ));
    Future.delayed(const Duration(milliseconds: 300), () {
      _animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
            // Body
            //--------------------------
            Expanded(
              child: LayoutBuilder(builder: (child, constraints) {
                final cardHeight = constraints.biggest.height;
                return AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Stack(
                        children: [
                          //-------------------------------------
                          // Back semitransparent card
                          //-------------------------------------
                          Positioned.fill(
                            top: lerpDouble(
                                cardHeight, 20, _sizeAnimation.value),
                            left: size.width * .12,
                            right: size.width * .12,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          //--------------------------------------
                          // Player Card
                          //--------------------------------------
                          Positioned.fill(
                            top: lerpDouble(
                                cardHeight, 20, _sizeAnimation.value),
                            bottom: 15,
                            left: size.width * .09,
                            right: size.width * .09,
                            child: Opacity(
                              opacity: _sizeAnimation.value,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    //------------------------------
                                    // Album Cover Image
                                    //------------------------------
                                    Expanded(
                                      flex: 4,
                                      child: FadeTransition(
                                        opacity: _itemsAnimation,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(8.0),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 8))
                                            ],
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  widget.album.pathImage),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //----------------------------
                                    // Song Info Text
                                    //----------------------------
                                    Expanded(
                                      child: FadeTransition(
                                        opacity: _itemsAnimation,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Text(
                                              '${widget.album.songs.first} by ${widget.album.author} - ${widget.album.title}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //-----------------------------
                                    // Playback indicator
                                    //-----------------------------
                                    Expanded(
                                      child: FadeTransition(
                                        opacity: _itemsAnimation,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: CustomPaint(
                                              painter: WavePainter(),
                                              child: Container()),
                                        ),
                                      ),
                                    ),
                                    //-----------------------------
                                    // Music Player Controls
                                    //-----------------------------
                                    Expanded(
                                      child: _AnimatedPlayerControls(
                                        animation1: _sizeAnimation,
                                        animation2: _itemsAnimation,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(
                      0,
                      lerpDouble(size.width * .1, 0, _itemsAnimation.value),
                    ),
                    child: child);
              },
              child: Container(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AnimatedPlayerControls extends StatelessWidget {
  const _AnimatedPlayerControls({
    Key key,
    @required this.animation1,
    @required this.animation2,
  }) : super(key: key);

  final Animation animation1;
  final Animation animation2;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                : Transform.scale(
                    scale: lerpDouble(
                      .5,
                      1,
                      animation2.value,
                    ),
                    child: FloatingActionButton(
                      mini: i != 2,
                      heroTag: i.toString(),
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      elevation: 1,
                      foregroundColor: Color(0xffc21451),
                      child: Icon(listIcons[i]),
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
