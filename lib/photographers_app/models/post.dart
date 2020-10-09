import 'package:flutter_projects/photographers_app/models/users.dart';

class Post {
  final String photoPost;
  final int comments;
  final int likes;
  final bool isLiked;
  final User user;

  Post({this.photoPost, this.comments, this.likes, this.isLiked, this.user});

  static final listHomePost = [
    Post(
      user: User.kevin,
      likes: 1220,
      comments: 229,
      isLiked: true,
      photoPost: User.kevin.listPhotosUrl.first,
    ),
    Post(
      user: User.maria,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: User.maria.listPhotosUrl.first,
    ),
    Post(
      user: User.liliana,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: User.liliana.listPhotosUrl.first,
    ),
    Post(
      user: User.eduard,
      likes: 1220,
      comments: 229,
      isLiked: true,
      photoPost: User.eduard.listPhotosUrl.first,
    ),
    Post(
      user: User.kevin,
      likes: 1220,
      comments: 229,
      isLiked: true,
      photoPost: User.kevin.listPhotosUrl[1],
    ),
  ];
}
