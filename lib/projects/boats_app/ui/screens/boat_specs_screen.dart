import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/boats_app/models/boat.dart';

class BoatSpecsScreen extends StatelessWidget {
  const BoatSpecsScreen({Key? key, required this.boat}) : super(key: key);

  final Boat boat;

  static const _angleRotateBoat = (pi * -.5);
  static const _dxTranslate = 80.0;
  static const _dyTranslate = -100.0;

  //-------------------------------------------------
  // Custom Flight Hero
  //-------------------------------------------------
  Widget _flightShuttleBuilder(
      Animation animation, HeroFlightDirection flightDirection) {
    final isPop = flightDirection == HeroFlightDirection.pop;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final value = isPop
            ? Curves.easeInBack.transform(animation.value)
            : Curves.easeOutBack.transform(animation.value);
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(_dxTranslate * value, _dyTranslate * value, 0)
            ..rotateZ(_angleRotateBoat * value),
          child: child,
        );
      },
      child: _ImageBoat(
        boatImagePath: boat.imagePath,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animateItemNotifier = ValueNotifier(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateItemNotifier.value = true;
    });
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //--------------------------------------
                // Boat Model Image
                //--------------------------------------
                Hero(
                  tag: boat.model,
                  flightShuttleBuilder:
                      (_, animation, flightDirection, ___, ____) {
                    return _flightShuttleBuilder(animation, flightDirection);
                  },
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(_dxTranslate, _dyTranslate, 0)
                      ..rotateZ(_angleRotateBoat),
                    child: _ImageBoat(
                      boatImagePath: boat.imagePath,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -MediaQuery.of(context).size.height * .32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        boat.model,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      //------------------------------
                      // Owner boat
                      //------------------------------
                      Text.rich(
                        TextSpan(
                          text: 'By ',
                          children: [
                            TextSpan(
                              text: boat.owner,
                              style: TextStyle(
                                color: Colors.grey[900],
                              ),
                            ),
                          ],
                          style: TextStyle(
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                      ),
                      //-----------------------------------------
                      // Animated Items
                      //-----------------------------------------
                      ValueListenableBuilder<bool>(
                        valueListenable: animateItemNotifier,
                        builder: (context, value, child) {
                          return TweenAnimationBuilder<double>(
                              curve: Curves.fastOutSlowIn,
                              tween: Tween(begin: 1.0, end: value ? 0.0 : 1.0),
                              duration: const Duration(milliseconds: 600),
                              builder: (context, value, child) {
                                return Transform.translate(
                                  offset: Offset(0, (-50.0 * value)),
                                  child: Opacity(
                                    opacity: 1 - value,
                                    child: child,
                                  ),
                                );
                              },
                              child: child);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //------------------------------------
                            // Description Boat
                            //------------------------------------
                            const SizedBox(height: 20),
                            Text(
                              boat.description,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            //------------------------------------
                            // SPECS
                            //------------------------------------
                            const SizedBox(height: 30),
                            const Text(
                              'SPECS',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10),
                            _BoatSpecsList(boat: boat),
                            //-------------------------------------
                            // Gallery List View
                            //-------------------------------------
                            const SizedBox(height: 20),
                            const Text(
                              'GALLERY',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 200.0,
                              child: _BoatGalleryListView(boat: boat),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //--------------------------------------
          // Close Button
          //--------------------------------------
          Align(
            alignment: const Alignment(-.9, -.9),
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black12,
              child: const Icon(Icons.close),
              onPressed: () {
                animateItemNotifier.value = false;
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _BoatGalleryListView extends StatelessWidget {
  const _BoatGalleryListView({
    Key? key,
    required this.boat,
  }) : super(key: key);

  final Boat boat;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: boat.gallery.length,
      scrollDirection: Axis.horizontal,
      itemExtent: 220,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final galleryPath = boat.gallery[index];
        //----------------------------------------
        // Gallery Image
        //----------------------------------------
        return Container(
          margin: const EdgeInsets.only(right: 20),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(
            galleryPath,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class _BoatSpecsList extends StatelessWidget {
  const _BoatSpecsList({
    Key? key,
    required this.boat,
  }) : super(key: key);

  final Boat boat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        boat.specs.length,
        (index) {
          final key = boat.specs.keys.toList()[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(child: Text(key)),
                Expanded(
                  child: Text(
                    boat.specs[key]!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ImageBoat extends StatelessWidget {
  const _ImageBoat({
    Key? key,
    required this.boatImagePath,
  }) : super(key: key);

  final String boatImagePath;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .85,
      child: Image.asset(boatImagePath),
    );
  }
}
