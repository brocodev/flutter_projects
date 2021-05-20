import 'package:flutter/material.dart';
import 'package:flutter_projects/instagram_redesign/bloc/bloc_provider.dart';
import 'package:flutter_projects/instagram_redesign/models/ig_post.dart';
import 'package:flutter_projects/instagram_redesign/ui/widgets/rounded_border_image.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({
    Key key,
    @required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final instagramBloc = InstagramBlocProvider.of(context).instagramBloc;
    return Row(
      children: [
        RoundedBorderImage(
          height: 40,
          imageUrl: comment.user.photoUrl,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.user.username,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                comment.comment,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Theme.of(context).colorScheme.onBackground,
            backgroundColor: instagramBloc.themeMode == ThemeMode.dark
                ? Colors.grey[900]
                : Colors.grey[100],
            shape: const StadiumBorder(),
            textStyle: TextStyle(fontWeight: FontWeight.w400),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          onPressed: () {},
          child: Text("Reply"),
        ),
        FloatingActionButton(
          heroTag: UniqueKey(),
          foregroundColor: Theme.of(context).colorScheme.onBackground,
          backgroundColor: instagramBloc.themeMode == ThemeMode.dark
              ? Colors.grey[900]
              : Colors.grey[100],
          shape: StadiumBorder(),
          highlightElevation: 0,
          elevation: 0,
          mini: true,
          onPressed: () {},
          child: Icon(Icons.favorite_border),
        ),
      ],
    );
  }
}
