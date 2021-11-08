import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/extensions/text_theme_x.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';
import 'package:flutter_projects/projects/travel_app/ui/widgets/gradient_button.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key? key,
    required this.place,
    this.expanded = false,
  }) : super(key: key);

  final TravelPlace place;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: expanded ? const EdgeInsets.all(20) : const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius:
              expanded ? BorderRadius.zero : BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(place.imageUrl.first),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: !expanded,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(place.user.urlPhoto),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.user.name,
                        style: context.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'yesterday at 9:10 a.m.',
                        style: context.bodyText2.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Text(
              place.name,
              style: context.headline2,
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (context) {
                switch (place.statusTag) {
                  case StatusTag.popular:
                    return GradientTag(
                      colors: [
                        Colors.amber,
                        Colors.orange.shade700,
                      ],
                      child: Text(
                        'Popular places',
                        style: context.subtitle1.copyWith(color: Colors.white),
                      ),
                    );
                  case StatusTag.event:
                    return GradientTag(
                      colors: [
                        Colors.greenAccent.shade200,
                        Colors.greenAccent.shade700,
                      ],
                      child: Text(
                        'Events',
                        style: context.subtitle1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                }
              },
            ),
            const Spacer(),
            Visibility(
              visible: !expanded,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    icon: const Icon(CupertinoIcons.heart),
                    label: Text(place.likes.toString()),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    icon: const Icon(CupertinoIcons.reply),
                    label: Text(place.shared.toString()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
