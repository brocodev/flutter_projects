import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/travel_app/models/place.dart';
import 'package:flutter_projects/projects/travel_app/ui/detail/place_detail_screen.dart';
import 'package:flutter_projects/projects/travel_app/ui/feed/widgets/travel_navigation_bar.dart';
import 'package:flutter_projects/projects/travel_app/ui/widgets/place_card.dart';

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
        padding: const EdgeInsets.only(bottom: kToolbarHeight + 20),
        itemBuilder: (context, index) {
          final place = TravelPlace.places[index];
          return Hero(
            tag: place.id,
            child: Material(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, animation, __) {
                        return FadeTransition(
                          opacity: animation,
                          child: PlaceDetailScreen(
                            place: place,
                            screenHeight: MediaQuery.of(context).size.height,
                          ),
                        );
                      },
                    ),
                  ),
                  child: PlaceCard(place: place),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.location_on),
      ),
      bottomNavigationBar: TravelNavigationBar(
        onPressed: (int value) {},
        currentIndex: 1,
        items: [
          TravelNavigationBarItem(
            icon: CupertinoIcons.chat_bubble,
            selectedIcon: CupertinoIcons.chat_bubble_fill,
          ),
          TravelNavigationBarItem(
            icon: CupertinoIcons.square_split_2x2,
            selectedIcon: CupertinoIcons.square_split_2x2_fill,
          ),
        ],
      ),
    );
  }
}
