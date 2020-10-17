import 'package:flutter_projects/instagram_redesign/models/ig_user.dart';

class IgStories {
  final IgUser instagramUser;
  final List<StoryModel> stories;

  IgStories({
    this.instagramUser,
    this.stories,
  });

  static final List<IgStories> listUserStories = List.generate(
    IgUser.users.length,
    (index) {
      final user = IgUser.users[index];
      return IgStories(
          instagramUser: user,
          stories: List.generate(3, (i) {
            return StoryModel(
              imageUrl: user.listPhotosUrl[i],
              isViewed: false,
            );
          }));
    },
  );
}

class StoryModel {
  final String imageUrl;
  bool isViewed;

  StoryModel({this.imageUrl, this.isViewed});
}
