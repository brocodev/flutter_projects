import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/extensions/text_theme_x.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';
import 'package:flutter_projects/projects/travel_app/ui/detail/widgets/place_images_page_view.dart';
import 'package:flutter_projects/projects/travel_app/ui/widgets/gradient_status_tag.dart';
import 'package:flutter_projects/projects/travel_app/ui/widgets/translate_animation.dart';

class AnimatedDetailHeader extends StatelessWidget {
  const AnimatedDetailHeader({
    super.key,
    required this.place,
    required this.topPercent,
    required this.bottomPercent,
  });

  final TravelPlace place;
  final double topPercent;
  final double bottomPercent;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final imagesUrl = place.imagesUrl;
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: place.id,
          child: Material(
            child: ClipRect(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: (20 + topPadding) * (1 - bottomPercent),
                      bottom: 160 * (1 - bottomPercent),
                    ),
                    child: Transform.scale(
                      scale: lerpDouble(1, 1.3, bottomPercent),
                      child: PlaceImagesPageView(imagesUrl: imagesUrl),
                    ),
                  ),
                  Positioned(
                    top: topPadding,
                    left: -60 * (1 - bottomPercent),
                    child: const BackButton(
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: topPadding,
                    right: -60 * (1 - bottomPercent),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: lerpDouble(-100, 140, topPercent)!
                        .clamp(topPadding + 10, 140),
                    left: lerpDouble(100, 20, topPercent)!.clamp(20.0, 50.0),
                    right: 20,
                    child: AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: bottomPercent < 1 ? 0 : 1,
                      child: Text(
                        place.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              lerpDouble(0, 40, topPercent)!.clamp(20.0, 40.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 200,
                    child: AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: bottomPercent < 1 ? 0 : 1,
                      child: Opacity(
                        opacity: topPercent,
                        child: GradientStatusTag(
                          statusTag: place.statusTag,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(color: Colors.white, height: 10),
        ),
        Positioned.fill(
          top: null,
          bottom: -140 * (1 - topPercent),
          child: TranslateAnimation(
            child: _LikesAndSharesContainer(place: place),
          ),
        ),
        Positioned.fill(
          top: null,
          child: TranslateAnimation(
            child: _UserInfoContainer(place: place),
          ),
        )
      ],
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    required this.place,
  });

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(place.user.urlPhoto),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                place.user.name,
                style: context.bodyText1,
              ),
              Text(
                'yesterday at 9:10 p.m.',
                style: context.bodyText2.copyWith(color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue.shade600,
              textStyle: context.subtitle1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text('+Follow'),
          ),
        ],
      ),
    );
  }
}

class _LikesAndSharesContainer extends StatelessWidget {
  const _LikesAndSharesContainer({
    required this.place,
  });

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
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
              foregroundColor: Colors.black,
              textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            icon: const Icon(
              CupertinoIcons.heart,
              size: 26,
            ),
            label: Text(place.likes.toString()),
          ),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: context.subtitle1,
              shape: const StadiumBorder(),
            ),
            icon: const Icon(
              CupertinoIcons.reply,
              size: 26,
            ),
            label: Text(place.shared.toString()),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade100,
              foregroundColor: Colors.blue.shade600,
              textStyle: context.subtitle1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            icon: const Icon(
              Icons.check_circle_outlined,
              size: 26,
            ),
            label: const Text('Checkin'),
          ),
        ],
      ),
    );
  }
}
