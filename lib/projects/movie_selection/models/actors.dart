class Actor {

  const Actor({
    this.name,
    this.pathImage,
  });

  final String? name;
  final String? pathImage;

  static const listActors = [
    Actor(name: 'Josh Mike', pathImage: 'assets/img/movie/actor1.jpg'),
    Actor(name: 'Antony Mendez', pathImage: 'assets/img/movie/actor2.jpg'),
    Actor(name: 'Katy Pearce', pathImage: 'assets/img/movie/actor3.jpg'),
    Actor(name: 'Gerald Fey', pathImage: 'assets/img/movie/actor4.jpg'),
    Actor(name: 'Gina Velasquez', pathImage: 'assets/img/movie/actor5.jpg'),
  ];
}
