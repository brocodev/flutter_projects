import 'package:flutter/material.dart';
import 'package:flutter_projects/core/shared/ui/animations/tween_animations.dart';
import 'package:flutter_projects/projects/find_out/models/comments.dart';
import 'package:flutter_projects/projects/find_out/models/place.dart';
import 'package:flutter_projects/projects/find_out/ui/social_page/widgets/background_shader_image.dart';
import 'package:flutter_projects/projects/find_out/ui/social_page/widgets/card_place_information.dart';
import 'package:flutter_projects/projects/find_out/ui/social_page/widgets/comment_card.dart';
import 'package:flutter_projects/projects/find_out/ui/social_page/widgets/custom_bottom_navigation.dart';
import 'package:flutter_projects/projects/find_out/ui/widgets/common_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key, required this.place});

  final Place place;

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
              const TranslateAnimation(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                child: SizedBox(
                  height: size.height * .12,
                  child: ListView.builder(
                    itemExtent: size.width * .25,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
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
              const TranslateAnimation(
                duration: Duration(milliseconds: 1000),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    "Comentarios",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      height: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TranslateAnimation(
                  duration: const Duration(milliseconds: 1000),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
                    itemCount: listComments.length,
                    itemBuilder: (context, index) =>
                        CommentCard(comment: listComments[index]),
                    staggeredTileBuilder: (index) => StaggeredTile.count(
                      2,
                      listComments[index].photoCommentUrl == null ? 2.3 : 2.8,
                    ),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                ),
              )
            ],
          ),
          const Positioned(
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
                height: kToolbarHeight,
                width: kToolbarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kToolbarHeight),
                  gradient: LinearGradient(
                    colors: [
                      Colors.pinkAccent,
                      Colors.pinkAccent[100]!,
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
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderSocialPage extends StatelessWidget {
  const _HeaderSocialPage({
    required this.heightBackPageView,
    required this.place,
    required this.indexImageBackground,
    required this.infoVisibleNotifier,
  });

  final double heightBackPageView;
  final Place place;
  final ValueNotifier<int> indexImageBackground;
  final ValueNotifier<bool> infoVisibleNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightBackPageView * 1.33,
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: heightBackPageView,
            child: Hero(
              tag: place.id!,
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
                const _CustomAppBar(),
                SizedBox(
                  height: heightBackPageView * .13,
                ),
                _TitleAndHeart(
                  place: place,
                  infoVisibleNotifier: infoVisibleNotifier,
                ),
                _PageViewIndicators(
                  maxIndex: place.imageUrl!.length,
                  indexImageBackground: indexImageBackground,
                ),
                const Spacer()
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: infoVisibleNotifier,
            builder: (context, value, child) {
              return Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: value ? 1.0 : 0.0,
                  child: child,
                ),
              );
            },
            child: const PlaceInformationCard(),
          )
        ],
      ),
    );
  }
}

class _TitleAndHeart extends StatelessWidget {
  const _TitleAndHeart({
    required this.place,
    required this.infoVisibleNotifier,
  });

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
        ValueListenableBuilder<bool>(
          valueListenable: infoVisibleNotifier,
          builder: (context, value, child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: value ? 1.0 : 0.0,
              child: child,
            );
          },
          child: FloatingActionButton(
            onPressed: () {},
            heroTag: '',
            backgroundColor: Colors.white,
            elevation: 3,
            mini: true,
            foregroundColor: Colors.pinkAccent,
            child: const Icon(Icons.favorite),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class _PageViewIndicators extends StatelessWidget {
  const _PageViewIndicators({
    required this.maxIndex,
    required this.indexImageBackground,
  });

  final int maxIndex;
  final ValueNotifier<int> indexImageBackground;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: List.generate(
          maxIndex,
          (index) {
            return ValueListenableBuilder(
              valueListenable: indexImageBackground,
              builder: (context, dynamic value, child) {
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
          },
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        BackButton(),
        Spacer(flex: 2),
        FindOutHorizontalLogo(),
        Spacer(
          flex: 3,
        )
      ],
    );
  }
}

class _BackImagesPageView extends StatelessWidget {
  const _BackImagesPageView({
    required this.place,
    this.indexNotifier,
  });

  final Place place;
  final ValueNotifier<int>? indexNotifier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! > 20) {
          Navigator.pop(context);
        }
      },
      child: SizedBox(
        child: PageView.builder(
          onPageChanged: (value) => indexNotifier!.value = value,
          itemCount: place.imageUrl!.length,
          itemBuilder: (context, index) {
            return BackgroundShaderImage(imageUrl: place.imageUrl![index]);
          },
        ),
      ),
    );
  }
}
