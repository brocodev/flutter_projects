import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_stories.dart';
import 'package:flutter_projects/instagram_redesign/pages/widgets/rounded_border_image.dart';

class InstagramStoriesItem extends StatelessWidget {
  const InstagramStoriesItem({
    Key key,
    this.itemSize,
    @required this.onTap,
    @required this.stories,
  }) : super(key: key);

  final double itemSize;
  final VoidCallback onTap;
  final IgStories stories;

  @override
  Widget build(BuildContext context) {
    final user = stories.instagramUser;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: itemSize,
            height: itemSize,
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purpleAccent,
                    Colors.amber,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(itemSize * .4)),
            child: RoundedBorderImage(
              height: itemSize,
              imageUrl: user.photoUrl,
            )),
        Text(
          user.name.split(' ').first,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
