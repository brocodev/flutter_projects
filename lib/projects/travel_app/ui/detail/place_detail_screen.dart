import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    scrollController.addListener(() {});
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: DetailHeaderDelegate(
              maxExtent: MediaQuery.of(context).size.height * .7,
              minExtent: 240,
              builder: (percent) {
                const heightContainer = 70.0;
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      bottom: 50,
                      child: PageView.builder(
                        itemCount: place.imagesUrl.length,
                        allowImplicitScrolling: true,
                        itemBuilder: (context, index) {
                          return Image.network(
                            place.imagesUrl[index],
                            fit: BoxFit.cover,
                            color: Colors.black12,
                            colorBlendMode: BlendMode.darken,
                          );
                        },
                      ),
                    ),
                    Positioned.fill(
                      top: null,
                      bottom: (heightContainer - 20) * (1 - percent),
                      child: Container(
                        height: heightContainer + (1 - percent),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.shade50,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: null,
                      child: Container(
                        height: heightContainer,
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
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: Placeholder()),
          const SliverToBoxAdapter(child: Placeholder()),
        ],
      ),
    );
  }
}

class DetailHeaderDelegate extends SliverPersistentHeaderDelegate {
  DetailHeaderDelegate({
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


  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration(stretchTriggerOffset: 300);

  @override
  double get maxExtent => _maxExtext;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
