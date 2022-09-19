import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/music_vinyl_player/models/song.dart';
import 'package:flutter_projects/projects/music_vinyl_player/ui/song_player/widgets/song_player_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

const kDuration800ms = Duration(milliseconds: 800);
const kDurationTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);

class SongPlayerPage extends StatefulWidget {
  const SongPlayerPage({super.key, required this.song});

  final Song song;

  @override
  SongPlayerPageState createState() => SongPlayerPageState();
}

class SongPlayerPageState extends State<SongPlayerPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerSkew;
  late Animation<double> _rotateDisk;
  late Animation<double> _skewDisk;
  double playedSeconds = 0;
  double vinylDragValue = 0;
  bool isPlaying = false;
  Timer? _oneSecondTimer;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _controllerSkew =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _skewDisk = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(curve: Curves.easeInOut, parent: _controllerSkew),
    );
    _rotateDisk = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controllerSkew.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerSkew.dispose();
    _oneSecondTimer?.cancel();
    super.dispose();
  }

  //---------------------------------------------
  // On play or pause
  //---------------------------------------------
  void _pauseOrPlay(bool isPlaying) {
    if (isPlaying) {
      _controller.repeat();
      _oneSecondTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          playedSeconds++;
        });
      });
    } else {
      _controller.stop();
      _oneSecondTimer?.cancel();
    }
  }

  //---------------------------------------------
  // On Init Drag
  //---------------------------------------------
  void _onPanDown(DragDownDetails details) {
    _controller.stop();
    _controllerSkew.animateTo(
      .55,
      curve: Curves.easeOutBack,
    );
  }

  //---------------------------------------------
  // On dragging
  //---------------------------------------------
  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      if (details.delta.dx > 0.0) {
        vinylDragValue += -.007;
        playedSeconds = (playedSeconds - .5).clamp(
          0.0,
          widget.song.duration.inMilliseconds.toDouble(),
        );
      } else {
        vinylDragValue += .007;
        playedSeconds = (playedSeconds + .5).clamp(
          0.0,
          widget.song.duration.inMilliseconds.toDouble(),
        );
      }
    });
  }

  //---------------------------------------------
  // On finish dragging
  //---------------------------------------------
  void _onPanEnd(DragEndDetails details) {
    if (isPlaying) {
      _controller.repeat();
    }
    _controllerSkew.animateTo(
      1,
      curve: Curves.bounceOut,
      duration: const Duration(milliseconds: 600),
    );
  }

  String _formatSongDuration(Duration duration) {
    final seconds =
        (duration - Duration(minutes: duration.inMinutes)).inSeconds.toString();
    final sec = seconds.length == 1 ? '0$seconds' : seconds;
    return '${duration.inMinutes}:$sec';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeVinylDisk = size.height * .42;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          const NowPlayingAppBar(),
          Center(
            //----------------------------------------
            // Skew Disk Animated Builder
            //----------------------------------------
            child: AnimatedBuilder(
              animation: _controllerSkew,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1 + (.5 - _skewDisk.value * .5),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(-1 * _skewDisk.value),
                    alignment: Alignment.center,
                    child: child,
                  ),
                );
              },
              //----------------------------------------
              // Rotate Disk Animated Builder
              //----------------------------------------
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return GestureDetector(
                    onPanUpdate: _onPanUpdate,
                    onPanDown: _onPanDown,
                    onPanEnd: _onPanEnd,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sizeVinylDisk),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 100,
                            offset: Offset(0, 20),
                          )
                        ],
                      ),
                      child: Transform.rotate(
                        angle: (2 * pi) * _rotateDisk.value,
                        child: child,
                      ),
                    ),
                  );
                },
                //-------------------------
                // Disk Rotate animation
                //-------------------------
                child: Transform.rotate(
                  angle: pi * vinylDragValue,
                  child: TweenAnimationBuilder<double>(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 800),
                    tween: Tween(begin: 0, end: 1),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: 1.5 - (.5 * value),
                        child: Transform.translate(
                          offset: Offset(0, -200 * (1 - value)),
                          child: Opacity(
                            opacity: value,
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: VinylDisk(
                      albumImagePath: widget.song.album.pathImage,
                      heightDisk: sizeVinylDisk,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            widget.song.album.author!,
            style: GoogleFonts.poppins(
              fontSize: 20,
              shadows: const [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 20,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          //-------------------------------
          // Play time indicator
          //-------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PlayerIndicator(
              songTitle: widget.song.title,
              percentIndicator: playedSeconds / widget.song.duration.inSeconds,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            //-------------------------------------------------
            // Playback time and ending time
            //-------------------------------------------------
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _formatSongDuration(Duration(seconds: playedSeconds.toInt())),
                  style: kDurationTextStyle,
                ),
                Text(
                  _formatSongDuration(widget.song.duration),
                  style: kDurationTextStyle,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          //-----------------------------------------
          // Player controls
          //-----------------------------------------
          PlayerControls(
            isPlaying: isPlaying,
            onPausePlay: () {
              setState(() {
                isPlaying = !isPlaying;
              });
              _pauseOrPlay(isPlaying);
            },
          )
        ],
      ),
    );
  }
}
