import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/music_album_collection/models/album_model.dart';
import 'package:flutter_projects/projects/music_album_collection/screens/music_player/widgets/animated_player_controls.dart';
import 'package:flutter_projects/projects/music_album_collection/screens/music_player/widgets/wave_painter.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({
    super.key,
    required this.album,
  });

  final AlbumModel album;

  @override
  MusicPlayerScreenState createState() => MusicPlayerScreenState();
}

class MusicPlayerScreenState extends State<MusicPlayerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _itemsAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(milliseconds: 800),
    );
    _sizeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.6, curve: Curves.fastOutSlowIn),
      ),
    );

    _itemsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 1, curve: Curves.decelerate),
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _animationController.forward();
    });
    _animationController.addListener(_animationStatusListener);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animationStatusListener() {
    if (_animationController.status == AnimationStatus.dismissed) {
      Navigator.pop(context);
    }
  }

  BoxDecoration get _gradientDecoration {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white, Colors.blueGrey],
        stops: [0, 0],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final album = widget.album;
    return WillPopScope(
      onWillPop: () async {
        await _animationController.reverse();
        return false;
      },
      child: Scaffold(
        //--------------------------------
        // Animated Background
        //--------------------------------
        body: DecoratedBox(
          decoration: _gradientDecoration,
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
                      onPressed: () => _animationController.reverse(),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.white),
                      icon: const Icon(Icons.arrow_back_ios),
                      label: const Text('Back'),
                    ),
                  ],
                ),
              ),
              //--------------------------
              // Body
              //--------------------------
              Expanded(
                child: LayoutBuilder(
                  builder: (child, constraints) {
                    final cardHeight = constraints.biggest.height;
                    return AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        var imagePath = album.pathImage;
                        return Stack(
                          children: [
                            //-------------------------------------
                            // Back semitransparent card
                            //-------------------------------------
                            Positioned.fill(
                              top: lerpDouble(
                                cardHeight,
                                20,
                                _sizeAnimation.value,
                              ),
                              left: size.width * .12,
                              right: size.width * .12,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            //--------------------------------------
                            // Player Card
                            //--------------------------------------
                            Positioned.fill(
                              top: lerpDouble(
                                cardHeight,
                                20,
                                _sizeAnimation.value,
                              ),
                              bottom: 15,
                              left: size.width * .09,
                              right: size.width * .09,
                              child: Opacity(
                                opacity: _sizeAnimation.value,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      //------------------------------
                                      // Album Cover Image
                                      //------------------------------
                                      // Text(_sizeAnimation.value.toString()),
                                      Flexible(
                                        flex: 4,
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: FadeTransition(
                                            opacity: _itemsAnimation,
                                            child: _AlbumImage(
                                                imagePath: imagePath),
                                          ),
                                        ),
                                      ),
                                      //----------------------------
                                      // Song Info Text
                                      //----------------------------
                                      Expanded(
                                        child: FadeTransition(
                                          opacity: _itemsAnimation,
                                          child: _SongInformation(album: album),
                                        ),
                                      ),
                                      //-----------------------------
                                      // Playback indicator
                                      //-----------------------------
                                      Expanded(
                                        child: FadeTransition(
                                          opacity: _itemsAnimation,
                                          child: const WavePlayingIndicator(),
                                        ),
                                      ),
                                      //-----------------------------
                                      // Music Player Controls
                                      //-----------------------------
                                      Expanded(
                                        child: AnimatedPlayerControls(
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
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              _TVBottomButton(
                animationController: _animationController,
                size: size,
                itemsAnimation: _itemsAnimation,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TVBottomButton extends StatelessWidget {
  const _TVBottomButton({
    Key? key,
    required AnimationController animationController,
    required this.size,
    required Animation<double> itemsAnimation,
  })  : _animationController = animationController,
        _itemsAnimation = itemsAnimation,
        super(key: key);

  final AnimationController _animationController;
  final Size size;
  final Animation<double> _itemsAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child) {
        var value = lerpDouble(size.width * .1, 0, _itemsAnimation.value);
        return Transform.translate(
          offset: Offset(0, value!),
          child: child,
        );
      },
      child: Container(
        width: size.width * .2,
        height: size.width * .15,
        decoration: const BoxDecoration(
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
    );
  }
}

class WavePlayingIndicator extends StatelessWidget {
  const WavePlayingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: CustomPaint(
        painter: WavePainter(),
        child: Container(),
      ),
    );
  }
}

class _SongInformation extends StatelessWidget {
  const _SongInformation({
    Key? key,
    required this.album,
  }) : super(key: key);

  final AlbumModel album;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Text(
          '${album.songs.first} '
          'by ${album.author} - '
          '${album.title}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _AlbumImage extends StatelessWidget {
  const _AlbumImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 8),
          )
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
