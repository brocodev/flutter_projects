import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_projects/animations/tween_animations.dart';
import 'package:flutter_projects/music_vinyl_player/models/song.dart';
import 'package:flutter_projects/music_vinyl_player/ui/song_player/widgets/song_player_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

const kDuration800ms = const Duration(milliseconds: 800);

class SongPlayerPage extends StatefulWidget {
  final Song song;

  const SongPlayerPage({Key key, @required this.song}) : super(key: key);

  @override
  _SongPlayerPageState createState() => _SongPlayerPageState();
}

class _SongPlayerPageState extends State<SongPlayerPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controllerSkew;
  Animation<double> _rotateDisk;
  Animation<double> _skewDisk;
  double playedSeconds = 0.0;
  double vinylDragValue = 0.0;
  bool isOnPlay = true;
  Timer secondLapse;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _controllerSkew =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _skewDisk = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.easeInOut, parent: _controllerSkew));

    _rotateDisk = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controllerSkew.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    secondLapse?.cancel();
    super.dispose();
  }

  void _onPauseOrPlay(bool isPlayed) {
    if (isPlayed) {
      _controller.stop();
      secondLapse?.cancel();
    } else {
      _controller.repeat();
      secondLapse = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          playedSeconds++;
        });
      });
    }
  }

  void _onPanUpdate(details) {
    setState(() {
      if (details.delta.dx > 0) {
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

  void _onPanDown(details) {
    setState(() {
      isOnPlay = true;
    });
    _controller.stop();
    _controllerSkew.animateTo(
      .55,
      curve: Curves.fastOutSlowIn,
    );
    _onPauseOrPlay(isOnPlay);
  }

  void _onPanEnd(details) {
    setState(() {
      isOnPlay = false;
    });
    _controller.repeat();
    _onPauseOrPlay(isOnPlay);
    _controllerSkew.animateTo(
      1.0,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeVinylDisk = size.height * .42;
    final durationTextStyle = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          const NowPlayingAppBar(),
          Center(
            //-------------------------------------------
            // Implicit Animations
            //-------------------------------------------
            child: ScaleAnimation(
              duration: kDuration800ms,
              initScale: 1.4,
              finalScale: 1.0,
              child: OpacityAnimation(
                duration: kDuration800ms,
                child: TranslateAnimation(
                    duration: kDuration800ms,
                    offsetDirection: Axis.vertical,
                    offset: -300,
                    //-----------------------------------------
                    // Disk Skew Animation
                    //-----------------------------------------
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
                      //--------------------------------
                      // On drag disk detector
                      //--------------------------------
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return GestureDetector(
                            onPanUpdate: _onPanUpdate,
                            onPanDown: _onPanDown,
                            onPanEnd: _onPanEnd,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(sizeVinylDisk),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 60,
                                      offset: Offset(0, 20))
                                ],
                              ),
                              child: Transform.rotate(
                                  angle: (2 * pi) * _rotateDisk.value,
                                  child: child),
                            ),
                          );
                        },
                        //-------------------------
                        // Disk Rotate animation
                        //-------------------------
                        child: Transform.rotate(
                          angle: (pi) * vinylDragValue,
                          child: VinylDisk(
                            albumImagePath: widget.song.album.pathImage,
                            heightDisk: sizeVinylDisk,
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          Text(
            widget.song.album.author,
            style: GoogleFonts.poppins(
              fontSize: 20,
              shadows: [
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
                  style: durationTextStyle,
                ),
                Text(
                  _formatSongDuration(widget.song.duration),
                  style: durationTextStyle,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          //-----------------------------------------
          // Player controls
          //-----------------------------------------
          PlayerControls(
            isOnPlay: isOnPlay,
            onPausePlay: () {
              setState(() {
                isOnPlay = !isOnPlay;
              });
              _onPauseOrPlay(isOnPlay);
            },
          )
        ],
      ),
    );
  }

  String _formatSongDuration(Duration duration) {
    final seconds =
        (duration - Duration(minutes: duration.inMinutes)).inSeconds.toString();
    return '${duration.inMinutes}:${seconds.length == 1 ? '0' + seconds : seconds}';
  }
}
