import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundShaderImage extends StatelessWidget {
  const BackgroundShaderImage({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CupertinoActivityIndicator(radius: 40),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black12,
                  Colors.black.withOpacity(.6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, .7],
              ),
            ),
          ),
        )
      ],
    );
  }
}
