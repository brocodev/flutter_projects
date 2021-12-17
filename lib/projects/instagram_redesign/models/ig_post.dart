import 'package:flutter_projects/projects/instagram_redesign/models/ig_user.dart';

class IgPost {
  IgPost({
    this.id,
    this.userPost,
    this.comments,
    this.likes,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting'
            ' industry. Lorem Ipsum has been the industry standard dummy'
            ' text ever since the 1500s, when an unknown printer took a '
            'galley of type and scrambled it to make a type specimen book.',
    this.photos,
    this.isLiked,
  });

  final int? id;
  final IgUser? userPost;
  final List<Comment>? comments;
  final String description;
  final int? likes;
  bool? isLiked;
  final List<String>? photos;

  static final List<IgPost> listPosts =
      List.generate(IgUser.users.length, (index) {
    final user = IgUser.users[index];
    return IgPost(
        id: index,
      userPost: user,
      comments: List.generate(user.following!, (i) {
        return Comment(
          comment: [
            'Superb!!',
            'Nice photography 📷',
            'Awesome!! 😎 ',
            'Magnificent photo 😍',
            'Wow!! Look soo amazing!! 🤩🤩🤩',
            'I love your photos ❤',
            'Your are incredible!! 😺👌',
            'Magnificent photo 😍',
          ][i % 8],
          user: IgUser.users[i % IgUser.users.length],
        );
      }),
      likes: user.followers,
      isLiked: false,
      photos: List.generate(index.isEven ? 3 : 4, (i) {
        return user.listPhotosUrl![3 + i];
      }),
    );
  });
}

class Comment {
  const Comment({this.comment, this.user});

  final String? comment;
  final IgUser? user;
}
