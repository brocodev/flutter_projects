import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/find_out/models/comments.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.height * .013;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    CachedNetworkImageProvider(comment.photoUserUrl!),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    text: comment.user,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize,
                    ),
                    children: [
                      TextSpan(
                        text: '\nhace 20 min',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: fontSize * .8,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (comment.photoCommentUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: comment.photoCommentUrl!,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                comment.comment!,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.favorite,
                color: Colors.pinkAccent,
              ),
              Text(
                ' ${comment.commentLikes}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 20),
              Icon(
                Icons.comment,
                color: Colors.grey[600],
              ),
              Text(
                ' ${comment.commentResponses}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
