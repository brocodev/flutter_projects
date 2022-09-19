class Album {
  const Album({
    this.genres = const [
      'Power Pop',
      'Rap rock',
      'Rock latino',
    ],
    this.rate,
    this.title,
    this.author,
    this.pathImage,
    this.year,
    this.songsCount = 10,
    this.duration = const Duration(minutes: 74),
    this.description =
        "Lorem Ipsum is simply dummy text of the printing and typesetting "
            "industry. Lorem Ipsum has been the industry's standard dumm"
            "y text ever since the 1500s, when an unknown printer took a"
            " galley of type and scrambled it to make a type specimen boo"
            "k. It has survived not only five centuries, but also the lea"
            "p into electronic typesetting, remaining essentially unchang"
            "ed. It was popularised in the 1960s with the release of Let"
            "raset sheets containing Lorem Ipsum passages, and more recen"
            "tly with desktop publishing software like Aldus PageMaker inc"
            "luding versions of Lorem Ipsum.",
  });

  final String? title;
  final String? author;
  final String? pathImage;
  final String description;
  final int? year;
  final int songsCount;
  final Duration duration;
  final double? rate;
  final List<String> genres;

  static const listAlbum = [
    Album(
      title: 'Apocalipsis Zombie',
      author: 'Cuarteto de nos',
      rate: 4.1,
      pathImage: 'assets/img/music/zombie.jpg',
      year: 2018,
    ),
    Album(
      title: 'Jueves',
      author: 'Cuarteto de nos',
      rate: 4.8,
      pathImage: 'assets/img/music/jueves.jpg',
      year: 2020,
    ),
    Album(
      title: 'Habla tu espejo',
      author: 'Cuarteto de nos',
      rate: 4.6,
      pathImage: 'assets/img/music/espejo.jpg',
      year: 2016,
    ),
    Album(
      title: 'Porfiado',
      author: 'Cuarteto de nos',
      rate: 4.4,
      pathImage: 'assets/img/music/porfiado.jpg',
      year: 2011,
    ),
    Album(
      title: 'Bipolar',
      rate: 3.9,
      author: 'Cuarteto de nos',
      pathImage: 'assets/img/music/bipolar.jpg',
      year: 2009,
    ),
    Album(
      title: 'Raro',
      author: 'Cuarteto de nos',
      rate: 4.3,
      pathImage: 'assets/img/music/raro.jpg',
      year: 2006,
    ),
    Album(
      title: 'Cortamambo',
      author: 'Cuarteto de nos',
      rate: 4,
      pathImage: 'assets/img/music/cortamanbo.jpg',
      year: 2000,
    ),
  ];
}
