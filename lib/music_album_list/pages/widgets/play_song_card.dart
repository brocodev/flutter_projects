import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/music_album_list/models/album_model.dart';

class PlaySongCard extends StatelessWidget {
  const PlaySongCard({
    Key key,
    @required this.album,
    this.itemAnimation,
    this.indexSong,
  }) : super(key: key);

  final Animation<double> itemAnimation;
  final AlbumModel album;
  final int indexSong;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final opacityItems = 1.0 * itemAnimation.value;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 10,
            )
          ]),
      child: Column(
        children: <Widget>[
          if (itemAnimation.value > 0.0) ...[
            Opacity(
              opacity: opacityItems,
              child: Container(
                height: size.height / 2.5,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          offset: Offset(0, 15),
                          color: Colors.black26),
                    ],
                    image: DecorationImage(
                      image: AssetImage(album.pathImage),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            const SizedBox(height: 50),
            Opacity(
              opacity: opacityItems,
              child: Text(
                "${album.author} - ${album.title}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Opacity(
              opacity: opacityItems,
              child: Text(
                "${album.songs[indexSong]}",
                style: TextStyle(
                    height: 1.5,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Opacity(
                opacity: opacityItems,
                child: CustomPaint(
                  painter: SongLinePainter(),
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ],
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.repeat,
                  color: Colors.grey,
                ),
                Transform.scale(
                  scale: 1.3 * itemAnimation.value.clamp(.8, 1.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'rewind',
                    backgroundColor: Colors.white,
                    elevation: 2,
                    mini: true,
                    foregroundColor: Colors.pinkAccent,
                    child: Icon(Icons.fast_rewind),
                  ),
                ),
                Transform.scale(
                  scale: 1.3 * itemAnimation.value.clamp(.6, 1.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'pause-play',
                    backgroundColor: Colors.white,
                    elevation: 2,
                    foregroundColor: Colors.pinkAccent,
                    child: Icon(Icons.play_arrow),
                  ),
                ),
                Transform.scale(
                  scale: 1.3 * itemAnimation.value.clamp(.8, 1.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'forward',
                    backgroundColor: Colors.white,
                    elevation: 2,
                    mini: true,
                    foregroundColor: Colors.pinkAccent,
                    child: Icon(Icons.fast_forward),
                  ),
                ),
                Icon(
                  Icons.volume_up,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SongLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    var startPoint = Offset(0, size.height * .6);

    var paint2 = Paint();
    paint2.color = Colors.grey[300];
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 2;

    var path2 = Path();
    path2.moveTo(startPoint.dx, startPoint.dy);
    path2.cubicTo(width * .05, height * .3, width * .1, height * 1.2,
        width * .15, height * .5);

    path2.cubicTo(width * .2, height * .1, width * .25, height * 1.2,
        width * .3, height * .5);
    path2.cubicTo(
        width * .35, 0, width * .45, height * 1.5, width * .5, height * .6);

    path2.cubicTo(width * .55, height * .0, width * .65, height * 1.3,
        width * .7, height * .6);

    path2.cubicTo(width * .75, height * .2, width * .8, height * 1, width * .85,
        height * .6);
    path2.cubicTo(
        width * .9, height * .3, width * .95, height * 1, width, height * .5);

    canvas.drawPath(path2, paint2);
    // =================== PINK LINE =============================
    // ===========================================================
    var paint = Paint();
    paint.color = Colors.redAccent[200];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(width * .05, height * .3, width * .1, height * 1.2,
        width * .15, height * .5);

    path.cubicTo(width * .2, height * .1, width * .25, height * 1.2, width * .3,
        height * .5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
