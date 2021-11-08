class TravelPlace {
  TravelPlace({
    required this.id,
    required this.name,
    required this.user,
    required this.statusTag,
    required this.shared,
    required this.likes,
    required this.imageUrl,
    required this.locationDesc,
    required this.description,
  });

  final String id;
  final String name;
  final TravelUser user;
  final StatusTag statusTag;
  final int shared;
  final int likes;
  final String locationDesc;
  final String description;
  final List<String> imageUrl;

  static final places = [
    TravelPlace(
      id: '3',
      name: 'Riviera Maya',
      likes: 500,
      shared: 240,
      description:
          'Riviera Maya tiene más de 120 km de costa turquesa cristalina,'
          ' playas de arena blanca, sitios arqueológicos, parques '
          'naturales y actividades acuáticas únicas',
      imageUrl: [
        'https://images.unsplash.com/photo-1564852694965-94accf8e0713?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1552074284-5e88ef1aef18?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1560242374-f222add02c68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60'
      ],
      statusTag: StatusTag.popular,
      user: TravelUser.alex,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California',
    ),
    TravelPlace(
      id: '1',
      name: 'Tulum',
      likes: 140,
      shared: 49,
      description:
          'Tulum fue una ciudad amurallada de la cultura maya ubicada en el '
          'Estado de Quintana Roo, en el sureste de México, en la costa'
          ' del mar Caribe.',
      imageUrl: [
        'https://images.unsplash.com/photo-1504730655501-24c39ac53f0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1522094522800-6e0189c77a16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1533193773788-92826ee86674?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60'
      ],
      statusTag: StatusTag.event,
      user: TravelUser.mario,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California',
    ),
    TravelPlace(
      id: '2',
      likes: 29,
      shared: 40,
      name: 'Ometepec',
      description:
          '''Ometepec (en náhuatl: ome, tepetl, 'dos, cerros''lugar entre dos cerros') es un poblado y cabecera del municipio homónimo en el estado mexicano de Guerrero.''',
      imageUrl: [
        'https://2.bp.blogspot.com/_GHlHbm51_qM/TAFUb-P_O0I/AAAAAAAAAdA/TMMHF6eox74/s1600/Iglesia+Santiago+Ap%C3%B3stol,+Ometepec,+Gro.+(Foto+Jaime+L%C3%B3pez+J)+.JPG',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/SanNicolasOmetepec02.JPG/1024px-SanNicolasOmetepec02.JPG',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Aguas_termal.jpg/800px-Aguas_termal.jpg'
      ],
      statusTag: StatusTag.event,
      user: TravelUser.luna,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California',
    ),
    TravelPlace(
      id: '4',
      name: 'Acapulco',
      shared: 500,
      likes: 39,
      description:
          'Acapulco se encuentra a la altura de los mejores resorts del'
          ' mundo. Representa las vacaciones ideales para cualquier '
          'exigencia',
      imageUrl: [
        'https://images.unsplash.com/photo-1571674327010-0c4cae5f349a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1572290612272-8043354568bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1584415326659-a6a153c07e32?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80'
      ],
      statusTag: StatusTag.event,
      user: TravelUser.mario,
      locationDesc: 'GOLDEN GATE Cat Bridge, San Francisco California',
    ),
  ];
}

class TravelUser {
  TravelUser(this.name, this.urlPhoto);

  final String name;
  final String urlPhoto;

  static TravelUser alex = TravelUser('Alex Fernandez', 'https://images.unsplash.com/photo-1589304038421-449708a42983?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80');
  static TravelUser mario = TravelUser('Mario Calzada', 'https://i.ibb.co/c1j1VDT/yo.jpg');
  static TravelUser luna = TravelUser('Luna Benioly', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=334&q=80');

  static List<TravelUser> users = [alex, mario, luna];
}

enum StatusTag { popular, event }
