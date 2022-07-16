import 'package:flutter_projects/projects/instagram_redesign/models/ig_collection.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_external_platform.dart';

class IgUser {
  const IgUser({
    this.name,
    this.typeUser,
    this.username,
    this.externalPlatforms = const [],
    this.followers,
    this.following,
    this.photoUrl,
    this.listPhotosUrl,
    this.collections,
  });

  final String? name;
  final String? typeUser;
  final int? followers;
  final int? following;
  final List<IgCollection>? collections;
  final String? photoUrl;
  final List<String>? listPhotosUrl;
  final String? username;
  final List<ExternalPlatform> externalPlatforms;

  static const liliana = IgUser(
    name: 'Liliana Mondragon',
    followers: 14320,
    collections: IgCollection.listCollection,
    following: 120,
    username: 'lilian_moon',
    photoUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=334&q=80',
    listPhotosUrl: [
      'https://images.unsplash.com/photo-1602066215160-33198d54a53d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=753&q=80',
      'https://images.unsplash.com/photo-1601575930087-f8800cf72a3f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1502082553048-f009c37129b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
      'https://images.unsplash.com/photo-1601818441790-432781baa2f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80',
      'https://images.unsplash.com/photo-1601735468813-b02de4268657?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80',
      'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1597284902002-b6100a7a60a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1588697362969-bd13ab72070d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80',
      'https://images.unsplash.com/photo-1581568703422-1a538f9af7c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
    ],
    typeUser: 'Photographer',
  );
  static const julissa = IgUser(
    name: 'Julissa Towers',
    followers: 13320,
    username: 'juli_towers99',
    collections: IgCollection.listCollection,
    following: 320,
    photoUrl:
        'https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjB8fHdvbWFufGVufDB8fDB8&auto=format&fit=crop&w=500&q=60',
    listPhotosUrl: [
      'https://images.unsplash.com/photo-1477327665424-41aeff75a2e3?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1453175324447-6864b23ecf23?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1463736932348-4915535cf6f9?ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80',
      'https://images.unsplash.com/photo-1530231810657-c657c81a437d?ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80',
      'https://images.unsplash.com/photo-1501554728187-ce583db33af7?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1477896715183-91fd0e24f425?ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80',
      'https://images.unsplash.com/photo-1519671282429-b44660ead0a7?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      'https://images.unsplash.com/photo-1595877786670-393ef0ac0961?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    ],
    typeUser: 'Model',
  );
  static const eduard = IgUser(
    name: 'Eduard Otero',
    followers: 9320,
    username: 'edoter_0',
    collections: IgCollection.listCollection,
    following: 20,
    photoUrl:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8bWVufGVufDB8fDB8&auto=format&fit=crop&w=500&q=60',
    listPhotosUrl: [
      'https://images.unsplash.com/photo-1454789548928-9efd52dc4031?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=527&q=80',
      'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
      'https://images.unsplash.com/photo-1457364887197-9150188c107b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
      'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80',
      'https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
      'https://images.unsplash.com/photo-1465101162946-4377e57745c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=757&q=80',
      'https://images.unsplash.com/photo-1536697246787-1f7ae568d89a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    ],
    typeUser: 'Designer',
  );
  static const karla = IgUser(
    name: 'Karla Smith',
    followers: 14020,
    collections: IgCollection.listCollection,
    following: 402,
    username: 'smith_karla',
    photoUrl:
        'https://images.unsplash.com/photo-1502898295-455afaf0f015?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    listPhotosUrl: [
      'https://images.unsplash.com/photo-1601974915460-f55ea921f8ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=680&q=80',
      'https://images.unsplash.com/photo-1596213476704-4437fff60106?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1601940352968-888350d50338?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=337&q=80',
      'https://images.unsplash.com/photo-1587678711204-ca6d3d2f1f3b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1601779144646-5e6a43c5d615?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1600009274776-5422e05f1c55?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1598602055533-04e934ea2f09?ixlib=rb-1.2.1&auto=format&fit=crop&w=362&q=80',
      'https://images.unsplash.com/photo-1601348435451-8caff6b824ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    ],
    typeUser: 'Photographer',
  );
  static const maria = IgUser(
    name: 'Maria Lopez',
    username: 'maria11lp',
    followers: 11200,
    collections: IgCollection.listCollection,
    following: 297,
    photoUrl:
        'https://images.unsplash.com/photo-1530047198515-516ff90fc4d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    listPhotosUrl: [
      'https://images.unsplash.com/photo-1589304038421-449708a42983?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1588915176926-50db6502fd75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1602122412015-227d33be1a4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/flagged/photo-1580079942799-b27f909bc765?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=601&q=80',
      'https://images.unsplash.com/photo-1581450308330-a054773a57ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1590607199580-c2edd498520a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1598137203988-80de6392fc1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    ],
    typeUser: 'Photographer',
  );
  static const kevin = IgUser(
    name: 'Kevin Melendez',
    followers: 14200,
    username: 'kevin_mdez_hdez',
    collections: IgCollection.listCollection,
    following: 47,
    photoUrl: 'https://i.ibb.co/c1j1VDT/yo.jpg',
    externalPlatforms: [
      ExternalPlatform.discord,
      ExternalPlatform.facebook,
      ExternalPlatform.uplabs,
      ExternalPlatform.twitter,
      ExternalPlatform.instagram,
      ExternalPlatform.youtube,
      ExternalPlatform.twitch,
      ExternalPlatform.discord,
      ExternalPlatform.snapchat,
      ExternalPlatform.unsplash,
    ],
    listPhotosUrl: [
      'https://images.unsplash.com/photo-1589793080380-6089f6eb360e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=282&q=80',
      'https://images.unsplash.com/photo-1589793907316-f94025b46850?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=332&q=80',
      'https://images.unsplash.com/photo-1601921721860-f355dcbc16f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1594408052115-7e8b8a6261f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
      'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=332&q=80',
      'https://images.unsplash.com/photo-1602028279379-d79c1f69e20a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
      'https://images.unsplash.com/photo-1601960882468-6becabf6f58a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1575438922952-8ebd22b0bc1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'https://images.unsplash.com/photo-1601107487727-4cb5c960cdc6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    ],
    typeUser: 'Developer',
  );

  static const users = [
    liliana,
    julissa,
    kevin,
    eduard,
    maria,
    karla,
  ];
}
