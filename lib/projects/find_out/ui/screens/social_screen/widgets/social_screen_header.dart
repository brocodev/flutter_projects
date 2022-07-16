import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/find_out/models/place.dart';
import 'package:flutter_projects/projects/find_out/ui/screens/social_screen/widgets/widgets.dart';
import 'package:flutter_projects/projects/find_out/ui/widgets/common_widgets.dart';

class SocialScreenHeader extends StatelessWidget {
  const SocialScreenHeader({
    super.key,
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
                SizedBox(height: heightBackPageView * .13),
                _TitleAndHeart(
                  place: place,
                  infoVisibleNotifier: infoVisibleNotifier,
                ),
                _PageViewIndicators(
                  maxIndex: place.imageUrl!.length,
                  indexImageBackground: indexImageBackground,
                ),
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
