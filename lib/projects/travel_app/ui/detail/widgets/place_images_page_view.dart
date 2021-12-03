import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PlaceImagesPageView extends StatefulWidget {
  const PlaceImagesPageView({
    Key? key,
    required this.factorChange,
    required this.imagesUrl,
  }) : super(key: key);

  final double factorChange;
  final List<String> imagesUrl;

  @override
  State<PlaceImagesPageView> createState() => _PlaceImagesPageViewState();
}

class _PlaceImagesPageViewState extends State<PlaceImagesPageView> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Transform.scale(
            scale: lerpDouble(1, 1.3, widget.factorChange)!,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() => currentIndex = value);
              },
              controller: PageController(viewportFraction: .9),
              itemCount: widget.imagesUrl.length,
              allowImplicitScrolling: true,
              itemBuilder: (context, index) {
                return _DecoratedPicture(
                  imageUrl: widget.imagesUrl[index],
                  isSelected: currentIndex == index,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imagesUrl.length,
            (index) {
              final isSelected = index == currentIndex;
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: 4,
                width: isSelected ? 20 : 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isSelected ? Colors.black26 : Colors.black12,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _DecoratedPicture extends StatelessWidget {
  const _DecoratedPicture({
    Key? key,
    required this.imageUrl,
    required this.isSelected,
  }) : super(key: key);

  final String imageUrl;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        top: isSelected ? 5 : 20,
        bottom: isSelected ? 5 : 30,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
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
