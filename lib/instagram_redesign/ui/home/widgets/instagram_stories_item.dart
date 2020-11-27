import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_user_stories.dart';
import 'package:flutter_projects/instagram_redesign/ui/widgets/rounded_gradient_border_image.dart';

class InstagramStoriesItem extends StatelessWidget {
  const InstagramStoriesItem({
    Key key,
    this.itemSize,
    @required this.onTap,
    @required this.stories,
  }) : super(key: key);

  final double itemSize;
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
          RoundedGradientBorderImage(height: itemSize, imageUrl: user.photoUrl),
          Text(
            user.name.split(' ').first,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
