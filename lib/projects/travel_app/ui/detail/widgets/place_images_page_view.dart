import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceImagesPageView extends StatefulWidget {
  const PlaceImagesPageView({
    Key? key,
    required this.imagesUrl,
  }) : super(key: key);

  final List<String> imagesUrl;

  @override
  State<PlaceImagesPageView> createState() => _PlaceImagesPageViewState();
}

class _PlaceImagesPageViewState extends State<PlaceImagesPageView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: widget.imagesUrl.length,
            onPageChanged: (value) {
              setState(() => currentIndex = value);
            },
            physics: const BouncingScrollPhysics(),
            controller: PageController(viewportFraction: .9),
            itemBuilder: (context, index) {
              final imageUrl = widget.imagesUrl[index];
              final isSelected = currentIndex == index;
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                margin: EdgeInsets.only(
                  right: 10,
                  top: isSelected ? 5 : 20,
                  bottom: isSelected ? 5 : 20,
                ),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
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
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imagesUrl.length,
            (index) {
              final isSelected = currentIndex == index;
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                color: isSelected ? Colors.black38 : Colors.black12,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 3,
                width: isSelected ? 20 : 10,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
