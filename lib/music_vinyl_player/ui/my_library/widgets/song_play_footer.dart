import 'package:flutter/material.dart';
import 'package:flutter_projects/music_vinyl_player/models/song.dart';
import 'package:google_fonts/google_fonts.dart';

class SongPlayFooter extends StatelessWidget {
  const SongPlayFooter({
    Key key,
    @required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(song.album.pathImage),
              ),
              CircularProgressIndicator(
                value: .7,
                strokeWidth: 5,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffd4af90)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              song.album.author,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            Text(
              'Anonimo',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          iconSize: 38,
          color: Colors.grey[700],
          icon: Icon(
            Icons.play_circle_outline,
          ),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 38,
          color: Colors.grey[700],
          icon: Icon(
            Icons.playlist_play,
          ),
        ),
      ],
    );
  }
}
