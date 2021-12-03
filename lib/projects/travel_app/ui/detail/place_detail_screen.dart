import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/projects/travel_app/extensions/text_theme_x.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';
import 'package:flutter_projects/projects/travel_app/ui/detail/widgets/animated_detail_header.dart';
import 'package:flutter_projects/projects/travel_app/ui/detail/widgets/translate_animation.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
    required this.screenHeight,
  }) : super(key: key);

  final TravelPlace place;
  final double screenHeight;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController =
        ScrollController(initialScrollOffset: widget.screenHeight * .3);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final place = widget.place;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: BuilderPersistentDelegate(
              maxExtent: MediaQuery.of(context).size.height,
              minExtent: 240,
              builder: (factorChange) {
                return AnimatedDetailHeader(
                  upFactorChange: ((1 - factorChange) / .7).clamp(0.0, 1.0),
                  downFactorChange: (factorChange / .3).clamp(0.0, 1.0),
                  place: place,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: TranslateAnimation(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.black26,
                        ),
                        Flexible(
                          child: Text(
                            place.locationDesc,
                            maxLines: 1,
                            style: context.bodyText1.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(place.description),
                    const SizedBox(height: 10),
                    Text(place.description),
                    const SizedBox(height: 10),
                    Text(place.description),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'THE PLACES IN THIS COLLECTION',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: TravelPlace.collectionPlaces.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                itemExtent: 150,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final place = TravelPlace.collectionPlaces[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: place.imagesUrl.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 150)),
        ],
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate({
    required this.builder,
    required double minExtent,
    required double maxExtent,
  })  : _maxExtext = maxExtent,
        _minExtent = minExtent,
        super();

  final double _minExtent;
  final double _maxExtext;
  final Widget Function(double percent) builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtext);
  }

  // @override
  // OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
  //     OverScrollHeaderStretchConfiguration(stretchTriggerOffset: 300);

  @override
  double get maxExtent => _maxExtext;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
