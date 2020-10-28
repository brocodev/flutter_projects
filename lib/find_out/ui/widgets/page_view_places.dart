import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/find_out/models/place.dart';
import 'package:flutter_projects/find_out/ui/social_page.dart';
import 'background_shader_image.dart';
import 'common_widgets.dart';

class PageViewPlaces extends StatelessWidget {
  const PageViewPlaces({
    Key key,
    this.places,
    @required this.pageController,
  }) : super(key: key);
  final List<Place> places;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final pageValueNotifier = ValueNotifier(0.0);
    pageController.addListener(() {
      pageValueNotifier.value = pageController.page;
    });
    return PageView.builder(
      allowImplicitScrolling: false,
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemBuilder: (context, index) {
        final place = places[index % places.length];
        return GestureDetector(
          onVerticalDragUpdate: (details) =>
              _onDragVerticalUpdate(details, context, place),
          child: ValueListenableBuilder(
            valueListenable: pageValueNotifier,
            builder: (context, value, child) {
              final percent = index - value;
              return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-0.8 * percent),
                  child: child);
            },
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: DecoratedBox(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(blurRadius: 30, color: Colors.black38)
                  ]),
                )),
                Hero(
                    tag: place.id,
                    child: BackgroundShaderImage(
                      imageUrl: place.imageUrl.first,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Spacer(flex: 3),
                      Center(child: TitlePlace(place: place)),
                      const Spacer(flex: 2),
                      Text(
                        "Información",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(.9)),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        place.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16, color: Colors.white.withOpacity(.8)),
                      ),
                      const SizedBox(height: 50),
                      _LikeAndComments(place: place),
                      const Spacer(),
                      const Center(
                          child: Icon(
                        Icons.keyboard_arrow_up,
                        size: 30,
                        color: Colors.white70,
                      )),
                      const Center(
                          child: Text('Desliza hacia arriba',
                              style: TextStyle(
                                color: Colors.white70,
                              ))),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _onDragVerticalUpdate(DragUpdateDetails details, context, place) {
    if (details.primaryDelta < -20) {
      Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: SocialPage(place: place),
              );
            },
          ));
    }
  }
}

class _LikeAndComments extends StatelessWidget {
  const _LikeAndComments({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.favorite_border,
          size: 32,
        ),
        Text(
          " ${place.likes}",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        const SizedBox(width: 40),
        Icon(
          Icons.comment,
          size: 32,
        ),
        Text(
          " ${place.comments.length}",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
