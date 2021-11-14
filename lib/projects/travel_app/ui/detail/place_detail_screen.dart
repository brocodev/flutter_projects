import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
  }) : super(key: key);

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverPersistentHeader(
            delegate: DetailHeaderDelegate(
              maxExtent: 400,
              minExtent: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailHeaderDelegate extends SliverPersistentHeaderDelegate {
  DetailHeaderDelegate({
    required double minExtent,
    required double maxExtent,
  })  : _maxExtext = maxExtent,
        _minExtent = minExtent,
        super();

  final double _minExtent;
  final double _maxExtext;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Placeholder();
  }

  @override
  double get maxExtent => _maxExtext;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
