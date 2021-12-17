import 'package:flutter_projects/projects/music_vinyl_player/models/album.dart';

class Song {
  const Song(this.title, this.duration, this.album);

  final String title;
  final Duration duration;
  final Album album;


  static final currentSong =
      Song('Anónimo', const Duration(seconds: 213), Album.listAlbum[1]);
}
