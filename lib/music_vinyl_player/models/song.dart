import 'album.dart';

class Song {
  final String title;
  final Duration duration;
  final Album album;

  Song(this.title, this.duration, this.album);

  static final currentSong =
      Song('Anónimo', Duration(seconds: 213), Album.listAlbum[1]);
}
