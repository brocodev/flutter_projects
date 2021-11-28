import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';

class PlaceImagesPageView extends StatelessWidget {
  const PlaceImagesPageView({
    Key? key,
    required this.factorChange,
    required this.place,
  }) : super(key: key);

  final double factorChange;
  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Transform.scale(
            scale: lerpDouble(1, 1.3, factorChange)!,
            child: PageView.builder(
              controller: PageController(viewportFraction: .9),
              itemCount: place.imagesUrl.length,
              allowImplicitScrolling: true,
              itemBuilder: (context, index) {
                return _DecoratedPicture(imageUrl: place.imagesUrl[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _DecoratedPicture extends StatelessWidget {
  const _DecoratedPicture({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.black26,
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
