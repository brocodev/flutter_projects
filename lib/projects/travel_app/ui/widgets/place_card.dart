import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/extensions/text_theme_x.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';
import 'package:flutter_projects/projects/travel_app/ui/widgets/gradient_button.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: CachedNetworkImageProvider(place.imagesUrl.first),
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
            Row(
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
            const Spacer(),
            Text(
              place.name,
              style: context.headline2,
            ),
            const SizedBox(height: 16),
            GradientTag(
              statusTag: place.statusTag
            ),
            const Spacer(),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
