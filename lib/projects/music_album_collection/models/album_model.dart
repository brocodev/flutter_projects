class AlbumModel {
  AlbumModel({
    required this.title,
    required this.author,
    required this.pathImage,
    required this.songs,
  });

  final String title;
  final String author;
  final String pathImage;
  final List<String> songs;

  static final listAlbum = [
    AlbumModel(
        title: 'Apocalipsis Zombie',
        author: 'Cuarteto de nos',
        pathImage: 'assets/img/music/zombie.jpg',
        songs: ['Gaucho Power', 'Invisible', 'El rey y el as'],),
    AlbumModel(
        title: 'Jueves',
        author: 'Cuarteto de nos',
        pathImage: 'assets/img/music/jueves.jpg',
        songs: ['Anonimo', 'Mario Neta', 'Hombre con alas'],),
    AlbumModel(
        title: 'Habla tu espejo',
        author: 'Cuarteto de nos',
        pathImage: 'assets/img/music/espejo.jpg',
        songs: ['No llora', 'Roberto', 'El aprendiz'],),
    AlbumModel(
        title: 'Porfiado',
        author: 'Cuarteto de nos',
        pathImage: 'assets/img/music/porfiado.jpg',
        songs: ['Lo malo de ser bueno', 'Buen dia benito', 'Miguel Gritar'],),
    AlbumModel(
        title: 'Bipolar',
        author: 'Cuarteto de nos',
        pathImage: 'assets/img/music/bipolar.jpg',
        songs: ['El hijo de hernandez', 'Doble identidad', 'Mi lista negra'],),
    AlbumModel(
        title: 'Raro',
        author: 'Cuarteto de nos',
        pathImage: 'assets/img/music/raro.jpg',
        songs: [
          'Hoy estoy raro',
          'Me hace bien, me hace mal',
          'Ya no se que hacer conmigo'
        ],),
    AlbumModel(
        title: 'Cortamambo',
        author: 'Cuarteto de nos',
        pathImage: 'assets/img/music/cortamanbo.jpg',
        songs: [
          'La guerra de Gardel',
          'Intentaron separarnos',
          'Me amo',
        ],),
  ];
}
