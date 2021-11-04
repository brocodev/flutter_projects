import 'package:flutter_projects/projects/find_out/models/comments.dart';

class Place {
  Place({
    this.id,
    this.typePlace,
    this.title,
    this.description,
    this.imageUrl,
    this.likes,
    this.comments,
  });

  final String? id;
  final String? title;
  final String? description;
  final List<String>? imageUrl;
  final int? likes;
  final String? typePlace;
  final List<Comment>? comments;

  static final dumpListData = [
    Place(
      id: '3',
      title: 'Riviera Maya',
      likes: 23,
      typePlace: 'Playa',
      comments: Comment.defaultListComment,
      description:
          'Riviera Maya tiene más de 120 km de costa turquesa cristalina,'
          ' playas de arena blanca, sitios arqueológicos, parques '
          'naturales y actividades acuáticas únicas',
      imageUrl: [
        'https://images.unsplash.com/photo-1564852694965-94accf8e0713?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1552074284-5e88ef1aef18?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1560242374-f222add02c68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60'
      ],
    ),
    Place(
      id: '1',
      title: 'Tulum',
      likes: 14,
      typePlace: 'Playa',
      comments: Comment.defaultListComment,
      description:
          'Tulum fue una ciudad amurallada de la cultura maya ubicada en el '
          'Estado de Quintana Roo, en el sureste de México, en la costa'
          ' del mar Caribe.',
      imageUrl: [
        'https://images.unsplash.com/photo-1504730655501-24c39ac53f0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1522094522800-6e0189c77a16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1533193773788-92826ee86674?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60'
      ],
    ),
    Place(
      id: '2',
      likes: 29,
      comments: Comment.defaultListComment,
      title: 'Ometepec',
      typePlace: 'Pueblo magico',
      description:
          '''Ometepec (en náhuatl: ome, tepetl, 'dos, cerros''lugar entre dos cerros') es un poblado y cabecera del municipio homónimo en el estado mexicano de Guerrero.''',
      imageUrl: [
        'https://2.bp.blogspot.com/_GHlHbm51_qM/TAFUb-P_O0I/AAAAAAAAAdA/TMMHF6eox74/s1600/Iglesia+Santiago+Ap%C3%B3stol,+Ometepec,+Gro.+(Foto+Jaime+L%C3%B3pez+J)+.JPG',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/SanNicolasOmetepec02.JPG/1024px-SanNicolasOmetepec02.JPG',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Aguas_termal.jpg/800px-Aguas_termal.jpg'
      ],
    ),
    Place(
      id: '4',
      title: 'Acapulco',
      typePlace: 'Playa',
      comments: Comment.defaultListComment,
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
    ),
  ];
}
