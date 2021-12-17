class TravelPlace {
  TravelPlace({
    required this.name,
    required this.user,
    required this.imagesUrl,
    this.id = '',
    this.description = '',
    this.locationDesc = '',
    this.statusTag = StatusTag.popular,
    this.shared = 0,
    this.likes = 0,
  });

  final String id;
  final String name;
  final TravelUser user;
  final StatusTag statusTag;
  final int shared;
  final int likes;
  final String locationDesc;
  final String description;
  final List<String> imagesUrl;

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
      imagesUrl: [
        'https://images.unsplash.com/photo-1564852694965-94accf8e0713?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1552074284-5e88ef1aef18?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1560242374-f222add02c68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60'
      ],
      user: TravelUser.alex,
      locationDesc: 'QUINTANA ROO Mexico, Coast of the Caribbean Sea',
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
      imagesUrl: [
        'https://images.unsplash.com/photo-1504730655501-24c39ac53f0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1522094522800-6e0189c77a16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1533193773788-92826ee86674?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60'
      ],
      statusTag: StatusTag.event,
      user: TravelUser.mario,
      locationDesc: 'QUINTANA ROO Mexico, in southeastern Mexico',
    ),
    TravelPlace(
      id: '2',
      likes: 29,
      shared: 40,
      name: 'Ometepec',
      description:
          '''Ometepec (en náhuatl: ome, tepetl, 'dos, cerros''lugar entre dos cerros') es un poblado y cabecera del municipio homónimo en el estado mexicano de Guerrero.''',
      imagesUrl: [
        'https://2.bp.blogspot.com/_GHlHbm51_qM/TAFUb-P_O0I/AAAAAAAAAdA/TMMHF6eox74/s1600/Iglesia+Santiago+Ap%C3%B3stol,+Ometepec,+Gro.+(Foto+Jaime+L%C3%B3pez+J)+.JPG',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/SanNicolasOmetepec02.JPG/1024px-SanNicolasOmetepec02.JPG',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Aguas_termal.jpg/800px-Aguas_termal.jpg'
      ],
      statusTag: StatusTag.event,
      user: TravelUser.luna,
      locationDesc: 'GUERRERO MEXICO Ometepec City',
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
      imagesUrl: [
        'https://images.unsplash.com/photo-1571674327010-0c4cae5f349a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1572290612272-8043354568bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1584415326659-a6a153c07e32?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80'
      ],
      statusTag: StatusTag.event,
      user: TravelUser.lili,
      locationDesc: 'GUERRERO MEXICO ON THE SOUTHERN COAST OF THE COUNTRY',
    ),
  ];
  static final collectionPlaces = [
    TravelPlace(
      name: 'San Miguel de Allende',
      imagesUrl: [
        'https://images.unsplash.com/photo-1518105779142-d975f22f1b0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=60'
      ],
      user: TravelUser.mario,
    ),
    TravelPlace(
      name: 'Chichen Itza',
      imagesUrl: [
        'https://images.unsplash.com/photo-1518638150340-f706e86654de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=867&q=60'
      ],
      user: TravelUser.mario,
    ),
    TravelPlace(
      name: 'Ciudad de Mexico',
      imagesUrl: [
        'https://images.unsplash.com/photo-1574493264149-87880133a2ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=60'
      ],
      user: TravelUser.mario,
    ),
    TravelPlace(
      name: 'Teotihuacan',
      imagesUrl: [
        'https://images.unsplash.com/photo-1575351881847-b3bf188d9d0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=60'
      ],
      user: TravelUser.mario,
    ),
    TravelPlace(
      name: 'Taxco',
      imagesUrl: [
        'https://images.unsplash.com/photo-1595781514079-2abd0a36f892?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=60'
      ],
      user: TravelUser.mario,
    ),
    TravelPlace(
      name: 'Acapulco',
      imagesUrl: [
        'https://images.unsplash.com/photo-1624979575293-10e2113ed91d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=60'
      ],
      user: TravelUser.luna,
    ),
  ];
}

class TravelUser {
  TravelUser(this.name, this.urlPhoto);

  final String name;
  final String urlPhoto;

  static TravelUser lili = TravelUser('Lily Juarez',
      'https://images.unsplash.com/photo-1457732815361-daa98277e9c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=60',);
  static TravelUser alex = TravelUser('Alex Fernandez',
      'https://images.unsplash.com/photo-1589304038421-449708a42983?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',);
  static TravelUser mario =
      TravelUser('Mario Calzada', 'https://i.ibb.co/c1j1VDT/yo.jpg');
  static TravelUser luna = TravelUser('Luna Benioly',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=334&q=80',);
  static TravelUser javier = TravelUser('Javier',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=334&q=80',);

  static List<TravelUser> users = [alex, mario, luna, lili, javier];
}

enum StatusTag { popular, event }
