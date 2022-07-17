import 'package:flutter_projects/projects/instagram_redesign/models/ig_user.dart';

enum IgTypeActivity {
  likes,
  comments,
  mention,
  follows,
  messages,
}

class IgActivity {
  IgActivity({
    this.date,
    this.isViewed,
    this.description,
    this.typeNotification,
    this.imageUrl,
    this.user,
  });

  final String? description;
  final String? imageUrl;
  final IgUser? user;
  final DateTime? date;
  bool? isViewed;
  final IgTypeActivity? typeNotification;

  static final listActivities = List.generate(
    64,
    (index) {
      final listImagesUrl = IgUser.kevin.listPhotosUrl;
      return IgActivity(
        user: _users[index % _users.length],
        typeNotification:
            IgTypeActivity.values[index % IgTypeActivity.values.length],
        imageUrl: listImagesUrl![index % listImagesUrl.length],
        date: _dates[index % _dates.length],
        description:
            'Lorem Ipsum ha sido el texto de relleno estándar de las industrias'
            ' desde el año 1500, cuando un impresor '
            '(N. del T. persona que se dedica a la imprenta) desconocido usó '
            'una galería de textos y los mezcló de tal '
            'manera que logró hacer un libro de textos especimen.',
        isViewed: false,
      );
    },
  );

  static final _dates = [
    DateTime.now().subtract(const Duration(minutes: 1)),
    DateTime.now().subtract(const Duration(minutes: 20)),
    DateTime.now().subtract(const Duration(hours: 1)),
    DateTime.now().subtract(const Duration(hours: 3)),
    DateTime.now().subtract(const Duration(hours: 9)),
    DateTime.now().subtract(const Duration(hours: 12)),
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(hours: 32)),
  ];

  static const _users = [
    IgUser(
      username: 'marino_kto',
      photoUrl:
          'https://images.unsplash.com/photo-1543205089-425bfeaf4d43?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    ),
    IgUser(
      username: 'nina_viajera',
      photoUrl:
          'https://images.unsplash.com/photo-1578847737496-8a7e79ff20a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    ),
    IgUser(
      username: 'luck_spokcle',
      photoUrl:
          'https://images.unsplash.com/photo-1522925875192-02df6922c92f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    ),
    IgUser(
      username: 'coffee_men',
      photoUrl:
          'https://images.unsplash.com/photo-1545418776-a37fba72a75d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    ),
    IgUser(
      username: 'ginadventure',
      photoUrl:
          'https://images.unsplash.com/photo-1551655510-555dc3be8633?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    ),
    IgUser(
      username: 'lalocosmonauta',
      photoUrl:
          'https://images.unsplash.com/photo-1595282048003-72cfd24fa14e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    ),
  ];
}
