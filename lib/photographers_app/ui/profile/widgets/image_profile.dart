import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    Key key,
    @required this.imageUser,
  }) : super(key: key);

  final String imageUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUser),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.26),
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}