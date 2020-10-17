import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedBorderImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final Color borderColor;
  final double borderWidth;

  const RoundedBorderImage({
    Key key,
    this.imageUrl,
    this.height,
    this.borderColor,
    this.borderWidth = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: borderColor ?? Theme.of(context).backgroundColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(height * .4),
          image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover)),
    );
  }
}
