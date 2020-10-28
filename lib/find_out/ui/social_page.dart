import 'package:flutter/material.dart';
import 'package:flutter_projects/animations/tween_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_projects/find_out/models/comments.dart';
import 'package:flutter_projects/find_out/models/place.dart';
import 'package:flutter_projects/find_out/ui/widgets/background_shader_image.dart';
import 'package:flutter_projects/find_out/ui/widgets/card_place_information.dart';
import 'package:flutter_projects/find_out/ui/widgets/comment_card.dart';
import 'package:flutter_projects/find_out/ui/widgets/common_widgets.dart';
import 'package:flutter_projects/find_out/ui/widgets/custom_bottom_navigation.dart';

class SocialPage extends StatelessWidget {
  final Place place;

  const SocialPage({Key key, @required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexImageBackground = ValueNotifier(0);
    final size = MediaQuery.of(context).size;
    final heightBackPageView = size.height * .33;
    final infoVisibleNotifier = ValueNotifier(false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 800), () {
        infoVisibleNotifier.value = true;
      });
    });
    final listComments = Comment.defaultListComment;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _HeaderSocialPage(
                    heightBackPageView: heightBackPageView,
                    place: place,
                    indexImageBackground: indexImageBackground,
                    infoVisibleNotifier: infoVisibleNotifier,
                  ),
                  TranslateAnimation(
                    duration: const Duration(milliseconds: 800),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Fotos de turistas",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  TranslateAnimation(
                    duration: const Duration(milliseconds: 800),
                    child: SizedBox(
                      height: size.height * .12,
                      child: ListView.builder(
                        itemExtent: size.width * .25,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          final i = index % 3;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/img/findout/friends${i + 1}.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  TranslateAnimation(
                    duration: const Duration(milliseconds: 1000),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text("Comentarios",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              height: 2,
                              fontWeight: FontWeight.w600,
                            ))),
                  ),
                  Expanded(
                    child: TranslateAnimation(
                      duration: const Duration(milliseconds: 1000),
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
                        itemCount: listComments.length,
                        itemBuilder: (BuildContext context, int index) {
                          final comment = listComments[index];
                          return CommentCard(comment: comment);
                        },
                        staggeredTileBuilder: (int index) {
                          return StaggeredTile.count(
                            2,
                            listComments[index].photoCommentUrl == null
                                ? 2.3
                                : 2.8,
                          );
                        },
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                    ),
                  )
                ]),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigation(),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: kToolbarHeight / 2,
              child: Center(
                child: Container(
                  child: Icon(Icons.add, color: Colors.white),
                  height: kToolbarHeight,
                  width: kToolbarHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kToolbarHeight),
                    gradient: LinearGradient(
                      colors: [
                        Colors.pinkAccent,
                        Colors.pinkAccent[100],
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(.6),
                        blurRadius: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class _HeaderSocialPage extends StatelessWidget {
  const _HeaderSocialPage({
    Key key,
    @required this.heightBackPageView,
    @required this.place,
    @required this.indexImageBackground,
    @required this.infoVisibleNotifier,
  }) : super(key: key);

  final double heightBackPageView;
  final Place place;
  final ValueNotifier<int> indexImageBackground;
  final ValueNotifier<bool> infoVisibleNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightBackPageView * 1.33,
      child: Stack(children: <Widget>[
        SizedBox(
          height: heightBackPageView,
          child: Hero(
            tag: place.id,
            child: _BackImagesPageView(
              place: place,
              indexNotifier: indexImageBackground,
            ),
          ),
        ),
        Positioned(
            top: 40,
            left: 20,
            right: 20,
            bottom: 0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _CustomAppBar(),
                  SizedBox(
                    height: heightBackPageView * .13,
                  ),
                  _TitleAndHeart(
                    place: place,
                    infoVisibleNotifier: infoVisibleNotifier,
                  ),
                  _PageViewIndicators(
                      maxIndex: place.imageUrl.length,
                      indexImageBackground: indexImageBackground),
                  const Spacer()
                ])),
        ValueListenableBuilder(
            valueListenable: infoVisibleNotifier,
            builder: (context, value, child) {
              return Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: value ? 1.0 : 0.0,
                    child: child),
              );
            },
            child: CardPlaceInformation())
      ]),
    );
  }
}

class _TitleAndHeart extends StatelessWidget {
  const _TitleAndHeart({
    Key key,
    @required this.place,
    @required this.infoVisibleNotifier,
  }) : super(key: key);

  final Place place;
  final ValueNotifier<bool> infoVisibleNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        const SizedBox(width: 20),
        TitlePlace(
          place: place,
          baseFontSize: 30,
        ),
        const Spacer(),
        ValueListenableBuilder(
            valueListenable: infoVisibleNotifier,
            builder: (context, value, child) {
              return AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: value ? 1.0 : 0.0,
                  child: child);
            },
            child: FloatingActionButton(
              onPressed: () {},
              heroTag: '',
              backgroundColor: Colors.white,
              elevation: 3,
              mini: true,
              foregroundColor: Colors.pinkAccent,
              child: Icon(Icons.favorite),
            )),
        const SizedBox(width: 20),
      ],
    );
  }
}

class _PageViewIndicators extends StatelessWidget {
  const _PageViewIndicators({
    Key key,
    @required this.maxIndex,
    @required this.indexImageBackground,
  }) : super(key: key);

  final int maxIndex;
  final ValueNotifier<int> indexImageBackground;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
            children: List.generate(maxIndex, (index) {
          return ValueListenableBuilder(
            valueListenable: indexImageBackground,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: CircleAvatar(
                  radius: value == index ? 5 : 4,
                  backgroundColor:
                      value == index ? Colors.pinkAccent : Colors.white,
                ),
              );
            },
          );
        })));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      BackButton(),
      const Spacer(flex: 2),
      FindOutHorizontalLogo(),
      const Spacer(
        flex: 3,
      )
    ]);
  }
}

class _BackImagesPageView extends StatelessWidget {
  const _BackImagesPageView({
    Key key,
    @required this.place,
    this.indexNotifier,
  }) : super(key: key);

  final Place place;
  final ValueNotifier indexNotifier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta > 20) {
          Navigator.pop(context);
        }
      },
      child: SizedBox(
        child: PageView.builder(
          onPageChanged: (value) => indexNotifier.value = value,
          itemCount: place.imageUrl.length,
          itemBuilder: (context, index) {
            return BackgroundShaderImage(imageUrl: place.imageUrl[index]);
          },
        ),
      ),
    );
  }
}
