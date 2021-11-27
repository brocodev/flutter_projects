import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';
import 'package:flutter_projects/projects/travel_app/ui/detail/animated_detail_header.dart';

class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
    required this.initialScrollOffset,
  }) : super(key: key);

  final TravelPlace place;
  final double initialScrollOffset;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late final ScrollController _scrollController;

  void _scrollListener() {}

  @override
  void initState() {
    super.initState();
    _scrollController =
        ScrollController(initialScrollOffset: widget.initialScrollOffset);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                return Hero(
                  tag: widget.place.id,
                  child: AnimatedDetailHeader(

                    upFactorChange: ((1 - factorChange) / .6).clamp(0.0, 1.0),
                    downFactorChange: (factorChange / .4).clamp(0.0, 1.0),
                    place: widget.place,
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: Container(height: 600)),
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
