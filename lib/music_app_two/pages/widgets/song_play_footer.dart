import 'package:flutter/material.dart';
import 'package:flutter_projects/music_app_two/models/song.dart';
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
          height: kToolbarHeight,
          width: kToolbarHeight,
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
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            Text(
              'Anonimo',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15,
                  height: 2),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          iconSize: 45,
          color: Colors.grey[700],
          icon: Icon(
            Icons.play_circle_outline,
          ),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 45,
          color: Colors.grey[700],
          icon: Icon(
            Icons.playlist_play,
          ),
        ),
      ],
    );
  }
}
