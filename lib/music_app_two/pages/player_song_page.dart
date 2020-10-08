import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_projects/animations/tween_animations.dart';
import 'package:flutter_projects/music_app_two/models/song.dart';
import 'package:flutter_projects/music_app_two/pages/widgets/vinyl_disk.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerSongPage extends StatefulWidget {
  final Song song;

  const PlayerSongPage({Key key, @required this.song}) : super(key: key);

  @override
  _PlayerSongPageState createState() => _PlayerSongPageState();
}

class _PlayerSongPageState extends State<PlayerSongPage>
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

  _onPauseOrPlay(bool isPlayed) {
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

  _onPanUpdate(details) {
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

  _onPanDown(details) {
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

  _onPanEnd(details) {
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
    final sizeVinylDisk = MediaQuery.of(context).size.width * .8;
    final durationTextStyle = const TextStyle(
        fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 18);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          _CustomAppBar(),
          Center(
            child: ScaleAnimation(
              duration: const Duration(milliseconds: 800),
              initScale: 1.4,
              finalScale: 1.0,
              child: OpacityAnimation(
                duration: const Duration(milliseconds: 800),
                child: TranslateAnimation(
                    duration: const Duration(milliseconds: 800),
                    offsetDirection: Axis.vertical,
                    offset: -300,
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
                fontSize: 24,
                shadows: [Shadow(color: Colors.black26, blurRadius: 20)]),
          ),
          const SizedBox(height: 10),
          _PlayerIndicator(
            songTitle: widget.song.title,
            percentIndicator: playedSeconds / widget.song.duration.inSeconds,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          _PlayerControls(
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

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 2,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
          )),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            BackButton(),
            const Spacer(),
            Text(
              "NOW PLAYING",
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: 3.0),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({
    Key key,
    @required this.onPausePlay,
    @required this.isOnPlay,
  }) : super(key: key);

  final VoidCallback onPausePlay;
  final bool isOnPlay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 40,
                offset: Offset(0, 30),
              )
            ],
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                iconSize: 40,
                color: Color(0xffd4af70),
                icon: Icon(Icons.skip_previous),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 40,
                color: Color(0xffd4af70),
                icon: Icon(Icons.skip_next),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onPausePlay,
          borderRadius: BorderRadius.circular(45),
          child: CircleAvatar(
            backgroundColor: Color(0xffd4af70),
            radius: 45,
            foregroundColor: Colors.white,
            child: Icon(
              isOnPlay ? Icons.play_arrow : Icons.pause,
              size: 70,
            ),
          ),
        )
      ],
    );
  }
}

class _PlayerIndicator extends StatelessWidget {
  final String songTitle;
  final double percentIndicator;

  const _PlayerIndicator({
    Key key,
    @required this.songTitle,
    @required this.percentIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          songTitle,
          style: GoogleFonts.spectral(
            fontSize: 75,
            fontWeight: FontWeight.w800,
            shadows: [
              Shadow(
                color: Colors.black26,
                blurRadius: 40,
                offset: Offset(0, 20),
              )
            ],
          ),
        ),
        CustomPaint(
          painter: LineIndicator(percentIndicator - .005),
          child: ClipPath(
            clipper: TextClipper(percentIndicator),
            child: Text(
              songTitle,
              overflow: TextOverflow.clip,
              softWrap: false,
              style: GoogleFonts.spectral(
                fontSize: 75,
                color: Colors.white70,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LineIndicator extends CustomPainter {
  final double percent;

  LineIndicator(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(size.width * percent, 0),
      Offset(size.width * percent, size.height),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black
        ..strokeWidth = 3.0,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TextClipper extends CustomClipper<Path> {
  final double percent;

  TextClipper(this.percent);

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width * percent, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * percent, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
