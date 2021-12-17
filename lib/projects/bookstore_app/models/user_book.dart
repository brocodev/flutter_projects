class UserBook {
  const UserBook({this.name, this.photoUrl, this.favoriteCategories});

  final String? name;
  final String? photoUrl;
  final List<String>? favoriteCategories;

  static const currentUser = UserBook(
      name: 'Kevin',
      photoUrl:
          'https://i.ibb.co/992SLrQ/120603136-2461308150844778-7380402767182275816-n.jpg',
      favoriteCategories: [
        'Food',
        'Technology',
        'Programming',
        'Thriller',
        'Physic',
        'Sci-Fi',
      ],);

  static const users1 = [
    UserBook(
      name: 'Mary',
      photoUrl:
          'https://images.unsplash.com/photo-1612738834376-b6a945a83615?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Gina',
      photoUrl:
          'https://images.unsplash.com/photo-1612053759697-fd1ba823672d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Joan',
      photoUrl:
          'https://images.unsplash.com/photo-1612731333495-771374b978fa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Francis',
      photoUrl:
          'https://images.unsplash.com/photo-1612637974989-9a9747b1ba43?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80',
    ),
    UserBook(
      name: 'Armand',
      photoUrl:
          'https://images.unsplash.com/photo-1612533398391-8ee1793c809a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Milan',
      photoUrl:
          'https://images.unsplash.com/photo-1612596053923-2f790e246d07?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=376&q=80',
    ),
    UserBook(
      name: 'Rose',
      photoUrl:
          'https://images.unsplash.com/photo-1612782972309-728cbb6da8f0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Richard',
      photoUrl:
          'https://images.unsplash.com/photo-1612301973929-ce3cc5ec04b4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
  ];

  static const users2 = [
    UserBook(
      name: 'Lilian',
      photoUrl:
          'https://images.unsplash.com/photo-1612587704555-22472e377776?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Kim',
      photoUrl:
          'https://images.unsplash.com/photo-1612348517534-4408534a0a8c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    ),
    UserBook(
      name: 'Karen',
      photoUrl:
          'https://images.unsplash.com/photo-1604684330644-25c4d8142c01?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=325&q=80',
    ),
    UserBook(
      name: 'Julee',
      photoUrl:
          'https://images.unsplash.com/photo-1602423597260-6e754437411a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Martha',
      photoUrl:
          'https://images.unsplash.com/photo-1612209992975-954021ffc595?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=344&q=80',
    ),
    UserBook(
      name: 'Robert',
      photoUrl:
          'https://images.unsplash.com/photo-1612317464368-264da183a443?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Aline',
      photoUrl:
          'https://images.unsplash.com/photo-1612448577725-8ef52d7ae3e6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    UserBook(
      name: 'Marco',
      photoUrl:
          'https://images.unsplash.com/photo-1611019402620-39bc77832723?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=352&q=80',
    ),
  ];
}

class Review {
  const Review({
    this.review,
    this.authorReview,
    this.date,
    this.likes,
    this.replies,
  });

  final String? review;
  final DateTime? date;
  final int? likes;
  final int? replies;
  final UserBook? authorReview;
}
