import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_user_stories.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/ig_user_border_image.dart';

class InstagramStoriesItem extends StatelessWidget {
  const InstagramStoriesItem({
    super.key,
    this.itemSize,
    required this.onTap,
    required this.stories,
  });

  final double? itemSize;
  final VoidCallback onTap;
  final IgUserStories stories;

  @override
  Widget build(BuildContext context) {
    final user = stories.instagramUser;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IgUserBorderImage(height: itemSize, imageUrl: user.photoUrl),
          Text(
            user.name!.split(' ').first,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
