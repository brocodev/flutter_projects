import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/projects/travel_app/extensions/text_theme_x.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';
import 'package:flutter_projects/projects/travel_app/ui/detail/widgets/place_images_page_view.dart';
import 'package:flutter_projects/projects/travel_app/ui/detail/widgets/translate_animation.dart';

class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader({
    Key? key,
    required this.place,
    required this.upFactorChange,
    required this.downFactorChange,
  }) : super(key: key);

  final TravelPlace place;
  final double downFactorChange;
  final double upFactorChange;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    const heightContainer = 70.0;
    return Stack(
      fit: StackFit.expand,
      children: [
        //------------------------
        // Page view
        //------------------------
        Hero(
          tag: place.id,
          child: Material(
            child: ClipRRect(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: (20 + topPadding) * (1 - downFactorChange),
                      bottom: 160 * (1 - downFactorChange),
                    ),
                    child: PlaceImagesPageView(
                      factorChange: downFactorChange,
                      imagesUrl: place.imagesUrl,
                    ),
                  ),
                  SafeArea(
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BackButton(color: Colors.white),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: lerpDouble(-30, 140, upFactorChange)!
                        .clamp(topPadding + 10, 140.0),
                    left: lerpDouble(60, 20, upFactorChange)!.clamp(20, 50),
                    right: 20,
                    child: Opacity(
                      opacity: downFactorChange,
                      child: Text(
                        place.name,
                        style: TextStyle(
                          fontSize: lerpDouble(20, 40, upFactorChange),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //--------------------------
        // Comments and likes
        //--------------------------
        Positioned.fill(
          top: null,
          bottom: -(heightContainer * 2) * (1 - upFactorChange),
          child: TranslateAnimation(
            child: _LikesAndRepliesContainer(
              height: heightContainer,
              place: place,
            ),
          ),
        ),
        //--------------------------
        // Profile information
        //--------------------------
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(color: Colors.white, height: 20),
        ),
        Positioned.fill(
          top: null,
          child: TranslateAnimation(
            child: _UserInfoContainer(
              height: heightContainer,
              place: place,
            ),
          ),
        ),
      ],
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    Key? key,
    required this.height,
    required this.place,
  }) : super(key: key);

  final double height;
  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            offset: const Offset(0, -5),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(place.user.urlPhoto),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.user.name,
                style: context.bodyText1,
              ),
              Text(
                'yesterday at 10:30',
                style: context.bodyText2.copyWith(color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.blue.shade600,
              textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            child: const Text('+Follow'),
          ),
        ],
      ),
    );
  }
}

class _LikesAndRepliesContainer extends StatelessWidget {
  const _LikesAndRepliesContainer({
    Key? key,
    required this.height,
    required this.place,
  }) : super(key: key);

  final double height;
  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 2,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            icon: const Icon(CupertinoIcons.heart, size: 26),
            label: Text(place.likes.toString()),
          ),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            icon: const Icon(CupertinoIcons.reply, size: 26),
            label: Text(place.shared.toString()),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade100,
              primary: Colors.blue.shade600,
              textStyle: context.subtitle1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon: const Icon(Icons.check_circle_outlined, size: 26),
            label: const Text('Checkin'),
          ),
        ],
      ),
    );
  }
}
