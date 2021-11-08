import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';
import 'package:flutter_projects/projects/travel_app/ui/feed/widgets/place_card.dart';
import 'package:flutter_projects/projects/travel_app/ui/feed/widgets/travel_navigation_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search),
        ),
        title: const Text('Feed'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.star),
          ),
        ],
      ),
      extendBody: true,
      body: ListView.builder(
        itemExtent: 350,
        itemCount: TravelPlace.places.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          final place = TravelPlace.places[index];
          return PlaceCard(place: place);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.location_on),
      ),
      bottomNavigationBar: TravelNavigationBar(
        onPressed: (int value) {},
        items: [
          TravelNavigationBarItem(
            icon: Icons.chat_outlined,
            selectedIcon: Icons.chat,
          ),
          TravelNavigationBarItem(
            icon: Icons.widgets_outlined,
            selectedIcon: Icons.widgets,
          ),
        ],
      ),
    );
  }
}
