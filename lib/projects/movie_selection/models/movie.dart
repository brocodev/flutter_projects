import 'package:flutter_projects/projects/movie_selection/models/actors.dart';

class Movie {
  Movie({
    this.uniqueId,
    this.billboardHour,
    this.reviews,
    this.title,
    this.tags,
    this.writer = 'Clark Ken',
    this.director = 'Bruno Diaz',
    this.year = '2019',
    this.duration,
    this.rate,
    this.likes,
    this.imageUrl,
    this.dislikes,
    this.description,
    this.actors,
  });

  final String? title;
  String? uniqueId;
  final List<String>? tags;
  final String? imageUrl;
  final Duration? duration;
  final double? rate;
  final int? likes;
  final int? dislikes;
  final int? reviews;
  final String? description;
  final List<Actor>? actors;
  final String year;
  final String director;
  final String writer;
  String? billboardHour;

  static final List<Movie> listMovie = [
    Movie(
      title: 'Mortal Kombat : Scorpions Revenge',
      duration: const Duration(hours: 1, minutes: 35),
      tags: ['Action', 'Animation', 'Bloody'],
      rate: 7.5,
      likes: 120,
      dislikes: 14,
      actors: Actor.listActors,
      description: 'Hanzo Hasashi pierde su clan, su familia y su vida durante'
          ' un ataque por un clan ninja rival. Pero recibe la oportunidad de '
          'competir en un torneo interdimensional para salvar a sus seres '
          'queridos mientras otros luchadores intentan salvar el reino de '
          'la Tierra de la aniquilación.',
      reviews: 12,
      imageUrl: 'assets/img/movie/mortal_kombat.jpg',
    ),
    Movie(
      title: 'Superman Red Son',
      duration: const Duration(hours: 1, minutes: 40),
      tags: ['Action', 'Animation', 'Heroes'],
      rate: 8,
      likes: 135,
      dislikes: 17,
      actors: Actor.listActors,
      description: '¿Qué hubiera sucedido si el cohete del pequeño Kal-El '
          'hubiera caído en la Unión Soviética en vez de Kansas? Esa es '
          'la premisa de este cuento de Elseworld de DC Comics.',
      reviews: 66,
      imageUrl: 'assets/img/movie/red_son.jpg',
    ),
    Movie(
      title: 'Justice League - Apokolips War',
      duration: const Duration(hours: 2, minutes: 7),
      tags: ['Action', 'Animation', 'Heroes'],
      rate: 8.3,
      likes: 253,
      dislikes: 35,
      actors: Actor.listActors,
      description:
          'Después de la aniquilación de la Tierra en manos de Darkseid, los '
          'super héroes restantes se ven forzados a reagruparse y llevar '
          'la guerra hasta el mismo Darkseid si tienen alguna oportunidad de '
          'salvar al planeta y a los sobrevivientes de una vez por todas.',
      reviews: 44,
      imageUrl: 'assets/img/movie/apokolips_war.jpg',
    ),
    Movie(
      title: 'Extraction',
      duration: const Duration(hours: 2, minutes: 7),
      tags: ['Action', 'War', '2019'],
      rate: 7.3,
      likes: 253,
      dislikes: 35,
      actors: Actor.listActors,
      description:
          'Tyler Rake, un osado mercenario sin nada que perder, se embarca '
          'en una peligrosa misión de extracción cuando es contratado '
          'para rescatar al hijo secuestrado de un líder del crimen en Asia',
      reviews: 44,
      imageUrl: 'assets/img/movie/mision_rescate.jpg',
    ),
  ];

  static final listMovie2 = [
    Movie(
      title: 'The Kissing Both',
      duration: const Duration(hours: 1, minutes: 56),
      tags: ['Drama', 'Romance', 'Comedy'],
      rate: 6.9,
      likes: 200,
      dislikes: 24,
      actors: Actor.listActors,
      description:
          'Elle Evans tuvo un increíble verano con su enamorado Noah Flynn.'
          ' Pero ahora Noah partió para Harvard, y Elle tendrá que hacer'
          ' malabares con una relación a distancia, inscripciones en la'
          ' facultad y una nueva amistad con un atractivo compañero de'
          ' clase que podría cambiar todo.',
      reviews: 54,
      imageUrl: 'assets/img/movie/kissing_both.jpg',
    ),
    Movie(
      title: 'Rambo: Last Blood',
      duration: const Duration(hours: 2, minutes: 6),
      tags: ['Action', 'Adventure', 'Suspense'],
      rate: 7.9,
      likes: 235,
      dislikes: 9,
      actors: Actor.listActors,
      description: 'Rambo debe enfrentar su pasado y desempolvar sus '
          'implacables habilidades de combate para vengarse en una misión'
          'final. Un viaje mortal de venganza.',
      reviews: 30,
      imageUrl: 'assets/img/movie/rambo.jpg',
    ),
    Movie(
      title: 'Bad Boys II',
      duration: const Duration(hours: 1, minutes: 56),
      tags: ['Action', 'Comedy', 'Crimen'],
      rate: 7.5,
      likes: 299,
      dislikes: 13,
      actors: Actor.listActors,
      description: 'Marcus y Mike deben confrontar cambios de carrera y crisis'
          ' de edad media, cuando se unen a un equipo de élite recién creado '
          'del departamento de policía de Miami para capturar al implacable '
          'Armando Armas, líder de un cartel de drogas.',
      reviews: 40,
      imageUrl: 'assets/img/movie/bad_boys2.jpg',
    ),
    Movie(
      title: 'Star Wars: The Rise Of Skywalker',
      duration: const Duration(hours: 1, minutes: 56),
      tags: ['Science Fiction', 'Action', '2019'],
      rate: 6.2,
      likes: 200,
      dislikes: 24,
      actors: Actor.listActors,
      description: 'Los miembros sobrevivientes de la resistencia se enfrentan'
          ' a la Primera Orden una vez más, y el legendario conflicto entre '
          'los Jedi y los Sith alcanza su punto máximo llevando la saga '
          'Skywalker a su fin.',
      reviews: 54,
      imageUrl: 'assets/img/movie/star_wars.jpg',
    ),
  ];

  static final listMovie3 = [
    Movie(
      title: 'Jojo Rabbit',
      duration: const Duration(hours: 1, minutes: 56),
      tags: ['Drama', 'War', 'Comedy'],
      rate: 6.9,
      likes: 200,
      dislikes: 24,
      actors: Actor.listActors,
      description: 'Un solitario niño alemán, Jojo, ve su mundo puesto'
          ' de cabeza cuando descubre que su madre está'
          ' escondiendo a una niña judía en su ático durante '
          'la Segunda Guerra Mundial. Con la ayuda de su amigo '
          'imaginario, Adolf Hitler, Jojo debe confrontar su'
          ' nacionalismo ciego.',
      reviews: 54,
      imageUrl: 'assets/img/movie/jojo_rabbit.jpg',
    ),
    Movie(
      title: 'Sonic The Hedgehod',
      duration: const Duration(hours: 2, minutes: 6),
      tags: ['Action', 'Adventure', 'Comedy'],
      rate: 7.9,
      likes: 235,
      dislikes: 9,
      actors: Actor.listActors,
      description:
          'Después de descubrir a un increíblemente veloz erizo azul, un '
          'oficial de policía de un pequeño pueblo debe ayudarlo a'
          'derrotar a un genio malvado que quiere capturarlo para '
          'experimentar con él. Basada en el videojuego.',
      reviews: 30,
      imageUrl: 'assets/img/movie/sonic.jpg',
    ),
    Movie(
      title: 'Onward',
      duration: const Duration(hours: 1, minutes: 56),
      tags: ['Animation', 'Adventure', 'Comedy'],
      rate: 7.5,
      likes: 299,
      dislikes: 13,
      actors: Actor.listActors,
      description:
          'Dos adolescentes elfos, Ian y Barley, se embarcan en un viaje '
          'para descubrir si todavía existe algo de magia para poder'
          ' pasar un último día con su padre, quien falleció cuando '
          'eran muy pequeños para recordarlo.',
      reviews: 40,
      imageUrl: 'assets/img/movie/onward.jpg',
    ),
    Movie(
      title: 'Birds of Prey: And the Fantabulous Emancipation of One Harley '
          'Quinn',
      duration: const Duration(hours: 1, minutes: 56),
      tags: ['Adventure', 'Action', 'Crime'],
      rate: 6.2,
      likes: 200,
      dislikes: 24,
      actors: Actor.listActors,
      description:
          'Cuando el nefasto villano de Gotham, Roman Sionis, y su mano '
          'derecha, Zsasz, piden una recompensa por una joven llamada'
          ' Cass, toda la ciudad comienza a buscarla. Es cuando los '
          'caminos de Harley, Huntress, Black Canary y Renee Montoya '
          'se cruzan.',
      reviews: 54,
      imageUrl: 'assets/img/movie/bird_prey.jpg',
    ),
  ];
}
