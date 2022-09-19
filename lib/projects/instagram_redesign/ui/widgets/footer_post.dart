import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/projects/instagram_redesign/ui/widgets/rounded_border_image.dart';

class FooterPost extends StatelessWidget {
  const FooterPost({
    super.key,
    required this.post,
    this.colorDescription,
    this.colorMoreButton,
    this.colorMoreText,
  });

  final IgPost post;
  final Color? colorMoreButton;
  final Color? colorMoreText;
  final Color? colorDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        //-----------------------------------
        //-----RETURN THE 3 FIRSTS IMAGES
        //-----------------------------------
        return Align(
          widthFactor: .8,
          child: RoundedBorderImage(
            imageUrl: post.comments![index].user!.photoUrl,
            height: 30,
            borderWidth: 1.5,
          ),
        );
      })
        //-------------------------------------
        //-----ADDING THE NEXT WIDGETS
        //-------------------------------------
        ..add(const SizedBox(width: 20))
        ..add(
          Flexible(
            child: Text(
              post.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: colorDescription ??
                    Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
        ..add(const SizedBox(width: 5))
        ..add(
          SizedBox(
            height: 30,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: colorMoreButton ?? Colors.white,
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: Text(
                'More',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorMoreText ?? colorDescription,
                ),
              ),
            ),
          ),
        ),
    );
  }
}
