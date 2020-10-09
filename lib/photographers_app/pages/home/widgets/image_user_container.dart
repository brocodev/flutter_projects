import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/photographers_app/models/users.dart';

class ImageUserContainer extends StatelessWidget {
  const ImageUserContainer({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 20,
                      offset: Offset(-10, 10))
                ],
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(user.photoUrl),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(height: 10),
          AutoSizeText(
            user.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
