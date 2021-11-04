class VideoGame {
  const VideoGame({
    this.title,
    this.srcImage,
    this.nowPlaying,
    this.genre,
  });

  final String? title;
  final String? srcImage;
  final int? nowPlaying;
  final String? genre;


  static const mainGame = VideoGame(
    title: 'League of Legends',
    genre: 'MOBA',
    nowPlaying: 12310,
    srcImage: 'assets/img/gaming/lol.jpg',
  );

  static const videoGames =  [
    VideoGame(
      title: 'Animal Crossing',
      genre: 'Simulation',
      nowPlaying: 1230,
      srcImage: 'assets/img/gaming/animal_crossing.jpg',
    ),
    VideoGame(
      title: 'COD Warzone',
      genre: 'Shooter FPS',
      nowPlaying: 1939,
      srcImage: 'assets/img/gaming/codwarzone.jpg',
    ),
    VideoGame(
      title: 'Crash Bandicoot 4',
      genre: 'Adventure',
      nowPlaying: 1239,
      srcImage: 'assets/img/gaming/crash_bandicoot_4.jpg',
    ),
    VideoGame(
      title: 'Cyberpunk 2077',
      genre: 'ARPG',
      nowPlaying: 1199,
      srcImage: 'assets/img/gaming/cyberpunk2077.jpg',
    ),
    VideoGame(
      title: 'Doom Eternal',
      genre: 'Shooter FPS',
      nowPlaying: 1002,
      srcImage: 'assets/img/gaming/doom_eternal.jpg',
    ),
    VideoGame(
      title: 'Fall Guys',
      genre: 'Battle Royale',
      nowPlaying: 3919,
      srcImage: 'assets/img/gaming/fall_guys.jpg',
    ),
    VideoGame(
      title: 'Ori and the Will of the Wisps',
      genre: 'Platforms',
      nowPlaying: 1002,
      srcImage: 'assets/img/gaming/ori.jpg',
    ),
    VideoGame(
      title: 'Spiderman The Game',
      genre: 'Action',
      nowPlaying: 2100,
      srcImage: 'assets/img/gaming/spiderman.jpg',
    ),
    VideoGame(
      title: 'Valorant',
      genre: 'Shooter FPS',
      nowPlaying: 1000,
      srcImage: 'assets/img/gaming/valorant.jpg',
    ),
  ];

}
