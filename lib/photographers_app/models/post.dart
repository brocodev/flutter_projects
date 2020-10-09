import 'package:flutter_projects/photographers_app/models/users.dart';

class PhotoAppPost {
  final String photoPost;
  int comments;
  int likes;
  bool isLiked;
  final PhotoAppUser user;

  PhotoAppPost({this.photoPost, this.comments, this.likes, this.isLiked, this.user});

  static final listHomePost = [
    PhotoAppPost(
      user: PhotoAppUser.kevin,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoAppUser.kevin.listPhotosUrl.first,
    ),
    PhotoAppPost(
      user: PhotoAppUser.maria,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoAppUser.maria.listPhotosUrl.first,
    ),
    PhotoAppPost(
      user: PhotoAppUser.liliana,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoAppUser.liliana.listPhotosUrl.first,
    ),
    PhotoAppPost(
      user: PhotoAppUser.eduard,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoAppUser.eduard.listPhotosUrl.first,
    ),
    PhotoAppPost(
      user: PhotoAppUser.kevin,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoAppUser.kevin.listPhotosUrl[1],
    ),
  ];
}
