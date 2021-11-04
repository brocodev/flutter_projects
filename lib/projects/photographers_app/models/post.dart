import 'package:flutter_projects/projects/photographers_app/models/users.dart';

class PhotoPost {
  PhotoPost({
    this.photoPost,
    this.comments,
    this.likes,
    this.isLiked,
    this.user,
  });

  final String? photoPost;
  int? comments;
  int? likes;
  bool? isLiked;
  final PhotoUser? user;

  static final listHomePost = [
    PhotoPost(
      user: PhotoUser.kevin,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoUser.kevin.listPhotosUrl!.first,
    ),
    PhotoPost(
      user: PhotoUser.maria,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoUser.maria.listPhotosUrl!.first,
    ),
    PhotoPost(
      user: PhotoUser.liliana,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoUser.liliana.listPhotosUrl!.first,
    ),
    PhotoPost(
      user: PhotoUser.eduard,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoUser.eduard.listPhotosUrl!.first,
    ),
    PhotoPost(
      user: PhotoUser.kevin,
      likes: 1220,
      comments: 229,
      isLiked: false,
      photoPost: PhotoUser.kevin.listPhotosUrl![1],
    ),
  ];
}
