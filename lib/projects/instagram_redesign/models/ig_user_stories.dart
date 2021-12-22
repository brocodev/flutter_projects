import 'package:flutter_projects/projects/instagram_redesign/models/ig_user.dart';

class IgUserStories {

  const IgUserStories({
    required this.indexStory,
    required this.instagramUser,
    required this.listStories,
  });

  final int indexStory;
  final IgUser instagramUser;
  final List<StoryModel> listStories;


  static final List<IgUserStories> listUserStories = List.generate(
    IgUser.users.length,
    (index) {
      final user = IgUser.users[index];
      return IgUserStories(
          indexStory: index,
          instagramUser: user,
          listStories: List.generate(3, (i) {
            return StoryModel(
              imageUrl: user.listPhotosUrl![i],
              isViewed: false,
              duration: const Duration(seconds: 3),
            );
          }),);
    },
  );
}

class StoryModel {
  StoryModel({this.imageUrl, this.isViewed, this.duration});

  final String? imageUrl;
  final Duration? duration;
  bool? isViewed;

}
